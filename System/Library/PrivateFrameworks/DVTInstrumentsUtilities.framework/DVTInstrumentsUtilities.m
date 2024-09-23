BOOL sub_22634D508()
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    sub_22636FBC4();
  return v2 != 0;
}

void sub_22634E030(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 72))
  {
    v3 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = 0;

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    if (v5)
    {
      *(_QWORD *)(v4 + 40) = 0;

      v4 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v4 + 72) = 1;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v32, (uint64_t)v37, 16);
    if (v8)
    {
      v12 = v8;
      v13 = *(_QWORD *)v33;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v6);
          objc_msgSend__welcomeAgent_(*(void **)(a1 + 32), v9, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14++), v10, v11);
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v32, (uint64_t)v37, 16);
      }
      while (v12);
    }

    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 48);
    *(_QWORD *)(v15 + 48) = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v28, (uint64_t)v36, 16);
    if (v19)
    {
      v23 = v19;
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v17);
          objc_msgSend__welcomeAgent_(*(void **)(a1 + 32), v20, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v25++), v21, v22, (_QWORD)v28);
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v28, (uint64_t)v36, 16);
      }
      while (v23);
    }

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 56);
    *(_QWORD *)(v26 + 56) = 0;

  }
}

uint64_t sub_22634E834()
{
  return archive_read_free();
}

uint64_t sub_22634EC3C()
{
  return archive_write_free();
}

void sub_22634EC44(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  id v8;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3, v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtURL_error_(v8, v6, *(_QWORD *)(a1 + 32), 0, v7);

}

void sub_22634F2F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_22634F31C(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

void sub_22634F404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

uint64_t sub_22634F420(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_assignActivityManager_slot_, *(_QWORD *)(a1 + 40), a2, a5);
}

void sub_22634F4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22634F5C4(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = a2;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (*(_QWORD *)objc_msgSend__managerImplPtr(v14, v7, v8, v9, v10, (_QWORD)v17))
        {
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v16 = (__int128 *)objc_msgSend__managerImplPtr(v14, v7, v8, v9, v10);
          sub_22636CBD4(v15, v16, a3);
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v11);
  }

}

void sub_22634F6F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22634F71C(uint64_t a1, void *a2, unsigned __int8 a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a2;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v11 = (void *)objc_opt_class();
        if (objc_msgSend_supportsQoS(v11, v12, v13, v14, v15, (_QWORD)v22))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v21 = (__int128 *)objc_msgSend__secondTierManagerImplPtr(v10, v16, v17, v18, v19);
          sub_22636CBD4(v20, v21, a3);
        }
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v16, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v7);
  }

}

void sub_22634F850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_22634F8D8@<X0>(unsigned __int8 *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x40uLL);
  result = sub_22634F930(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22634F91C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_22634F930(_QWORD *a1, unsigned __int8 *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24EDC29C8;
  sub_22636CE04(a1 + 3, *a2);
  return a1;
}

void sub_22634F968(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_22634F97C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC29C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_22634F98C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC29C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22769619CLL);
}

void sub_22634F9BC(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 32);
  sub_22634F9E8(&v1);
}

void sub_22634F9E8(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        v6 = v4;
        sub_22634FA58(&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_22634FA58(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = sub_22634FAC8(v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_22634FAC8(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

BOOL sub_22634FB20(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v18;

  v4 = objc_retainAutorelease(a1);
  v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  v18 = 0;
  v10 = strtoll_l(v9, &v18, 0, 0);
  v11 = v18;
  v16 = (char *)&v9[objc_msgSend_length(v4, v12, v13, v14, v15)];
  if (a3 && v11 == v16)
    *a3 = v10;
  return v11 == v16;
}

void sub_22634FBE4()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("error-message");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C648;
  qword_25583C648 = v1;

}

void sub_22635004C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_22635023C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2263502C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226350334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)XRSpace;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_226350364(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_226350464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226350488(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BDBCA90];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 1, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_25583C660;
  qword_25583C660 = v5;

}

void sub_2263505E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2263506B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22635075C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_226350774(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2263508FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_226350A0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226350C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_226350CE4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_226350CF4(uint64_t a1)
{

}

void sub_226350CFC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_226350E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_226350E7C(uint64_t a1)
{
  NSLog(CFSTR("User data can only be attached to a space while in that space, returning nil"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void sub_226350FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  objc_sync_exit(v17);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_226350FE4(uint64_t a1)
{
  NSLog(CFSTR("User data can only be attached to a space while in that space, returning nil"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void sub_226351104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;

  objc_sync_exit(v16);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_226351134(uint64_t a1)
{
  NSLog(CFSTR("User data can only be attached to a space while in that space, returning nil"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void sub_226351270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;
  void *v16;

  objc_sync_exit(v16);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_2263512A0(uint64_t a1)
{
  NSLog(CFSTR("User data can only be retrieved from a space while in that space, returning nil"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

void sub_22635160C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2263516AC(uint64_t a1, void *a2)
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_observer(WeakRetained, v4, v5, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12
    && (!objc_msgSend_targetIsSet(WeakRetained, v8, v9, v10, v11)
     || (objc_msgSend_target(WeakRetained, v13, v14, v15, v16),
         v17 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend_object(v27, v18, v19, v20, v21),
         v22 = (void *)objc_claimAutoreleasedReturnValue(),
         v22,
         v17,
         v17 == v22)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend_space(WeakRetained, v8, v9, v10, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__removeNotificationShim_(v23, v24, (uint64_t)WeakRetained, v25, v26);

  }
}

void sub_226351780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2263519C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_226351AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t sub_226351AD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_hello(*(void **)(a1 + 32), a2, a3, a4, a5);
  return objc_msgSend_goodbye(*(void **)(a1 + 32), v6, v7, v8, v9);
}

void sub_226351BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)_XRSpaceNotificationShim;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_226351D60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226351DBC(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  if (a2 == 2)
  {
    v14 = objc_begin_catch(exc_buf);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend_name(v12, v15, v16, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Exception thrown while running an XRSpace op (%@): %@"));

    }
    else
    {
      NSLog(CFSTR("Exception thrown while running an XRSpace op: %@"));
    }

    objc_end_catch();
    JUMPOUT(0x226351DA0);
  }
  objc_begin_catch(exc_buf);
  v19 = *(void **)&v12[v13];
  *(_QWORD *)&v12[v13] = 0;

  objc_exception_rethrow();
}

void sub_226351E74(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_226351F2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226351FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_226351FC4(void *a1)
{
  unsigned int *v1;
  unsigned int *v2;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  v2 = v1 + 8;
  while (!__ldxr(v2))
  {
    if (!__stxr(1u, v2))
    {
      v9 = (uint64_t)v1;
      dispatch_get_global_queue(21, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v4, *(dispatch_block_t *)(v9 + 8));

      v5 = *(void **)(v9 + 8);
      *(_QWORD *)(v9 + 8) = 0;

      objc_msgSend_removeObserver_forKeyPath_context_(*(void **)(v9 + 16), v6, v9, (uint64_t)CFSTR("isFinished"), qword_25583BF80);
      v7 = *(void **)(v9 + 16);
      *(_QWORD *)(v9 + 16) = 0;

      v8 = *(void **)(v9 + 24);
      *(_QWORD *)(v9 + 24) = 0;

      v1 = (unsigned int *)v9;
      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:

}

void sub_226352084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2263520F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2263521BC(void *a1)
{
  void (**v1)(id, _QWORD, char *);
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  const char *v29;
  const char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v43 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  sub_22635296C(1, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v39, (uint64_t)v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v10)
        objc_enumerationMutation(v6);
      v1[2](v1, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v11), &v43);
      if (v43)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v39, (uint64_t)v46, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    sub_2263524E8(1, v13, v14, v15, v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v35, (uint64_t)v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v6);
          v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v23 = v22;
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v31, (uint64_t)v44, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v32;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v32 != v27)
                  objc_enumerationMutation(v23);
                v1[2](v1, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), &v43);
                if (v43)
                {

                  goto LABEL_26;
                }
              }
              v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v29, (uint64_t)&v31, (uint64_t)v44, 16);
              if (v26)
                continue;
              break;
            }
          }

        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v30, (uint64_t)&v35, (uint64_t)v45, 16);
      }
      while (v19);
    }
  }
LABEL_26:

}

uint64_t sub_22635240C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_announceUsedCapability_version_(a2, (const char *)a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a5);
}

uint64_t sub_226352494(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5);
}

id sub_2263524E8(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;

  objc_msgSend_currentThread(MEMORY[0x24BDD17F0], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_threadDictionary(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("XRCapabilityAdditionalContextSets"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a1 && !v15)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend_threadDictionary(v6, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v15, (uint64_t)CFSTR("XRCapabilityAdditionalContextSets"), v22);

  }
  return v15;
}

void sub_22635286C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Index;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  Index = objc_msgSend_firstIndex(v6, v8, v9, v10, v11);
  v17 = objc_msgSend_lastIndex(v6, v13, v14, v15, v16);
  v22 = objc_msgSend_firstIndex(v6, v18, v19, v20, v21);

  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 216), v23, (uint64_t)v7, v24, v25);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, id))(v5 + 16))(v5, v7, Index, v17 - v22 + 1, v26);

}

id sub_22635296C(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  objc_msgSend_currentThread(MEMORY[0x24BDD17F0], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_threadDictionary(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("XRCapabilityContextSet"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a1 && !v15)
  {
    objc_msgSend_weakObjectsHashTable(MEMORY[0x24BDD15C0], v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_threadDictionary(v6, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v24, v25, (uint64_t)v15, (uint64_t)CFSTR("XRCapabilityContextSet"), v26);

  }
  return v15;
}

void sub_226352BFC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BDBCA90];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 1, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_25583C668;
  qword_25583C668 = v5;

}

void sub_226352E68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226352FA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226352FF8()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_25583C680;
  qword_25583C680 = v0;

}

uint64_t sub_226353034(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t hasSpaceAvailable;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v10 = a3;
  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  v14 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9, v13);
  if (objc_msgSend_length(v14, v15, v16, v17, v18))
  {
    objc_msgSend_dataUsingEncoding_(v14, v19, 4, v20, v21);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      hasSpaceAvailable = objc_msgSend_hasSpaceAvailable(a1, v22, v23, v24, v25);
      if (!(_DWORD)hasSpaceAvailable)
        break;
      v26 = objc_retainAutorelease(v26);
      v32 = objc_msgSend_bytes(v26, v28, v29, v30, v31);
      v37 = objc_msgSend_length(v26, v33, v34, v35, v36);
      v40 = objc_msgSend_write_maxLength_(a1, v38, v32, v37, v39);
      v45 = v40;
      if (v40 < 1)
      {
        if (!v40)
          abort();
        hasSpaceAvailable = 0;
        break;
      }
      if (v40 != objc_msgSend_length(v26, v41, v42, v43, v44))
      {
        v50 = objc_msgSend_length(v26, v46, v47, v48, v49);
        objc_msgSend_subdataWithRange_(v26, v51, v45, v50 - v45, v52);
        v53 = objc_claimAutoreleasedReturnValue();

        v45 = 0;
        v26 = (id)v53;
      }
    }
    while (v45 != objc_msgSend_length(v26, v46, v47, v48, v49));

  }
  else
  {
    hasSpaceAvailable = 1;
  }

  return hasSpaceAvailable;
}

void sub_226353518()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("xs:annotation");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C688;
  qword_25583C688 = v1;

}

void sub_2263537A4()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("xs:pattern");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C698;
  qword_25583C698 = v1;

}

void sub_22635397C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_22635398C(uint64_t result)
{
  BOOL v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  if (*(_BYTE *)(result + 88))
    v1 = 1;
  else
    v1 = *(_QWORD *)(result + 16) > 4uLL;
  if (!v1)
  {
    v2 = *(_QWORD **)result;
    if (*(_QWORD *)result == result + 8)
    {
LABEL_14:
      *(_BYTE *)(result + 88) = 1;
    }
    else
    {
      v3 = 0;
      while (v3 != 4)
      {
        *(_OWORD *)(result + 24 + 16 * v3) = *((_OWORD *)v2 + 2);
        v4 = (_QWORD *)v2[1];
        if (v4)
        {
          do
          {
            v5 = v4;
            v4 = (_QWORD *)*v4;
          }
          while (v4);
        }
        else
        {
          do
          {
            v5 = (_QWORD *)v2[2];
            v6 = *v5 == (_QWORD)v2;
            v2 = v5;
          }
          while (!v6);
        }
        ++v3;
        v2 = v5;
        if (v5 == (_QWORD *)(result + 8))
          goto LABEL_14;
      }
      __break(1u);
    }
  }
  return result;
}

void sub_226353A9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226353AF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t **sub_226353B00(void *a1, void *a2)
{
  uint64_t **v3;
  uint64_t **v4;
  uint64_t **v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v3 != v4)
      sub_226354290(v3 + 1, v4[1], v4 + 2);
    *((_OWORD *)v3 + 2) = *((_OWORD *)v5 + 2);
    v6 = *((_OWORD *)v5 + 3);
    v7 = *((_OWORD *)v5 + 4);
    v8 = *((_OWORD *)v5 + 5);
    *((_BYTE *)v3 + 96) = *((_BYTE *)v5 + 96);
    *((_OWORD *)v3 + 4) = v7;
    *((_OWORD *)v3 + 5) = v8;
    *((_OWORD *)v3 + 3) = v6;
    sub_22635398C((uint64_t)(v3 + 1));
  }

  return v3;
}

void sub_226353B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226353D70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226353DF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_226353E00(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  std::logic_error *exception;

  if (!*(_QWORD *)(a1 + 16))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_226354E40(exception, "Trying to call lastIndex when the set is empty.");
    __cxa_throw(exception, (struct type_info *)off_24EDC2088, MEMORY[0x24BEDAB00]);
  }
  v3 = *(_QWORD **)(a1 + 8);
  v1 = (_QWORD *)(a1 + 8);
  v2 = v3;
  if (v3)
  {
    do
    {
      v4 = v2;
      v2 = (_QWORD *)v2[1];
    }
    while (v2);
  }
  else
  {
    do
    {
      v4 = (_QWORD *)v1[2];
      v5 = *v4 == (_QWORD)v1;
      v1 = v4;
    }
    while (v5);
  }
  return v4[5];
}

void sub_226353E80(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_226353EA0(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t *i;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;

  if (*(_BYTE *)(a1 + 88))
  {
    v2 = *(_QWORD *)(a1 + 16);
    if (v2 > 4)
      sub_22636FC58();
    if (v2)
    {
      for (i = (unint64_t *)(a1 + 32); *(i - 1) > a2 || *i < a2; i += 2)
      {
        if (!--v2)
          return 0;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7 = *(_QWORD **)(a1 + 8);
    v5 = (_QWORD *)(a1 + 8);
    v6 = v7;
    if (!v7)
      goto LABEL_20;
    v8 = v5;
    do
    {
      v9 = v6[5];
      v10 = v9 >= a2;
      if (v9 >= a2)
        v11 = v6;
      else
        v11 = v6 + 1;
      if (v10)
        v8 = v6;
      v6 = (_QWORD *)*v11;
    }
    while (*v11);
    if (v8 == v5 || v8[4] > a2)
LABEL_20:
      v8 = v5;
    return v8 != v5;
  }
}

BOOL sub_226353F5C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;

  if (!a3)
    return 0;
  v5 = *(_QWORD **)(a1 + 8);
  v3 = (_QWORD *)(a1 + 8);
  v4 = v5;
  if (!v5)
    goto LABEL_13;
  v6 = v3;
  do
  {
    v7 = v4[5];
    v8 = v7 >= a2;
    if (v7 >= a2)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == v3 || a2 + a3 - 1 < v6[4])
LABEL_13:
    v6 = v3;
  return v6 != v3;
}

void sub_226354054(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_226354064(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t v7;

  v2 = (_QWORD *)*result;
  v1 = (_QWORD *)result[1];
  if ((_QWORD *)*result != v1)
  {
    v3 = result[2];
    if (v3 == v2[5])
    {
      v4 = (_QWORD *)v2[1];
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          v5 = (_QWORD *)v2[2];
          v6 = *v5 == (_QWORD)v2;
          v2 = v5;
        }
        while (!v6);
      }
      *result = v5;
      if (v5 == v1)
        v7 = 0;
      else
        v7 = v5[4];
    }
    else
    {
      v7 = v3 + 1;
    }
    result[2] = v7;
  }
  return result;
}

void sub_226354174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226354280(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t **sub_226354290(uint64_t **result, _QWORD *a2, _QWORD *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t *v16;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v14 = result;
    v15 = v8;
    v16 = v8;
    if (v8)
    {
      v15 = sub_226354648((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
          sub_2263543F0(v5, v8);
          v8 = v15;
          v16 = v15;
          if (v15)
            v15 = sub_226354648((uint64_t)v15);
          v10 = (_QWORD *)v9[1];
          if (v10)
          {
            do
            {
              a2 = v10;
              v10 = (_QWORD *)*v10;
            }
            while (v10);
          }
          else
          {
            do
            {
              a2 = (_QWORD *)v9[2];
              v11 = *a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v11);
          }
          if (!v8)
            break;
          v9 = a2;
        }
        while (a2 != a3);
      }
    }
    result = (uint64_t **)sub_22635469C((uint64_t)&v14);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)sub_226354730(v5, (_OWORD *)a2 + 2);
      v12 = (_QWORD *)a2[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          v13 = (_QWORD *)a2[2];
          v11 = *v13 == (_QWORD)a2;
          a2 = v13;
        }
        while (!v11);
      }
      a2 = v13;
    }
    while (v13 != a3);
  }
  return result;
}

void sub_2263543DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_22635469C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_2263543F0(uint64_t **a1, uint64_t *a2)
{
  uint64_t **v3;
  uint64_t *v4;
  uint64_t **v5;

  v3 = a1 + 1;
  v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        v3 = (uint64_t **)v4;
        if (a2[5] >= (unint64_t)v4[4])
          break;
        v4 = (uint64_t *)*v4;
        v5 = v3;
        if (!*v3)
          goto LABEL_8;
      }
      v4 = (uint64_t *)v4[1];
    }
    while (v4);
    v5 = v3 + 1;
  }
  else
  {
    v5 = a1 + 1;
  }
LABEL_8:
  sub_22635445C(a1, (uint64_t)v3, v5, a2);
  return a2;
}

uint64_t *sub_22635445C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_2263544B0(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_2263544B0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

_QWORD *sub_226354648(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t sub_22635469C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  sub_2263546F0(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    sub_2263546F0(*(_QWORD *)a1, v2);
  }
  return a1;
}

void sub_2263546F0(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_2263546F0(a1, *a2);
    sub_2263546F0(a1, a2[1]);
    operator delete(a2);
  }
}

_OWORD *sub_226354730(uint64_t **a1, _OWORD *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;

  v4 = operator new(0x30uLL);
  v5 = v4;
  v4[2] = *a2;
  v6 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        v6 = (uint64_t **)v7;
        if (*((_QWORD *)v4 + 5) >= (unint64_t)v7[4])
          break;
        v7 = (uint64_t *)*v7;
        v8 = v6;
        if (!*v6)
          goto LABEL_8;
      }
      v7 = (uint64_t *)v7[1];
    }
    while (v7);
    v8 = v6 + 1;
  }
  else
  {
    v8 = a1 + 1;
  }
LABEL_8:
  sub_22635445C(a1, (uint64_t)v6, v8, (uint64_t *)v4);
  return v5;
}

uint64_t *sub_2263547C0(uint64_t a1, _OWORD *a2)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v17;
  __int128 v19;

  v3 = *(_QWORD *)a2 - 1;
  if (!*(_QWORD *)a2)
    v3 = 0;
  v5 = (uint64_t *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (!v4)
    return sub_226354CD0((uint64_t **)a1, (_QWORD *)(a1 + 8), a2);
  v6 = (uint64_t *)(a1 + 8);
  do
  {
    v7 = v4[5];
    v8 = v7 >= v3;
    if (v7 >= v3)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == v5)
    return sub_226354CD0((uint64_t **)a1, (_QWORD *)(a1 + 8), a2);
  v19 = *a2;
  v11 = *((_QWORD *)&v19 + 1);
  v10 = v19;
  while (1)
  {
    v13 = v6[4];
    v12 = v6[5];
    if ((v12 == -1 || v12 + 1 != v10) && (!v13 || v13 - 1 != v11) && (v12 < v10 || v11 < v13))
      break;
    if (v13 < v10)
      v10 = v6[4];
    if (v11 <= v12)
      v11 = v6[5];
    v17 = sub_2263548DC((uint64_t **)a1, v6);
    operator delete(v6);
    v6 = v17;
    if (v5 == v17)
    {
      v6 = v5;
      break;
    }
  }
  *(_QWORD *)&v19 = v10;
  *((_QWORD *)&v19 + 1) = v11;
  return sub_226354CD0((uint64_t **)a1, v6, &v19);
}

uint64_t *sub_2263548DC(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_22635494C(v6, a2);
  return v3;
}

uint64_t *sub_22635494C(uint64_t *result, uint64_t *a2)
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
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
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
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t *sub_226354CD0(uint64_t **a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9;

  v6 = (uint64_t *)operator new(0x30uLL);
  *((_OWORD *)v6 + 2) = *a3;
  v7 = (uint64_t **)sub_226354D58(a1, a2, &v9, v6 + 4);
  sub_22635445C(a1, v9, v7, v6);
  return v6;
}

void sub_226354D44(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_226354D58(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  unint64_t v11;
  _QWORD *v12;

  v4 = a1 + 1;
  if (a1 + 1 != a2 && a2[5] < *a4)
  {
    while (1)
    {
      v5 = (_QWORD *)*v4;
      a2 = v4;
      if (!*v4)
        break;
      while (1)
      {
        v4 = v5;
        if (v5[5] >= *a4)
          break;
        v5 = (_QWORD *)v5[1];
        if (!v5)
          goto LABEL_19;
      }
    }
LABEL_20:
    *a3 = v4;
    return a2;
  }
  v6 = *a2;
  if ((_QWORD *)*a1 == a2)
  {
    v8 = a2;
  }
  else
  {
    if (v6)
    {
      v7 = (_QWORD *)*a2;
      do
      {
        v8 = v7;
        v7 = (_QWORD *)v7[1];
      }
      while (v7);
    }
    else
    {
      v9 = a2;
      do
      {
        v8 = (_QWORD *)v9[2];
        v10 = *v8 == (_QWORD)v9;
        v9 = v8;
      }
      while (v10);
    }
    v11 = a4[1];
    if (v11 < v8[4])
    {
      while (1)
      {
        v12 = (_QWORD *)*v4;
        a2 = v4;
        if (!*v4)
          goto LABEL_20;
        while (1)
        {
          v4 = v12;
          if (v11 < v12[4])
            break;
          v12 = (_QWORD *)v12[1];
          if (!v12)
          {
LABEL_19:
            a2 = v4 + 1;
            goto LABEL_20;
          }
        }
      }
    }
  }
  if (v6)
  {
    *a3 = v8;
    return v8 + 1;
  }
  else
  {
    *a3 = a2;
  }
  return a2;
}

std::logic_error *sub_226354E40(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void sub_226354F78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2263554BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  objc_msgSend_ticket(v7, a2, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend__holdReceivedAgent_ticket_(v6, v9, (uint64_t)v7, (uint64_t)v8, v10);

  if ((v6 & 1) == 0)
    objc_msgSend__welcomeAgent_(*(void **)(a1 + 32), v11, *(_QWORD *)(a1 + 40), v12, v13);
}

uint64_t sub_226355600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__executeWelcomeForAgent_, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_2263557A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend__runAgentPrologue_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4, a5);
  objc_msgSend__runAgentPrologue_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 48), v7, v8);
  objc_msgSend__executeAgent_(*(void **)(a1 + 32), v9, *(_QWORD *)(a1 + 40), v10, v11);
  objc_msgSend__executeAgent_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 48), v13, v14);
  objc_msgSend__runAgentEpilogue_(*(void **)(a1 + 32), v15, *(_QWORD *)(a1 + 40), v16, v17);
  return objc_msgSend__runAgentEpilogue_(*(void **)(a1 + 32), v18, *(_QWORD *)(a1 + 48), v19, v20);
}

void sub_2263557F8(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(id *)(a1 + 32);
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v37, (uint64_t)v43, 16);
  if (v4)
  {
    v8 = v4;
    v9 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v2);
        objc_msgSend__runAgentPrologue_(*(void **)(a1 + 40), v5, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10++), v6, v7);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v37, (uint64_t)v43, 16);
    }
    while (v8);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = *(id *)(a1 + 32);
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v42, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v11);
        objc_msgSend__executeAgent_(*(void **)(a1 + 40), v14, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19++), v15, v16);
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v42, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = *(id *)(a1 + 32);
  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v29, (uint64_t)v41, 16);
  if (v22)
  {
    v26 = v22;
    v27 = *(_QWORD *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v20);
        objc_msgSend__runAgentEpilogue_(*(void **)(a1 + 40), v23, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v28++), v24, v25, (_QWORD)v29);
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v29, (uint64_t)v41, 16);
    }
    while (v26);
  }

}

void sub_226355AB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__runAgentPrologue_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4, a5);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = *(id *)(a1 + 48);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v47, (uint64_t)v53, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend__runAgentPrologue_(*(void **)(a1 + 32), v9, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v14++), v10, v11);
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v47, (uint64_t)v53, 16);
    }
    while (v12);
  }

  objc_msgSend__executeAgent_(*(void **)(a1 + 32), v15, *(_QWORD *)(a1 + 40), v16, v17);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = *(id *)(a1 + 48);
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v43, (uint64_t)v52, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v44;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(v18);
        objc_msgSend__executeAgent_(*(void **)(a1 + 32), v21, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v26++), v22, v23);
      }
      while (v24 != v26);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v43, (uint64_t)v52, 16);
    }
    while (v24);
  }

  objc_msgSend__runAgentEpilogue_(*(void **)(a1 + 32), v27, *(_QWORD *)(a1 + 40), v28, v29);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v30 = *(id *)(a1 + 48);
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v39, (uint64_t)v51, 16);
  if (v32)
  {
    v36 = v32;
    v37 = *(_QWORD *)v40;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(v30);
        objc_msgSend__runAgentEpilogue_(*(void **)(a1 + 32), v33, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v38++), v34, v35, (_QWORD)v39);
      }
      while (v36 != v38);
      v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v39, (uint64_t)v51, 16);
    }
    while (v36);
  }

}

uint64_t XREngineeringTypeIDForMnemonic(void *a1)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;

  v1 = qword_25583C6E8;
  v5 = a1;
  if (v1 != -1)
    dispatch_once(&qword_25583C6E8, &unk_24EDC2A90);
  v6 = objc_msgSend_indexOfObject_((void *)qword_25583C6E0, v2, (uint64_t)v5, v3, v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (unsigned __int16)v6;
}

uint64_t sub_226356124(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend_orderedSetWithCapacity_(MEMORY[0x24BDBCEE0], a2, 252, a4, a5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_25583C6E0;
  qword_25583C6E0 = v5;

  return MEMORY[0x24BEDD108](qword_25583C6E0, sel_addObjects_count_, XR_ENGINEERING_MNEMONIC_BY_ETYPE, 252, v7);
}

__CFString *XREngineeringMnemonicForTypeID(int a1)
{
  return XR_ENGINEERING_MNEMONIC_BY_ETYPE[a1];
}

uint64_t XREngineeringTypeUnwrapAny(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t Value_fieldIndex;

  v3 = a1;
  if (objc_msgSend_engineeringType(v3, v4, v5, v6, v7) == 107)
    Value_fieldIndex = objc_msgSend_getValue_fieldIndex_(v3, v8, a2, 0, v9);
  else
    Value_fieldIndex = 0;

  return Value_fieldIndex;
}

void sub_226356BA8()
{
  void *v0;
  void *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v0 = (void *)objc_opt_new();
  v1 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_226356C54;
  v12[3] = &unk_24EDC3EF8;
  v13 = v0;
  v2 = v0;
  objc_msgSend_enumerateEngineeringTypeDefs_(v1, v3, (uint64_t)v12, v4, v5);
  v10 = objc_msgSend_copy(v2, v6, v7, v8, v9);
  v11 = (void *)qword_25583C6F0;
  qword_25583C6F0 = v10;

}

void sub_226356C54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = *(void **)(a1 + 32);
  objc_msgSend_mnemonic(v3, v6, v7, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, v4, (uint64_t)v12, v11);
}

id sub_226357120(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  void *v26;
  void *v27;

  v1 = a1;
  if (objc_msgSend_engineeringType(v1, v2, v3, v4, v5) == 135)
  {
    v26 = 0;
    v27 = 0;
    if (objc_msgSend_getValue_fieldIndex_(v1, v6, (uint64_t)&v27, 0, v7))
    {
      if ((objc_msgSend_getValue_fieldIndex_(v1, v8, (uint64_t)&v26, 1, v9) & 1) != 0)
      {
        v14 = objc_msgSend_uint64(v27, v10, v11, v12, v13);
        v25[1] = bswap64(objc_msgSend_uint64(v26, v15, v16, v17, v18, bswap64(v14)));
        v19 = objc_alloc(MEMORY[0x24BDD1880]);
        v23 = (void *)objc_msgSend_initWithUUIDBytes_(v19, v20, (uint64_t)v25, v21, v22);

        return v23;
      }

    }
  }

  return 0;
}

void sub_2263571EC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2263571D4);
  }
  _Unwind_Resume(a1);
}

void sub_22635720C(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, void *, void *);
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend_engineeringType(v5, v6, v7, v8, v9) == 208)
  {
    objc_msgSend_objectValue(v5, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_count(v14, v15, v16, v17, v18) & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        sub_22636FCD0(v14, v36, v37, v38, v39);
    }
    else if ((unint64_t)objc_msgSend_count(v14, v19, v20, v21, v22) >= 2)
    {
      v26 = 1;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(v14, v23, v26 - 1, v24, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v14, v28, v26, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v27, v31);

        v26 += 2;
      }
      while (objc_msgSend_count(v14, v32, v33, v34, v35) > v26);
    }

  }
}

void sub_226357308(void *a1, uint64_t a2, void *a3)
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend_engineeringType(v5, v6, v7, v8, v9) != 163)
    goto LABEL_20;
  v33 = 0;
  if (!objc_msgSend_getLengthOfUint64Representation_(v5, v10, (uint64_t)&v33, v11, v12))
    goto LABEL_20;
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v29 = 0;
  if (!v33)
    goto LABEL_19;
  v15 = 0;
  while (1)
  {
    if (!objc_msgSend_getValue_fieldIndex_(v5, v13, (uint64_t)&v32, v15, v14)
      || !objc_msgSend_isValid(v32, v13, v16, v17, v14)
      || !objc_msgSend_getValue_fieldIndex_(v32, v13, (uint64_t)&v31, 0, v14)
      || !objc_msgSend_getValue_fieldIndex_(v32, v13, (uint64_t)&v30, 1, v14))
    {
      goto LABEL_18;
    }
    objc_msgSend_uuidFromEngineeringValue(v31, v13, v18, v19, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = objc_msgSend_uint32(v30, v20, v21, v22, v23);
      v26 = v25 <= 1uLL ? 1 : v25;
      v27 = v26 - 1;
      v28 = v15 ? v27 : v25;
      v29 = 0;
      v4[2](v4, v24, v28, &v29);
      if (v29)
        break;
    }

LABEL_18:
    if (v33 <= ++v15)
      goto LABEL_19;
  }

LABEL_19:
LABEL_20:

}

uint64_t sub_226357454(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, unint64_t a6, unint64_t a7)
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v42;

  v12 = a1;
  if (objc_msgSend_engineeringType(v12, v13, v14, v15, v16) == 209)
  {
    v42 = 0;
    if (a4)
    {
      v23 = 0;
      if (!objc_msgSend_getValue_fieldIndex_(v12, v17, (uint64_t)&v42, 0, v18))
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend_uuidFromEngineeringValue(v42, v19, v20, v21, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a3)
    {
      if (!objc_msgSend_getValue_fieldIndex_(v12, v17, (uint64_t)&v42, 2, v18))
        goto LABEL_20;
      objc_msgSend_string(v42, v24, v25, v26, v27);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      if (!objc_msgSend_getValue_fieldIndex_(v12, v17, (uint64_t)&v42, 1, v18))
        goto LABEL_20;
      objc_msgSend_string(v42, v28, v29, v30, v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (!(a6 | a7))
    {
LABEL_18:
      v23 = 1;
      goto LABEL_21;
    }
    if (objc_msgSend_getValue_fieldIndex_(v12, v17, (uint64_t)&v42, 3, v18))
    {
      objc_msgSend_string(v42, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v36;
      if (a6)
        *(_BYTE *)a6 = objc_msgSend_isEqualToString_(v36, v37, (uint64_t)CFSTR("shared"), v38, v39);
      if (a7)
        *(_BYTE *)a7 = objc_msgSend_isEqualToString_(v40, v37, (uint64_t)CFSTR("ephemeral"), v38, v39);

      goto LABEL_18;
    }
LABEL_20:
    v23 = 0;
    goto LABEL_21;
  }
  v23 = 0;
LABEL_22:

  return v23;
}

uint64_t sub_2263575C4(void *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  void *v22;

  v6 = a1;
  if (objc_msgSend_engineeringType(v6, v7, v8, v9, v10) == 23)
  {
    v21 = 0;
    v22 = 0;
    v15 = 0;
    if (objc_msgSend_getValue_fieldIndex_(v6, v11, (uint64_t)&v22, 0, v12))
    {
      if (objc_msgSend_getValue_fieldIndex_(v6, v13, (uint64_t)&v21, 1, v14))
      {
        if (a3)
          *a3 = objc_msgSend_uint32(v22, v16, v17, v18, v19);
        if (a4)
        {
          objc_msgSend_string(v21, v16, v17, v18, v19);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t sub_22635768C(void *a1, uint64_t a2, uint64_t *a3, id *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id obj;
  void *v22;

  v6 = a1;
  if (objc_msgSend_engineeringType(v6, v7, v8, v9, v10) == 8)
  {
    obj = 0;
    v22 = 0;
    v15 = 0;
    if (objc_msgSend_getValue_fieldIndex_(v6, v11, (uint64_t)&v22, 0, v12))
    {
      if (objc_msgSend_getValue_fieldIndex_(v6, v13, (uint64_t)&obj, 1, v14))
      {
        if (a3)
          *a3 = objc_msgSend_uint64(v22, v16, v17, v18, v19);
        if (a4)
          objc_storeStrong(a4, obj);
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t sub_226357824()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
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
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;

  v0 = objc_opt_new();
  v1 = (void *)qword_25583C700;
  qword_25583C700 = v0;

  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v2, (uint64_t)CFSTR("MACH (0x01)"), 1, v3);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v4, (uint64_t)CFSTR("NETWORK (0x02)"), 2, v5);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v6, (uint64_t)CFSTR("FSYSTEM (0x03)"), 3, v7);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v8, (uint64_t)CFSTR("BSD (0x04)"), 4, v9);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v10, (uint64_t)CFSTR("IOKIT (0x05)"), 5, v11);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v12, (uint64_t)CFSTR("DRIVERS (0x06)"), 6, v13);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v14, (uint64_t)CFSTR("TRACE (0x07)"), 7, v15);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v16, (uint64_t)CFSTR("MISC (0x14)"), 20, v17);
  objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v18, (uint64_t)CFSTR("MIG (0xff)"), 255, v19);
  result = objc_msgSend_isAppleInternal(MEMORY[0x24BDD1760], v20, v21, v22, v23);
  if ((_DWORD)result)
  {
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v25, (uint64_t)CFSTR("DLIL (0x08)"), 8, v26);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v27, (uint64_t)CFSTR("PTHREAD (0x09)"), 9, v28);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v29, (uint64_t)CFSTR("CORESTORAGE (0x0a)"), 10, v30);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v31, (uint64_t)CFSTR("CG (0x0b)"), 11, v32);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v33, (uint64_t)CFSTR("MONOTONIC (0x0c)"), 12, v34);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v35, (uint64_t)CFSTR("SECURITY (0x1e)"), 30, v36);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v37, (uint64_t)CFSTR("DYLD (0x1f)"), 31, v38);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v39, (uint64_t)CFSTR("QT (0x20)"), 32, v40);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v41, (uint64_t)CFSTR("APPS (0x21)"), 33, v42);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v43, (uint64_t)CFSTR("LAUNCHD (0x22)"), 34, v44);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v45, (uint64_t)CFSTR("SILICON (0x23)"), 35, v46);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v47, (uint64_t)CFSTR("PERF (0x25)"), 37, v48);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v49, (uint64_t)CFSTR("IMPORTANCE (0x26)"), 38, v50);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v51, (uint64_t)CFSTR("BANK (0x28)"), 40, v52);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v53, (uint64_t)CFSTR("XPC (0x29)"), 41, v54);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v55, (uint64_t)CFSTR("ATM (0x2a)"), 42, v56);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v57, (uint64_t)CFSTR("ARIADNE (0x2b)"), 43, v58);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v59, (uint64_t)CFSTR("DAEMON (0x2c)"), 44, v60);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v61, (uint64_t)CFSTR("ENERGYTRACE (0x2d)"), 45, v62);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v63, (uint64_t)CFSTR("DISPATCH (0x2e)"), 46, v64);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v65, (uint64_t)CFSTR("IMG (0x31)"), 49, v66);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v67, (uint64_t)CFSTR("UMALLOC (0x33)"), 51, v68);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v69, (uint64_t)CFSTR("TURNSTILE (0x35)"), 53, v70);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v71, (uint64_t)CFSTR("AUDIO (0x36)"), 54, v72);
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v73, (uint64_t)CFSTR("GRAPHICS (0x85)"), 133, v74);
    return objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C700, v75, (uint64_t)CFSTR("MUSE (0x34)"), 52, v76);
  }
  return result;
}

void sub_226357B2C()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  const char *v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  const char *v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  const char *v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  const char *v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  const char *v333;
  uint64_t v334;
  const char *v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  const char *v356;
  uint64_t v357;
  const char *v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  const char *v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  const char *v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  void *v376;
  const char *v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  const char *v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  const char *v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  const char *v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  const char *v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  const char *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  const char *v412;
  uint64_t v413;
  const char *v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  const char *v420;
  uint64_t v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  const char *v427;
  uint64_t v428;
  const char *v429;
  uint64_t v430;
  const char *v431;
  uint64_t v432;
  const char *v433;
  uint64_t v434;
  const char *v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  void *v440;
  void *v441;
  void *v442;
  id v443;

  v0 = objc_opt_new();
  v1 = (void *)qword_25583C710;
  qword_25583C710 = v0;

  if (objc_msgSend_isAppleInternal(MEMORY[0x24BDD1760], v2, v3, v4, v5))
  {
    v443 = (id)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v6, (uint64_t)v443, 1, v7);
    objc_msgSend_setObject_forIntegerKey_(v443, v8, (uint64_t)CFSTR("EXCP_KTRAP_x86 (0x02)"), 2, v9);
    objc_msgSend_setObject_forIntegerKey_(v443, v10, (uint64_t)CFSTR("EXCP_SYNC_ARM (0x03)"), 3, v11);
    objc_msgSend_setObject_forIntegerKey_(v443, v12, (uint64_t)CFSTR("EXCP_SERR_ARM (0x04)"), 4, v13);
    objc_msgSend_setObject_forIntegerKey_(v443, v14, (uint64_t)CFSTR("EXCP_INTR (0x05)"), 5, v15);
    objc_msgSend_setObject_forIntegerKey_(v443, v16, (uint64_t)CFSTR("EXCP_ALNG (0x06)"), 6, v17);
    objc_msgSend_setObject_forIntegerKey_(v443, v18, (uint64_t)CFSTR("EXCP_UTRAP_x86 (0x07)"), 7, v19);
    objc_msgSend_setObject_forIntegerKey_(v443, v20, (uint64_t)CFSTR("EXCP_FP (0x08)"), 8, v21);
    objc_msgSend_setObject_forIntegerKey_(v443, v22, (uint64_t)CFSTR("EXCP_DECI (0x09)"), 9, v23);
    objc_msgSend_setObject_forIntegerKey_(v443, v24, (uint64_t)CFSTR("SIGNPOST (0x0a)"), 10, v25);
    objc_msgSend_setObject_forIntegerKey_(v443, v26, (uint64_t)CFSTR("EXCP_SC (0x0c)"), 12, v27);
    objc_msgSend_setObject_forIntegerKey_(v443, v28, (uint64_t)CFSTR("EXCP_TRACE (0x0d)"), 13, v29);
    objc_msgSend_setObject_forIntegerKey_(v443, v30, (uint64_t)CFSTR("EXCP_EMUL (0x0e)"), 14, v31);
    objc_msgSend_setObject_forIntegerKey_(v443, v32, (uint64_t)CFSTR("IHDLR (0x10)"), 16, v33);
    objc_msgSend_setObject_forIntegerKey_(v443, v34, (uint64_t)CFSTR("IPC (0x20)"), 32, v35);
    objc_msgSend_setObject_forIntegerKey_(v443, v36, (uint64_t)CFSTR("RESOURCE (0x25)"), 37, v37);
    objc_msgSend_setObject_forIntegerKey_(v443, v38, (uint64_t)CFSTR("VM (0x30)"), 48, v39);
    objc_msgSend_setObject_forIntegerKey_(v443, v40, (uint64_t)CFSTR("LEAKS (0x31)"), 49, v41);
    objc_msgSend_setObject_forIntegerKey_(v443, v42, (uint64_t)CFSTR("WORKINGSET (0x32)"), 50, v43);
    objc_msgSend_setObject_forIntegerKey_(v443, v44, (uint64_t)CFSTR("SCHED (0x40)"), 64, v45);
    objc_msgSend_setObject_forIntegerKey_(v443, v46, (uint64_t)CFSTR("MSGID_INVALID (0x50)"), 80, v47);
    objc_msgSend_setObject_forIntegerKey_(v443, v48, (uint64_t)CFSTR("LOCKS (0x60)"), 96, v49);
    objc_msgSend_setObject_forIntegerKey_(v443, v50, (uint64_t)CFSTR("PMAP (0x70)"), 112, v51);
    objc_msgSend_setObject_forIntegerKey_(v443, v52, (uint64_t)CFSTR("CLOCK (0x80)"), 128, v53);
    objc_msgSend_setObject_forIntegerKey_(v443, v54, (uint64_t)CFSTR("MP (0x90)"), 144, v55);
    objc_msgSend_setObject_forIntegerKey_(v443, v56, (uint64_t)CFSTR("VM_PRESSURE (0xa0)"), 160, v57);
    objc_msgSend_setObject_forIntegerKey_(v443, v58, (uint64_t)CFSTR("STACKSHOT (0xa1)"), 161, v59);
    objc_msgSend_setObject_forIntegerKey_(v443, v60, (uint64_t)CFSTR("SFI (0xa2)"), 162, v61);
    objc_msgSend_setObject_forIntegerKey_(v443, v62, (uint64_t)CFSTR("ENERGY_PERF (0xa3)"), 163, v63);
    objc_msgSend_setObject_forIntegerKey_(v443, v64, (uint64_t)CFSTR("SYSDIAGNOSE (0xa4)"), 164, v65);
    objc_msgSend_setObject_forIntegerKey_(v443, v66, (uint64_t)CFSTR("ZALLOC (0xa5)"), 165, v67);
    objc_msgSend_setObject_forIntegerKey_(v443, v68, (uint64_t)CFSTR("THREAD_GROUP (0xa6)"), 166, v69);
    objc_msgSend_setObject_forIntegerKey_(v443, v70, (uint64_t)CFSTR("COALITION (0xa7)"), 167, v71);
    objc_msgSend_setObject_forIntegerKey_(v443, v72, (uint64_t)CFSTR("SHAREDREGION (0xa8)"), 168, v73);
    objc_msgSend_setObject_forIntegerKey_(v443, v74, (uint64_t)CFSTR("SCHED_CLUTCH (0xa9)"), 169, v75);
    objc_msgSend_setObject_forIntegerKey_(v443, v76, (uint64_t)CFSTR("IO(0xaa)"), 170, v77);
    objc_msgSend_setObject_forIntegerKey_(v443, v78, (uint64_t)CFSTR("WORKGROUP (0xab)"), 171, v79);
    objc_msgSend_setObject_forIntegerKey_(v443, v80, (uint64_t)CFSTR("HV (0xac)"), 172, v81);
    objc_msgSend_setObject_forIntegerKey_(v443, v82, (uint64_t)CFSTR("KCOV (0xad)"), 173, v83);
    objc_msgSend_setObject_forIntegerKey_(v443, v84, (uint64_t)CFSTR("MACHDEP_EXCP_SC_x86 (0xae)"), 174, v85);
    objc_msgSend_setObject_forIntegerKey_(v443, v86, (uint64_t)CFSTR("MACHDEP_EXCP_SC_ARM (0xaf)"), 175, v87);
    v442 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v88, (uint64_t)v442, 2, v89);
    objc_msgSend_setObject_forIntegerKey_(v442, v90, (uint64_t)CFSTR("NETIP (0x01)"), 1, v91);
    objc_msgSend_setObject_forIntegerKey_(v442, v92, (uint64_t)CFSTR("NETARP (0x02)"), 2, v93);
    objc_msgSend_setObject_forIntegerKey_(v442, v94, (uint64_t)CFSTR("NETUDP (0x03)"), 3, v95);
    objc_msgSend_setObject_forIntegerKey_(v442, v96, (uint64_t)CFSTR("NETTCP (0x04)"), 4, v97);
    objc_msgSend_setObject_forIntegerKey_(v442, v98, (uint64_t)CFSTR("NETICMP (0x05)"), 5, v99);
    objc_msgSend_setObject_forIntegerKey_(v442, v100, (uint64_t)CFSTR("NETIGMP (0x06)"), 6, v101);
    objc_msgSend_setObject_forIntegerKey_(v442, v102, (uint64_t)CFSTR("NETRIP (0x07)"), 7, v103);
    objc_msgSend_setObject_forIntegerKey_(v442, v104, (uint64_t)CFSTR("NETOSPF (0x08)"), 8, v105);
    objc_msgSend_setObject_forIntegerKey_(v442, v106, (uint64_t)CFSTR("NETISIS (0x09)"), 9, v107);
    objc_msgSend_setObject_forIntegerKey_(v442, v108, (uint64_t)CFSTR("NETSNMP (0x0a)"), 10, v109);
    objc_msgSend_setObject_forIntegerKey_(v442, v110, (uint64_t)CFSTR("NETSOCK (0x0b)"), 11, v111);
    objc_msgSend_setObject_forIntegerKey_(v442, v112, (uint64_t)CFSTR("NETAARP (0x64)"), 100, v113);
    objc_msgSend_setObject_forIntegerKey_(v442, v114, (uint64_t)CFSTR("NETDDP (0x65)"), 101, v115);
    objc_msgSend_setObject_forIntegerKey_(v442, v116, (uint64_t)CFSTR("NETNBP (0x66)"), 102, v117);
    objc_msgSend_setObject_forIntegerKey_(v442, v118, (uint64_t)CFSTR("NETZIP (0x67)"), 103, v119);
    objc_msgSend_setObject_forIntegerKey_(v442, v120, (uint64_t)CFSTR("NETADSP (0x68)"), 104, v121);
    objc_msgSend_setObject_forIntegerKey_(v442, v122, (uint64_t)CFSTR("NETATP (0x69)"), 105, v123);
    objc_msgSend_setObject_forIntegerKey_(v442, v124, (uint64_t)CFSTR("NETASP (0x6a)"), 106, v125);
    objc_msgSend_setObject_forIntegerKey_(v442, v126, (uint64_t)CFSTR("NETAFP (0x6b)"), 107, v127);
    objc_msgSend_setObject_forIntegerKey_(v442, v128, (uint64_t)CFSTR("NETRTMP (0x6c)"), 108, v129);
    objc_msgSend_setObject_forIntegerKey_(v442, v130, (uint64_t)CFSTR("NETAURP (0x6d)"), 109, v131);
    objc_msgSend_setObject_forIntegerKey_(v442, v132, (uint64_t)CFSTR("NETIPSEC (0x80)"), 128, v133);
    objc_msgSend_setObject_forIntegerKey_(v442, v134, (uint64_t)CFSTR("NETVMNET (0x81)"), 129, v135);
    v136 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v137, (uint64_t)v136, 5, v138);
    objc_msgSend_setObject_forIntegerKey_(v136, v139, (uint64_t)CFSTR("IOINTC (0x00)"), 0, v140);
    objc_msgSend_setObject_forIntegerKey_(v136, v141, (uint64_t)CFSTR("IOWORKLOOP (0x01)"), 1, v142);
    objc_msgSend_setObject_forIntegerKey_(v136, v143, (uint64_t)CFSTR("IOINTES (0x02)"), 2, v144);
    objc_msgSend_setObject_forIntegerKey_(v136, v145, (uint64_t)CFSTR("IOCLKES (0x03)"), 3, v146);
    objc_msgSend_setObject_forIntegerKey_(v136, v147, (uint64_t)CFSTR("IOCMDQ (0x04)"), 4, v148);
    objc_msgSend_setObject_forIntegerKey_(v136, v149, (uint64_t)CFSTR("IOMCURS (0x05)"), 5, v150);
    objc_msgSend_setObject_forIntegerKey_(v136, v151, (uint64_t)CFSTR("IOMDESC (0x06)"), 6, v152);
    objc_msgSend_setObject_forIntegerKey_(v136, v153, (uint64_t)CFSTR("IOPOWER (0x07)"), 7, v154);
    objc_msgSend_setObject_forIntegerKey_(v136, v155, (uint64_t)CFSTR("IOSERVICE (0x08)"), 8, v156);
    objc_msgSend_setObject_forIntegerKey_(v136, v157, (uint64_t)CFSTR("IOREGISTRY (0x09)"), 9, v158);
    objc_msgSend_setObject_forIntegerKey_(v136, v159, (uint64_t)CFSTR("IOSTORAGE (0x20)"), 32, v160);
    objc_msgSend_setObject_forIntegerKey_(v136, v161, (uint64_t)CFSTR("IONETWORK (0x21)"), 33, v162);
    objc_msgSend_setObject_forIntegerKey_(v136, v163, (uint64_t)CFSTR("IOKEYBOARD (0x22)"), 34, v164);
    objc_msgSend_setObject_forIntegerKey_(v136, v165, (uint64_t)CFSTR("IOHID (0x23)"), 35, v166);
    objc_msgSend_setObject_forIntegerKey_(v136, v167, (uint64_t)CFSTR("IOAUDIO (0x24)"), 36, v168);
    objc_msgSend_setObject_forIntegerKey_(v136, v169, (uint64_t)CFSTR("IOSERIAL (0x25)"), 37, v170);
    objc_msgSend_setObject_forIntegerKey_(v136, v171, (uint64_t)CFSTR("IOTTY (0x26)"), 38, v172);
    objc_msgSend_setObject_forIntegerKey_(v136, v173, (uint64_t)CFSTR("IOSAM (0x27)"), 39, v174);
    objc_msgSend_setObject_forIntegerKey_(v136, v175, (uint64_t)CFSTR("IOPARALLELATA (0x28)"), 40, v176);
    objc_msgSend_setObject_forIntegerKey_(v136, v177, (uint64_t)CFSTR("IOPARALLELSCSI (0x29)"), 41, v178);
    objc_msgSend_setObject_forIntegerKey_(v136, v179, (uint64_t)CFSTR("IOSATA (0x2a)"), 42, v180);
    objc_msgSend_setObject_forIntegerKey_(v136, v181, (uint64_t)CFSTR("IOSAS (0x2b)"), 43, v182);
    objc_msgSend_setObject_forIntegerKey_(v136, v183, (uint64_t)CFSTR("IOFIBRECHANNEL (0x2c)"), 44, v184);
    objc_msgSend_setObject_forIntegerKey_(v136, v185, (uint64_t)CFSTR("IOUSB (0x2d)"), 45, v186);
    objc_msgSend_setObject_forIntegerKey_(v136, v187, (uint64_t)CFSTR("IOBLUETOOTH (0x2e)"), 46, v188);
    objc_msgSend_setObject_forIntegerKey_(v136, v189, (uint64_t)CFSTR("IOFIREWIRE (0x2f)"), 47, v190);
    objc_msgSend_setObject_forIntegerKey_(v136, v191, (uint64_t)CFSTR("IOINFINIBAND (0x30)"), 48, v192);
    objc_msgSend_setObject_forIntegerKey_(v136, v193, (uint64_t)CFSTR("IOCPUPM (0x31)"), 49, v194);
    objc_msgSend_setObject_forIntegerKey_(v136, v195, (uint64_t)CFSTR("IOGRAPHICS (0x32)"), 50, v196);
    objc_msgSend_setObject_forIntegerKey_(v136, v197, (uint64_t)CFSTR("HIBERNATE (0x33)"), 51, v198);
    objc_msgSend_setObject_forIntegerKey_(v136, v199, (uint64_t)CFSTR("IOTHUNDERBOLT (0x34)"), 52, v200);
    objc_msgSend_setObject_forIntegerKey_(v136, v201, (uint64_t)CFSTR("BOOTER (0x35)"), 53, v202);
    objc_msgSend_setObject_forIntegerKey_(v136, v203, (uint64_t)CFSTR("IOAUDIO2 (0x36)"), 54, v204);
    objc_msgSend_setObject_forIntegerKey_(v136, v205, (uint64_t)CFSTR("IOAFK (0x37)"), 55, v206);
    objc_msgSend_setObject_forIntegerKey_(v136, v207, (uint64_t)CFSTR("IOSURFACEPA (0x40)"), 64, v208);
    objc_msgSend_setObject_forIntegerKey_(v136, v209, (uint64_t)CFSTR("IOMDPA (0x41)"), 65, v210);
    objc_msgSend_setObject_forIntegerKey_(v136, v211, (uint64_t)CFSTR("IODARTPA (0x42)"), 66, v212);
    v213 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v214, (uint64_t)v213, 6, v215);
    objc_msgSend_setObject_forIntegerKey_(v213, v216, (uint64_t)CFSTR("DRVSTORAGE (0x01)"), 1, v217);
    objc_msgSend_setObject_forIntegerKey_(v213, v218, (uint64_t)CFSTR("DRVNETWORK (0x02)"), 2, v219);
    objc_msgSend_setObject_forIntegerKey_(v213, v220, (uint64_t)CFSTR("DRVKEYBOARD (0x03)"), 3, v221);
    objc_msgSend_setObject_forIntegerKey_(v213, v222, (uint64_t)CFSTR("DRVHID (0x04)"), 4, v223);
    objc_msgSend_setObject_forIntegerKey_(v213, v224, (uint64_t)CFSTR("DRVAUDIO (0x05)"), 5, v225);
    objc_msgSend_setObject_forIntegerKey_(v213, v226, (uint64_t)CFSTR("DRVSERIAL (0x07)"), 7, v227);
    objc_msgSend_setObject_forIntegerKey_(v213, v228, (uint64_t)CFSTR("DRVSAM (0x08)"), 8, v229);
    objc_msgSend_setObject_forIntegerKey_(v213, v230, (uint64_t)CFSTR("DRVPARALLELATA (0x09)"), 9, v231);
    objc_msgSend_setObject_forIntegerKey_(v213, v232, (uint64_t)CFSTR("DRVPARALLELSCSI (0x0a)"), 10, v233);
    objc_msgSend_setObject_forIntegerKey_(v213, v234, (uint64_t)CFSTR("DRVSATA (0x0b)"), 11, v235);
    objc_msgSend_setObject_forIntegerKey_(v213, v236, (uint64_t)CFSTR("DRVSAS (0x0c)"), 12, v237);
    objc_msgSend_setObject_forIntegerKey_(v213, v238, (uint64_t)CFSTR("DRVFIBRECHANNEL (0x0d)"), 13, v239);
    objc_msgSend_setObject_forIntegerKey_(v213, v240, (uint64_t)CFSTR("DRVUSB (0x0e)"), 14, v241);
    objc_msgSend_setObject_forIntegerKey_(v213, v242, (uint64_t)CFSTR("DRVBLUETOOTH (0x0f)"), 15, v243);
    objc_msgSend_setObject_forIntegerKey_(v213, v244, (uint64_t)CFSTR("DRVFIREWIRE (0x10)"), 16, v245);
    objc_msgSend_setObject_forIntegerKey_(v213, v246, (uint64_t)CFSTR("DRVINFINIBAND (0x11)"), 17, v247);
    objc_msgSend_setObject_forIntegerKey_(v213, v248, (uint64_t)CFSTR("DRVGRAPHICS (0x12)"), 18, v249);
    objc_msgSend_setObject_forIntegerKey_(v213, v250, (uint64_t)CFSTR("DRVSD (0x13)"), 19, v251);
    objc_msgSend_setObject_forIntegerKey_(v213, v252, (uint64_t)CFSTR("DRVNAND (0x14)"), 20, v253);
    objc_msgSend_setObject_forIntegerKey_(v213, v254, (uint64_t)CFSTR("SSD (0x15)"), 21, v255);
    objc_msgSend_setObject_forIntegerKey_(v213, v256, (uint64_t)CFSTR("DRVSPI (0x16)"), 22, v257);
    objc_msgSend_setObject_forIntegerKey_(v213, v258, (uint64_t)CFSTR("DRVWLAN_802_11 (0x17)"), 23, v259);
    objc_msgSend_setObject_forIntegerKey_(v213, v260, (uint64_t)CFSTR("DRVSSM (0x18)"), 24, v261);
    objc_msgSend_setObject_forIntegerKey_(v213, v262, (uint64_t)CFSTR("DRVSMC (0x19)"), 25, v263);
    objc_msgSend_setObject_forIntegerKey_(v213, v264, (uint64_t)CFSTR("DRVMACEFIMANAGER (0x1a)"), 26, v265);
    objc_msgSend_setObject_forIntegerKey_(v213, v266, (uint64_t)CFSTR("DRVANE (0x1b)"), 27, v267);
    objc_msgSend_setObject_forIntegerKey_(v213, v268, (uint64_t)CFSTR("DRVETHERNET (0x1c)"), 28, v269);
    objc_msgSend_setObject_forIntegerKey_(v213, v270, (uint64_t)CFSTR("DRVMCC (0x1d)"), 29, v271);
    objc_msgSend_setObject_forIntegerKey_(v213, v272, (uint64_t)CFSTR("DRVACCESSORY (0x1e)"), 30, v273);
    objc_msgSend_setObject_forIntegerKey_(v213, v274, (uint64_t)CFSTR("SOCDIAGS (0x1f)"), 31, v275);
    objc_msgSend_setObject_forIntegerKey_(v213, v276, (uint64_t)CFSTR("DRVVIRTIO (0x20)"), 32, v277);
    v441 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v278, (uint64_t)v441, 8, v279);
    objc_msgSend_setObject_forIntegerKey_(v441, v280, (uint64_t)CFSTR("DLIL_STATIC (0x01)"), 1, v281);
    objc_msgSend_setObject_forIntegerKey_(v441, v282, (uint64_t)CFSTR("DLIL_PR_MOD (0x02)"), 2, v283);
    objc_msgSend_setObject_forIntegerKey_(v441, v284, (uint64_t)CFSTR("DLIL_IF_MOD (0x03)"), 3, v285);
    objc_msgSend_setObject_forIntegerKey_(v441, v286, (uint64_t)CFSTR("DLIL_PR_FLT (0x04)"), 4, v287);
    objc_msgSend_setObject_forIntegerKey_(v441, v288, (uint64_t)CFSTR("DLIL_IF_FLT (0x05)"), 5, v289);
    v290 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v291, (uint64_t)v290, 3, v292);
    objc_msgSend_setObject_forIntegerKey_(v290, v293, (uint64_t)CFSTR("FSRW (0x1)"), 1, v294);
    objc_msgSend_setObject_forIntegerKey_(v290, v295, (uint64_t)CFSTR("DKRW (0x2)"), 2, v296);
    objc_msgSend_setObject_forIntegerKey_(v290, v297, (uint64_t)CFSTR("FSVN (0x3)"), 3, v298);
    objc_msgSend_setObject_forIntegerKey_(v290, v299, (uint64_t)CFSTR("FSLOOOKUP (0x4)"), 4, v300);
    objc_msgSend_setObject_forIntegerKey_(v290, v301, (uint64_t)CFSTR("JOURNAL (0x5)"), 5, v302);
    objc_msgSend_setObject_forIntegerKey_(v290, v303, (uint64_t)CFSTR("IOCTL (0x6)"), 6, v304);
    objc_msgSend_setObject_forIntegerKey_(v290, v305, (uint64_t)CFSTR("BOOTCACHE (0x7)"), 7, v306);
    objc_msgSend_setObject_forIntegerKey_(v290, v307, (uint64_t)CFSTR("HFS (0x8)"), 8, v308);
    objc_msgSend_setObject_forIntegerKey_(v290, v309, (uint64_t)CFSTR("APFS (0x9)"), 9, v310);
    objc_msgSend_setObject_forIntegerKey_(v290, v311, (uint64_t)CFSTR("SMB (0xa)"), 10, v312);
    objc_msgSend_setObject_forIntegerKey_(v290, v313, (uint64_t)CFSTR("MOUNT (0xb)"), 11, v314);
    objc_msgSend_setObject_forIntegerKey_(v290, v315, (uint64_t)CFSTR("EXFAT (0xe)"), 14, v316);
    objc_msgSend_setObject_forIntegerKey_(v290, v317, (uint64_t)CFSTR("MSDOS (0xf)"), 15, v318);
    objc_msgSend_setObject_forIntegerKey_(v290, v319, (uint64_t)CFSTR("ACFS (0x10)"), 16, v320);
    objc_msgSend_setObject_forIntegerKey_(v290, v321, (uint64_t)CFSTR("THROTTLE (0x11)"), 17, v322);
    objc_msgSend_setObject_forIntegerKey_(v290, v323, (uint64_t)CFSTR("DECMP (0x12)"), 18, v324);
    objc_msgSend_setObject_forIntegerKey_(v290, v325, (uint64_t)CFSTR("VFS (0x13)"), 19, v326);
    objc_msgSend_setObject_forIntegerKey_(v290, v327, (uint64_t)CFSTR("LIVEFS (0x14)"), 20, v328);
    objc_msgSend_setObject_forIntegerKey_(v290, v329, (uint64_t)CFSTR("CONTENT_PROT (0xcf)"), 207, v330);
    v440 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v331, (uint64_t)v440, 31, v332);
    objc_msgSend_setObject_forIntegerKey_(v440, v333, (uint64_t)CFSTR("UUID (0x05)"), 5, v334);
    objc_msgSend_setObject_forIntegerKey_(v440, v335, (uint64_t)CFSTR("INTERNAL (0x07)"), 7, v336);
    objc_msgSend_setObject_forIntegerKey_(v440, v337, (uint64_t)CFSTR("API (0x08)"), 8, v338);
    objc_msgSend_setObject_forIntegerKey_(v440, v339, (uint64_t)CFSTR("DEBUGGING (0x09)"), 9, v340);
    v341 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v342, (uint64_t)v341, 33, v343);
    objc_msgSend_setObject_forIntegerKey_(v341, v344, (uint64_t)CFSTR("LOGINWINDOW (0x03)"), 3, v345);
    objc_msgSend_setObject_forIntegerKey_(v341, v346, (uint64_t)CFSTR("AUDIO (0x04)"), 4, v347);
    objc_msgSend_setObject_forIntegerKey_(v341, v348, (uint64_t)CFSTR("SYSTEMUI (0x05)"), 5, v349);
    objc_msgSend_setObject_forIntegerKey_(v341, v350, (uint64_t)CFSTR("SIGNPOST (0x0a)"), 10, v351);
    objc_msgSend_setObject_forIntegerKey_(v341, v352, (uint64_t)CFSTR("APPKIT (0x0c)"), 12, v353);
    objc_msgSend_setObject_forIntegerKey_(v341, v354, (uint64_t)CFSTR("UIKIT (0x0d)"), 13, v355);
    objc_msgSend_setObject_forIntegerKey_(v341, v356, (uint64_t)CFSTR("DFR (0x0e)"), 14, v357);
    objc_msgSend_setObject_forIntegerKey_(v341, v358, (uint64_t)CFSTR("LAYOUT (0x0f)"), 15, v359);
    objc_msgSend_setObject_forIntegerKey_(v341, v360, (uint64_t)CFSTR("COREDATA (0x10)"), 16, v361);
    objc_msgSend_setObject_forIntegerKey_(v341, v362, (uint64_t)CFSTR("SAMBA (0x80)"), 128, v363);
    objc_msgSend_setObject_forIntegerKey_(v341, v364, (uint64_t)CFSTR("EOSSUPPORT (0x81)"), 129, v365);
    objc_msgSend_setObject_forIntegerKey_(v341, v366, (uint64_t)CFSTR("MACEFIMANAGER (0x82)"), 130, v367);
    v439 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v368, (uint64_t)v439, 7, v369);
    objc_msgSend_setObject_forIntegerKey_(v439, v370, (uint64_t)CFSTR("DATA (0x0)"), 0, v371);
    objc_msgSend_setObject_forIntegerKey_(v439, v372, (uint64_t)CFSTR("STRING (0x1)"), 1, v373);
    objc_msgSend_setObject_forIntegerKey_(v439, v374, (uint64_t)CFSTR("INFO (0x2)"), 2, v375);
    v376 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v377, (uint64_t)v376, 4, v378);
    objc_msgSend_setObject_forIntegerKey_(v376, v379, (uint64_t)CFSTR("PROC (0x01)"), 1, v380);
    objc_msgSend_setObject_forIntegerKey_(v376, v381, (uint64_t)CFSTR("MEMSTAT (0x02)"), 2, v382);
    objc_msgSend_setObject_forIntegerKey_(v376, v383, (uint64_t)CFSTR("KEVENT (0x03)"), 3, v384);
    objc_msgSend_setObject_forIntegerKey_(v376, v385, (uint64_t)CFSTR("EXCP_SC (0x0c)"), 12, v386);
    objc_msgSend_setObject_forIntegerKey_(v376, v387, (uint64_t)CFSTR("AIO (0x0d)"), 13, v388);
    objc_msgSend_setObject_forIntegerKey_(v376, v389, (uint64_t)CFSTR("SC_EXTENDED_INFO (0x0e)"), 14, v390);
    objc_msgSend_setObject_forIntegerKey_(v376, v391, (uint64_t)CFSTR("SC_EXTENDED_INFO2 (0x0f)"), 15, v392);
    objc_msgSend_setObject_forIntegerKey_(v376, v393, (uint64_t)CFSTR("KDEBUG_TEST (0xff)"), 255, v394);
    v395 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v396, (uint64_t)v395, 10, v397);
    objc_msgSend_setObject_forIntegerKey_(v395, v398, (uint64_t)CFSTR("CS_IO"), 0, v399);
    v400 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v401, (uint64_t)v400, 30, v402);
    objc_msgSend_setObject_forIntegerKey_(v400, v403, (uint64_t)CFSTR("SEC_KERNEL"), 0, v404);
    objc_msgSend_setObject_forIntegerKey_(v400, v405, (uint64_t)CFSTR("SEC_SANDBOX"), 1, v406);
    v407 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v408, (uint64_t)v407, 12, v409);
    objc_msgSend_setObject_forIntegerKey_(v407, v410, (uint64_t)CFSTR("MT_INSTRS_CYCLES"), 1, v411);
    objc_msgSend_setObject_forIntegerKey_(v407, v412, (uint64_t)CFSTR("MT_DEBUG"), 2, v413);
    objc_msgSend_setObject_forIntegerKey_(v407, v414, (uint64_t)CFSTR("MT_RESOURCES_PROC_EXIT"), 3, v415);
    objc_msgSend_setObject_forIntegerKey_(v407, v416, (uint64_t)CFSTR("MT_RESOURCES_THR_EXIT"), 4, v417);
    objc_msgSend_setObject_forIntegerKey_(v407, v418, (uint64_t)CFSTR("MT_TMPTH"), 254, v419);
    objc_msgSend_setObject_forIntegerKey_(v407, v420, (uint64_t)CFSTR("MT_TMPCPU"), 255, v421);
    v422 = (void *)objc_opt_new();
    objc_msgSend_setObject_forIntegerKey_((void *)qword_25583C710, v423, (uint64_t)v422, 20, v424);
    objc_msgSend_setObject_forIntegerKey_(v422, v425, (uint64_t)CFSTR("MISC_COREBRIGHTNESS"), 1, v426);
    objc_msgSend_setObject_forIntegerKey_(v422, v427, (uint64_t)CFSTR("MISC_VIDEOENG"), 2, v428);
    objc_msgSend_setObject_forIntegerKey_(v422, v429, (uint64_t)CFSTR("EVENT"), 16, v430);
    objc_msgSend_setObject_forIntegerKey_(v422, v431, (uint64_t)CFSTR("MISC_INSTRUMENTS"), 17, v432);
    objc_msgSend_setObject_forIntegerKey_(v422, v433, (uint64_t)CFSTR("MISC_INSTRUMENTSBT"), 18, v434);
    objc_msgSend_setObject_forIntegerKey_(v422, v435, (uint64_t)CFSTR("MISC_LAYOUT"), 26, v436);
    objc_msgSend_setObject_forIntegerKey_(v422, v437, (uint64_t)CFSTR("BUFFER"), 32, v438);

  }
}

void sub_226358D58()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("xs:appinfo");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C720;
  qword_25583C720 = v1;

}

uint64_t sub_226359614(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addObject_(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, *(_QWORD *)(a1 + 40), a4, a5);
}

uint64_t sub_2263596B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_count(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_2263597A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2263597B0(uint64_t a1)
{

}

void sub_2263597B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = objc_msgSend_copy(*(void **)(*(_QWORD *)(a1 + 32) + 16), a2, a3, a4, a5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

__CFString *sub_226359840(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *result;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  int v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t isHighestResolutionTimeEnabled;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t i;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  unint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  char *v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  double v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  unsigned int v232;
  __CFString **v233;
  int v234;
  unint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  unsigned __int8 v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  unsigned int v276;
  __CFString **v277;
  void *v278;
  void *v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  id v335;
  const char *v336;
  unint64_t v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  uint64_t v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  unint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  double v355;
  id v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  id v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  unsigned __int16 k;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  uint64_t v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  void *v408;
  unint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  void *v414;
  id v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  double v420;
  double v421;
  const char *v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  id v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  double v438;
  double v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  void *v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t m;
  uint64_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  void *v465;
  const char *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  void *v470;
  id v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  void *v475;
  void *v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  void *v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  __CFString *v508;
  uint64_t v509;
  __CFString *v510;
  const char *v511;
  uint64_t v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  const char *v516;
  uint64_t v517;
  void *v518;
  const char *v519;
  uint64_t v520;
  uint64_t v521;
  void *v522;
  void *v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  const char *v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  char *v534;
  uint64_t v535;
  const char *v536;
  const char *v537;
  uint64_t v538;
  uint64_t v539;
  const char *v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  const char *v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  void *v552;
  uint64_t v553;
  const char *v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  const char *v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  _QWORD v566[4];
  id v567;
  id v568;
  _QWORD v569[5];
  _QWORD v570[4];
  __CFString *v571;
  _QWORD v572[5];
  char *v573;
  const unsigned __int8 *v574;
  uint64_t v575;
  uint64_t (*v576)(uint64_t, uint64_t);
  void (*v577)(uint64_t);
  id v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  _QWORD v583[4];
  id v584;
  id v585;
  void *v586;
  char v587[128];
  id out[6];
  _BYTE v589[128];
  uint64_t v590;

  v590 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if ((objc_msgSend_isValid(v6, v7, v8, v9, v10) & 1) != 0)
  {
    result = (__CFString *)objc_msgSend_engineeringType(v6, v11, v12, v13, v14);
    v20 = CFSTR("<private>");
    switch((int)result)
    {
      case 0:
        goto LABEL_188;
      case 1:
        v235 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v236, (uint64_t)CFSTR("{%d,%d}"), v237, v238, HIDWORD(v235), v235);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 2:
      case 43:
      case 51:
      case 123:
      case 152:
      case 187:
        v44 = (void *)*((_QWORD *)v5 + 1);
        objc_msgSend_objectValue(v6, v16, v17, v18, v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v44, v46, (uint64_t)v45, v47, v48);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
      case 97:
        v82 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v82, v83, (uint64_t)CFSTR("%.2lf"), v84, v85, v86);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 4:
      case 44:
        if (objc_msgSend_uint64(v6, v16, v17, v18, v19) != -1)
          goto LABEL_32;
        goto LABEL_181;
      case 5:
      case 6:
      case 235:
        v494 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v494, v495, (uint64_t)CFSTR("%.1lf%%"), v496, v497, v498);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 7:
      case 17:
      case 28:
      case 29:
      case 30:
      case 35:
      case 36:
      case 55:
      case 59:
      case 64:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 84:
      case 90:
      case 91:
      case 134:
      case 226:
      case 232:
      case 242:
        goto LABEL_9;
      case 8:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForThreadEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 9:
        v573 = 0;
        out[0] = 0;
        v586 = 0;
        if (objc_msgSend_getValue_fieldIndex_(v6, v16, (uint64_t)out, 0, v19)
          && objc_msgSend_getValue_fieldIndex_(v6, v239, (uint64_t)&v573, 1, v240)
          && objc_msgSend_getValue_fieldIndex_(v573, v241, (uint64_t)&v586, 0, v242))
        {
          v247 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_string(out[0], v243, v244, v245, v246);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          v253 = objc_msgSend_uint64(v586, v249, v250, v251, v252);
          objc_msgSend_stringWithFormat_(v247, v254, (uint64_t)CFSTR("%@  0x%llx"), v255, v256, v248, v253);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = 0;
        }

        break;
      case 10:
        objc_msgSend_string(v6, v16, v17, v18, v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_hasPrefix_(v45, v257, (uint64_t)CFSTR("MSC_"), v258, v259) & 1) == 0
          && !objc_msgSend_hasPrefix_(v45, v260, (uint64_t)CFSTR("BSC_"), v261, v262))
        {
          goto LABEL_145;
        }
        objc_msgSend_substringFromIndex_(v45, v260, 4, v261, v262);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 11:
      case 12:
      case 20:
      case 32:
      case 37:
      case 45:
      case 49:
      case 50:
      case 53:
      case 54:
      case 57:
      case 58:
      case 60:
      case 67:
      case 80:
      case 81:
      case 82:
      case 83:
      case 85:
      case 86:
      case 87:
      case 98:
      case 100:
      case 101:
      case 105:
      case 106:
      case 108:
      case 109:
      case 110:
      case 112:
      case 113:
      case 115:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 128:
      case 129:
      case 132:
      case 137:
      case 138:
      case 141:
      case 144:
      case 145:
      case 148:
      case 149:
      case 153:
      case 154:
      case 156:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 182:
      case 183:
      case 184:
      case 188:
      case 191:
      case 196:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 211:
      case 212:
      case 213:
      case 214:
      case 217:
      case 218:
      case 219:
      case 220:
      case 224:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 239:
      case 240:
      case 241:
      case 244:
      case 246:
      case 249:
      case 250:
      case 251:
        objc_msgSend_string(v6, v16, v17, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 13:
      case 15:
      case 68:
      case 70:
      case 89:
      case 160:
        goto LABEL_11;
      case 14:
        v263 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_kDebugClassNameForClass_(XRKDebugClassSubclassStringMapping, v264, v263, v265, v266);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (v45)
          goto LABEL_145;
        v271 = (void *)MEMORY[0x24BDD17C8];
        v272 = objc_msgSend_uint32(v6, v267, v268, v269, v270);
        objc_msgSend_stringWithFormat_(v271, v273, (uint64_t)CFSTR("0x%x"), v274, v275, v272);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 16:
        v276 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        if (v276 >= 3)
          goto LABEL_185;
        v277 = off_24EDC40B0;
        goto LABEL_166;
      case 18:
      case 19:
      case 56:
      case 122:
      case 127:
        v65 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        isHighestResolutionTimeEnabled = objc_msgSend_isHighestResolutionTimeEnabled(v5, v66, v67, v68, v69);
        objc_msgSend_stringForNanoseconds_highestResolutionTimeEnabled_(DTNanoTimestampFormatter, v71, v65, isHighestResolutionTimeEnabled, v72);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 21:
        objc_msgSend_objectValue(v6, v16, v17, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 22:
        v278 = (void *)*((_QWORD *)v5 + 2);
        v279 = (void *)MEMORY[0x24BDD16E0];
        v280 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_numberWithUnsignedInt_(v279, v281, v280, v282, v283);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v278, v284, (uint64_t)v45, v285, v286);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 23:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForProcessEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 24:
        objc_msgSend_stringForCoreProfileBacktraceEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 25:
        v573 = 0;
        if (!objc_msgSend_getLengthOfUint64Representation_(v6, v16, (uint64_t)&v573, v18, v19))
          goto LABEL_188;
        objc_msgSend_string(MEMORY[0x24BDD16A8], v121, v122, v123, v124);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        out[0] = 0;
        if (v573)
        {
          for (i = 0; i < (unint64_t)v573; ++i)
          {
            if (i)
              objc_msgSend_appendString_(v20, v125, (uint64_t)CFSTR(", "), v126, v127);
            if (objc_msgSend_getValue_fieldIndex_(v6, v125, (uint64_t)out, (unsigned __int16)i, v127)
              && objc_msgSend_isValid(out[0], v129, v130, v131, v132))
            {
              v134 = (void *)*((_QWORD *)v5 + 1);
              v135 = (void *)MEMORY[0x24BDD16E0];
              v136 = objc_msgSend_uint64(out[0], v129, v133, v131, v132);
              objc_msgSend_numberWithUnsignedLongLong_(v135, v137, v136, v138, v139);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringFromNumber_(v134, v141, (uint64_t)v140, v142, v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_appendFormat_(v20, v145, (uint64_t)CFSTR("(%@)"), v146, v147, v144);

            }
            else
            {
              objc_msgSend_appendString_(v20, v129, (uint64_t)CFSTR("<error>"), v131, v132);
            }
          }
        }

        break;
      case 26:
        v287 = (void *)MEMORY[0x24BDD17C8];
        v288 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v287, v289, (uint64_t)CFSTR("frag %u"), v290, v291, v288);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 27:
        objc_msgSend_stringForBacktraceEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 31:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForCoreEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 33:
      case 34:
        if (!objc_msgSend_uint64(v6, v16, v17, v18, v19) || objc_msgSend_uint64(v6, v99, v100, v101, v102) == -1)
          goto LABEL_181;
LABEL_32:
        v91 = objc_msgSend_uint64(v6, v87, v88, v89, v90);
        v96 = objc_msgSend_isHighestResolutionTimeEnabled(v5, v92, v93, v94, v95);
        objc_msgSend_stringForNanoseconds_highestResolutionTimeEnabled_(DTUserTimeFormatter, v97, v91, v96, v98);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 38:
      case 104:
      case 114:
      case 133:
      case 185:
      case 205:
        v39 = (void *)MEMORY[0x24BDD17C8];
        v40 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v39, v41, (uint64_t)CFSTR("%d"), v42, v43, v40);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 39:
      case 40:
      case 41:
      case 42:
      case 236:
        v73 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringForLongLong_(DTBytesFormatter, v74, v73, v75, v76);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 46:
      case 142:
      case 157:
      case 158:
      case 181:
      case 216:
        v20 = (__CFString *)objc_opt_new();
        *((_BYTE *)v5 + 66) = 1;
        v581 = 0u;
        v582 = 0u;
        v579 = 0u;
        v580 = 0u;
        objc_msgSend_objectValue(v6, v50, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v579, (uint64_t)v589, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v580;
          do
          {
            for (j = 0; j != v56; ++j)
            {
              if (*(_QWORD *)v580 != v57)
                objc_enumerationMutation(v54);
              sub_226359840(v5, *(_QWORD *)(*((_QWORD *)&v579 + 1) + 8 * j), 1);
              v59 = objc_claimAutoreleasedReturnValue();
              v63 = (void *)v59;
              if (v59)
                objc_msgSend_appendString_(v20, v60, v59, v61, v62);
              else
                objc_msgSend_appendString_(v20, v60, (uint64_t)CFSTR("n/a"), v61, v62);

            }
            v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v64, (uint64_t)&v579, (uint64_t)v589, 16);
          }
          while (v56);
        }

        *((_BYTE *)v5 + 66) = a3;
        break;
      case 47:
        v292 = (void *)MEMORY[0x24BDD17C8];
        v293 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v292, v294, (uint64_t)CFSTR("%u%%"), v295, v296, v293);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 48:
        v232 = objc_msgSend_uint32(v6, v16, v17, v18, v19) + 1;
        if (v232 < 5)
        {
          v233 = off_24EDC40E8;
          goto LABEL_103;
        }
        v20 = 0;
        break;
      case 52:
        v148 = (void *)*((_QWORD *)v5 + 4);
        v149 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_numberWithDouble_(v149, v150, v151, v152, v153);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v148, v154, (uint64_t)v45, v155, v156);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 61:
      case 66:
      case 69:
      case 99:
      case 111:
      case 125:
      case 139:
      case 146:
      case 164:
      case 189:
      case 190:
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v29, v31, (uint64_t)CFSTR("%u"), v32, v33, v30);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 62:
      case 63:
      case 92:
      case 102:
        v77 = (void *)MEMORY[0x24BDD17C8];
        v78 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v77, v79, (uint64_t)CFSTR("%lld"), v80, v81, v78);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 65:
        v573 = 0;
        v574 = (const unsigned __int8 *)&v573;
        v575 = 0x3032000000;
        v576 = sub_22635C6B8;
        v577 = sub_22635C6C8;
        v157 = objc_alloc(MEMORY[0x24BDD16A8]);
        v578 = (id)objc_msgSend_initWithString_(v157, v158, (uint64_t)CFSTR("("), v159, v160);
        v572[0] = MEMORY[0x24BDAC760];
        v572[1] = 3221225472;
        v572[2] = sub_22635C6D0;
        v572[3] = &unk_24EDC3FB0;
        v572[4] = &v573;
        objc_msgSend_enumerateUint64Values_(v6, v161, (uint64_t)v572, v162, v163);
        if (objc_msgSend_length(*((void **)v574 + 5), v164, v165, v166, v167) == 1)
        {
          v20 = CFSTR("()");
        }
        else
        {
          v534 = (char *)*((_QWORD *)v574 + 5);
          v535 = objc_msgSend_length(v534, v168, v169, v170, v171);
          objc_msgSend_replaceCharactersInRange_withString_(v534, v536, v535 - 1, 1, (uint64_t)CFSTR(")"));
          v20 = (__CFString *)*((id *)v574 + 5);
        }
        _Block_object_dispose(&v573, 8);

        break;
      case 88:
        v172 = (void *)MEMORY[0x24BDD17C8];
        v173 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v172, v174, (uint64_t)CFSTR("Frame %u"), v175, v176, v173);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 93:
        v297 = (void *)*((_QWORD *)v5 + 3);
        v298 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_numberWithDouble_(v298, v299, v300, v301, v302);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v297, v303, (uint64_t)v45, v304, v305);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 94:
        v177 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringForLongLong_(DTBitRateFormatter, v178, v177, v179, v180);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 95:
      case 96:
        v573 = 0;
        if (objc_msgSend_getLengthOfUint64Representation_(v6, v16, (uint64_t)&v573, v18, v19))
        {
          if (v573)
          {
            v103 = objc_alloc(MEMORY[0x24BDD16A8]);
            v107 = (void *)objc_msgSend_initWithString_(v103, v104, (uint64_t)CFSTR("("), v105, v106);
            v570[0] = MEMORY[0x24BDAC760];
            v570[1] = 3221225472;
            v570[2] = sub_22635C704;
            v570[3] = &unk_24EDC3FD8;
            v20 = v107;
            v571 = v20;
            objc_msgSend_enumerateUint64Values_(v6, v108, (uint64_t)v570, v109, v110);
            v115 = objc_msgSend_length(v20, v111, v112, v113, v114);
            objc_msgSend_replaceCharactersInRange_withString_(v20, v116, v115 - 1, 1, (uint64_t)CFSTR(")"));

          }
          else
          {
            v20 = CFSTR("()");
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            sub_22636FD50();
LABEL_188:
          v20 = CFSTR("<error>");
        }
        break;
      case 103:
        v573 = 0;
        out[0] = 0;
        if (objc_msgSend_getValue_fieldIndex_(v6, v16, (uint64_t)&v573, 0, v19)
          && objc_msgSend_getValue_fieldIndex_(v6, v306, (uint64_t)out, 1, v307))
        {
          v312 = (void *)MEMORY[0x24BDD17C8];
          v313 = objc_msgSend_uint64(v573, v308, v309, v310, v311);
          v318 = objc_msgSend_isHighestResolutionTimeEnabled(v5, v314, v315, v316, v317);
          objc_msgSend_stringForNanoseconds_highestResolutionTimeEnabled_(DTNanoTimestampFormatter, v319, v313, v318, v320);
          v321 = (void *)objc_claimAutoreleasedReturnValue();
          v326 = objc_msgSend_uint64(out[0], v322, v323, v324, v325);
          objc_msgSend_stringForNanoseconds_(DTUserTimeFormatter, v327, v326, v328, v329);
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v312, v331, (uint64_t)CFSTR("%@ (%@)"), v332, v333, v321, v330);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("-");
        }
        goto LABEL_192;
      case 107:
        v573 = 0;
        if (XREngineeringTypeUnwrapAny(v6, (uint64_t)&v573))
        {
          sub_226359840(v5, v573, a3);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = CFSTR("<any>");
        }
        goto LABEL_196;
      case 116:
        v334 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        if (v334 == 0xEEEEB0B5B2B2EEEELL)
        {
          v20 = CFSTR("OS_SIGNPOST_ID_EXCLUSIVE");
        }
        else if (v334 == -1)
        {
          v20 = CFSTR("OS_SIGNPOST_ID_INVALID");
        }
        else
        {
          if (v334)
          {
LABEL_9:
            v24 = (void *)MEMORY[0x24BDD17C8];
            v25 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
            objc_msgSend_stringWithFormat_(v24, v26, (uint64_t)CFSTR("0x%llx"), v27, v28, v25);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          v20 = CFSTR("OS_SIGNPOST_ID_NULL");
        }
        break;
      case 124:
        objc_msgSend_stringForUserIDEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 126:
        if (objc_msgSend_uint32(v6, v16, v17, v18, v19))
          v20 = CFSTR("Yes");
        else
          v20 = CFSTR("No");
        break;
      case 130:
        objc_msgSend_stringForTextSymbolEngineeringValue_shouldIncludeLibrary_(v5, v16, (uint64_t)v6, 1, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 131:
      case 197:
        v117 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v118, (uint64_t)CFSTR("%llu"), v119, v120, v117);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 135:
        v573 = 0;
        v574 = (const unsigned __int8 *)&v573;
        v575 = 0x3010000000;
        v578 = 0;
        v576 = (uint64_t (*)(uint64_t, uint64_t))"";
        v577 = 0;
        v569[0] = MEMORY[0x24BDAC760];
        v569[1] = 3221225472;
        v569[2] = sub_22635C730;
        v569[3] = &unk_24EDC3FB0;
        v569[4] = &v573;
        objc_msgSend_enumerateUint64Values_(v6, v16, (uint64_t)v569, v18, v19);
        memset(out, 0, 37);
        uuid_unparse(v574 + 32, (char *)out);
        v335 = objc_alloc(MEMORY[0x24BDD17C8]);
        v20 = (__CFString *)objc_msgSend_initWithBytes_length_encoding_(v335, v336, (uint64_t)out, 36, 1);
        _Block_object_dispose(&v573, 8);
        break;
      case 136:
        objc_msgSend_stringForInstrumentTypeEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 140:
        v337 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v338, (uint64_t)CFSTR("%u/%u"), v339, v340, HIDWORD(v337), v337);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 143:
        objc_msgSend_stringForSocketAddrEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 147:
        v573 = 0;
        out[0] = 0;
        if (!objc_msgSend_getValue_fieldIndex_(v6, v16, (uint64_t)&v573, 0, v19)
          || !objc_msgSend_getValue_fieldIndex_(v6, v181, (uint64_t)out, 2, v182))
        {
          goto LABEL_228;
        }
        if (objc_msgSend_isValid(v573, v183, v184, v185, v186)
          && objc_msgSend_isValid(out[0], v187, v188, v189, v190))
        {
          v191 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_string(v573, v187, v188, v189, v190);
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = objc_msgSend_uint64(out[0], v193, v194, v195, v196);
          objc_msgSend_stringWithFormat_(v191, v198, (uint64_t)CFSTR("%@ <0x%llx>"), v199, v200, v192, v197);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_192;
        }
        if (objc_msgSend_isValid(out[0], v187, v188, v189, v190))
        {
          v552 = (void *)MEMORY[0x24BDD17C8];
          v553 = objc_msgSend_uint64(out[0], v548, v549, v550, v551);
          objc_msgSend_stringWithFormat_(v552, v554, (uint64_t)CFSTR("0x%llx"), v555, v556, v553);
          v557 = objc_claimAutoreleasedReturnValue();
LABEL_227:
          v20 = (__CFString *)v557;
          goto LABEL_192;
        }
        if (objc_msgSend_isValid(v573, v548, v549, v550, v551))
        {
          objc_msgSend_string(v573, v558, v559, v560, v561);
          v557 = objc_claimAutoreleasedReturnValue();
          goto LABEL_227;
        }
LABEL_228:
        v20 = 0;
LABEL_192:

        break;
      case 150:
        v341 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v341, v342, (uint64_t)CFSTR("%.2lf:1"), v343, v344, v345);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 151:
        v346 = (void *)MEMORY[0x24BDD17C8];
        v347 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v346, v348, (uint64_t)CFSTR("%u / 20"), v349, v350, v347);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 155:
        v351 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        if (*((_QWORD *)v5 + 9))
        {
          v355 = (double)v351 / 1000000000.0;
          v356 = objc_alloc(MEMORY[0x24BDBCE60]);
          v45 = (void *)objc_msgSend_initWithTimeInterval_sinceDate_(v356, v357, *((_QWORD *)v5 + 9), v358, v359, v355);
          objc_msgSend_stringFromDate_(*((void **)v5 + 6), v360, (uint64_t)v45, v361, v362);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        objc_msgSend_stringForNanoseconds_(DTUserTimeFormatter, v352, v351, v353, v354);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 159:
        v363 = (void *)objc_opt_new();
        v566[0] = MEMORY[0x24BDAC760];
        v566[1] = 3221225472;
        v566[2] = sub_22635C748;
        v566[3] = &unk_24EDC4000;
        v567 = v6;
        v364 = v363;
        v568 = v364;
        objc_msgSend_enumerateUint64Values_(v567, v365, (uint64_t)v566, v366, v367);
        if (objc_msgSend_length(v364, v368, v369, v370, v371))
          v20 = (__CFString *)v364;
        else
          v20 = CFSTR("<empty>");

        break;
      case 161:
      case 162:
        objc_msgSend_stringForCallSiteEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 163:
        v573 = 0;
        v372 = (void *)objc_opt_new();
        out[0] = 0;
        if (!objc_msgSend_getLengthOfUint64Representation_(v6, v373, (uint64_t)&v573, v374, v375))
        {
          v20 = CFSTR("corrupt");
          goto LABEL_220;
        }
        if (objc_msgSend_isMultiline(v5, v376, v377, v378, v379))
        {
          if (v573)
          {
            for (k = 0; k < (unint64_t)v573; ++k)
            {
              if (objc_msgSend_getValue_fieldIndex_(v6, v380, (uint64_t)out, k, v381)
                && objc_msgSend_isValid(out[0], v383, v384, v385, v386))
              {
                if (objc_msgSend_length(v372, v383, v387, v385, v386))
                  objc_msgSend_appendString_(v372, v388, (uint64_t)CFSTR("\n"), v389, v390);
                objc_msgSend_stringForCallSiteEngineeringValue_(v5, v388, (uint64_t)out[0], v389, v390);
                v391 = objc_claimAutoreleasedReturnValue();
                v395 = (void *)v391;
                if (v391)
                  objc_msgSend_appendString_(v372, v392, v391, v393, v394);
                else
                  objc_msgSend_appendString_(v372, v392, (uint64_t)CFSTR("missing"), v393, v394);

              }
              else
              {
                objc_msgSend_appendString_(v372, v383, (uint64_t)CFSTR("missing"), v385, v386);
              }
            }
          }
          goto LABEL_218;
        }
        if (v573
          && objc_msgSend_getValue_fieldIndex_(v6, v380, (uint64_t)out, 0, v381)
          && objc_msgSend_isValid(out[0], v540, v541, v542, v543))
        {
          sub_226359840(v5, out[0], a3);
          v544 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v372, v545, (uint64_t)CFSTR("%@ ← (%lu other frames)"), v546, v547, v544, v573 - 1);

LABEL_218:
          v20 = v372;
          goto LABEL_220;
        }
        v20 = CFSTR("empty");
LABEL_220:

        break;
      case 173:
        objc_msgSend_string(v6, v16, v17, v18, v19);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v399 = objc_msgSend_rangeOfString_(v45, v396, (uint64_t)CFSTR("."), v397, v398);
        if (v399 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_145:
          v49 = v45;
        }
        else
        {
          objc_msgSend_substringFromIndex_(v45, v400, v399 + 1, v401, v402);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_14;
      case 186:
        v403 = (void *)MEMORY[0x24BDD17C8];
        v404 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v403, v405, (uint64_t)CFSTR("%llx"), v406, v407, v404);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 192:
        v408 = (void *)MEMORY[0x24BDD17C8];
        v409 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        objc_msgSend_stringWithFormat_(v408, v410, (uint64_t)CFSTR("0x%llx"), v411, v412, bswap64(v409));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 193:
        v573 = 0;
        if (objc_msgSend_getValue_fieldIndex_(v6, v16, (uint64_t)&v573, 0, v19))
        {
          sub_226359840(v5, v573, a3);
          v413 = (void *)objc_claimAutoreleasedReturnValue();
          v414 = v413;
          if (v413)
            v20 = v413;
          else
            v20 = CFSTR("<bad size>");

        }
        else
        {
          v20 = CFSTR("<data>");
        }
LABEL_196:

        break;
      case 194:
        objc_msgSend_setUnitOptions_(*((void **)v5 + 7), v16, 1, v18, v19);
        v415 = objc_alloc(MEMORY[0x24BDD1660]);
        objc_msgSend_fixedDecimal(v6, v416, v417, v418, v419);
        v421 = v420;
        objc_msgSend_baseUnit(MEMORY[0x24BDD1908], v422, v423, v424, v425);
        v426 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend_initWithDoubleValue_unit_(v415, v427, (uint64_t)v426, v428, v429, v421);

        objc_msgSend_stringFromMeasurement_(*((void **)v5 + 7), v430, (uint64_t)v45, v431, v432);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 195:
        objc_msgSend_setUnitOptions_(*((void **)v5 + 7), v16, 2, v18, v19);
        v433 = objc_alloc(MEMORY[0x24BDD1660]);
        objc_msgSend_fixedDecimal(v6, v434, v435, v436, v437);
        v439 = v438;
        objc_msgSend_baseUnit(MEMORY[0x24BDD1908], v440, v441, v442, v443);
        v444 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend_initWithDoubleValue_unit_(v433, v445, (uint64_t)v444, v446, v447, v439);

        objc_msgSend_stringFromMeasurement_(*((void **)v5 + 7), v448, (uint64_t)v45, v449, v450);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 198:
        *((_BYTE *)v5 + 66) = 1;
        v451 = (void *)objc_opt_new();
        v562 = 0u;
        v563 = 0u;
        v564 = 0u;
        v565 = 0u;
        objc_msgSend_objectValue(v6, v452, v453, v454, v455);
        v456 = (void *)objc_claimAutoreleasedReturnValue();
        v458 = objc_msgSend_countByEnumeratingWithState_objects_count_(v456, v457, (uint64_t)&v562, (uint64_t)v587, 16);
        if (v458)
        {
          v459 = *(_QWORD *)v563;
          do
          {
            for (m = 0; m != v458; ++m)
            {
              if (*(_QWORD *)v563 != v459)
                objc_enumerationMutation(v456);
              sub_226359840(v5, *(_QWORD *)(*((_QWORD *)&v562 + 1) + 8 * m), 1);
              v461 = objc_claimAutoreleasedReturnValue();
              v465 = (void *)v461;
              if (v461)
                objc_msgSend_addObject_(v451, v462, v461, v463, v464);
              else
                objc_msgSend_addObject_(v451, v462, (uint64_t)CFSTR("n/a"), v463, v464);

            }
            v458 = objc_msgSend_countByEnumeratingWithState_objects_count_(v456, v466, (uint64_t)&v562, (uint64_t)v587, 16);
          }
          while (v458);
        }

        *((_BYTE *)v5 + 66) = a3;
        objc_msgSend_componentsJoinedByString_(v451, v467, (uint64_t)CFSTR(" "), v468, v469);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 206:
        v201 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        if (!v201)
          goto LABEL_181;
        if (v201 <= 0x3E7)
        {
          v206 = "cycles";
          if (v201 < 2)
            v206 = "cycle";
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v202, (uint64_t)CFSTR("%llu %s"), v204, v205, v201, v206);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        }
        sub_22635C55C(v201, v202, v203, v204, v205);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v45, v537, (uint64_t)CFSTR("c"), v538, v539);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v20 = v49;
LABEL_15:

        break;
      case 207:
        v276 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        if (v276 >= 4)
        {
          v20 = CFSTR("Unknown");
        }
        else
        {
          v277 = off_24EDC4110;
LABEL_166:
          v20 = v277[v276];
        }
        break;
      case 208:
        v470 = (void *)objc_opt_new();
        v583[0] = MEMORY[0x24BDAC760];
        v583[1] = 3221225472;
        v583[2] = sub_22635C60C;
        v583[3] = &unk_24EDC3F88;
        v584 = v5;
        v471 = v470;
        v585 = v471;
        objc_msgSend_enumerateKeyValuePairs_(v6, v472, (uint64_t)v583, v473, v474);
        v475 = v585;
        v20 = (__CFString *)v471;

        break;
      case 209:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForURLSessionEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 210:
        v207 = objc_msgSend_uint64(v6, v16, v17, v18, v19);
        if (!v207)
          goto LABEL_181;
        sub_22635C55C(v207, v208, v209, v210, v211);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 215:
        v476 = (void *)*((_QWORD *)v5 + 6);
        v477 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_dateWithTimeIntervalSince1970_(v477, v478, v479, v480, v481);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromDate_(v476, v482, (uint64_t)v45, v483, v484);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 221:
        v485 = (void *)*((_QWORD *)v5 + 5);
        v486 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        objc_msgSend_numberWithDouble_(v486, v487, v488, v489, v490);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringFromNumber_(v485, v491, (uint64_t)v45, v492, v493);
        v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 222:
        v212 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        v213 = strerror(v212);
        v214 = (void *)MEMORY[0x24BDD17C8];
        v219 = objc_msgSend_uint32(v6, v215, v216, v217, v218);
        if (v213)
          objc_msgSend_stringWithFormat_(v214, v220, (uint64_t)CFSTR("[%d: %s]"), v221, v222, v219, v213);
        else
          objc_msgSend_stringWithFormat_(v214, v220, (uint64_t)CFSTR("%d"), v221, v222, v219);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 223:
        objc_msgSend_fixedDecimal(v6, v16, v17, v18, v19);
        v224 = (unint64_t)(v223 * 1000000000.0);
        v229 = objc_msgSend_isHighestResolutionTimeEnabled(v5, v225, v226, v227, v228);
        objc_msgSend_stringForNanoseconds_highestResolutionTimeEnabled_(DTUserTimeFormatter, v230, v224, v229, v231);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 225:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForSwiftTaskEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 233:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForSwiftActorEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 234:
        v232 = objc_msgSend_uint32(v6, v16, v17, v18, v19) - 1;
        if (v232 >= 4)
        {
LABEL_185:
          v20 = &stru_24EDCA888;
        }
        else
        {
          v233 = off_24EDC40C8;
LABEL_103:
          v20 = v233[v232];
        }
        break;
      case 237:
        v573 = 0;
        objc_msgSend_getTitleAndSubtitleForSwiftTaskPriorityEngineeringValue_title_subtitle_(v5, v16, (uint64_t)v6, (uint64_t)&v573, 0);
        v20 = v573;

        break;
      case 238:
        v234 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
        if (v234 == -1)
        {
          v20 = CFSTR("MACH_PORT_DEAD");
        }
        else
        {
          if (v234)
          {
LABEL_11:
            v34 = (void *)MEMORY[0x24BDD17C8];
            v35 = objc_msgSend_uint32(v6, v16, v17, v18, v19);
            objc_msgSend_stringWithFormat_(v34, v36, (uint64_t)CFSTR("0x%x"), v37, v38, v35);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_7;
          }
          v20 = CFSTR("MACH_PORT_NULL");
        }
        break;
      case 243:
        if (objc_msgSend_uint64(v6, v16, v17, v18, v19))
        {
          v20 = CFSTR("-");
          if (objc_msgSend_uint64(v6, v499, v500, v501, v502) != -1)
          {
            v507 = objc_msgSend_uint64(v6, v503, v504, v505, v506);
            v508 = CFSTR("+");
            if (v507 <= 0)
              v508 = CFSTR("-");
            if (v507 >= 0)
              v509 = v507;
            else
              v509 = -v507;
            v510 = v508;
            v515 = objc_msgSend_isHighestResolutionTimeEnabled(v5, v511, v512, v513, v514);
            objc_msgSend_stringForNanoseconds_highestResolutionTimeEnabled_(DTUserTimeFormatter, v516, v509, v515, v517);
            v518 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByAppendingString_(v510, v519, (uint64_t)v518, v520, v521);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
LABEL_181:
          v20 = CFSTR("-");
        }
        break;
      case 245:
        objc_msgSend_stringForLibraryAddressEngineeringValue_(v5, v16, (uint64_t)v6, v18, v19);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      case 247:
        v522 = (void *)MEMORY[0x24BDBCF38];
        objc_msgSend_string(v6, v16, v17, v18, v19);
        v523 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_timeZoneWithName_(v522, v524, (uint64_t)v523, v525, v526);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          objc_msgSend_systemLocale(MEMORY[0x24BDBCEA0], v527, v528, v529, v530);
          v531 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_localizedName_locale_(v45, v532, 0, (uint64_t)v531, v533);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("-");
        }
        goto LABEL_15;
      case 248:
        break;
      default:
        __break(1u);
        return result;
    }
  }
  else
  {
    v22 = objc_msgSend_useSimplifiedPlaceholder(v5, v11, v12, v13, v14);
    v23 = CFSTR("n/a");
    if (v22)
      v23 = CFSTR("–");
    v21 = v23;
LABEL_7:
    v20 = v21;
  }

  return v20;
}

void sub_22635B254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22635C550(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8 * a2) = a3;
  return result;
}

id sub_22635C55C(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double v5;
  int v6;
  void *v7;
  long double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 > 0x3E7)
  {
    v5 = (double)a1;
    v6 = (int)(log2((double)a1) / 9.96578428);
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = pow(1000.0, (double)v6);
    objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("%.2f %s"), v10, v11, v5 / v8, off_24EDC4020[v6 - 1]);
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%llu"), a4, a5, a1);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_22635C60C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  sub_226359840(v5, a2, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_226359840(*(_QWORD *)(a1 + 32), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend_length(*(void **)(a1 + 40), v8, v9, v10, v11);
  v16 = *(void **)(a1 + 40);
  if (v12)
    objc_msgSend_appendFormat_(v16, v13, (uint64_t)CFSTR(", (%@ : %@)"), v14, v15, v17, v7);
  else
    objc_msgSend_appendFormat_(v16, v13, (uint64_t)CFSTR("(%@ : %@)"), v14, v15, v17, v7);

}

uint64_t sub_22635C6B8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22635C6C8(uint64_t a1)
{

}

uint64_t sub_22635C6D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_appendFormat_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2, (uint64_t)CFSTR("%llu,"), a4, a5, a3);
}

uint64_t sub_22635C704(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_appendFormat_(*(void **)(a1 + 32), a2, (uint64_t)CFSTR("%llu,"), a4, a5, a3);
}

uint64_t sub_22635C730(uint64_t result, uint64_t a2, unint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 8 * a2 + 32) = bswap64(a3);
  return result;
}

uint64_t sub_22635C748(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;

  if ((unint64_t)a2 < 0x33)
  {
    v11 = *(void **)(a1 + 40);
    if (a2)
      return objc_msgSend_appendFormat_(v11, a2, (uint64_t)CFSTR(" 0x%llx"), a4, a5, a3);
    else
      return objc_msgSend_appendFormat_(v11, 0, (uint64_t)CFSTR("0x%llx"), a4, a5, a3);
  }
  else
  {
    v12 = 0;
    objc_msgSend_getLengthOfUint64Representation_(*(void **)(a1 + 32), a2, (uint64_t)&v12, a4, a5);
    return objc_msgSend_appendFormat_(*(void **)(a1 + 40), v7, (uint64_t)CFSTR(" (%llu more...)"), v8, v9, v12 - (_QWORD)a2);
  }
}

uint64_t sub_22635C7CC()
{
  id v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)qword_25583C730;
  qword_25583C730 = (uint64_t)v0;

  objc_msgSend_setNumberStyle_((void *)qword_25583C730, v2, 1, v3, v4);
  return objc_msgSend_setUsesGroupingSeparator_((void *)qword_25583C730, v5, 1, v6, v7);
}

uint64_t sub_22635C814()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = objc_opt_new();
  v1 = (void *)qword_25583C740;
  qword_25583C740 = v0;

  objc_msgSend_setNumberStyle_((void *)qword_25583C740, v2, 1, v3, v4);
  objc_msgSend_setMaximumFractionDigits_((void *)qword_25583C740, v5, 1, v6, v7);
  objc_msgSend_setPositiveSuffix_((void *)qword_25583C740, v8, (uint64_t)CFSTR(" FPS"), v9, v10);
  return MEMORY[0x24BEDD108](qword_25583C740, sel_setNegativeSuffix_, CFSTR(" FPS"), v11, v12);
}

void sub_22635C87C()
{
  uint64_t v0;
  void *v1;

  sub_22635C8A4(4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25583C750;
  qword_25583C750 = v0;

}

id sub_22635C8A4(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend_setNumberStyle_(v2, v3, 1, v4, v5);
  objc_msgSend_setUsesGroupingSeparator_(v2, v6, 1, v7, v8);
  objc_msgSend_setMinimumFractionDigits_(v2, v9, a1, v10, v11);
  objc_msgSend_setMaximumFractionDigits_(v2, v12, 4, v13, v14);
  return v2;
}

void sub_22635C900()
{
  uint64_t v0;
  void *v1;

  sub_22635C8A4(0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_25583C760;
  qword_25583C760 = v0;

}

void sub_22635CA34()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDD1970];
  v3 = (id)objc_opt_new();
  objc_msgSend_setValueTransformer_forName_(v0, v1, (uint64_t)v3, (uint64_t)CFSTR("XRSecureUnarchiveFromDataTransformerName"), v2);

}

uint64_t sub_22635CA84(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], a2, a3, 1, a4);
}

id sub_22635CA98(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  v10 = v8;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x24BDD1620], v11, (uint64_t)v10, (uint64_t)v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_22635CCB4(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_25583C778);
  objc_exception_rethrow();
}

void sub_22635CCCC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22635CDAC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_25583C778);
  objc_exception_rethrow();
}

void sub_22635CDC4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22635CF78()
{
  void *v0;

  v0 = (void *)qword_25583C780;
  qword_25583C780 = MEMORY[0x24BDBD1B8];

}

void sub_22635D468(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  char v20;

  v3 = a2;
  v20 = objc_msgSend_impl(v3, v4, v5, v6, v7);
  v8 = objc_alloc(MEMORY[0x24BDD1968]);
  v11 = (void *)objc_msgSend_initWithBytes_objCType_(v8, v9, (uint64_t)&v20, (uint64_t)"C", v10);
  v12 = *(void **)(a1 + 32);
  objc_msgSend_mnemonic(v3, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v12, v18, (uint64_t)v11, (uint64_t)v17, v19);
}

id sub_22635D5A0()
{
  if (qword_25583C848 != -1)
    dispatch_once(&qword_25583C848, &unk_24EDC4270);
  return (id)qword_25583C840;
}

void sub_22635D9B0()
{
  void *v0;

  v0 = (void *)qword_25583C790;
  qword_25583C790 = (uint64_t)&unk_24EDD4DA0;

}

void sub_22635DAA0()
{
  void *v0;

  v0 = (void *)qword_25583C7A0;
  qword_25583C7A0 = (uint64_t)&unk_24EDD4DC8;

}

void sub_22635DAF8()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("type");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C7B0;
  qword_25583C7B0 = v1;

}

void sub_22635DBC4()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("mnemonic");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("title");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("enum");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("usage");
  v4[3] = objc_opt_class();
  v3[4] = CFSTR("class");
  v4[4] = objc_opt_class();
  v3[5] = CFSTR("attribute");
  v4[5] = objc_opt_class();
  v3[6] = CFSTR("experimental");
  v4[6] = objc_opt_class();
  v3[7] = CFSTR("deprecated");
  v4[7] = objc_opt_class();
  v3[8] = CFSTR("encoding-convention");
  v4[8] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)v3, 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C7C0;
  qword_25583C7C0 = v1;

}

void sub_22635DD68()
{
  void *v0;

  v0 = (void *)qword_25583C7D0;
  qword_25583C7D0 = (uint64_t)&unk_24EDD4DF0;

}

void sub_22635DE78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int isEqualToString;
  char *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;

  objc_msgSend_mainBundle(MEMORY[0x24BDD1488], a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_executablePath(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastPathComponent(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("etypetool"), v17, v18);

  if (isEqualToString)
  {
    v20 = getenv("SRCROOT");
    if (v20)
    {
      v22 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v21, (uint64_t)v20, 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_relativeToURL_(v22, v24, (uint64_t)CFSTR("DVTInstrumentsUtilities/EngineeringTypes/engineering_types.etypesdef"), (uint64_t)v23, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)qword_25583C7E8;
      qword_25583C7E8 = v26;

    }
  }
  if (!qword_25583C7E8)
  {
    sub_22635D5A0();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)qword_25583C7E8;
    qword_25583C7E8 = v28;

  }
}

void sub_22635E204()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("sentinel");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("array");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("packed");
  v4[2] = objc_opt_class();
  v3[3] = CFSTR("bit-width");
  v4[3] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)v3, 4);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C7F0;
  qword_25583C7F0 = v1;

}

void sub_22635E324()
{
  void *v0;

  v0 = (void *)qword_25583C800;
  qword_25583C800 = (uint64_t)&unk_24EDD4E18;

}

void sub_22635E534()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("slot");
  v3[1] = CFSTR("remainder");
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C810;
  qword_25583C810 = v1;

}

void sub_22635E7A4()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("bit-range");
  v4[0] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)&v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C820;
  qword_25583C820 = v1;

}

void sub_22635E944()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("type");
  v4[0] = objc_opt_class();
  v3[1] = CFSTR("start");
  v4[1] = objc_opt_class();
  v3[2] = CFSTR("end");
  v4[2] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C830;
  qword_25583C830 = v1;

}

uint64_t sub_22635ECD0(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v11;

  v1 = objc_retainAutorelease(a1);
  v6 = (const char *)objc_msgSend_objCType(v1, v2, v3, v4, v5);
  if (!strcmp(v6, "C"))
  {
    v11 = 0;
    objc_msgSend_getValue_(v1, v7, (uint64_t)&v11, v8, v9);
    return v11;
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v7, *MEMORY[0x24BDBCAB8], (uint64_t)CFSTR("%@ is not an NSValue encoding an XRImplementationClassTypeID"), v9, v1);
    return 0;
  }
}

void sub_22635ED4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int isEqualToString;
  char *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  FILE *v81;
  const char *v82;
  size_t v83;
  FILE *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  id v91;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a2, (uint64_t)CFSTR("com.apple.dt.instruments.DVTInstrumentsUtilities"), a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (!v5)
  {
    objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v6, v7, v8, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_executableURL(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastPathComponent(v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("etypetool"), v39, v40))
    {

    }
    else
    {
      objc_msgSend_mainBundle(MEMORY[0x24BDD1488], v41, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_executableURL(v45, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v55, v56, (uint64_t)CFSTR("ac_generator"), v57, v58);

      if (!isEqualToString)
      {
        v81 = (FILE *)*MEMORY[0x24BDAC8D8];
        v82 = "Attempting to use XREngineeringTypeDefinitions.m outside the framework\n";
        v83 = 71;
        goto LABEL_17;
      }
    }
    v60 = getenv("SRCROOT");
    if (v60)
    {
      objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v61, (uint64_t)v60, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v21, v62, (uint64_t)CFSTR("DVTInstrumentsUtilities/EngineeringTypes/engineering_types.etypesdef"), 1, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (void *)qword_25583C840;
      qword_25583C840 = v64;

      v91 = 0;
      v69 = objc_msgSend_checkResourceIsReachableAndReturnError_((void *)qword_25583C840, v66, (uint64_t)&v91, v67, v68);
      v70 = v91;
      if ((v69 & 1) != 0)
      {

        goto LABEL_12;
      }
      v84 = (FILE *)*MEMORY[0x24BDAC8D8];
      objc_msgSend_localizedFailureReason(v70, v71, v72, v73, v74);
      v85 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v90 = (const char *)objc_msgSend_UTF8String(v85, v86, v87, v88, v89);
      fprintf(v84, "engineering_types.etypesdef is unreachable: %s\n", v90);

LABEL_18:
      exit(1);
    }
    v81 = (FILE *)*MEMORY[0x24BDAC8D8];
    v82 = "SRCROOT must be set to the root of DVTInstrumentsFrameworks.\n";
    v83 = 61;
LABEL_17:
    fwrite(v82, v83, 1uLL, v81);
    goto LABEL_18;
  }
  objc_msgSend_URLForResource_withExtension_(v5, v6, (uint64_t)CFSTR("engineering_types"), (uint64_t)CFSTR("etypesdef"), v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_25583C840;
  qword_25583C840 = v11;

  if (!qword_25583C840)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v13, v14, v15, v16);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v76, (uint64_t)"NSURL *_etypesdefURL(void)_block_invoke", v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v75, v80, (uint64_t)v79, (uint64_t)CFSTR("XREngineeringTypeDefinitions.m"), 203, CFSTR("Didn't find the engineering_types file in the bundle"));

  }
  if ((objc_msgSend_checkResourceIsReachableAndReturnError_((void *)qword_25583C840, v13, 0, v15, v16) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v22, (uint64_t)"NSURL *_etypesdefURL(void)_block_invoke", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v21, v26, (uint64_t)v25, (uint64_t)CFSTR("XREngineeringTypeDefinitions.m"), 204, CFSTR("Didn't find the engineering_types file in the bundle"));

LABEL_12:
  }

}

void sub_22635F460()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)qword_25583C858;
  qword_25583C858 = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)qword_25583C850;
  qword_25583C850 = v2;

}

void *sub_22635F8DC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
    return (void *)objc_msgSend_setObject_forKey_(a1, a2, a3, a4, a5);
  return a1;
}

id sub_22635F8E8(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend_setWithObject_(v6, v8, v7, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xr_deepCopy_classes_(MEMORY[0x24BDD1618], v12, (uint64_t)v5, (uint64_t)v11, v13);
  }
  else
  {
    v11 = 0;
    objc_msgSend_xr_deepCopy_classes_(MEMORY[0x24BDD1618], v3, 0, 0, v4);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id sub_22635F968(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v5 = a3;
  v6 = a4;
  v23 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], v7, (uint64_t)v5, 0, (uint64_t)&v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22635FB20;
  block[3] = &unk_24EDC2C58;
  v10 = v5;
  v22 = v10;
  if (qword_25583C868 == -1)
  {
    if (v9)
    {
LABEL_3:
      v11 = (void *)qword_25583C870;
      if (os_log_type_enabled((os_log_t)qword_25583C870, OS_LOG_TYPE_ERROR))
        sub_22636FE98(v11, v9);
      v12 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&qword_25583C868, block);
    if (v9)
      goto LABEL_3;
  }
  v16 = (id)qword_25583C878;
  if (v6)
  {
    objc_msgSend_setByAddingObjectsFromSet_((void *)qword_25583C878, v13, (uint64_t)v6, v14, v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v17;
  }
  v20 = 0;
  objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x24BDD1620], v13, (uint64_t)v16, (uint64_t)v8, (uint64_t)&v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;
  if (v9)
  {
    v18 = (void *)qword_25583C870;
    if (os_log_type_enabled((os_log_t)qword_25583C870, OS_LOG_TYPE_ERROR))
      sub_22636FE0C(v18, v9);
  }

LABEL_13:
  return v12;
}

void sub_22635FB20()
{
  os_log_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v0 = os_log_create("com.apple.dt.DVTInstrumentsUtilities", "KeyedArchiverDeepCopy");
  v1 = (void *)qword_25583C870;
  qword_25583C870 = (uint64_t)v0;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend_setWithObjects_(v2, v9, v3, v10, v11, v4, v5, v6, v7, v8, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_25583C878;
  qword_25583C878 = v12;

}

void sub_22635FBFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_22635FCAC(uint64_t a1, const char *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (a3 == (void *)a4)
    return 1;
  else
    return objc_msgSend_isEqual_(a3, a2, a4, a4, a5);
}

uint64_t sub_22635FCC8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;

  if (qword_25583C888 != -1)
    dispatch_once(&qword_25583C888, &unk_24EDC2B70);
  objc_msgSend_description(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_rangeOfCharacterFromSet_(v6, v7, qword_25583C880, v8, v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_CLIPSLiteralFormatter(XREngineeringNumberFormatter, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_getObjectValue_forString_errorDescription_(v14, v15, 0, (uint64_t)v6, 0) ^ 1;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void sub_22635FD78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend_alphanumericCharacterSet(MEMORY[0x24BDD1690], a2, a3, a4, a5);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addCharactersInString_(v18, v5, (uint64_t)CFSTR("-"), v6, v7);
  objc_msgSend_invert(v18, v8, v9, v10, v11);
  v16 = objc_msgSend_copy(v18, v12, v13, v14, v15);
  v17 = (void *)qword_25583C880;
  qword_25583C880 = v16;

}

id sub_22635FDD4(void *a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_CLIPSLiteralFormatter(XREngineeringNumberFormatter, v2, v3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringFromNumber_(v6, v7, (uint64_t)a1, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return v10;
  }
  else if (objc_msgSend_xr_isCLIPSSymbol(a1, v2, v3, v4, v5))
  {
    objc_msgSend_description(a1, v12, v13, v14, v15);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)objc_opt_new();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = a1;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v52, (uint64_t)v56, 16);
      if (v23)
      {
        v28 = v23;
        v29 = *(_QWORD *)v53;
        v30 = 1;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v53 != v29)
              objc_enumerationMutation(v21);
            v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v31);
            if ((v30 & 1) == 0)
              objc_msgSend_appendString_(v16, v24, (uint64_t)CFSTR(" "), v26, v27);
            objc_msgSend_xr_clipsStringRepresentation(v32, v24, v25, v26, v27);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v16, v34, (uint64_t)v33, v35, v36);

            v30 = 0;
            ++v31;
          }
          while (v28 != v31);
          v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v52, (uint64_t)v56, 16);
          v30 = 0;
        }
        while (v28);
      }

    }
    else
    {
      objc_msgSend_description(a1, v17, v18, v19, v20);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v16, v38, (uint64_t)v37, v39, v40);

      v45 = objc_msgSend_length(v16, v41, v42, v43, v44);
      objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v16, v46, (uint64_t)CFSTR("\""), (uint64_t)CFSTR("\\\""), 0, 0, v45);
      objc_msgSend_insertString_atIndex_(v16, v47, (uint64_t)CFSTR("\""), 0, v48);
      objc_msgSend_appendString_(v16, v49, (uint64_t)CFSTR("\""), v50, v51);
    }
    return v16;
  }
}

id sub_226360014(void *a1, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return MEMORY[0x24BDBD1A8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v4, v5, v6, v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, a2, (uint64_t)a1, (uint64_t)CFSTR("NSObject+DVTInstrumentsUtilities.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isKindOfClass:NSString.class] || [self isKindOfClass:NSArray.class]"));

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22[0] = a1;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, (uint64_t)v22, 1, v9);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return MEMORY[0x24BDBD1A8];
  v11 = a1;
  objc_msgSend_indexesOfObjectsPassingTest_(v11, v12, (uint64_t)&unk_24EDC42E0, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(v11, v16, (uint64_t)v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t sub_226360194(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_2263603A4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  v9 = (void *)MEMORY[0x24BDD1968];
  v10 = a5;
  v11 = a2;
  objc_msgSend_valueWithRange_(v9, v12, a3, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v15, (uint64_t)v14, (uint64_t)v11, v16);

  v23 = (id)objc_msgSend_copy(v10, v17, v18, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v21, (uint64_t)v23, (uint64_t)v11, v22);

}

void sub_2263607A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_2263607E8(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char isKindOfClass;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  __int128 v24;
  _BYTE *v25;

  v22 = a3;
  v7 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v21 = a1[6];
LABEL_8:
    *(_BYTE *)(*(_QWORD *)(v21 + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    v21 = a1[5];
    goto LABEL_8;
  }
  v9 = v22;
  if (objc_msgSend_count(v9, v10, v11, v12, v13) && (unint64_t)objc_msgSend_count(v9, v14, v15, v16, v17) < 4)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_226360940;
    v23[3] = &unk_24EDC4330;
    v24 = *((_OWORD *)a1 + 2);
    v25 = a4;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v18, (uint64_t)v23, v19, v20);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
  }

LABEL_11:
}

void sub_226360940(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BYTE *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
      v6 = (_BYTE *)a1[6];
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      *v6 = 1;
    }
  }

}

void sub_2263609D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char isKindOfClass;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  id v43;

  v43 = a2;
  v5 = a3;
  objc_msgSend_firstObject(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13, v14);

  v23 = v15;
  if ((unint64_t)objc_msgSend_count(v5, v16, v17, v18, v19) >= 2)
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v20, 1, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend_objectAtIndexedSubscript_(v5, v26, 1, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v29;
    if ((isKindOfClass & 1) != 0)
    {
      v23 = v15;
LABEL_6:
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v30, (uint64_t)v34, (uint64_t)v43, v33);

      goto LABEL_7;
    }
    v23 = objc_msgSend_unsignedIntegerValue(v29, v30, v31, v32, v33);

    if ((unint64_t)objc_msgSend_count(v5, v35, v36, v37, v38) >= 3)
    {
      objc_msgSend_objectAtIndexedSubscript_(v5, v20, 2, v39, v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:
  objc_msgSend_valueWithRange_(MEMORY[0x24BDD1968], v20, v15, v23 - v15 + 1, v22);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v41, (uint64_t)v40, (uint64_t)v43, v42);

}

void sub_226360CB0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;

  v32 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v11 = objc_msgSend_rangeValue(v5, v7, v8, v9, v10);
  v13 = v12;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v14, v11, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v18, (uint64_t)v17, v19, v20);

  if (v13 != 1)
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v21, v13 + v11 - 1, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v25, (uint64_t)v24, v26, v27);

  }
  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v21, (uint64_t)v32, v22, v23);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend_addObject_(v6, v28, (uint64_t)v31, v29, v30);
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 40), v28, (uint64_t)v6, (uint64_t)v32, v30);

}

void sub_2263611C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_226361214(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  id v42;

  v42 = a2;
  v5 = a3;
  v10 = objc_msgSend_rangeValue(v5, v6, v7, v8, v9);
  v12 = objc_msgSend_supportForCapability_versions_(*(void **)(a1 + 32), v11, (uint64_t)v42, v10, (uint64_t)v11);
  if (v12 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 64) + 16), v13, (uint64_t)v42, v14, v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32
      || (objc_msgSend_unimplementedRecoveryForCapability_(*(void **)(a1 + 32), v29, (uint64_t)v42, v30, v31),
          (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_addObject_(*(void **)(a1 + 72), v29, (uint64_t)v32, v30, v31);

    }
    v33 = (void *)MEMORY[0x24BDD1968];
    v34 = objc_msgSend_supportedVersionsForCapability_(*(void **)(a1 + 32), v29, (uint64_t)v42, v30, v31);
    objc_msgSend_valueWithRange_(v33, v35, v34, (uint64_t)v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 48), v38, (uint64_t)v37, (uint64_t)v42, v39);

    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v40, (uint64_t)v5, (uint64_t)v42, v41);
  }
  else if (v12 == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_msgSend_abandonedRecoveryForCapability_(*(void **)(a1 + 32), v13, (uint64_t)v42, v14, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend_addObject_(*(void **)(a1 + 40), v16, (uint64_t)v19, v17, v18);
    v20 = (void *)MEMORY[0x24BDD1968];
    v21 = objc_msgSend_supportedVersionsForCapability_(*(void **)(a1 + 32), v16, (uint64_t)v42, v17, v18);
    objc_msgSend_valueWithRange_(v20, v22, v21, (uint64_t)v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 48), v25, (uint64_t)v24, (uint64_t)v42, v26);

    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 56), v27, (uint64_t)v5, (uint64_t)v42, v28);
  }

}

uint64_t sub_2263613D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  result = objc_msgSend_appendFormat_(*(void **)(a1 + 32), a2, (uint64_t)CFSTR(" %@"), a4, a5, a2);
  if (a3 + 1 == *(_QWORD *)(a1 + 40))
    return objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)CFSTR("\n"), v9, v10);
  return result;
}

uint64_t sub_22636143C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  result = objc_msgSend_appendFormat_(*(void **)(a1 + 32), a2, (uint64_t)CFSTR(" %@"), a4, a5, a2);
  if (a3 + 1 == *(_QWORD *)(a1 + 40))
    return objc_msgSend_appendString_(*(void **)(a1 + 32), v8, (uint64_t)CFSTR("\n"), v9, v10);
  return result;
}

BOOL sub_2263614D4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;

  objc_msgSend_domain(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("Supported Capability Problem"), v8, v9))
    v14 = objc_msgSend_code(a1, v10, v11, v12, v13) == 0;
  else
    v14 = 0;

  return v14;
}

void sub_22636152C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend_userInfo(a1, v5, v6, v7, v8);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v9, (uint64_t)CFSTR("XRCapabilityRangesKey"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v13, (uint64_t)CFSTR("XRRequiredVersionsKey"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = sub_226361604;
  v23[3] = &unk_24EDC4420;
  v24 = v16;
  v25 = v4;
  v17 = v16;
  v18 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v19, (uint64_t)v23, v20, v21);

}

void sub_226361604(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v7 = *(_QWORD *)(a1 + 40);
  v8 = a2;
  v13 = objc_msgSend_rangeValue(a3, v9, v10, v11, v12);
  v15 = v14;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v14, (uint64_t)v8, v16, v17);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_rangeValue(v24, v18, v19, v20, v21);
  (*(void (**)(uint64_t, id, uint64_t, const char *, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v8, v13, v15, v22, v23, a4);

}

void sub_226361730(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend_enumString(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("com.apple.dt.etype.%@"), v11, v12, v9);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_registerCapability_versions_(*(void **)(a1 + 32), v13, (uint64_t)v38, 1, 1);
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_mnemonic(v4, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v14, v20, (uint64_t)CFSTR("This version does not support the new engineering type '%@'."), v21, v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUnimplementedRecoverySuggestion_forCapability_(*(void **)(a1 + 32), v24, (uint64_t)v23, (uint64_t)v38, v25);
  v26 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_mnemonic(v4, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(v26, v32, (uint64_t)CFSTR("This version no longer supports the engineering type '%@'."), v33, v34, v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAbandonedRecoverySuggestion_forCapability_(*(void **)(a1 + 32), v36, (uint64_t)v35, (uint64_t)v38, v37);
}

void sub_226361E0C()
{
  const char *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("xs:annotation");
  v3[1] = CFSTR("xs:restriction");
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v0, (uint64_t)v4, (uint64_t)v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_25583C898;
  qword_25583C898 = v1;

}

void sub_226362D80(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int isEqualToString;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  int v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v8 = v3;
  if (!v3)
    goto LABEL_22;
  if (!objc_msgSend_errorLimit(v3, v4, v5, v6, v7)
    || (v13 = *((_QWORD *)v8 + 4), v13 <= objc_msgSend_errorLimit(v8, v9, v10, v11, v12)))
  {
    ++*((_QWORD *)v8 + 4);
    objc_msgSend_findErrorMessageForErrorPtr_(v8, v9, a2, v11, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (!v19)
    {
      objc_msgSend_xr_writeStringWithFormat_(*((void **)v8 + 6), v20, (uint64_t)CFSTR("%s:%d: error: %s"), v22, v23, *(_QWORD *)(a2 + 24), *(unsigned int *)(a2 + 32), *(_QWORD *)(a2 + 8));
      v33 = *((_QWORD *)v8 + 9);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_QWORD *)(a2 + 24);
        v35 = *(_DWORD *)(a2 + 32);
        v36 = *(void **)(a2 + 8);
        *(_DWORD *)buf = 136315650;
        v68 = v34;
        v69 = 1024;
        v70 = v35;
        v71 = 2080;
        v72 = v36;
        _os_log_error_impl(&dword_22634C000, v33, OS_LOG_TYPE_ERROR, "%s:%d: error: %s", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    objc_msgSend_name(v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("xs:unique"), v26, v27);

    if (isEqualToString)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v29, (uint64_t)CFSTR(" Repeating element value is: %s.\n"), v31, v32, *(_QWORD *)(a2 + 40));
    }
    else
    {
      objc_msgSend_name(v15, v29, v30, v31, v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("xs:keyref"), v39, v40);

      if (v41)
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v42, (uint64_t)CFSTR(" Invalid value is: %s.\n"), v44, v45, *(_QWORD *)(a2 + 48));
      }
      else
      {
        objc_msgSend_name(v15, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)CFSTR("xs:pattern"), v48, v49);

        if (!v50)
          goto LABEL_17;
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v51, (uint64_t)CFSTR(" '%s' doesn't fulfill the requirements.\n"), v53, v54, *(_QWORD *)(a2 + 40));
      }
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend_replacementString(v15, v51, v52, v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingString_(v56, v57, (uint64_t)v55, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      objc_msgSend_xr_writeStringWithFormat_(*((void **)v8 + 6), v61, (uint64_t)CFSTR("%s:%d: error: %@"), v62, v63, *(_QWORD *)(a2 + 24), *(unsigned int *)(a2 + 32), v60);
      v64 = *((_QWORD *)v8 + 9);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = *(_QWORD *)(a2 + 24);
        v66 = *(_DWORD *)(a2 + 32);
        *(_DWORD *)buf = 136315650;
        v68 = v65;
        v69 = 1024;
        v70 = v66;
        v71 = 2112;
        v72 = v60;
        _os_log_error_impl(&dword_22634C000, v64, OS_LOG_TYPE_ERROR, "%s:%d: error: %@", buf, 0x1Cu);
      }

      goto LABEL_21;
    }
LABEL_17:
    objc_msgSend_replacementString(v15, v51, v52, v53, v54);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!*((_BYTE *)v8 + 40))
  {
    *((_BYTE *)v8 + 40) = 1;
    objc_msgSend_path(*((void **)v8 + 1), v9, v14, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_xr_writeStringWithFormat_(*((void **)v8 + 6), v16, (uint64_t)CFSTR("%@: error: Too many schema validation errors emitted. Stopping now.\n"), v17, v18, v15);
LABEL_21:

  }
LABEL_22:

}

void sub_2263630A8(void *a1, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = (void *)*((_QWORD *)v7 + 6);
  v9 = *(_QWORD *)(a2 + 24);
  if (!v9)
    v9 = objc_msgSend_fileSystemRepresentation(*((void **)v7 + 1), v3, v4, v5, v6);
  objc_msgSend_xr_writeStringWithFormat_(v8, v3, (uint64_t)CFSTR("%s:%d: error: %s"), v5, v6, v9, *(unsigned int *)(a2 + 32), *(_QWORD *)(a2 + 8));
  v10 = *((id *)v7 + 9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v15 = *(_QWORD *)(a2 + 24);
    if (!v15)
      v15 = objc_msgSend_fileSystemRepresentation(*((void **)v7 + 1), v11, v12, v13, v14);
    v16 = *(_DWORD *)(a2 + 32);
    v17 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)buf = 136315650;
    v19 = v15;
    v20 = 1024;
    v21 = v16;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_22634C000, v10, OS_LOG_TYPE_ERROR, "%s:%d: error: %s", buf, 0x1Cu);
  }

}

void sub_226363BD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226363F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_226363FE8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void sub_226364100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)XRFrameActivityManager;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2263641C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2263642D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2263643A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_2263643C4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void **v7;
  uint64_t result;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = (void **)(a1 + 40);
  result = objc_msgSend_holdBackArrivingAgent_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4, a5);
  if ((result & 1) == 0)
  {
    objc_msgSend_setYieldNow_(*(void **)(a1 + 40), v9, (uint64_t)a2, v10, v11);
    objc_msgSend__prepareMinorFrameAgent_(*(void **)(a1 + 32), v12, *(_QWORD *)(a1 + 40), v13, v14);
    objc_msgSend_hello(*(void **)(a1 + 40), v15, v16, v17, v18);
    objc_msgSend_setYieldNow_(*v7, v19, 0, v20, v21);
    objc_msgSend__escortMinorFrameAgentToExit_(*(void **)(a1 + 32), v22, *(_QWORD *)(a1 + 40), v23, v24);
    if (objc_msgSend_nextMovementType(*v7, v25, v26, v27, v28) != 2)
      return objc_msgSend_goodbye(*v7, v29, v30, v31, v32);
    result = objc_msgSend_holdBackRevisitingAgent_(*(void **)(a1 + 32), v29, *(_QWORD *)(a1 + 40), v31, v32);
    if ((result & 1) == 0)
      return objc_msgSend_goodbye(*v7, v29, v30, v31, v32);
  }
  return result;
}

void sub_226364474(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_226364610(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226364708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_2263647B8@<X0>(__int128 *a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = operator new(0x68uLL);
  result = sub_226364828(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_226364814(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_226364828(_QWORD *a1, __int128 *a2, unsigned __int8 *a3, int *a4)
{
  char v6;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24EDC2958;
  sub_2263648D8((int)&v6, (_DWORD)a1 + 24, a2, a3, a4);
  return a1;
}

void sub_226364878(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_22636488C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC2958;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_22636489C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC2958;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22769619CLL);
}

uint64_t sub_2263648CC(uint64_t a1)
{
  return sub_22636C320(a1 + 24);
}

void sub_2263648D8(int a1, int a2, __int128 *a3, unsigned __int8 *a4, int *a5)
{
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;

  v8 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  sub_22636C2DC(a2, (int)&v8, *a4, *a5, QOS_CLASS_USER_INITIATED);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_226364954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22634FAC8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_226364968@<X0>(__int128 *a1@<X1>, unsigned __int8 *a2@<X2>, int *a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = operator new(0x68uLL);
  result = sub_2263649D8(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_2263649C4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2263649D8(_QWORD *a1, __int128 *a2, unsigned __int8 *a3, int *a4)
{
  char v6;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24EDC2958;
  sub_226364A3C((int)&v6, (_DWORD)a1 + 24, a2, a3, a4);
  return a1;
}

void sub_226364A28(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_226364A3C(int a1, int a2, __int128 *a3, unsigned __int8 *a4, int *a5)
{
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;

  v8 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  sub_22636C2DC(a2, (int)&v8, *a4, *a5, QOS_CLASS_USER_INITIATED);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_226364AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22634FAC8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_226364ACC@<X0>(unsigned int *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x28uLL);
  result = sub_226364B24(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_226364B10(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_226364B24(_QWORD *a1, unsigned int *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24EDC2990;
  sub_22636B264(a1 + 3, *a2);
  return a1;
}

void sub_226364B5C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_226364B70(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC2990;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_226364B80(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24EDC2990;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22769619CLL);
}

void sub_226364BB0(uint64_t a1)
{

}

void DVTIUAssertRecover(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v5)(void);

  v5 = a3;
  NSLog(CFSTR("DVTInstrumentsFoundation UNEXPECTED FAILURE (%s:%d) Set a breakpoint at DVTIFAssertRecover #Error"), a1, a2);
  v5[2]();

}

void DVTIUAssertNotMainThread(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("DVTInstrumentsFoundation THREADING: This code should never be called directly on the main thread (%s:%d) #Developer #Comment"), a1, a2);
}

void DVTIUAssertMainThread(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;

  objc_msgSend_currentThread(MEMORY[0x24BDD17F0], a2, a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("DVTInstrumentsFoundation THREADING: Main thread at (%s:%d) running on secondary thread: %@  #Developer #Comment"), a1, a2, v7);

}

BOOL _DVTIURuntimeCheckForBlockCaptureOfObject(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  unint64_t v5;
  id *v6;
  unint64_t v7;
  id v8;
  BOOL v9;

  v3 = a2;
  v4 = 0;
  if (a1 && v3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + a1;
    if (a1 + 40 <= v5)
    {
      v6 = (id *)(a1 + 32);
      v7 = a1 + 48;
      do
      {
        v8 = *v6++;
        v4 = v8 == v3;
        v9 = v8 == v3 || v7 > v5;
        v7 += 8;
      }
      while (!v9);
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

uint64_t DVTIUIsAppleInternalOSEnvironment()
{
  if (qword_25583C8F8 != -1)
    dispatch_once(&qword_25583C8F8, &unk_24EDC2BB0);
  return byte_25583C8F0;
}

uint64_t sub_226364D3C()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  byte_25583C8F0 = result;
  return result;
}

__CFString *DVTIUCurrentDylibRootPath()
{
  char *v0;
  char *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __CFString *v6;

  v0 = getenv("DYLD_ROOT_PATH");
  if (v0 && (v1 = realpath_DARWIN_EXTSN(v0, 0)) != 0)
  {
    v5 = v1;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v2, (uint64_t)v1, v3, v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v6 = CFSTR("/");
  }
  return v6;
}

uint64_t DVTIUUidForPid(int a1)
{
  int v1;
  BOOL v2;
  size_t v4;
  _OWORD v5[26];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12[2];
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v12 = 0xE00000001;
  v13 = 1;
  v14 = a1;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  v4 = 648;
  v1 = sysctl(v12, 4u, v5, &v4, 0, 0);
  if (v4)
    v2 = v1 == 0;
  else
    v2 = 0;
  if (v2)
    return DWORD1(v6);
  else
    return 0xFFFFFFFFLL;
}

uint64_t DVTIsRestrictedPid()
{
  return 0;
}

BOOL DVTIsProcessRestricted(task_name_t a1)
{
  return sub_226364ECC(a1) < 2;
}

uint64_t sub_226364ECC(task_name_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int has_internal_content;
  uint64_t result;
  kern_return_t v6;
  int v7;
  int v8;
  int v9;
  int buffer;
  int x;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 - 1 > 0xFFFFFFFD)
    return 0;
  v16 = v1;
  v17 = v2;
  if (!csr_check())
    return 3;
  has_internal_content = os_variant_has_internal_content();
  v15 = 2048;
  *(_OWORD *)task_info_out = 0u;
  v14 = 0u;
  task_info_outCnt = 8;
  if (task_info(a1, 0xFu, task_info_out, &task_info_outCnt))
    return 0;
  x = 0;
  v6 = pid_for_task(a1, &x);
  result = 0;
  if (!v6)
  {
    buffer = 0;
    v7 = proc_pidinfo(x, 30, 0, &buffer, 4);
    result = 0;
    if (v7 == 4)
    {
      v8 = csops_audittoken();
      result = 0;
      if (!v8)
      {
        if ((v15 & 4) == 0)
        {
          if ((v15 & 0x800) != 0)
          {
            if (!has_internal_content)
              return 0;
            return geteuid() == 0;
          }
          else
          {
            if ((v15 & 0x20000000) != 0)
              v9 = has_internal_content;
            else
              v9 = 1;
            if (v9)
              return 3;
            else
              return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t DVTIsProcessDebuggable(task_name_t a1)
{
  return sub_226364ECC(a1) & 1;
}

uint64_t DVTIsSimulatorProcess()
{
  return 0;
}

BOOL DVTCheckIfPIDExists(_BOOL8 result)
{
  if (result)
    return kill(result, 0) != -1 || *__error() != 3;
  return result;
}

void sub_2263650A0()
{
  uint64_t v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v0 = objc_opt_new();
  v1 = (void *)qword_25583C908;
  qword_25583C908 = v0;

  objc_msgSend_queue((void *)qword_25583C908, v2, v3, v4, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMaxConcurrentOperationCount_(v9, v6, 32, v7, v8);

}

uint64_t sub_226365144()
{
  XRFrameCommutator *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = objc_alloc_init(XRFrameCommutator);
  v1 = (void *)qword_25583C910;
  qword_25583C910 = (uint64_t)v0;

  return objc_msgSend_start((void *)qword_25583C910, v2, v3, v4, v5);
}

void sub_226365204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_226365214@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = operator new();
  result = sub_22636E068(v4, a1);
  *a2 = v4;
  return result;
}

void sub_226365264(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x22769619C](v1, 0x1020C40D1E833C5);
  _Unwind_Resume(a1);
}

void sub_2263652F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)XRFrameCommutator;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t sub_22636541C(uint64_t a1, void **a2)
{
  uint64_t result;
  void **v4;

  if (a2)
  {
    v4 = a2 + 29;
    sub_22634FA58(&v4);
    v4 = a2 + 26;
    sub_22634FA58(&v4);
    v4 = a2 + 23;
    sub_22634FA58(&v4);
    return MEMORY[0x22769619C](a2, 0x1020C40D1E833C5);
  }
  return result;
}

void sub_226365908(void *a1, void *a2, uint64_t a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a1;
  objc_msgSend_URLByAppendingPathComponent_(a2, v5, a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_checkResourceIsReachableAndReturnError_(v8, v9, 0, v10, v11))
  {
    v16 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend_relativePath(v8, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithContentsOfFile_(v16, v18, (uint64_t)v17, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addEntriesFromDictionary_(v25, v22, (uint64_t)v21, v23, v24);

  }
}

void sub_226365A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_226365AA4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  unint64_t v18;
  unint64_t *v19;

  v5 = a2;
  v10 = v5;
  v18 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    v11 = objc_msgSend_copy(v5, v6, v7, v8, v9);
    v12 = *(_QWORD *)(a1 + 32) + 8;
    v19 = &v18;
    v13 = sub_2263661D4(v12, &v18, (uint64_t)&unk_2263745A0, &v19);
    v14 = (void *)v13[3];
    v13[3] = v11;
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32) + 8;
    v19 = &v18;
    v16 = sub_2263661D4(v15, &v18, (uint64_t)&unk_2263745A0, &v19);
    v17 = v10;
    v14 = (void *)v16[3];
    v16[3] = v17;
  }

}

void sub_226365B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226365C8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226365D54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226365E30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226365EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226365FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_226365FC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5);
}

void sub_22636605C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_226366074(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);

}

void sub_2263660BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_226366180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_2263661D4(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
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
    sub_226366444(a1, v19);
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

void sub_226366400(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  sub_226366678(v2, v1);
  _Unwind_Resume(a1);
}

void sub_22636641C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_226366444(uint64_t a1, size_t __n)
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
      sub_226366520(a1, prime);
  }
}

void sub_226366520(uint64_t a1, unint64_t a2)
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
      sub_22636641C();
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

void sub_226366678(uint64_t a1, id *a2)
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

_QWORD *sub_2263666BC(_QWORD *a1, unint64_t *a2)
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

_QWORD *sub_226366770(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
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
  v12 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  v13 = *a3;
  v14 = a3[1];
  a3[1] = 0;
  *i = 0;
  i[1] = v6;
  i[2] = v13;
  i[3] = v14;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_226366444(a1, v20);
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
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *v12;
  *v12 = i;
  *(_QWORD *)(v21 + 8 * v3) = v12;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7)
        v23 %= v7;
    }
    else
    {
      v23 &= v7 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_22636699C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  sub_226366678(v2, v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2263669B8(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = sub_2263666BC(a1, a2);
  if (result)
  {
    sub_2263669EC(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

_QWORD *sub_2263669EC(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  id *v3;
  void *__p;
  char v5;

  if (a2)
  {
    v2 = *a2;
    sub_226366A48(result, a2, (uint64_t)&__p);
    v3 = (id *)__p;
    __p = 0;
    if (v3)
    {
      if (v5)

      operator delete(v3);
    }
    return (_QWORD *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_226366A48@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

void sub_226366B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_226366BD0(a1, *(id **)(a1 + 16));
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

void sub_226366BD0(uint64_t a1, id *a2)
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

void sub_226366C0C(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t i;
  id *v8;
  BOOL v9;
  id *v10;
  void *v11;
  unint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = a2;
  v6 = a1[1];
  if (v6)
  {
    for (i = 0; i != v6; ++i)
      *(_QWORD *)(*a1 + 8 * i) = 0;
    v8 = (id *)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8)
      v9 = a2 == a3;
    else
      v9 = 1;
    if (v9)
    {
      v10 = v8;
    }
    else
    {
      do
      {
        v11 = (void *)v4[3];
        v8[2] = (id)v4[2];
        objc_storeStrong(v8 + 3, v11);
        v10 = (id *)*v8;
        v12 = (unint64_t)v8[2];
        v8[1] = (id)v12;
        v13 = sub_226366D20((uint64_t)a1, v12, v8 + 2);
        sub_226366E74(a1, v8, v13);
        v4 = (_QWORD *)*v4;
        if (v10)
          v14 = v4 == a3;
        else
          v14 = 1;
        v8 = v10;
      }
      while (!v14);
    }
    sub_226366BD0((uint64_t)a1, v10);
  }
  while (v4 != a3)
  {
    sub_2263671A8(a1, v4 + 2);
    v4 = (_QWORD *)*v4;
  }
}

void sub_226366CF4(void *a1)
{
  uint64_t v1;
  id *v2;

  __cxa_begin_catch(a1);
  sub_226366BD0(v1, v2);
  __cxa_rethrow();
}

void sub_226366D0C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *sub_226366D20(uint64_t a1, unint64_t a2, _QWORD *a3)
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
  _QWORD *v16;
  int v17;
  _QWORD *result;
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
    sub_226366F5C(a1, v13);
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
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = (_QWORD *)*v16;
    if (!v16)
      break;
    v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      v20 = v16[1];
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && v16[2] == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *sub_226366E74(_QWORD *result, _QWORD *a2, _QWORD *a3)
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

void sub_226366F5C(uint64_t a1, size_t __n)
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
      sub_226367038(a1, prime);
  }
}

void sub_226367038(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      sub_22636641C();
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
      for (i = (_QWORD *)*v7; *v7; i = (_QWORD *)*v7)
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
          v7 = i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = i;
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

_QWORD *sub_2263671A8(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  _QWORD *v7;

  v4 = operator new(0x20uLL);
  *v4 = 0;
  v5 = (void *)a2[1];
  v4[2] = *a2;
  v4[3] = v5;
  v6 = v4[2];
  v4[1] = v6;
  v7 = sub_226366D20((uint64_t)a1, v6, v4 + 2);
  sub_226366E74(a1, v4, v7);
  return v4;
}

void sub_226367244(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  sub_226366678(v2, v1);
  _Unwind_Resume(a1);
}

uint64_t sub_226367260(uint64_t a1)
{
  void *v2;

  sub_226366BD0(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

uint64_t sub_226367298(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], a2, (uint64_t)CFSTR("Instruments Utility Error"), a3, 0);
}

id sub_2263672B4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a3;
  v11 = [v9 alloc];
  v14 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9, v13);

  v20 = *MEMORY[0x24BDD0FC8];
  v21[0] = v14;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v21, (uint64_t)&v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v17, (uint64_t)CFSTR("Instruments Utility Error"), 0, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id sub_22636739C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v19;
  __CFString *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (!v7)
  {
    if (a3 <= 199)
    {
      if (a3)
      {
        if (a3 == 100)
          v7 = CFSTR("Possible security violation");
      }
      else
      {
        v7 = CFSTR("Internal DVTInstrumentsUtilities Error");
      }
    }
    else
    {
      switch(a3)
      {
        case 200:
          v7 = CFSTR("Another application broke a system lock this application requires");
          break;
        case 300:
          v7 = CFSTR("Internal framework misuse error");
          break;
        case 400:
          v7 = CFSTR("Operation was denied");
          break;
      }
    }
  }
  if (a5)
  {
    v8 = *MEMORY[0x24BDD0FF0];
    v21[0] = *MEMORY[0x24BDD0FC8];
    v21[1] = v8;
    v22[0] = v7;
    v22[1] = a5;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = a5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v9, v11, (uint64_t)v22, (uint64_t)v21, 2);
  }
  else
  {
    v19 = *MEMORY[0x24BDD0FC8];
    v20 = v7;
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = 0;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(v12, v14, (uint64_t)&v20, (uint64_t)&v19, 1);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v16, (uint64_t)CFSTR("Instruments Utility Error"), a3, (uint64_t)v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t sub_226367510(void *a1, const char *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;

  objc_msgSend_userInfo(a1, a2, (uint64_t)a3, (uint64_t)a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("DVTInstrumentsUtilitiesRecoveryActionKey"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_userInfo(a1, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)CFSTR("DVTInstrumentsUtilitiesRecoveryParameterKey"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v26 = v21 == 0;
  else
    v26 = 1;
  v27 = !v26;
  if (!v26)
  {
    if (a3)
    {
      v28 = objc_msgSend_copy(v12, v22, v23, v24, v25);
      v29 = (void *)*a3;
      *a3 = v28;

    }
    if (a4)
    {
      v30 = objc_msgSend_copy(v21, v22, v23, v24, v25);
      v31 = (void *)*a4;
      *a4 = v30;

    }
  }

  return v27;
}

uint64_t sub_2263675DC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend_domain(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88], v8, v9))
  {
    v14 = objc_msgSend_code(a1, v10, v11, v12, v13);

    if (v14 == 516)
      return 1;
  }
  else
  {

  }
  objc_msgSend_domain(a1, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x24BDD1128], v21, v22))
  {
    v27 = objc_msgSend_code(a1, v23, v24, v25, v26);

    if (v27 == 17)
      return 1;
  }
  else
  {

  }
  return 0;
}

uint64_t sub_22636768C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend_domain(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v6, v7, *MEMORY[0x24BDD0B88], v8, v9))
  {
    v14 = objc_msgSend_code(a1, v10, v11, v12, v13);

    if (v14 == 260)
      return 1;
  }
  else
  {

  }
  objc_msgSend_domain(a1, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x24BDD1128], v21, v22))
  {
    v27 = objc_msgSend_code(a1, v23, v24, v25, v26);

    if (v27 == 2)
      return 1;
  }
  else
  {

  }
  return 0;
}

uint64_t sub_226368A4C()
{
  return 0xFFFFFFFFLL;
}

id sub_226368A9C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v6 = a4;
  objc_msgSend_pathForResource_ofType_(a1, v7, a3, (uint64_t)CFSTR("plist"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCE70]);
    v14 = (void *)objc_msgSend_initWithContentsOfFile_(v10, v11, (uint64_t)v9, v12, v13);
    v18 = v14;
    if (v14)
    {
      objc_msgSend_objectForKey_(v14, v15, (uint64_t)v6, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = (void *)objc_msgSend_copy(v19, v20, v21, v22, v23);
      else
        v24 = 0;

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

uint64_t sub_226368B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a1, sel_topLevelKeyValueForPlistName_key_, CFSTR("version"), CFSTR("CFBundleVersion"), a5);
}

unint64_t XRUnionTimeRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (a1 != -1 || a2)
  {
    if (a3 != -1 || a4)
    {
      if (a1 > -a2 || a2 == 0)
        v5 = -1;
      else
        v5 = a2 + a1 - 1;
      if (a3 > -a4 || a4 == 0)
        v7 = -1;
      else
        v7 = a4 + a3 - 1;
      if (v5 <= v7)
        v5 = v7;
      if (a1 >= a3)
        v8 = a3;
      else
        v8 = a1;
      if (v8 >= v5)
        v9 = v5;
      else
        v9 = v8;
      if (v8 > v5)
        v5 = v8;
      if (v5 - v9 == -1)
        return 0;
      else
        return v9;
    }
    else
    {
      return a1;
    }
  }
  return a3;
}

unint64_t XRMakeInclusiveTimeRange(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (a1 >= a2)
    v2 = a2;
  else
    v2 = a1;
  if (a1 <= a2)
    v3 = a2;
  else
    v3 = a1;
  if (v3 - v2 == -1)
    return 0;
  else
    return v2;
}

uint64_t XRIntersectionTimeRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  if (a1 == -1 && !a2)
    return -1;
  if (a3 == -1 && !a4)
    return -1;
  v4 = a1 <= a3 ? a3 : a1;
  v5 = a1 > -a2 || a2 == 0;
  v6 = v5 ? -1 : a2 + a1 - 1;
  v7 = a3 > -a4 || a4 == 0;
  v8 = v7 ? -1 : a4 + a3 - 1;
  if (v6 >= v8)
    v6 = v8;
  v9 = v6 >= v4;
  v10 = v6 - v4;
  if (!v9)
    return -1;
  if (v10 == -1)
    return 0;
  return v4;
}

uint64_t XRMakeDurationTimeRange(unint64_t a1, uint64_t a2)
{
  BOOL v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = __CFADD__(a2, a1);
  v3 = a1 + a2 - 1;
  if (a1 >= v3)
    v4 = a1 + a2 - 1;
  else
    v4 = a1;
  if (a1 > v3)
    v3 = a1;
  if (v3 - v4 == -1)
    v4 = 0;
  if (v2)
    v5 = a1;
  else
    v5 = v4;
  if (a2)
    return v5;
  else
    return -1;
}

uint64_t XRDisplayStringFromTimeRange(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 > -(uint64_t)a2 || a2 == 0)
    return objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("[%llu - %llu]"), a4, a5, a1, -1);
  else
    return objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("[%llu - %llu]"), a4, a5, a1, &a2[a1 - 1]);
}

uint64_t XRStringFromTimeRange(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%llu %llu"), a4, a5, a1, a2);
}

uint64_t XRTimeRangeFromString(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v1 = objc_retainAutorelease(a1);
  v5 = (const char *)objc_msgSend_cStringUsingEncoding_(v1, v2, 1, v3, v4);
  sscanf(v5, "%llu %llu", &v7, &v8);
  return v7;
}

id sub_226368DBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[2];

  v6[0] = a3;
  v6[1] = a4;
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x24BDD1968], a2, (uint64_t)v6, (uint64_t)"{XRTimeRange=QQ}", a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_226368DF4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[2];

  v6[0] = 0;
  v6[1] = 0;
  objc_msgSend_getValue_(a1, a2, (uint64_t)v6, a4, a5);
  return v6[0];
}

id sub_226368E1C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("start");
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("length");
  v15[0] = v6;
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v7, a4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v15, (uint64_t)v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t sub_226368EE4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend_objectForKeyedSubscript_(a1, a2, (uint64_t)CFSTR("start"), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(a1, v7, (uint64_t)CFSTR("length"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = objc_msgSend_unsignedLongLongValue(v6, v11, v12, v13, v14);
    if (!v10)
      goto LABEL_23;
  }
  else
  {
    v15 = 0;
    if (!v10)
    {
LABEL_23:
      v25 = -1;
      goto LABEL_24;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_23;
  v20 = objc_msgSend_unsignedLongLongValue(v10, v16, v17, v18, v19);
  v21 = __CFADD__(v20, v15);
  v22 = v15 + v20 - 1;
  if (v15 >= v22)
    v23 = v15 + v20 - 1;
  else
    v23 = v15;
  if (v15 > v22)
    v22 = v15;
  if (v22 - v23 == -1)
    v23 = 0;
  if (v21)
    v24 = v15;
  else
    v24 = v23;
  if (v20)
    v25 = v24;
  else
    v25 = -1;
LABEL_24:

  return v25;
}

void sub_226369078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2263690FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22636923C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_22636964C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2263696F8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_22636974C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2263697D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226369934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_226369968(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  sub_22636A8D0((_QWORD *)v1 + 3);
  objc_msgSend_setStrongBlockAdapterToken_(v1, v2, 0, v3, v4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend_keyEnumerator(*((void **)v1 + 2), v5, v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        sub_226369FCC(*((void **)v1 + 2), *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18++), v1);
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v19, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v16);
  }

}

void sub_226369A90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_226369B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)XRLazyKVOAdapter;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_226369BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_226369CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_226369E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_226369E78(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a2;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), *(_QWORD *)(a1 + 56), a3, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v8);
  }

  objc_msgSend_setObject_forIntegerKey_(*(void **)(a1 + 48), v11, (uint64_t)v5, a3, v12);
}

void sub_226369F90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_226369FCC(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  id v23;
  id v24;

  v5 = a1;
  v6 = a2;
  v10 = a3;
  if (v6)
  {
    objc_msgSend_objectForKey_(v5, v7, (uint64_t)v6, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = sub_22636A474;
    v22 = &unk_24EDC4548;
    v12 = v6;
    v23 = v12;
    v24 = v10;
    objc_msgSend_enumerateObjectsAndIntegerKeys_(v11, v13, (uint64_t)&v19, v14, v15);
    objc_msgSend_removeObjectForKey_(v5, v16, (uint64_t)v12, v17, v18, v19, v20, v21, v22);

  }
}

void sub_22636A0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_22636A1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22636A380(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v4);
  _Unwind_Resume(a1);
}

void sub_22636A474(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a2;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend_removeObserver_forKeyPath_context_(*(void **)(a1 + 32), v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a3, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v8);
  }

}

void sub_22636A578(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_22636A59C(_QWORD *a1, _QWORD *a2)
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

void sub_22636A688(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (_QWORD *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v8[2] = a2[2];
      v9 = (_QWORD *)*v8;
      sub_22636A77C(a1, v8);
      a2 = (_QWORD *)*a2;
      v8 = v9;
      if (!v9)
        goto LABEL_9;
    }
    do
    {
      v10 = (_QWORD *)*v8;
      operator delete(v8);
      v8 = v10;
    }
    while (v10);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_22636A7F8(a1, a2 + 2);
      a2 = (_QWORD *)*a2;
    }
  }
}

void sub_22636A748(void *a1)
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

void sub_22636A768(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *sub_22636A77C(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  v4 = a2 + 2;
  v5 = a2[2];
  v6 = HIDWORD(v5);
  v7 = 0x9DDFEA08EB382D69 * (((8 * v5) + 8) ^ HIDWORD(v5));
  v8 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
  a2[1] = v8;
  v9 = sub_226366D20((uint64_t)a1, v8, v4);
  sub_226366E74(a1, a2, v9);
  return a2;
}

_QWORD *sub_22636A7F8(_QWORD *a1, unint64_t *a2)
{
  _QWORD *v4;

  sub_22636A84C((uint64_t)a1, a2, (uint64_t)&v4);
  return sub_22636A77C(a1, v4);
}

void sub_22636A830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_22636A84C@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a1 + 16;
  result = operator new(0x18uLL);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  v7 = *a2;
  result[2] = *a2;
  *(_BYTE *)(a3 + 16) = 1;
  v8 = HIDWORD(v7);
  v9 = 0x9DDFEA08EB382D69 * (((8 * v7) + 8) ^ HIDWORD(v7));
  *result = 0;
  result[1] = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) ^ ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) >> 47));
  return result;
}

_QWORD *sub_22636A8D0(_QWORD *result)
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

_QWORD *sub_22636A934(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  _QWORD **v11;
  _QWORD *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9)
        v3 = v8 % v9;
    }
    else
    {
      v3 = v8 & (v9 - 1);
    }
    v11 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (_QWORD *)*i)
      {
        v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9)
              v13 %= v9;
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    v16 = 1;
    if (v9 >= 3)
      v16 = (v9 & (v9 - 1)) != 0;
    v17 = v16 | (2 * v9);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    sub_226366444(a1, v19);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9)
        v22 %= v9;
    }
    else
    {
      v22 &= v9 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_22636AB70(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_22636AB84(uint64_t a1)
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

id sub_22636ABCC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  unsigned __int8 *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CC_LONG v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  if ((unint64_t)objc_msgSend_length(a1, a2, a3, a4, a5) <= 0x100000000)
  {
    v7 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
    v8 = objc_retainAutorelease(a1);
    v13 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11, v12);
    v18 = objc_msgSend_length(v8, v14, v15, v16, v17);
    CC_SHA256(v13, v18, v7);
    v19 = objc_alloc(MEMORY[0x24BDBCE50]);
    v21 = (void *)objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v19, v20, (uint64_t)v7, 32, 1);
    objc_msgSend_base64EncodedStringWithOptions_(v21, v22, 0, v23, v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id sub_22636AC8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_opt_new();
    objc_msgSend_setGroup_(v4, v5, (uint64_t)v3, v6, v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id sub_22636ACDC()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (void *)objc_opt_new();
  objc_msgSend_setStopWhenDone_(v0, v1, 1, v2, v3);
  return v0;
}

void sub_22636AD10(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  void *v11;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_22636AD88;
  v9[3] = &unk_24EDC2EC8;
  v10 = v4;
  v11 = a1;
  v5 = v4;
  objc_msgSend_performBlock_(a1, v6, (uint64_t)v9, v7, v8);

}

void sub_22636AD88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFRunLoop *CFRunLoop;
  void *v24;

  objc_msgSend_hello(*(void **)(a1 + 32), a2, a3, a4, a5);
  objc_msgSend_goodbye(*(void **)(a1 + 32), v6, v7, v8, v9);
  objc_msgSend_ticket(*(void **)(a1 + 32), v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v24 = v14;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = v24;
    if ((isKindOfClass & 1) != 0)
    {
      v19 = objc_msgSend_stopWhenDone(v24, (const char *)v24, v16, v17, v18);
      v14 = v24;
      if (v19)
      {
        CFRunLoop = (__CFRunLoop *)objc_msgSend_getCFRunLoop(*(void **)(a1 + 40), (const char *)v24, v20, v21, v22);
        CFRunLoopStop(CFRunLoop);
        v14 = v24;
      }
    }
  }

}

void sub_22636AE14(void *a1, uint64_t a2, void *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  objc_msgSend_ticket(v4, v5, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_group(v12, v9, v13, v10, v11);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      dispatch_get_global_queue(17, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = sub_22636AF24;
      v19[3] = &unk_24EDC2EC8;
      v19[4] = a1;
      v20 = v4;
      dispatch_group_notify(v17, v18, v19);

    }
    else
    {
      objc_msgSend__scheduleAgentVisit_(a1, v14, (uint64_t)v4, v15, v16);
    }

  }
  else
  {
    objc_msgSend__scheduleAgentVisit_(a1, v9, (uint64_t)v4, v10, v11);
  }

}

uint64_t sub_22636AF24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend__scheduleAgentVisit_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4, a5);
}

id sub_22636AF60()
{
  if (qword_25583C938[0] != -1)
    dispatch_once(qword_25583C938, &unk_24EDC2C10);
  return (id)qword_25583C5A0;
}

void sub_22636AFA0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  os_log_t v10;
  void *v11;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("XREnableInternalSignposts"), v7, v8);

  if (v9)
  {
    v10 = os_log_create("com.apple.dt.utilities", "Frame Scheduler");
    v11 = (void *)qword_25583C5A0;
    qword_25583C5A0 = (uint64_t)v10;

  }
}

void sub_22636B010(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22636B020(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_22636B09C;
  v6[3] = &unk_24EDC4570;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t sub_22636B09C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_22636B0A8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_22636B124;
  v6[3] = &unk_24EDC4570;
  v7 = v3;
  v8 = a1;
  v5 = v3;
  dispatch_barrier_async(v4, v6);

}

uint64_t sub_22636B124(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 8));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_22636B154(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  NSObject *v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 8))
  {
    dispatch_group_enter(v3);
    v5 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22636B1F4;
    block[3] = &unk_24EDC2DE8;
    v8 = v4;
    dispatch_barrier_async(v5, block);
    v6 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

void sub_22636B1F4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_22636B1FC(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;

  *(_QWORD *)(a1 + 8) = 0;
  if (a2 == 1)
    v3 = MEMORY[0x24BDAC9C0];
  else
    v3 = 0;
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, -15);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.dt.frame.inactivity", v4);
  v6 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v5;

  return a1;
}

BOOL sub_22636B268(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _BOOL8 v3;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)a1)
  {
    v3 = 0;
  }
  else if (*(_DWORD *)(a1 + 8))
  {
    v3 = 1;
  }
  else
  {
    v3 = *(_DWORD *)(a1 + 12) != 0;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_22636B2C8(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v4;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)a1 || (v4 = *(_DWORD *)(a1 + 4), v4 == -1))
  {
    v3 = 1;
  }
  else
  {
    v3 = 0;
    *(_DWORD *)(a1 + 4) = v4 + 1;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_22636B32C(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 8);
  if (!v3)
  {
    v4 = *(_DWORD *)(a1 + 12) == 0;
    v6 = *(_BYTE *)(a1 + 3) == 0;
    v5 = v4;
    if (*(_BYTE *)a1)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = 0;
  v5 = 0;
  v6 = *(_BYTE *)(a1 + 3) == 0;
  if (v3 != -1 && *(_BYTE *)a1 == 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 8) = v3 + 1;
    v5 = v4;
  }
LABEL_8:
  os_unfair_lock_unlock(v2);
  return v6 & v5;
}

BOOL sub_22636B3C8(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  _BOOL4 v4;
  int v5;
  int v6;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 8);
  if (v3)
    v4 = 0;
  else
    v4 = *(_DWORD *)(a1 + 12) == 0;
  v5 = *(_DWORD *)(a1 + 4);
  if (!v5)
    sub_2263702F4();
  v6 = *(unsigned __int8 *)(a1 + 3);
  if (*(_BYTE *)(a1 + 1))
  {
    *(_DWORD *)(a1 + 4) = v5 - 1;
  }
  else
  {
    if (v3 != -1 && !*(_BYTE *)a1)
      *(_DWORD *)(a1 + 8) = v3 + 1;
    *(_BYTE *)(a1 + 1) = 1;
  }
  os_unfair_lock_unlock(v2);
  return !v6 && v4;
}

uint64_t sub_22636B468(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 4);
  if (!v3)
    sub_22637031C();
  *(_DWORD *)(a1 + 4) = v3 - 1;
  if (!*(_BYTE *)(a1 + 2))
    *(_BYTE *)(a1 + 2) = 1;
  os_unfair_lock_unlock(v2);
  return 0;
}

BOOL sub_22636B4C0(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  _BOOL8 v4;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 1))
  {
    if (!v3)
      sub_226370344();
    --v3;
    --*(_DWORD *)(a1 + 4);
    *(_DWORD *)(a1 + 8) = v3;
    *(_BYTE *)(a1 + 1) = 0;
  }
  *(_BYTE *)(a1 + 3) = 1;
  if (v3)
    v4 = 0;
  else
    v4 = *(_DWORD *)(a1 + 12) == 0;
  os_unfair_lock_unlock(v2);
  return v4;
}

uint64_t sub_22636B53C(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = *(unsigned __int8 *)(a1 + 2);
  if (*(_BYTE *)(a1 + 2))
    *(_BYTE *)(a1 + 2) = 0;
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_22636B584(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  int v5;
  int v6;
  int v7;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  if (*(_BYTE *)a1 || (v5 = *(_DWORD *)(a1 + 12), v5 == -1) || (v6 = *(_DWORD *)(a1 + 4)) == 0)
  {
    v3 = 0;
  }
  else
  {
    v7 = *(_DWORD *)(a1 + 8);
    if (!v7)
      sub_22637036C();
    *(_DWORD *)(a1 + 4) = v6 - 1;
    *(_DWORD *)(a1 + 8) = v7 - 1;
    *(_DWORD *)(a1 + 12) = v5 + 1;
    v3 = 1;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

BOOL sub_22636B600(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  uint32_t os_unfair_lock_opaque;
  uint32_t v4;
  _BOOL8 v5;

  v2 = a1 + 4;
  os_unfair_lock_lock(a1 + 4);
  os_unfair_lock_opaque = a1[3]._os_unfair_lock_opaque;
  v5 = (!os_unfair_lock_opaque || (v4 = os_unfair_lock_opaque - 1, (a1[3]._os_unfair_lock_opaque = v4) == 0))
    && !a1[2]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v5;
}

uint64_t sub_22636B65C(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;

  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  v3 = 1;
  if (!*(_BYTE *)a1)
  {
    *(_BYTE *)a1 = 1;
    v3 = 0;
  }
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_22636B6AC(uint64_t a1)
{
  unsigned __int8 v2;
  os_unfair_lock_s *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  os_unfair_lock_s *v14;
  int os_unfair_lock_opaque_low;
  void *v16;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)a1 + 32));
  v3 = *(os_unfair_lock_s **)a1;
  if ((v2 & 1) == 0)
  {
    v4 = sub_22636B584(*(_QWORD *)a1);
    v5 = *(void (***)(_QWORD, _QWORD))(a1 + 8);
    if (v4)
    {
      v5[2](v5, *(_QWORD *)a1 + 32);
      if (sub_22636B600(*(os_unfair_lock_s **)a1))
      {
        v6 = *(_QWORD *)a1;
        v7 = *(std::__shared_weak_count **)(*(_QWORD *)a1 + 48);
        if (v7)
        {
          v8 = std::__shared_weak_count::lock(v7);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)(v6 + 40);
            if (v10)
            {
              v11 = *(_QWORD *)(v10 + 32);
              if (v11)
                sub_22636CC18(v11);
            }
            p_shared_owners = (unint64_t *)&v9->__shared_owners_;
            do
              v13 = __ldaxr(p_shared_owners);
            while (__stlxr(v13 - 1, p_shared_owners));
            if (!v13)
            {
              ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
              std::__shared_weak_count::__release_weak(v9);
            }
          }
        }
      }
    }
    else
    {
      *(_QWORD *)(a1 + 8) = 0;

    }
    JUMPOUT(0x22769619CLL);
  }
  v14 = v3 + 4;
  os_unfair_lock_lock(v3 + 4);
  os_unfair_lock_opaque_low = LOBYTE(v3->_os_unfair_lock_opaque);
  os_unfair_lock_unlock(v14);
  if (os_unfair_lock_opaque_low)
  {
    v16 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
  else
  {
    dispatch_async_f(*(dispatch_queue_t *)(*(_QWORD *)a1 + 24), (void *)a1, (dispatch_function_t)sub_22636B6AC);
  }
}

void sub_22636B808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22634FAC8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_22636B81C(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id *v5;
  int v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  id v14;

  v14 = a2;
  v3 = sub_22636B2C8(a1);
  v4 = v14;
  if (!v3)
  {
    v5 = (id *)operator new();
    *v5 = (id)a1;
    v5[1] = (id)MEMORY[0x227696724](v14);
    v6 = sub_22636B32C(a1);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 24), v5, (dispatch_function_t)sub_22636B6AC);
    v4 = v14;
    if (v6)
    {
      v7 = *(std::__shared_weak_count **)(a1 + 48);
      if (v7)
      {
        v8 = std::__shared_weak_count::lock(v7);
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 40);
          if (v9)
          {
            v10 = *(_QWORD *)(v9 + 32);
            if (v10)
              sub_22636CC18(v10);
            goto LABEL_10;
          }
        }
      }
      else
      {
        v8 = 0;
      }
      v11 = v5[1];
      v5[1] = 0;

      MEMORY[0x22769619C](v5, 0xA0C40AFF93C70);
      if (!v8)
      {
LABEL_14:
        v4 = v14;
        goto LABEL_15;
      }
LABEL_10:
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v13 = __ldaxr(p_shared_owners);
      while (__stlxr(v13 - 1, p_shared_owners));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      goto LABEL_14;
    }
  }
LABEL_15:

}

void sub_22636B954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  sub_22634FAC8((uint64_t)&a11);

  _Unwind_Resume(a1);
}

void sub_22636B978(uint64_t a1, void *a2)
{
  sub_22636B020(*(_QWORD *)(a1 + 64), a2);
}

void sub_22636B980(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;

  if (!sub_22636B2C8(a1) && sub_22636B3C8(a1))
  {
    v2 = *(std::__shared_weak_count **)(a1 + 48);
    if (v2)
    {
      v3 = std::__shared_weak_count::lock(v2);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)(a1 + 40);
        if (v5)
        {
          v6 = *(_QWORD *)(v5 + 32);
          if (v6)
            sub_22636CC18(v6);
          p_shared_owners = (unint64_t *)&v4->__shared_owners_;
          do
            v8 = __ldaxr(p_shared_owners);
          while (__stlxr(v8 - 1, p_shared_owners));
        }
        else
        {
          v9 = (unint64_t *)&v3->__shared_owners_;
          do
            v8 = __ldaxr(v9);
          while (__stlxr(v8 - 1, v9));
        }
        if (!v8)
        {
          ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
          std::__shared_weak_count::__release_weak(v4);
        }
      }
    }
  }
}

void sub_22636BA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22634FAC8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_22636BA48(uint64_t a1)
{
  uint64_t result;

  result = sub_22636B2C8(a1);
  if (!(_DWORD)result)
    return sub_22636B468(a1);
  return result;
}

uint64_t sub_22636BA7C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  objc_msgSend__startingMajorFrame(*(void **)(a1 + 56), a2, a3, a4, a5);
  result = sub_22636B53C(a1);
  if ((_DWORD)result)
  {
    result = sub_22636B2C8(a1);
    if (!(_DWORD)result)
      return sub_22636B3C8(a1);
  }
  return result;
}

void sub_22636BAC8(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  NSObject *v14;
  std::__shared_weak_count *v15;
  std::__shared_weak_count *v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v22 = a2;
  v3 = sub_22636B2C8(a1);
  v4 = v22;
  if (!v3)
  {
    if (sub_22636B32C(a1))
    {
      v5 = *(std::__shared_weak_count **)(a1 + 48);
      if (v5)
      {
        v6 = std::__shared_weak_count::lock(v5);
        v27 = v6;
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)(a1 + 40);
          v26 = v8;
          if (v8)
          {
            v9 = *(_QWORD *)(v8 + 32);
            if (v9)
              sub_22636CC18(v9);
            v10 = *(NSObject **)(a1 + 24);
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = sub_22636BD24;
            block[3] = &unk_24EDC4570;
            v25 = a1;
            v24 = v22;
            dispatch_sync(v10, block);
            if (sub_22636B600((os_unfair_lock_s *)a1))
            {
              v11 = *(_QWORD *)(v8 + 32);
              if (v11)
                sub_22636CC18(v11);
            }

          }
          p_shared_owners = (unint64_t *)&v7->__shared_owners_;
          do
            v13 = __ldaxr(p_shared_owners);
          while (__stlxr(v13 - 1, p_shared_owners));
          if (!v13)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
    }
    else
    {
      v14 = *(NSObject **)(a1 + 24);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_22636BCF0;
      v28[3] = &unk_24EDC4570;
      v30 = a1;
      v29 = v22;
      dispatch_sync(v14, v28);
      if (sub_22636B600((os_unfair_lock_s *)a1))
      {
        v15 = *(std::__shared_weak_count **)(a1 + 48);
        if (v15)
        {
          v16 = std::__shared_weak_count::lock(v15);
          v27 = v16;
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)(a1 + 40);
            v26 = v18;
            if (v18)
            {
              v19 = *(_QWORD *)(v18 + 32);
              if (v19)
                sub_22636CC18(v19);
            }
            v20 = (unint64_t *)&v17->__shared_owners_;
            do
              v21 = __ldaxr(v20);
            while (__stlxr(v21 - 1, v20));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
              std::__shared_weak_count::__release_weak(v17);
            }
          }
        }
      }

    }
    v4 = v22;
  }

}

void sub_22636BCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  sub_22634FAC8((uint64_t)&a17);

  _Unwind_Resume(a1);
}

uint64_t sub_22636BCF0(uint64_t a1)
{
  sub_22636B584(*(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_22636BD24(uint64_t a1)
{
  sub_22636B584(*(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_22636BD58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 56) = a2;
  return result;
}

void sub_22636BD60(uint64_t a1, void *a2)
{
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 64) + 8), a2);
}

void sub_22636BD6C(uint64_t a1, char a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = v5;
  if (*(_BYTE *)(a1 + 33))
    __assert_rtn("makeActive", "XRFrameScheduler_Private.mm", 506, "!_activated");
  atomic_store(0, (unsigned __int8 *)(a1 + 32));
  dispatch_group_enter(v5);
  v7 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_22636BE50;
  v9[3] = &unk_24EDC4598;
  v12 = a2;
  v10 = v6;
  v11 = a1;
  v8 = v6;
  sub_22636B0A8(v7, v9);
  *(_BYTE *)(a1 + 33) = 1;

}

void sub_22636BE40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22636BE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 40);
  sub_22636BE88(v6, (const char *)*(unsigned __int8 *)(a1 + 48), a3, a4, a5);
  dispatch_resume(*(dispatch_object_t *)(v6 + 24));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_22636BE88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__shared_weak_count *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;

  objc_msgSend__acquiredMinorFrame_(*(void **)(a1 + 56), a2, (uint64_t)a2, a4, a5);
  if (sub_22636B4C0(a1))
  {
    v6 = *(std::__shared_weak_count **)(a1 + 48);
    if (v6)
    {
      v7 = std::__shared_weak_count::lock(v6);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)(a1 + 40);
        if (v9)
        {
          v10 = *(_QWORD *)(v9 + 32);
          if (v10)
            sub_22636CC18(v10);
        }
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v12 = __ldaxr(p_shared_owners);
        while (__stlxr(v12 - 1, p_shared_owners));
        if (!v12)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
  }
}

void sub_22636BF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_22634FAC8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_22636BF38(uint64_t a1, char a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  if (!*(_BYTE *)(a1 + 33))
    __assert_rtn("makeInactive", "XRFrameScheduler_Private.mm", 518, "_activated");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  *(_BYTE *)(a1 + 3) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  dispatch_group_enter(v5);
  v6 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22636C034;
  block[3] = &unk_24EDC4598;
  v11 = a2;
  v9 = v5;
  v10 = a1;
  v7 = v5;
  dispatch_barrier_async(v6, block);
  atomic_store(1u, (unsigned __int8 *)(a1 + 32));
  *(_BYTE *)(a1 + 33) = 0;

}

void sub_22636C024(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22636C034(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 40);
  dispatch_suspend(*(dispatch_object_t *)(v2 + 24));
  objc_msgSend__yieldingMinorFrame_(*(void **)(v2 + 56), v3, *(unsigned __int8 *)(a1 + 48), v4, v5);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(v2 + 64) + 8));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_QWORD *sub_22636C078(uint64_t a1, uint64_t *a2)
{
  return sub_226363FE8((_QWORD *)(a1 + 64), a2);
}

void sub_22636C080(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t v8;

  if (!sub_22636B65C(a1))
  {
    v2 = dispatch_group_create();
    dispatch_resume(*(dispatch_object_t *)(a1 + 24));
    dispatch_group_enter(v2);
    v3 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_22636C144;
    v6[3] = &unk_24EDC45C0;
    v7 = v2;
    v8 = a1;
    v4 = v2;
    dispatch_barrier_async(v3, v6);
    sub_22636B154(*(_QWORD *)(a1 + 64), v4);
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
}

void sub_22636C144(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend__shutdown(*(void **)(*(_QWORD *)(a1 + 40) + 56), a2, a3, a4, a5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_22636C170(uint64_t a1, _QWORD *a2, char a3, int a4, dispatch_qos_class_t qos_class)
{
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  _QWORD *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v19;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 34) = a3;
  *(_QWORD *)(a1 + 40) = *a2;
  v7 = a2[1];
  *(_QWORD *)(a1 + 48) = v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 16);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  *(_QWORD *)(a1 + 64) = 0;
  if (a4 == 1)
    v10 = MEMORY[0x24BDAC9C0];
  else
    v10 = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  dispatch_queue_attr_make_with_qos_class(v10, qos_class, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.dt.frame.activity", v11);
  v13 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v12;

  dispatch_suspend(*(dispatch_object_t *)(a1 + 24));
  v14 = operator new(0x28uLL);
  v14[1] = 0;
  v14[2] = 0;
  *v14 = &off_24EDC2990;
  *(_QWORD *)&v19 = sub_22636B1FC((uint64_t)(v14 + 3), a4);
  *((_QWORD *)&v19 + 1) = v14;
  sub_22634F31C(a1 + 64, &v19);
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
  if (*((_QWORD *)&v19 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return a1;
}

void sub_22636C2B0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  std::__shared_weak_count *v5;

  sub_22634FAC8(v3);
  v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);

  _Unwind_Resume(a1);
}

uint64_t sub_22636C2E0(uint64_t a1)
{
  std::__shared_weak_count *v2;

  sub_22636C080(a1);
  sub_22634FAC8(a1 + 64);
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);

  return a1;
}

uint64_t sub_22636C324(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    while (!sub_22636B268(*v2))
    {
      v2 += 2;
      if (v2 == v3)
      {
        v2 = v3;
        break;
      }
    }
    if (v2 != a1[1])
      return *v2;
    v2 = a1[1];
  }
  v5 = a1[3];
  if (v5 == v2)
    return 0;
  v6 = *v5;
  if (*(_BYTE *)(v6 + 34))
    return v6;
  else
    return 0;
}

uint64_t sub_22636C3AC(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  BOOL v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 == v3)
  {
    v5 = a1 + 3;
    v4 = a1[3];
    if (v4 == v2)
      goto LABEL_17;
  }
  else
  {
    while (!sub_22636B268(*v2))
    {
      v2 += 2;
      if (v2 == v3)
      {
        v2 = v3;
        break;
      }
    }
    v6 = a1[3];
    v5 = a1 + 3;
    v4 = v6;
    v7 = *(v5 - 2);
    if (v2 != v7)
    {
      v8 = *v2;
      if (v4 != v7)
      {
        v9 = v8 != *v4;
        v10 = *(unsigned __int8 *)(*v4 + 33);
        v11 = v10 == 0;
        v12 = v10 != 0;
        LOBYTE(v13) = v11 && v8 != *v4;
        v14 = 1;
        goto LABEL_13;
      }
      v12 = 0;
      v13 = v8 != 0;
      v15 = 1;
      v14 = 1;
      v9 = v13;
LABEL_19:
      v16 = 1;
      goto LABEL_20;
    }
    if (v4 == v7)
    {
LABEL_17:
      LOBYTE(v13) = 0;
      v14 = 0;
      v9 = 0;
      v12 = 0;
      v15 = 1;
      goto LABEL_19;
    }
  }
  LOBYTE(v13) = 0;
  v14 = 0;
  v9 = *v4 != 0;
  v12 = *(unsigned __int8 *)(*v4 + 33) != 0;
LABEL_13:
  v15 = 0;
  if (*(_BYTE *)(*v4 + 34))
    v16 = 1;
  else
    v16 = v14;
LABEL_20:
  v17 = v16 & ((v15 | v14 & v9) ^ 1);
  v18 = v17 & !v12;
  if (v13 || v18)
  {
    if ((v18 & 1) == 0)
    {
      if (v12)
        sub_2263703BC();
      *v5 = v2;
      v4 = v2;
    }
    if (*(_BYTE *)(*v4 + 33))
      sub_226370394();
    return 3;
  }
  else if ((v14 & v9 & v12) == 1)
  {
    if (!*(_BYTE *)(*v4 + 33))
      sub_2263703E4();
    return 1;
  }
  else if ((v12 & v17) == 1)
  {
    if (!*(_BYTE *)(*v4 + 33))
      sub_22637040C();
    return 2;
  }
  else if (((v16 | !v12) & 1) != 0)
  {
    if (v14)
      sub_226370434();
    if (v12)
      sub_22637045C();
    return 0;
  }
  else
  {
    if (!*(_BYTE *)(*v4 + 33))
      sub_226370484();
    return 4;
  }
}

void sub_22636C580(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t *v6;
  id v7;

  v5 = a3;
  v6 = *(uint64_t **)(a1 + 24);
  v7 = v5;
  if (v6 == *(uint64_t **)(a1 + 8))
    __assert_rtn("activateSelectedManager", "XRFrameScheduler_Private.mm", 713, "_nextReadyManager != _activityManagers.end()");
  sub_22636BD6C(*v6, a2, v5);

}

void sub_22636C5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22636C610(uint64_t a1, char a2, void *a3)
{
  uint64_t *v5;
  id v6;

  v6 = a3;
  v5 = *(uint64_t **)(a1 + 24);
  if (v5 != *(uint64_t **)(a1 + 8) && *(_BYTE *)(*v5 + 33))
    sub_22636BF38(*v5, a2, v6);

}

void sub_22636C66C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_22636C680(char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v12 = (v7 - *a1) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      sub_22636E06C();
    v14 = v5 - (_QWORD)*a1;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v31 = result;
    v16 = (char *)sub_22636E0F4(result, v15);
    v18 = &v16[16 * v12];
    v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }
    else
    {
      v24 = &v16[16 * v12];
      do
      {
        v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
      }
      while (v22 != v23);
      v26 = *(int64x2_t *)a1;
    }
    v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    v28 = v26.i64[0];
    result = sub_22636E128((uint64_t)&v28);
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)a2;
    v8 = *((_QWORD *)a2 + 1);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = v7 + 16;
  }
  a1[1] = v11;
  return result;
}

uint64_t sub_22636C7C0(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(uint64_t **)result;
  v3 = *(uint64_t **)(result + 8);
  if (*(uint64_t **)result != v3)
  {
    do
    {
      result = sub_22636B268(*v2);
      if ((_DWORD)result)
        result = objc_msgSend__underrunMinorFrame_(*(void **)(*v2 + 56), v5, a2, v6, v7);
      v2 += 2;
    }
    while (v2 != v3);
  }
  return result;
}

uint64_t sub_22636C818(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(uint64_t **)(a3 + 24);
  if (v5 == *(uint64_t **)(a3 + 8))
  {
    v10 = *(_QWORD *)(result + 8);
    v11 = *(_QWORD *)(result + 24);
    if (v11 != v10 && *(_BYTE *)(*(_QWORD *)v11 + 33))
      sub_2263704AC();
    *(_QWORD *)(result + 24) = v10;
  }
  else
  {
    v6 = *(uint64_t **)result;
    v7 = *(uint64_t **)(result + 8);
    if (*(uint64_t **)result != v7)
    {
      v8 = *v5;
      while (*v6 != v8)
      {
        v6 += 2;
        if (v6 == v7)
        {
          v6 = *(uint64_t **)(result + 8);
          break;
        }
      }
    }
    *(_QWORD *)(result + 24) = v6;
    if (v6 == v7)
      sub_2263704D4();
    v9 = *v6;
    if (!*(_BYTE *)(v9 + 34))
      sub_2263704FC();
    return MEMORY[0x24BEDD108](*(_QWORD *)(v9 + 56), sel__extendingMinorFrame_, a2, a4, a5);
  }
  return result;
}

void sub_22636C8B8(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t **v8;
  int v9;
  dispatch_group_t v10;
  NSObject *v11;
  _QWORD block[4];
  NSObject *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 8);
  if (a2 < (unint64_t)((*(_QWORD *)(a1 + 16) - v6) >> 5))
  {
    v7 = v5;
    v8 = (uint64_t **)(v6 + 32 * a2);
    v9 = sub_22636C3AC(v8);
    switch(v9)
    {
      case 1:
        goto LABEL_5;
      case 3:
        sub_22636C580((uint64_t)v8, a2, v7);
        break;
      case 4:
LABEL_5:
        dispatch_group_enter(v7);
        v10 = dispatch_group_create();
        sub_22636C610((uint64_t)v8, a2, v10);
        dispatch_get_global_queue(33, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = sub_22636C9F8;
        block[3] = &unk_24EDC4598;
        v14 = a1;
        v15 = a2;
        v13 = v7;
        dispatch_group_notify(v10, v11, block);

        break;
    }

    return;
  }
  __break(1u);
}

void sub_22636C9DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22636C9F8(uint64_t a1)
{
  sub_22636C8B8(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_22636CA28(uint64_t a1, char a2, unsigned int a3, void *a4)
{
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[6];
  char v13;
  char v14;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 8);
  if (a3 >= (unint64_t)((*(_QWORD *)(a1 + 16) - v8) >> 5))
  {
    __break(1u);
  }
  else
  {
    v9 = v7;
    v10 = v8 + 32 * a3;
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22636CAEC;
    block[3] = &unk_24EDC45E0;
    block[4] = a1;
    block[5] = v10;
    v13 = a3;
    v14 = a2;
    dispatch_group_async(v9, v11, block);

  }
}

uint64_t sub_22636CAEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;

  v5 = *(unsigned __int8 *)(result + 49);
  v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (v5 < (*(_QWORD *)(*(_QWORD *)(result + 32) + 16) - v6) >> 5)
    return sub_22636C818(*(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 48), v6 + 32 * v5, a4, a5);
  __break(1u);
  return result;
}

void sub_22636CB18(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 8);
  if (a2 >= (unint64_t)((*(_QWORD *)(a1 + 16) - v6) >> 5))
  {
    __break(1u);
  }
  else
  {
    v7 = v5;
    sub_22636C610(v6 + 32 * a2, a2, v5);

  }
}

void sub_22636CB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22636CB88(uint64_t a1)
{
  uint64_t **v1;
  uint64_t **v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;

  v1 = *(uint64_t ***)(a1 + 8);
  v2 = *(uint64_t ***)(a1 + 16);
  while (v1 != v2)
  {
    v3 = *v1;
    v4 = v1[1];
    while (v3 != v4)
    {
      v5 = *v3;
      v3 += 2;
      sub_22636C080(v5);
    }
    v1 += 4;
  }
}

uint64_t sub_22636CBD4(uint64_t result, __int128 *a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result + 8);
  if (a3 >= (unint64_t)((*(_QWORD *)(result + 16) - v3) >> 5))
  {
    __break(1u);
  }
  else
  {
    v4 = v3 + 32 * a3;
    result = sub_22636C680((char **)v4, a2);
    *(_QWORD *)(v4 + 24) = *(_QWORD *)(v4 + 8);
  }
  return result;
}

uint64_t sub_22636CC18(uint64_t a1)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if ((*(_DWORD *)(a1 + 120) - 1) <= 1)
    *(_DWORD *)(a1 + 120) = 3;
  pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
  return pthread_mutex_unlock(v2);
}

BOOL sub_22636CC68(_BOOL8 result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  v3 = *(_QWORD *)(result + 8);
  v4 = (*(_QWORD *)(result + 16) - v3) >> 5;
  if (v4 > a2)
  {
    v5 = v3 + 32 * a2;
    v6 = *(uint64_t **)(v5 + 8);
    v7 = *(uint64_t **)(v5 + 24);
    if (v7 == v6)
      return 0;
    v8 = *v7;
    if (!*v7 || !*(_BYTE *)(v8 + 34))
      return 0;
    if (v4 > a3)
      return v8 == sub_22636C324((uint64_t **)(v3 + 32 * a3));
  }
  __break(1u);
  return result;
}

uint64_t sub_22636CCE4(uint64_t result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t **v5;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;

  v5 = *(uint64_t ***)(result + 8);
  v6 = *(uint64_t ***)(result + 16);
  while (v5 != v6)
  {
    v7 = *v5;
    v8 = v5[1];
    while (v7 != v8)
    {
      v9 = *v7;
      v7 += 2;
      result = sub_22636BA7C(v9, a2, a3, a4, a5);
    }
    v5 += 4;
  }
  return result;
}

uint64_t sub_22636CD30(uint64_t a1)
{
  uint64_t **v1;
  uint64_t **v2;
  uint64_t v3;

  v1 = *(uint64_t ***)(a1 + 8);
  v2 = *(uint64_t ***)(a1 + 16);
  while (1)
  {
    if (v1 == v2)
      return 1;
    v3 = sub_22636C324(v1);
    if (v3)
    {
      if (sub_22636B268(v3))
        break;
    }
    v1 += 4;
  }
  return 0;
}

unint64_t *sub_22636CD7C(unint64_t *a1, unsigned int a2)
{
  unint64_t v3;
  _OWORD v5[2];
  void **v6;

  do
    v3 = __ldaxr(&qword_25583C5A8);
  while (__stlxr(v3 + 1, &qword_25583C5A8));
  *a1 = v3;
  memset(v5, 0, sizeof(v5));
  sub_22636E174(a1 + 1, a2, (uint64_t)v5);
  v6 = (void **)v5;
  sub_22634FA58(&v6);
  a1[4] = 0;
  return a1;
}

void sub_22636CDEC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = v1;
  sub_22634FA58((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t sub_22636CE08(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v10;
  unint64_t v11;
  char v12;
  char v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  timeval v21;

  result = gettimeofday(&v21, 0);
  v3 = 1000000000 * v21.tv_sec + 1000 * v21.tv_usec;
  v4 = 1000000000 * *(_QWORD *)(a1 + 160) + 1000 * *(int *)(a1 + 168);
  v5 = *(_QWORD *)(a1 + 144) + *(_QWORD *)(a1 + 128);
  if (v3 < v4)
  {
    v6 = 0;
    do
    {
      v7 = v4 - v5;
      v8 = v6 + 1;
      if (v3 >= v4 - v5)
        break;
      v4 -= v5;
    }
    while (v6++ < 4);
    if (v8 == 5)
      v4 = v3 - v5;
    else
      v4 = v7;
  }
  v10 = v3 - v4;
  v11 = (v3 - v4) % v5;
  if (*(unsigned __int8 *)(a1 + 124) <= (v11 / 0x3E8 / *(int *)(a1 + 152)))
    v12 = 0;
  else
    v12 = v11 / 0x3E8 / *(int *)(a1 + 152);
  if (v5 <= v10)
    v13 = *(_BYTE *)(a1 + 124);
  else
    v13 = 0;
  v14 = v12 + v13;
  v15 = *(_BYTE *)(a1 + 176) + 1;
LABEL_16:
  if (v15 >= v14)
  {
    v20 = v10 - v11 + v4;
    *(_QWORD *)(a1 + 160) = v20 / 0x3B9ACA00;
    *(_DWORD *)(a1 + 168) = v20 % 0x3B9ACA00 / 0x3E8;
    *(_BYTE *)(a1 + 176) = v12;
    ++*(_QWORD *)(a1 + 272);
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 184);
    v17 = *(_QWORD *)(a1 + 192);
    while (1)
    {
      if (v16 == v17)
      {
        ++v15;
        goto LABEL_16;
      }
      v18 = v15 % *(unsigned __int8 *)(a1 + 124);
      v19 = *(_QWORD *)(*(_QWORD *)v16 + 8);
      if (v18 >= (*(_QWORD *)(*(_QWORD *)v16 + 16) - v19) >> 5)
        break;
      result = sub_22636C7C0(v19 + 32 * v18, v18);
      v16 += 16;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22636CFB4(uint64_t a1, _QWORD *a2)
{
  pthread_mutex_t *v4;

  if (!*a2)
    sub_226370524();
  v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  sub_22636D048((char **)(a1 + 232), (uint64_t)a2);
  while (*(_QWORD *)(a1 + 232) != *(_QWORD *)(a1 + 240))
  {
    if (!*(_DWORD *)(a1 + 120))
      break;
    *(_DWORD *)(a1 + 120) = 3;
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v4);
  }
  return pthread_mutex_unlock(v4);
}

uint64_t sub_22636D048(char **a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  int64x2_t v20;
  char *v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60)
      sub_22636E06C();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v25 = result;
    v13 = (char *)sub_22636E0F4(result, v12);
    v15 = &v13[16 * v9];
    *(_OWORD *)v15 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v20 = vdupq_n_s64((unint64_t)v16);
      v18 = &v13[16 * v9];
    }
    else
    {
      v18 = &v13[16 * v9];
      do
      {
        v19 = *((_OWORD *)v16 - 1);
        v16 -= 16;
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 16;
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
      }
      while (v16 != v17);
      v20 = *(int64x2_t *)a1;
    }
    v8 = v15 + 16;
    *a1 = v18;
    a1[1] = v15 + 16;
    v23 = v20;
    v21 = a1[2];
    a1[2] = &v13[16 * v14];
    v24 = v21;
    v22 = v20.i64[0];
    result = sub_22636E128((uint64_t)&v22);
  }
  else
  {
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v8 = v7 + 16;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  a1[1] = v8;
  return result;
}

uint64_t sub_22636D150(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t v7;

  v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  v5 = *(__int128 **)(a1 + 184);
  v6 = *(__int128 **)(a1 + 192);
  if (v5 != v6)
  {
    while (**(_QWORD **)v5 != a2)
    {
      if (++v5 == v6)
        goto LABEL_7;
    }
  }
  if (v5 == v6)
  {
LABEL_7:
    v7 = 0;
  }
  else
  {
    sub_22636C680((char **)(a1 + 208), v5);
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    v7 = 1;
  }
  while (*(_QWORD *)(a1 + 208) != *(_QWORD *)(a1 + 216))
  {
    if (!*(_DWORD *)(a1 + 120))
      break;
    *(_DWORD *)(a1 + 120) = 3;
    pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v4);
  }
  pthread_mutex_unlock(v4);
  return v7;
}

void sub_22636D230(uint64_t a1, unsigned int a2)
{
  uint64_t *v4;
  uint64_t *v5;
  pthread_mutex_t *v6;
  NSObject *group;

  group = dispatch_group_create();
  v4 = *(uint64_t **)(a1 + 184);
  v5 = *(uint64_t **)(a1 + 192);
  while (v4 != v5)
  {
    sub_22636CB18(*v4, a2, group);
    v4 += 2;
  }
  v6 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_unlock(v6);
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  pthread_mutex_lock(v6);

}

void sub_22636D2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22636D2C8(uint64_t a1)
{
  int v2;
  uint64_t *v3;
  uint64_t *v4;

  if (*(_DWORD *)(a1 + 120) == 1)
  {
    if (*(_BYTE *)(a1 + 124))
    {
      v2 = 0;
      while (*(_DWORD *)(a1 + 120) == 1)
      {
        sub_22636D230(a1, v2++);
        if (*(unsigned __int8 *)(a1 + 124) <= v2)
        {
          if (*(_DWORD *)(a1 + 120) != 1)
            return;
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      v3 = *(uint64_t **)(a1 + 184);
      v4 = *(uint64_t **)(a1 + 192);
      while (v3 != v4)
      {
        if ((sub_22636CD30(*v3) & 1) == 0)
          return;
        v3 += 2;
      }
      *(_DWORD *)(a1 + 120) = 2;
      pthread_cond_broadcast((pthread_cond_t *)(a1 + 8));
    }
  }
}

uint64_t sub_22636D374(uint64_t a1)
{
  uint64_t j;
  int v3;
  pthread_cond_t *v4;
  int v5;
  __int128 *v7;
  __int128 *v8;
  uint64_t i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  __darwin_time_t v15;
  __darwin_suseconds_t v16;
  dispatch_group_t v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  int v21;
  uint64_t *v22;
  uint64_t *v23;
  BOOL v24;
  NSObject *v25;
  os_signpost_id_t v26;
  os_signpost_id_t v27;
  dispatch_group_t v28;
  _BOOL8 *v29;
  _BOOL8 *v30;
  _BOOL4 v31;
  uint64_t v32;
  unsigned int v33;
  dispatch_time_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  uint64_t *v41;
  uint64_t *v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  __int128 *v49;
  __int128 *v50;
  uint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *p_shared_owners;
  unint64_t v54;
  __int128 *k;
  unint64_t *v56;
  unint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v61;
  dispatch_time_t when;
  void *context;
  pthread_cond_t *v64;
  timespec v65;
  timeval buf;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  pthread_setname_np("Commutator");
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  gettimeofday((timeval *)(a1 + 160), 0);
  *(_BYTE *)(a1 + 176) = 0;
  sub_22636AF60();
  j = objc_claimAutoreleasedReturnValue();
  v61 = (void *)j;
  v3 = *(_DWORD *)(a1 + 120);
  if (v3)
  {
    v4 = (pthread_cond_t *)(a1 + 8);
    v64 = (pthread_cond_t *)(a1 + 8);
    while (1)
    {
      if (v3 == 2)
      {
        do
          j = pthread_cond_wait(v4, (pthread_mutex_t *)(a1 + 56));
        while (*(_DWORD *)(a1 + 120) == 2);
        *(_BYTE *)(a1 + 256) = 1;
      }
      context = (void *)MEMORY[0x22769655C](j);
      v5 = *(_DWORD *)(a1 + 120);
      if (v5 == 4 || v5 == 1)
      {
        v8 = *(__int128 **)(a1 + 232);
        v7 = *(__int128 **)(a1 + 240);
        if (v8 != v7)
        {
          do
          {
            *(_QWORD *)(*(_QWORD *)v8 + 32) = a1;
            sub_22636C680((char **)(a1 + 184), v8++);
          }
          while (v8 != v7);
          v10 = *(_QWORD *)(a1 + 232);
          for (i = *(_QWORD *)(a1 + 240); i != v10; i = sub_22634FAC8(i - 16))
            ;
          *(_QWORD *)(a1 + 240) = v10;
          pthread_cond_broadcast(v64);
        }
        if (*(_BYTE *)(a1 + 256))
        {
          sub_22636D230(a1, *(unsigned __int8 *)(a1 + 176));
          sub_22636CE08(a1);
          *(_BYTE *)(a1 + 256) = 0;
        }
        v12 = *(_QWORD *)(a1 + 128);
        v11 = *(_QWORD *)(a1 + 136);
        if (v12 != v11 && (v11 > v12 || v11 < v12 && !*(_BYTE *)(a1 + 176)))
        {
          *(_QWORD *)(a1 + 128) = v11;
          v13 = v11 / *(unsigned __int8 *)(a1 + 124) / 0x3E8;
          *(_DWORD *)(a1 + 152) = v13;
          if ((int)v13 <= 0)
            __assert_rtn("_main", "XRFrameScheduler_Private.mm", 1142, "_minorFramePeriodInMicroseconds > 0");
          *(_QWORD *)(a1 + 144) = 0;
          *(_QWORD *)(a1 + 520) = 0;
          *(_QWORD *)(a1 + 528) = 0;
        }
        v14 = *(_DWORD *)(a1 + 168) + *(_DWORD *)(a1 + 152) + *(_DWORD *)(a1 + 152) * *(unsigned __int8 *)(a1 + 176);
        if (v14 <= 999999)
          v15 = *(_QWORD *)(a1 + 160);
        else
          v15 = *(_QWORD *)(a1 + 160) + 1;
        if (v14 <= 999999)
          v16 = *(_DWORD *)(a1 + 168) + *(_DWORD *)(a1 + 152) + *(_DWORD *)(a1 + 152) * *(unsigned __int8 *)(a1 + 176);
        else
          v16 = v14 - 1000000;
        v65.tv_sec = v15;
        v65.tv_nsec = 1000 * v16;
        when = dispatch_time(0, 0);
        v17 = dispatch_group_create();
        v18 = v61;
        v19 = os_signpost_id_make_with_pointer(v18, (const void *)a1);
        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v20 = v19;
          if (os_signpost_enabled(v18))
          {
            v21 = *(unsigned __int8 *)(a1 + 176);
            LODWORD(buf.tv_sec) = 67109120;
            HIDWORD(buf.tv_sec) = v21;
            _os_signpost_emit_with_name_impl(&dword_22634C000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "Minor Frame", "Started Frame %d", (uint8_t *)&buf, 8u);
          }
        }

        while (2)
        {
          if (*(_DWORD *)(a1 + 120) == 3)
            *(_DWORD *)(a1 + 120) = 1;
          v22 = *(uint64_t **)(a1 + 184);
          v23 = *(uint64_t **)(a1 + 192);
          while (v22 != v23)
          {
            sub_22636C8B8(*v22, *(unsigned __int8 *)(a1 + 176), v17);
            v22 += 2;
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));
          dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
          switch(*(_DWORD *)(a1 + 120))
          {
            case 0:
            case 2:
              abort();
            case 1:
              if (pthread_cond_timedwait(v64, (pthread_mutex_t *)(a1 + 56), &v65) == 60)
                goto LABEL_46;
              continue;
            case 3:
              gettimeofday(&buf, 0);
              v24 = buf.tv_sec < v15;
              if (buf.tv_sec == v15)
                v24 = buf.tv_usec < v16;
              if (v24)
                continue;
LABEL_46:
              v25 = v18;
              v26 = os_signpost_id_make_with_pointer(v25, (const void *)a1);
              if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v27 = v26;
                if (os_signpost_enabled(v25))
                {
                  LOWORD(buf.tv_sec) = 0;
                  _os_signpost_emit_with_name_impl(&dword_22634C000, v25, OS_SIGNPOST_INTERVAL_END, v27, "Minor Frame", "End", (uint8_t *)&buf, 2u);
                }
              }

              v28 = dispatch_group_create();
              v29 = *(_BOOL8 **)(a1 + 184);
              v30 = *(_BOOL8 **)(a1 + 192);
              while (v29 != v30)
              {
                v31 = sub_22636CC68(*v29, *(unsigned __int8 *)(a1 + 176), (*(unsigned __int8 *)(a1 + 176) + 1) % *(unsigned __int8 *)(a1 + 124));
                v32 = *v29;
                v33 = *(unsigned __int8 *)(a1 + 176);
                if (v31)
                  sub_22636CA28(v32, v33, (v33 + 1) % *(unsigned __int8 *)(a1 + 124), v28);
                else
                  sub_22636CB18(v32, v33, v28);
                v29 += 2;
              }
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));
              dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
              pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));

LABEL_56:
              v34 = dispatch_time(0, 0);
              if (dispatch_time(when, 2000 * *(int *)(a1 + 152)) < v34)
              {
                *(_BYTE *)(a1 + 256) = 1;
                sub_22636D230(a1, *(unsigned __int8 *)(a1 + 176));
                goto LABEL_75;
              }
              if (*(_BYTE *)(a1 + 256))
                goto LABEL_75;
              if (*(_DWORD *)(a1 + 120) == 4
                || *(_QWORD *)(a1 + 208) != *(_QWORD *)(a1 + 216)
                || *(_QWORD *)(a1 + 232) != *(_QWORD *)(a1 + 240))
              {
                sub_22636D230(a1, *(unsigned __int8 *)(a1 + 176));
              }
              v39 = (*(unsigned __int8 *)(a1 + 176) + 1) % *(unsigned __int8 *)(a1 + 124);
              *(_BYTE *)(a1 + 176) = v39;
              if (v39)
                goto LABEL_75;
              v40 = *(_DWORD *)(a1 + 168) + (*(_QWORD *)(a1 + 144) + *(_QWORD *)(a1 + 128)) / 0x3E8uLL;
              *(_DWORD *)(a1 + 168) = v40;
              if (v40 > 999999)
              {
                ++*(_QWORD *)(a1 + 160);
                *(_DWORD *)(a1 + 168) = v40 - 1000000;
              }
              ++*(_QWORD *)(a1 + 264);
              v41 = *(uint64_t **)(a1 + 184);
              v42 = *(uint64_t **)(a1 + 192);
              if (v41 == v42)
                goto LABEL_74;
              v43 = 1;
              break;
            case 4:
              goto LABEL_56;
            default:
              continue;
          }
          break;
        }
        do
        {
          while (1)
          {
            sub_22636CCE4(*v41, v35, v36, v37, v38);
            if ((v43 & 1) != 0)
              break;
            v43 = 0;
            v41 += 2;
            if (v41 == v42)
              goto LABEL_75;
          }
          v44 = *v41;
          v41 += 2;
          v45 = sub_22636CD30(v44);
          v43 = v45;
        }
        while (v41 != v42);
        if ((v45 & 1) != 0)
LABEL_74:
          sub_22636D2C8(a1);
LABEL_75:

      }
      objc_autoreleasePoolPop(context);
      v3 = *(_DWORD *)(a1 + 120);
      if (v3 == 3)
        break;
      if (v3 == 4)
      {
        sub_22636E384((uint64_t *)(a1 + 208), *(_QWORD *)(a1 + 216), *(uint64_t **)(a1 + 184), *(uint64_t **)(a1 + 192), (uint64_t)(*(_QWORD *)(a1 + 192) - *(_QWORD *)(a1 + 184)) >> 4);
        v46 = *(_QWORD *)(a1 + 184);
        for (j = *(_QWORD *)(a1 + 192); j != v46; j = sub_22634FAC8(j - 16))
          ;
        v3 = 0;
        *(_QWORD *)(a1 + 192) = v46;
        goto LABEL_83;
      }
LABEL_84:
      v47 = *(uint64_t **)(a1 + 208);
      v48 = *(uint64_t **)(a1 + 216);
      if (v47 != v48)
      {
        do
        {
          v50 = *(__int128 **)(a1 + 184);
          v49 = *(__int128 **)(a1 + 192);
          v51 = *v47;
          v52 = (std::__shared_weak_count *)v47[1];
          if (v52)
          {
            p_shared_owners = (unint64_t *)&v52->__shared_owners_;
            do
              v54 = __ldxr(p_shared_owners);
            while (__stxr(v54 + 1, p_shared_owners));
          }
          if (v50 != v49)
          {
            while (*(_QWORD *)v50 != v51)
            {
              if (++v50 == v49)
              {
                v50 = v49;
                goto LABEL_98;
              }
            }
            if (v50 != v49)
            {
              for (k = v50 + 1; k != v49; ++k)
              {
                if (*(_QWORD *)k != v51)
                  sub_22634F31C((uint64_t)v50++, k);
              }
            }
          }
LABEL_98:
          if (v52)
          {
            v56 = (unint64_t *)&v52->__shared_owners_;
            do
              v57 = __ldaxr(v56);
            while (__stlxr(v57 - 1, v56));
            if (!v57)
            {
              ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
              std::__shared_weak_count::__release_weak(v52);
            }
          }
          sub_22636CB88(*v47);
          sub_22636DB50(a1 + 184, (unint64_t)v50, *(_QWORD *)(a1 + 192));
          v47 += 2;
        }
        while (v47 != v48);
        v59 = *(_QWORD *)(a1 + 208);
        for (m = *(_QWORD *)(a1 + 216); m != v59; m = sub_22634FAC8(m - 16))
          ;
        *(_QWORD *)(a1 + 216) = v59;
        j = pthread_cond_broadcast(v64);
        v3 = *(_DWORD *)(a1 + 120);
      }
      v4 = (pthread_cond_t *)(a1 + 8);
      if (!v3)
        goto LABEL_109;
    }
    v3 = 1;
LABEL_83:
    *(_DWORD *)(a1 + 120) = v3;
    goto LABEL_84;
  }
LABEL_109:
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 8));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));

  return 0;
}

void sub_22636DAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

unint64_t sub_22636DB50(unint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 < a2)
  {
    __break(1u);
  }
  else
  {
    if (a2 != a3)
    {
      v4 = result;
      v5 = a3;
      v6 = *(_QWORD *)(v4 + 8);
      if (a3 == v6)
      {
        v8 = a2;
      }
      else
      {
        v7 = 16 * ((uint64_t)(a3 - a2) >> 4);
        v8 = a2;
        do
        {
          sub_22634F31C(v8, (__int128 *)(v8 + v7));
          v8 += 16;
        }
        while (v8 + v7 != v6);
        v5 = *(_QWORD *)(v4 + 8);
      }
      while (v5 != v8)
        v5 = sub_22634FAC8(v5 - 16);
      *(_QWORD *)(v4 + 8) = v8;
    }
    return a2;
  }
  return result;
}

uint64_t sub_22636DBF4(uint64_t a1)
{
  sub_22636D374(a1);
  return 0;
}

uint64_t sub_22636DC0C(uint64_t a1)
{
  pthread_mutex_t *v2;
  sched_param v4;
  pthread_attr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  while (*(_DWORD *)(a1 + 120))
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v2);
  *(_DWORD *)(a1 + 120) = 3;
  pthread_attr_init(&v5);
  pthread_attr_setschedpolicy(&v5, 2);
  pthread_attr_getschedparam(&v5, &v4);
  v4.sched_priority = 50;
  pthread_attr_setschedparam(&v5, &v4);
  pthread_create((pthread_t *)a1, &v5, (void *(__cdecl *)(void *))sub_22636DBF4, (void *)a1);
  pthread_attr_destroy(&v5);
  return pthread_mutex_unlock(v2);
}

uint64_t sub_22636DCF4(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v3;

  v2 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  while (1)
  {
    v3 = *(_DWORD *)(a1 + 120);
    if ((v3 - 1) < 3)
    {
      *(_DWORD *)(a1 + 120) = 4;
      pthread_cond_signal_thread_np((pthread_cond_t *)(a1 + 8), *(pthread_t *)a1);
      goto LABEL_5;
    }
    if (!v3)
      break;
LABEL_5:
    pthread_cond_wait((pthread_cond_t *)(a1 + 8), v2);
  }
  pthread_mutex_unlock(v2);
  return pthread_join(*(pthread_t *)a1, 0);
}

uint64_t sub_22636DD74(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if (*(_BYTE *)(a1 + 256))
  {
    v5 = 0;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 128);
    v8 = *(_QWORD *)(a1 + 144) + v7;
    if (v8 >= 0)
      v9 = *(_QWORD *)(a1 + 144) + v7;
    else
      v9 = v8 + 1;
    v6 = 1000000000 * *(_QWORD *)a2 + 1000 * *(int *)(a2 + 8);
    v10 = (1000000000 * *(_QWORD *)(a1 + 160) + 1000 * *(int *)(a1 + 168)) % v8 + v6 / v8 * v8 - v6;
    if (v10 >= -(v9 >> 1))
      v11 = 0;
    else
      v11 = *(_QWORD *)(a1 + 144) + v7;
    v12 = v11 + v10;
    if (v10 > v9 >> 1)
      v5 = v10 - v8;
    else
      v5 = v12;
    v13 = *(_QWORD *)(a1 + 520) + v5;
    v14 = -((double)v13 * 0.01 + (double)v5 * 0.12 + (double)(v5 - *(_QWORD *)(a1 + 528)) * 0.0015);
    *(_QWORD *)(a1 + 144) = (uint64_t)v14;
    v15 = v7 + (uint64_t)v14;
    v16 = *(unsigned __int8 *)(a1 + 124);
    if (v15 < v7 >> 1 || v15 > v7 + (v7 >> 1))
    {
      v18 = 0;
      v19 = 0;
      *(_QWORD *)(a1 + 144) = 0;
    }
    else
    {
      v18 = v13 + v5;
      v7 += (uint64_t)v14;
      v19 = v5;
    }
    *(_DWORD *)(a1 + 152) = v7 / v16 / 0x3E8;
    *(_QWORD *)(a1 + 520) = v18;
    *(_QWORD *)(a1 + 528) = v19;
    *(_QWORD *)(a1 + 8 * (*(_QWORD *)(a1 + 264) % 0x1EuLL) + 280) = v5;
  }
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t sub_22636DF08(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;

  v4 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  *(_QWORD *)(a1 + 136) = a2;
  return pthread_mutex_unlock(v4);
}

uint64_t sub_22636DF44(uint64_t a1, char a2)
{
  unint64_t v3;

  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 124) = a2;
  *(_OWORD *)(a1 + 136) = xmmword_226374650;
  *(_BYTE *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 241) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 520) = 0u;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 56), 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 8), 0);
  v3 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 128) = v3;
  *(_DWORD *)(a1 + 152) = v3 / *(unsigned __int8 *)(a1 + 124) / 0x3E8;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 440) = 0u;
  *(_OWORD *)(a1 + 456) = 0u;
  *(_OWORD *)(a1 + 472) = 0u;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  return a1;
}

void sub_22636E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  void **v11;
  void **v12;

  v12 = v11;
  a10 = (void **)(v10 + 232);
  sub_22634FA58(&a10);
  a10 = (void **)(v10 + 208);
  sub_22634FA58(&a10);
  a10 = v12;
  sub_22634FA58(&a10);
  _Unwind_Resume(a1);
}

void sub_22636E06C()
{
  sub_22636E080("vector");
}

void sub_22636E080(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_22636E0D0(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24EDC2080, MEMORY[0x24BEDAAF0]);
}

void sub_22636E0BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_22636E0D0(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *sub_22636E0F4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_22636641C();
  return operator new(16 * a2);
}

uint64_t sub_22636E128(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    sub_22634FAC8(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *sub_22636E174(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_22636E230(a1, a2);
    v6 = a1[1];
    v7 = v6 + 32 * a2;
    v8 = 32 * a2;
    do
    {
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(v6 + 8) = 0;
      *(_QWORD *)(v6 + 16) = 0;
      sub_22636E2A4((char *)v6, *(_QWORD **)a3, *(_QWORD **)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 4);
      *(_QWORD *)(v6 + 24) = *(_QWORD *)(a3 + 24);
      v6 += 32;
      v8 -= 32;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_22636E210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_22634F9E8(&a9);
  _Unwind_Resume(a1);
}

char *sub_22636E230(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    sub_22636E06C();
  result = (char *)sub_22636E270((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_22636E270(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_22636641C();
  return operator new(32 * a2);
}

char *sub_22636E2A4(char *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    v6 = result;
    result = sub_22636E344(result, a4);
    v7 = (_QWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      *v7 = *a2;
      v8 = a2[1];
      v7[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      v7 += 2;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_22636E330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_22634FA58(&a9);
  _Unwind_Resume(a1);
}

char *sub_22636E344(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_22636E06C();
  result = (char *)sub_22636E0F4((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

_QWORD *sub_22636E384(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD v33[5];

  v5 = (_QWORD *)a2;
  if (a5 < 1)
    return v5;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    v13 = *a1;
    v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
    if (v14 >> 60)
      sub_22636E06C();
    v15 = (a2 - v13) >> 4;
    v16 = v10 - v13;
    if (v16 >> 3 > v14)
      v14 = v16 >> 3;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
      v17 = 0xFFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v33[4] = v9;
    if (v17)
      v18 = (char *)sub_22636E0F4(v9, v17);
    else
      v18 = 0;
    v26 = (uint64_t *)&v18[16 * v15];
    v33[0] = v18;
    v33[1] = v26;
    v33[3] = &v18[16 * v17];
    v27 = &v26[2 * a5];
    do
    {
      *v26 = *a3;
      v28 = a3[1];
      v26[1] = v28;
      if (v28)
      {
        v29 = (unint64_t *)(v28 + 8);
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }
      v26 += 2;
      a3 += 2;
    }
    while (v26 != v27);
    v33[2] = v27;
    v5 = (_QWORD *)sub_22636E5EC(a1, v33, v5);
    sub_22636E128((uint64_t)v33);
    return v5;
  }
  v19 = (uint64_t)(v12 - a2) >> 4;
  if (v19 >= a5)
  {
    v20 = &a3[2 * a5];
LABEL_29:
    sub_22636E570((uint64_t)a1, a2, v12, (char *)(a2 + 16 * a5));
    if (v20 != a3)
    {
      v31 = v5;
      do
      {
        sub_226363FE8(v31, a3);
        a3 += 2;
        v31 += 2;
      }
      while (a3 != v20);
    }
    return v5;
  }
  v20 = &a3[2 * v19];
  if (v20 == a4)
  {
    v22 = *(uint64_t **)(v9 - 8);
  }
  else
  {
    v21 = &a3[2 * v19];
    v22 = *(uint64_t **)(v9 - 8);
    do
    {
      *v22 = *v21;
      v23 = v21[1];
      v22[1] = v23;
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v21 += 2;
      v22 += 2;
    }
    while (v21 != a4);
  }
  a1[1] = (uint64_t)v22;
  if ((uint64_t)(v12 - a2) >= 1)
    goto LABEL_29;
  return v5;
}

void sub_22636E55C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_22636E128((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_22636E570(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(char **)(result + 8);
  v5 = (char *)(a2 + v4 - a4);
  v6 = v4;
  while ((unint64_t)v5 < a3)
  {
    *(_OWORD *)v6 = *(_OWORD *)v5;
    v6 += 16;
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    v5 += 16;
  }
  *(_QWORD *)(result + 8) = v6;
  if (v4 != a4)
  {
    v7 = (uint64_t)(v4 - 16);
    v8 = 16 * ((v4 - a4) >> 4);
    v9 = a2 - 16;
    do
    {
      result = sub_22634F31C(v7, (__int128 *)(v9 + v8));
      v7 -= 16;
      v8 -= 16;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_22636E5EC(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  _QWORD *v9;
  _OWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  result = a2[1];
  v5 = (_QWORD *)*a1;
  v6 = result;
  if ((_QWORD *)*a1 != a3)
  {
    v7 = a3;
    v6 = a2[1];
    do
    {
      v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *(_OWORD *)(v6 - 16) = v8;
      v6 -= 16;
      *v7 = 0;
      v7[1] = 0;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v9 = (_QWORD *)a1[1];
  v10 = (_OWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *(_OWORD *)a3;
      *a3 = 0;
      a3[1] = 0;
      a3 += 2;
    }
    while (a3 != v9);
    v6 = a2[1];
  }
  a2[2] = v10;
  v11 = (_QWORD *)*a1;
  *a1 = v6;
  a2[1] = v11;
  v12 = a1[1];
  a1[1] = a2[2];
  a2[2] = v12;
  v13 = a1[2];
  a1[2] = a2[3];
  a2[3] = v13;
  *a2 = a2[1];
  return result;
}

void sub_22636E954(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    objc_msgSend_finishedWithMode_(v2, v4, (uint64_t)CFSTR("Failed"), v5, v6);

    objc_end_catch();
    JUMPOUT(0x22636E914);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_22636EA70(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  ssize_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  v10 = a3;
  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  v14 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9, v13);
  if (objc_msgSend_length(v14, v15, v16, v17, v18))
  {
    objc_msgSend_dataUsingEncoding_(v14, v19, 4, v20, v21);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      v27 = objc_msgSend_fileDescriptor(a1, v22, v23, v24, v25);
      v26 = objc_retainAutorelease(v26);
      v32 = (const void *)objc_msgSend_bytes(v26, v28, v29, v30, v31);
      v37 = objc_msgSend_length(v26, v33, v34, v35, v36);
      v38 = write(v27, v32, v37);
      v43 = v38 > 0;
      if (v38 < 1)
        break;
      v44 = v38;
      if (v38 != objc_msgSend_length(v26, v39, v40, v41, v42))
      {
        v49 = objc_msgSend_length(v26, v45, v46, v47, v48);
        objc_msgSend_subdataWithRange_(v26, v50, v44, v49 - v44, v51);
        v52 = objc_claimAutoreleasedReturnValue();

        v44 = 0;
        v26 = (id)v52;
      }
    }
    while (v44 != objc_msgSend_length(v26, v45, v46, v47, v48));

  }
  else
  {
    v43 = 1;
  }

  return v43;
}

uint64_t sub_22636EBA4()
{
  uint64_t result;

  result = sub_22636EBE8(0x49656C7070417369, 0xEF6C616E7265746ELL, 0);
  byte_25583C5B8 = result & 1;
  return result;
}

uint64_t sub_22636EBE8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v6;
  unint64_t v7;
  char v8;
  int v9;
  char v10;
  char v12;
  _OWORD v13[2];
  _BYTE v14[40];

  if (qword_25583C5F0 != -1)
    swift_once();
  v6 = off_25583C5F8;
  *(_QWORD *)&v13[0] = a1;
  *((_QWORD *)&v13[0] + 1) = a2;
  swift_bridgeObjectRetain();
  sub_2263705A4();
  if (v6[2] && (v7 = sub_22636F708((uint64_t)v14), (v8 & 1) != 0))
    sub_22636F79C(v6[7] + 32 * v7, (uint64_t)v13);
  else
    memset(v13, 0, sizeof(v13));
  sub_22636F9FC((uint64_t)v14);
  sub_22636F7D8(&qword_25583C610);
  v9 = swift_dynamicCast();
  v10 = v12;
  if (v12 == 2)
    v10 = a3;
  if (!v9)
    v10 = a3;
  return v10 & 1;
}

uint64_t sub_22636ECEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[40];

  if (qword_25583C5F0 != -1)
    swift_once();
  v6 = off_25583C5F8;
  *(_QWORD *)&v11[0] = a1;
  *((_QWORD *)&v11[0] + 1) = a2;
  swift_bridgeObjectRetain();
  sub_2263705A4();
  if (v6[2] && (v7 = sub_22636F708((uint64_t)v12), (v8 & 1) != 0))
    sub_22636F79C(v6[7] + 32 * v7, (uint64_t)v11);
  else
    memset(v11, 0, sizeof(v11));
  sub_22636F9FC((uint64_t)v12);
  sub_22636F7D8(&qword_25583C610);
  sub_22636F7D8(&qword_25583C620);
  if (swift_dynamicCast() && v10)
    return v10;
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t static XRInternalizedSettingsStore.appleInternal.getter()
{
  if (qword_25583C5B0 != -1)
    swift_once();
  return byte_25583C5B8;
}

uint64_t sub_22636EE44()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22636EEB4(0x53736C6F626D7953, 0xEC00000074656568, 0xD000000000000012, 0x8000000226379780, 0xD000000000000086);
  qword_25583C5C8 = result;
  unk_25583C5D0 = v1;
  return result;
}

uint64_t sub_22636EEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  if (qword_25583C5F0 != -1)
    swift_once();
  v9 = off_25583C5F8;
  swift_bridgeObjectRetain();
  sub_2263705A4();
  if (v9[2] && (v10 = sub_22636F708((uint64_t)&v15), (v11 & 1) != 0))
  {
    sub_22636F79C(v9[7] + 32 * v10, (uint64_t)&v17);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_22636F9FC((uint64_t)&v15);
  if (!*((_QWORD *)&v18 + 1))
  {
    sub_22636F818((uint64_t)&v17);
    goto LABEL_13;
  }
  sub_22636F7D8(&qword_25583C620);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    v15 = 0u;
    v16 = 0u;
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_22636F738(a3, a4);
    if ((v13 & 1) != 0)
    {
      sub_22636F79C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v15);
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_18:
  sub_22636F7D8(&qword_25583C610);
  if (swift_dynamicCast() && *((_QWORD *)&v17 + 1))
    return v17;
  swift_bridgeObjectRetain();
  return a5;
}

uint64_t static XRInternalizedSettingsStore.symbolsPermissionError_iOS.getter()
{
  uint64_t v0;

  if (qword_25583C5C0 != -1)
    swift_once();
  v0 = qword_25583C5C8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22636F0E8()
{
  unint64_t v0;
  uint64_t v1;

  v0 = sub_22636F148(MEMORY[0x24BEE4AF8]);
  v1 = sub_22636ECEC(0xD00000000000001ALL, 0x80000002263746A0, v0);
  swift_bridgeObjectRelease();
  return sub_22636F270(v1, &qword_25583C5E0);
}

unint64_t sub_22636F148(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_22636F7D8(&qword_25583C628);
  v2 = sub_2263705B0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22636FA6C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_22636F738(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22636FAB4(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22636F270@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;
  unint64_t v6;
  char v7;
  uint64_t result;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  if (*(_QWORD *)(a1 + 16))
  {
    v4 = sub_22636F738(0x65446E69616D6F44, 0xEE0073746C756166);
    if ((v5 & 1) != 0)
    {
      sub_22636F79C(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v10);
      sub_22636F7D8(&qword_25583C608);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*(_QWORD *)(a1 + 16) && (v6 = sub_22636F738(0xD000000000000010, 0x8000000226379760), (v7 & 1) != 0))
        {
          sub_22636F79C(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v10);
        }
        else
        {
          v10 = 0u;
          v11 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((_QWORD *)&v11 + 1))
        {
          swift_bridgeObjectRelease();
          result = sub_22636F818((uint64_t)&v10);
          goto LABEL_8;
        }
        sub_22636F7D8(&qword_25583C618);
        result = swift_dynamicCast();
        if ((result & 1) != 0)
        {
          *a2 = v9;
          a2[1] = v9;
          return result;
        }
      }
    }
  }
  result = swift_bridgeObjectRelease();
LABEL_8:
  *a2 = 0;
  a2[1] = 0;
  return result;
}

uint64_t static XRInternalizedSettingsStore.symbolicationModernization.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25583C5D8 != -1)
    swift_once();
  v2 = qword_25583C5E0;
  v3 = *(_QWORD *)algn_25583C5E8;
  *a1 = qword_25583C5E0;
  a1[1] = v3;
  return sub_22636F418(v2);
}

uint64_t sub_22636F418(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t XRInternalizedSettingsStore.SymbolicationModernization.domainDefaults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t XRInternalizedSettingsStore.SymbolicationModernization.setupInvocations.getter()
{
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for XRInternalizedSettingsStore()
{
  return &type metadata for XRInternalizedSettingsStore;
}

uint64_t destroy for XRInternalizedSettingsStore.SymbolicationModernization()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s23DVTInstrumentsUtilities27XRInternalizedSettingsStoreO26SymbolicationModernizationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for XRInternalizedSettingsStore.SymbolicationModernization(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for XRInternalizedSettingsStore.SymbolicationModernization(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for XRInternalizedSettingsStore.SymbolicationModernization(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XRInternalizedSettingsStore.SymbolicationModernization(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XRInternalizedSettingsStore.SymbolicationModernization(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XRInternalizedSettingsStore.SymbolicationModernization()
{
  return &type metadata for XRInternalizedSettingsStore.SymbolicationModernization;
}

uint64_t sub_22636F600(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22636F620(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for XRTimeRange()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25583C600)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25583C600);
  }
}

void sub_22636F69C()
{
  id v0;
  void *v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_internalizedSettings);
  v1 = (void *)sub_226370574();

  off_25583C5F8 = v1;
}

unint64_t sub_22636F708(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22637058C();
  return sub_22636F858(a1, v2);
}

unint64_t sub_22636F738(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2263705C8();
  sub_226370580();
  v4 = sub_2263705D4();
  return sub_22636F91C(a1, a2, v4);
}

uint64_t sub_22636F79C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22636F7D8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x227696A90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22636F818(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22636F7D8(&qword_25583C610);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22636F858(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_22636FA30(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x227696064](v9, a1);
      sub_22636F9FC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_22636F91C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2263705BC() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2263705BC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22636F9FC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_22636FA30(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_22636FA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22636F7D8((uint64_t *)&unk_25583C630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22636FAB4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL static XRTimeRange.== infix(_:_:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _BOOL4 v9;

  v4 = a1 - 1;
  v5 = -a2 < a1 || a2 == 0;
  v6 = v4 + a2;
  if (v5)
    v6 = -1;
  v7 = -a4 < a1 || a4 == 0;
  v8 = v4 + a4;
  if (v7)
    v8 = -1;
  v9 = v6 == v8;
  return a1 == a3 && v9;
}

BOOL sub_22636FB04(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  _BOOL4 v8;

  if (a1 > -a2 || a2 == 0)
    v5 = -1;
  else
    v5 = a2 + a1 - 1;
  if (a1 > -a4 || a4 == 0)
    v7 = -1;
  else
    v7 = a4 + a1 - 1;
  v8 = v5 == v7;
  return a1 == a3 && v8;
}

BOOL sub_22636FB48(uint64_t a1, uint64_t *a2)
{
  return sub_22636FB04(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *a2, a2[1]);
}

uint64_t static XRTimeRange.full.getter()
{
  return 0;
}

uint64_t static XRTimeRange.null.getter()
{
  return -1;
}

uint64_t XRTimeRange.actualStart.getter(uint64_t result)
{
  if (result == -1)
    return 0;
  return result;
}

uint64_t XRTimeRange.actualLength.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = -1;
  else
    v2 = 0;
  if (a2)
    v2 = a2;
  if (a1 == -1)
    return 0;
  else
    return v2;
}

void sub_22636FBC4()
{
  __assert_rtn("+[NSProcessInfo(DVTInstrumentsUtilities) isRunningVirtualized]", "NSProcessInfo+DVTInstrumentsUtilities.m", 53, "sysctlbyname(\"kern.hv_vmm_present\", &is_vmm, &is_vmm_size, NULL, 0) == 0");
}

void sub_22636FBEC()
{
  __assert_rtn("+[XRXMLParser commonXMLSchemaRepositoryURL]", "XRXMLParser.m", 41, "result");
}

void sub_22636FC14()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "It appears that the block being passed to requestLocalNotification:object:observe:block: captures the observer which would lead to an unrecoverable cycle.  Use the observer parameter passed in to the block instead.\nSet a breakpoint in '_DVTIUInvalidBlockCaptureBreak' to debug", v0, 2u);
}

void sub_22636FC58()
{
  __assert_rtn("containsIndex", "XRIndexSetImpl.hpp", 337, "_ranges.size() <= CACHE_SIZE");
}

void sub_22636FC80()
{
  __assert_rtn("-[XRMobileAgentQueueStop receiveMobileAgent:]", "XRMobileAgentQueueStop.m", 110, "agent.movementType != XRMobileAgentUnsetMovement");
}

void sub_22636FCA8()
{
  __assert_rtn("-[XRMobileAgentQueueStop(SubclassPrivate) _welcomeAgent:]", "XRMobileAgentQueueStop.m", 140, "agent.movementType != XRMobileAgentUnsetMovement");
}

void sub_22636FCD0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v5 = 134217984;
  v6 = objc_msgSend_count(a1, a2, a3, a4, a5);
  _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Key Value Typed Array has not even number of elements: %ld", (uint8_t *)&v5, 0xCu);
}

void sub_22636FD50()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get a size in points/pixel's underlying array", v0, 2u);
}

void sub_22636FD94()
{
  __assert_rtn("-[XREngineeringTypeDefinitions checksum]", "XREngineeringTypeDefinitions.m", 234, "chunk.length <= chunkSizeTarget");
}

void sub_22636FDBC()
{
  __assert_rtn("-[_XREngineeringTypeDefAttribute _handleCompletion]", "XREngineeringTypeDefinitions.m", 294, "foundAttr");
}

void sub_22636FDE4()
{
  __assert_rtn("-[_XREngineeringTypeDefImplClass _handleCompletion]", "XREngineeringTypeDefinitions.m", 318, "foundAttr");
}

void sub_22636FE0C(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  objc_msgSend_localizedDescription(a2, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22635FBFC(&dword_22634C000, v9, v10, "Unarchiving deep copied object failed with error: %@", v11, v12, v13, v14, 2u);

  sub_22635FC10();
}

void sub_22636FE98(void *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a1;
  objc_msgSend_localizedDescription(a2, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22635FBFC(&dword_22634C000, v9, v10, "Archiving object to deep copy failed with error: %@", v11, v12, v13, v14, 2u);

  sub_22635FC10();
}

void sub_22636FF24(void *a1, uint64_t *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_begin_catch(a1);
  *a3 = v5;
  v6 = v5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    v7 = *a2;
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Agent '%@' threw an exception and will be sent to its final destination in the failed mode. Exception: %@.", (uint8_t *)&v8, 0x16u);
  }
}

void sub_22636FFE8()
{
  __assert_rtn("-[XRMobileAgent activateAtStop:activationTicket:activationQoS:finalDestination:finalTicket:]", "XRMobileAgent.m", 67, "_itinerary == nil");
}

void sub_226370010(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_description(a1, a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mode(a1, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentStop(*(void **)a2, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 138412802;
  v19 = v7;
  v20 = 2112;
  v21 = v12;
  v22 = 2112;
  v23 = v17;
  _os_log_error_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Agent %@ did not set its itinerary in mode %@ after passing through stop %@", (uint8_t *)&v18, 0x20u);

  sub_226368A8C();
}

void sub_2263700E4()
{
  __assert_rtn("-[XRMobileAgentItinerary _visitNextStop:]", "XRMobileAgent.m", 276, "agent->_movementType == XRMobileAgentParkMovement");
}

void sub_22637010C()
{
  __assert_rtn("-[XRMobileAgentItinerary _visitNextStop:]", "XRMobileAgent.m", 234, "_nextMovementType == XRMobileAgentParkMovement");
}

void sub_226370134(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_mode(a1, (const char *)a2, a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a2 + 40);
  v9 = 138412802;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Agent '%@' attempted to set a nil next stop.  The current mode is '%@'.  The next mode is '%@'.  Moving to final destination in the failed mode.", (uint8_t *)&v9, 0x20u);

  sub_226368A8C();
}

void sub_2263701E4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_description(a1, a2, a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Agent %@ has been lost.  Recovering by sending it to its final destination in the failure mode.", (uint8_t *)&v6, 0xCu);

}

void sub_226370278(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_22634C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "A next stop of nil was set for the itinerary '%@'.  If this agent continues there will be another fault with the details.", (uint8_t *)&v1, 0xCu);
}

void sub_2263702F4()
{
  __assert_rtn("noteWantsFrame", "XRFrameScheduler_Private.mm", 115, "_pending > 0");
}

void sub_22637031C()
{
  __assert_rtn("noteWantsFrameNextMajor", "XRFrameScheduler_Private.mm", 128, "_pending > 0");
}

void sub_226370344()
{
  __assert_rtn("noteEnteringFrame", "XRFrameScheduler_Private.mm", 141, "_enqueued > 0");
}

void sub_22637036C()
{
  __assert_rtn("noteActivityExecuting", "XRFrameScheduler_Private.mm", 179, "_enqueued > 0");
}

void sub_226370394()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 669, "!(*_nextReadyManager)->isActive()");
}

void sub_2263703BC()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 666, "!currentManagerActive");
}

void sub_2263703E4()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 676, "(*_nextReadyManager)->isActive()");
}

void sub_22637040C()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 685, "(*_nextReadyManager)->isActive()");
}

void sub_226370434()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 701, "!managerSelected");
}

void sub_22637045C()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 702, "!currentManagerActive");
}

void sub_226370484()
{
  __assert_rtn("evaluateManagerSelection", "XRFrameScheduler_Private.mm", 692, "(*_nextReadyManager)->isActive()");
}

void sub_2263704AC()
{
  __assert_rtn("extendingMinorFrame", "XRFrameScheduler_Private.mm", 763, "_nextReadyManager == _activityManagers.end() || !(*_nextReadyManager)->isActive()");
}

void sub_2263704D4()
{
  __assert_rtn("extendingMinorFrame", "XRFrameScheduler_Private.mm", 759, "_nextReadyManager != _activityManagers.end()");
}

void sub_2263704FC()
{
  __assert_rtn("extendingMinorFrame", "XRFrameScheduler_Private.mm", 760, "(*_nextReadyManager)->createsAffinity()");
}

void sub_226370524()
{
  __assert_rtn("addRing", "XRFrameScheduler_Private.mm", 986, "ring != nullptr");
}

void sub_22637054C()
{
  __assert_rtn("-[XRFrameActivityBlockAgent dealloc]", "XRFrameActivityBlockAgent.m", 53, "current != FINISHED_OPERATION");
}

uint64_t sub_226370574()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_226370580()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22637058C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_226370598()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2263705A4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2263705B0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2263705BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2263705C8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2263705D4()
{
  return MEMORY[0x24BEE4328]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EDC20A8(__p);
}

uint64_t operator delete()
{
  return off_24EDC20B0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EDC20B8(__sz);
}

uint64_t operator new()
{
  return off_24EDC20C0();
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

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

xmlStructuredErrorFunc *__xmlStructuredError(void)
{
  return (xmlStructuredErrorFunc *)MEMORY[0x24BEDE548]();
}

void **__xmlStructuredErrorContext(void)
{
  return (void **)MEMORY[0x24BEDE550]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x24BEDA360]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x24BEDA398]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x24BEDA3D8]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x24BEDA3E0]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_extract()
{
  return MEMORY[0x24BEDA4A8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x24BEDA4B8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x24BEDA4F8]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x24BEDA528]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x24BEDA540]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x24BEDA660]();
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x24BDADC08]();
}

uint64_t csr_check()
{
  return MEMORY[0x24BDADC10]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x24BDAF5B0](*(_QWORD *)&t, x);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x24BDAF780](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x24BDAF7B0](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7B8](a1, *(_QWORD *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_signal_thread_np(pthread_cond_t *a1, pthread_t a2)
{
  return MEMORY[0x24BDAF7E8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

uint64_t strtoll_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x24BDB0018](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlDocPtr xmlCtxtReadFile(xmlParserCtxtPtr ctxt, const char *filename, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x24BEDE6D0](ctxt, filename, encoding, *(_QWORD *)&options);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

void xmlLockLibrary(void)
{
  MEMORY[0x24BEDE908]();
}

xmlParserCtxtPtr xmlNewParserCtxt(void)
{
  return (xmlParserCtxtPtr)MEMORY[0x24BEDE9C0]();
}

void xmlSchemaFree(xmlSchemaPtr schema)
{
  MEMORY[0x24BEDEB70](schema);
}

void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDEB78](ctxt);
}

void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt)
{
  MEMORY[0x24BEDEB80](ctxt);
}

xmlSchemaParserCtxtPtr xmlSchemaNewParserCtxt(const char *URL)
{
  return (xmlSchemaParserCtxtPtr)MEMORY[0x24BEDEB90](URL);
}

xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema)
{
  return (xmlSchemaValidCtxtPtr)MEMORY[0x24BEDEB98](schema);
}

xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt)
{
  return (xmlSchemaPtr)MEMORY[0x24BEDEBA0](ctxt);
}

void xmlSchemaSetValidStructuredErrors(xmlSchemaValidCtxtPtr ctxt, xmlStructuredErrorFunc serror, void *ctx)
{
  MEMORY[0x24BEDEBB8](ctxt, serror, ctx);
}

int xmlSchemaValidateFile(xmlSchemaValidCtxtPtr ctxt, const char *filename, int options)
{
  return MEMORY[0x24BEDEBC8](ctxt, filename, *(_QWORD *)&options);
}

void xmlSchemaValidateSetFilename(xmlSchemaValidCtxtPtr vctxt, const char *filename)
{
  MEMORY[0x24BEDEBD0](vctxt, filename);
}

void xmlSetStructuredErrorFunc(void *ctx, xmlStructuredErrorFunc handler)
{
  MEMORY[0x24BEDEC10](ctx, handler);
}

void xmlUnlockLibrary(void)
{
  MEMORY[0x24BEDEE28]();
}

