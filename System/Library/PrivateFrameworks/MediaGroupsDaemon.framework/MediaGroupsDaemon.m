void sub_21CBD4870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  id *v20;
  id *v21;
  uint64_t v22;
  id *v23;

  v23 = v21;
  objc_destroyWeak(v23);
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v22 - 56));
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

void sub_21CBD5200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD5A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_21CBD5B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD5E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD5FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD6158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD6368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD6688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD69F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD6CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBD7DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  id *v20;
  id *v21;
  uint64_t v22;
  id *v23;

  v23 = v21;
  objc_destroyWeak(v23);
  objc_destroyWeak(v20);
  _Block_object_dispose(&a20, 8);
  objc_destroyWeak((id *)(v22 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_21CBD8278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBD9284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_21CBD93E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBD9C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBDA1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBDA78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBDA920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x220788584](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21CBDAD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void sub_21CBDD560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MGClassForMGGroupType(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_msgSend(CFSTR("com.apple.media-group"), "isEqual:", v1) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.media-group.solo-HomePodAccessory"), "isEqual:", v1) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.media-group.solo-AppleTVAccessory"), "isEqual:", v1) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.media-group.solo-SpeakerAccessory"), "isEqual:", v1) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.media-group.solo-AudioReceiverAccessory"), "isEqual:", v1) & 1) != 0
    || (objc_msgSend(CFSTR("com.apple.media-group.solo-Accessory"), "isEqual:", v1) & 1) == 0
    && ((objc_msgSend(CFSTR("com.apple.media-group.home-theater"), "isEqual:", v1) & 1) != 0
     || (objc_msgSend(CFSTR("com.apple.media-group.solo"), "isEqual:", v1) & 1) != 0
     || (objc_msgSend(CFSTR("com.apple.media-group.media-system"), "isEqual:", v1) & 1) != 0
     || (objc_msgSend(CFSTR("com.apple.media-group.room"), "isEqual:", v1) & 1) != 0
     || (objc_msgSend(CFSTR("com.apple.media-group.zone"), "isEqual:", v1) & 1) != 0
     || objc_msgSend(CFSTR("com.apple.media-group.home"), "isEqual:", v1)))
  {
    objc_opt_class();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_21CBE213C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBE2C98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void _AddContainmentForGroup(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v9, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", v14))
  {
    MGLogForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_error_impl(&dword_21CBD2000, v15, OS_LOG_TYPE_ERROR, "detected loop in %@", buf, 0xCu);
    }

  }
  objc_msgSend(v9, "memberIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = ___AddContainmentForGroup_block_invoke;
  v23[3] = &unk_24E0AAA88;
  v17 = v13;
  v28 = v17;
  v18 = v10;
  v24 = v18;
  v19 = v11;
  v25 = v19;
  v20 = v9;
  v26 = v20;
  v21 = v12;
  v27 = v21;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v23);

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v21, "objectForKey:", v14);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v22 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v21, "setObject:forKey:", v22, v14);
    }
    objc_msgSend(v22, "addObject:", v19);

  }
}

void sub_21CBE3710(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_21CBE3B6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_21CBE415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBE4B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBE5514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_21CBE56E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MGSetServiceXPCInterfacesOnConnection(void *a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;

  v50 = a1;
  v44 = &unk_255324D50;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x24BDBCF20];
  v41 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v47, "setWithObjects:", v41, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");
  if ((a2 & 1) != 0)
    objc_msgSend(v50, "setRemoteObjectInterface:", v2);
  else
    objc_msgSend(v50, "setExportedInterface:", v2);
  v48 = &unk_2553200C8;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v48);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v40 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v45, v40, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_createGroupWithType_name_members_completion_, 2, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_createGroupWithType_name_members_completion_, 0, 1);
  v46 = (void *)MEMORY[0x24BDBCF20];
  v43 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v43, v23, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 0, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 1, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_addMember_group_completion_, 0, 1);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 0, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 1, 0);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_removeMember_group_completion_, 0, 1);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_deleteGroup_completion_, 1, 0);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_setName_group_completion_, 1, 0);
  v33 = (void *)MEMORY[0x24BDBCF20];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_startQueryWithPredicate_completion_, 0, 0);
  v36 = (void *)MEMORY[0x24BDBCF20];
  v37 = objc_opt_class();
  v38 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion_, 5, 0);
  if ((a2 & 1) != 0)
    objc_msgSend(v50, "setExportedInterface:", v12);
  else
    objc_msgSend(v50, "setRemoteObjectInterface:", v12);

}

id MGGroupIdentifierCopyApplyingHashing(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  CC_SHA256_CTX c;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned __int8 md[32];
  _QWORD data[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mg-hk-entity"));

  if (!v4)
    goto LABEL_15;
  _MGRelevantComponentsForGroupIdentifierComponents(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

LABEL_15:
    v18 = (void *)objc_msgSend(v1, "copy");
    goto LABEL_16;
  }
  v20 = v2;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(CFSTR("msi"), "isEqualToString:", v12, v20))
        {
          objc_msgSend(v7, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          memset(&c, 0, sizeof(c));
          CC_SHA256_Init(&c);
          data[0] = 0;
          data[1] = 0;
          objc_msgSend(v7, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "getUUIDBytes:", data);

          CC_SHA256_Update(&c, data, 0x10u);
          CC_SHA256_Final(md, &c);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", md);
        }
        v15 = v13;
        objc_msgSend(v13, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v12, v16);
        objc_msgSend(v6, "addObject:", v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v2 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v2, "setQueryItems:", v6);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64B98]), "initWithURLComponents:", v2);

LABEL_16:
  return v18;
}

id _MGRelevantComponentsForGroupIdentifierComponents(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("mg-hk-entity"));

  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = v1;
    objc_msgSend(v1, "queryItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(CFSTR("hi"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("zi"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("ri"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("ai"), "isEqualToString:", v10) & 1) != 0
            || (objc_msgSend(CFSTR("msi"), "isEqualToString:", v10) & 1) != 0
            || objc_msgSend(CFSTR("ht"), "isEqualToString:", v10))
          {
            v11 = objc_alloc(MEMORY[0x24BDD1880]);
            objc_msgSend(v9, "value");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

            if (v13)
              objc_msgSend(v16, "setObject:forKey:", v13, v10);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v1 = v15;
  }

  return v16;
}

id MGAccessoryCategoryTypeForAccessory(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id MGClassForGroupIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mg-hk-entity"));

  if (!v4)
  {
    v20 = 0;
    goto LABEL_28;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v2, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v6)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_20;
  }
  v7 = v6;
  v22 = v2;
  v23 = v1;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v25 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v12, "name", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("hi"), "isEqualToString:", v13))
      {
        v14 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "initWithUUIDString:", v15);
        v17 = v9;
        v9 = (void *)v16;
      }
      else
      {
        if (!objc_msgSend(CFSTR("ai"), "isEqualToString:", v13))
          goto LABEL_12;
        v18 = objc_alloc(MEMORY[0x24BDD1880]);
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "initWithUUIDString:", v15);
        v17 = v8;
        v8 = (void *)v19;
      }

LABEL_12:
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v7);

  v20 = 0;
  if (!v9)
  {
    v2 = v22;
    v1 = v23;
    goto LABEL_27;
  }
  v2 = v22;
  v1 = v23;
  if (!v8)
    goto LABEL_27;
  objc_msgSend(v22, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.media-group.solo-HomePodAccessory")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.media-group.solo-AppleTVAccessory")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.media-group.solo-SpeakerAccessory")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.media-group.solo-AudioReceiverAccessory")))
  {
LABEL_20:
    v20 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:
LABEL_28:

  return v20;
}

id MGGroupIdentifierForAccessory(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MGAccessoryCategoryTypeForAccessory(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForAccessoryIdentifierInHome(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id MGGroupIdentifierForAccessoryIdentifierInHome(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  v6 = a1;
  v7 = a3;
  if ((objc_msgSend(CFSTR("1D8FD40E-7CAE-4AD5-9973-977D18890DE2"), "isEqualToString:", v7) & 1) != 0)
  {
    v8 = CFSTR("com.apple.media-group.solo-HomePodAccessory");
  }
  else if ((objc_msgSend(CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"), "isEqualToString:", v7) & 1) != 0)
  {
    v8 = CFSTR("com.apple.media-group.solo-AppleTVAccessory");
  }
  else if ((objc_msgSend(CFSTR("C0F5EDC5-4003-464A-9E5D-0DB36677BC35"), "isEqualToString:", v7) & 1) != 0)
  {
    v8 = CFSTR("com.apple.media-group.solo-SpeakerAccessory");
  }
  else if (objc_msgSend(CFSTR("BE15659C-3CE6-4FD0-B152-BCDB488446C6"), "isEqualToString:", v7))
  {
    v8 = CFSTR("com.apple.media-group.solo-AudioReceiverAccessory");
  }
  else
  {
    v8 = CFSTR("com.apple.media-group.solo-Accessory");
  }

  v9 = v8;
  objc_msgSend(v6, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _MGGroupIdentifierHomeKitComponents(v9, v5, v11, v12, v13, v14, v15, v16, CFSTR("ai"), (uint64_t)v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id _MGGroupIdentifierHomeKitComponents(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  id v24;
  void *v25;
  id *v27;
  id *v28;

  v11 = a1;
  v12 = a2;
  v13 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v13, "setScheme:", CFSTR("mg-hk-entity"));
  if (v11)
    objc_msgSend(v13, "setPath:", v11);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(v12, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("hi"), v16);
  objc_msgSend(v14, "addObject:", v17);

  v27 = (id *)&a10;
  v18 = a9;
  if (v18)
  {
    do
    {
      v19 = v27;
      v28 = v27 + 1;
      v20 = *v19;
      if (!v20)
        break;
      v21 = v20;
      if ((objc_msgSend(CFSTR("hi"), "isEqualToString:", v18) & 1) == 0 && _NSIsNSString())
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v18, v21);
        objc_msgSend(v14, "addObject:", v22);

      }
      v23 = v28;
      v27 = v28 + 1;
      v24 = *v23;

      v18 = v24;
    }
    while (v24);
  }
  objc_msgSend(v13, "setQueryItems:", v14);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE64B98]), "initWithURLComponents:", v13);

  return v25;
}

id MGGroupIdentifierForHomeTheaterWithAppleTVAccessoryInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a1;
  objc_msgSend(a2, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(CFSTR("com.apple.media-group.home-theater"), v4, v7, v8, v9, v10, v11, v12, CFSTR("ht"), (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id MGGroupIdentifierForRoomInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForRoomIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForHomeInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForHomeIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForHomeIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("hi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGHomeIdentifierForGroupIdentifier(void *a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = CFSTR("hi");
  objc_msgSend(a1, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MGRelevantComponentsForGroupIdentifierComponents(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("hi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

id MGGroupIdentifierForZoneInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForZoneIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForZoneIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("zi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGGroupIdentifierForRoomIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("ri"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id MGGroupIdentifierForMediaSystemInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(a1, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MGGroupIdentifierForMediaSystemIdentifierInHome(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id MGGroupIdentifierForMediaSystemIdentifierInHome(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, CFSTR("msi"), (uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_21CBE78A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBE88F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21CBE8A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBE9038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBE919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBE92F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MGLogForCategory(int a1)
{
  if (MGLogForCategory_onceToken != -1)
    dispatch_once(&MGLogForCategory_onceToken, &__block_literal_global_1);
  return (id)MGLogForCategory_oslog[a1];
}

void sub_21CBEB8C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_21CBEBECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBECA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBECDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBED160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBED4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x220788584](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_21CBEEB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBEF20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21CBF0BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_21CBF1410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBF1590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBF1920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19)
{
  id *v19;
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_21CBF2910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CBF411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_21CBF44F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  id *v28;
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v28);
  objc_destroyWeak(v29);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak((id *)(v30 - 184));
  _Unwind_Resume(a1);
}

void sub_21CBF5350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_21CBF54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBF56D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21CBF59F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
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

uint64_t _CFHTTPServerCreateSelfSignedIdentity()
{
  return MEMORY[0x24BDB7500]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x24BDBD178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_advertise_descriptor_t)MEMORY[0x24BDE0A00](name, type, domain);
}

void nw_advertise_descriptor_set_txt_record_object(nw_advertise_descriptor_t advertise_descriptor, nw_txt_record_t txt_record)
{
  MEMORY[0x24BDE0A08](advertise_descriptor, txt_record);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x24BDE0A68](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
  MEMORY[0x24BDE0A80](descriptor, include_txt_record);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0A88](result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x24BDE0A90](result);
}

void nw_browse_result_enumerate_interfaces(nw_browse_result_t result, nw_browse_result_enumerate_interface_t enumerator)
{
  MEMORY[0x24BDE0A98](result, enumerator);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x24BDE0AA0](old_result, new_result);
}

size_t nw_browse_result_get_interfaces_count(nw_browse_result_t result)
{
  return MEMORY[0x24BDE0AA8](result);
}

void nw_browser_cancel(nw_browser_t browser)
{
  MEMORY[0x24BDE0AB0](browser);
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x24BDE0AB8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
  MEMORY[0x24BDE0AC0](browser, handler);
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0AC8](browser, queue);
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
  MEMORY[0x24BDE0AD0](browser, state_changed_handler);
}

void nw_browser_start(nw_browser_t browser)
{
  MEMORY[0x24BDE0AD8](browser);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0B40](connection);
}

void nw_connection_force_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0BA8](connection);
}

uint64_t nw_connection_get_id()
{
  return MEMORY[0x24BDE0BB8]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x24BDE0D00](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x24BDE0D10](context_identifier);
}

void nw_content_context_set_is_final(nw_content_context_t context, BOOL is_final)
{
  MEMORY[0x24BDE0D38](context, is_final);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
  MEMORY[0x24BDE0D40](context, protocol_metadata);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x24BDE0E30](endpoint);
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x24BDE0ED8]();
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0EE0](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x24BDE0FA8](error);
}

uint64_t nw_http_create_metadata_for_response()
{
  return MEMORY[0x24BDE11F0]();
}

uint64_t nw_http_fields_append()
{
  return MEMORY[0x24BDE1240]();
}

uint64_t nw_http_fields_create()
{
  return MEMORY[0x24BDE1250]();
}

uint64_t nw_http_fields_enumerate()
{
  return MEMORY[0x24BDE1260]();
}

uint64_t nw_http_messaging_create_options()
{
  return MEMORY[0x24BDE1270]();
}

uint64_t nw_http_metadata_copy_request()
{
  return MEMORY[0x24BDE1280]();
}

uint64_t nw_http_request_access_method()
{
  return MEMORY[0x24BDE12B0]();
}

uint64_t nw_http_request_copy_header_fields()
{
  return MEMORY[0x24BDE12C8]();
}

uint64_t nw_http_request_copy_url()
{
  return MEMORY[0x24BDE12D0]();
}

uint64_t nw_http_response_create_well_known()
{
  return MEMORY[0x24BDE1338]();
}

uint64_t nw_http_response_set_header_fields()
{
  return MEMORY[0x24BDE1358]();
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x24BDE1440](listener);
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1448](parameters);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
  MEMORY[0x24BDE1468](listener, advertise_descriptor);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_new_connection_limit(nw_listener_t listener, uint32_t new_connection_limit)
{
  MEMORY[0x24BDE1490](listener, *(_QWORD *)&new_connection_limit);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x24BDE14A0](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x24BDE1528](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

void nw_parameters_prohibit_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x24BDE1618](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_parameters_set_attach_protocol_listener()
{
  return MEMORY[0x24BDE1638]();
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
  MEMORY[0x24BDE1690](parameters, include_peer_to_peer);
}

void nw_parameters_set_local_only(nw_parameters_t parameters, BOOL local_only)
{
  MEMORY[0x24BDE16D0](parameters, local_only);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x24BDE1758](parameters, reuse_local_address);
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x24BDE1760]();
}

uint64_t nw_protocol_copy_http_definition()
{
  return MEMORY[0x24BDE1B40]();
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x24BDE2040](stack, protocol);
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x24BDE2600](options);
}

BOOL nw_txt_record_access_key(nw_txt_record_t txt_record, const char *key, nw_txt_record_access_key_t access_value)
{
  return MEMORY[0x24BDE2610](txt_record, key, access_value);
}

nw_txt_record_t nw_txt_record_create_dictionary(void)
{
  return (nw_txt_record_t)MEMORY[0x24BDE2620]();
}

BOOL nw_txt_record_set_key(nw_txt_record_t txt_record, const char *key, const uint8_t *value, size_t value_len)
{
  return MEMORY[0x24BDE2628](txt_record, key, value, value_len);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x24BDE9580](identity);
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x24BDE95D8](options, application_protocol);
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
  MEMORY[0x24BDE95E8](options, group);
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
  MEMORY[0x24BDE9620](options, identity);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

