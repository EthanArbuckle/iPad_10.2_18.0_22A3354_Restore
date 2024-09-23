void sub_1829903B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,char a41)
{
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a41);
  _Unwind_Resume(a1);
}

_BYTE *__copy_helper_block_ea8_96c48_ZTSNSt3__18optionalIU8__strongP12NSDictionaryEE(_BYTE *result, uint64_t a2)
{
  _BYTE *v2;

  result[96] = 0;
  result[104] = 0;
  if (*(_BYTE *)(a2 + 104))
  {
    v2 = result;
    result = *(id *)(a2 + 96);
    *((_QWORD *)v2 + 12) = result;
    v2[104] = 1;
  }
  return result;
}

void __destroy_helper_block_ea8_96c48_ZTSNSt3__18optionalIU8__strongP12NSDictionaryEE(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 104))

}

void _LSServer_OpenApplication(void *a1, void *a2, void *a3, int a4, void *a5)
{
  unint64_t v5;

  if (a4)
    v5 = 0;
  else
    v5 = 2;
  _LSServer_OpenApplicationCommon(a1, 0, 0, 0, 0, a3, v5, a2, a5);
}

void _LSServer_OpenApplicationCommon(void *a1, void *a2, unsigned int a3, void *a4, void *a5, void *a6, unint64_t a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _LSSpringBoardCall *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v16 = a1;
  v17 = a2;
  v28 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = (void *)MEMORY[0x186DAE7A0]();
  if ((a7 & 1) != 0)
    _LSSchemeApprovalRememberForBouncebackCheck(v19, v16);
  if (v16 && objc_msgSend(v16, "length"))
  {
    if (!v17
      || FrontBoardServicesLibrary(void)::frameworkLibrary
      || (FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2)) != 0)
    {
      _LSGetOptionsDictionaryContainingSourceApplication(v19, v17, 0, a3, v28, v18, 1, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc_init(_LSSpringBoardCall);
      -[_LSSpringBoardCall setBundleIdentifier:](v24, "setBundleIdentifier:", v16);
      -[_LSSpringBoardCall setLaunchOptions:](v24, "setLaunchOptions:", v23);
      if ((a7 & 2) == 0)
        -[_LSSpringBoardCall setClientXPCConnection:](v24, "setClientXPCConnection:", v19);
      -[_LSSpringBoardCall setCallCompletionHandlerWhenFullyComplete:](v24, "setCallCompletionHandlerWhenFullyComplete:", (a7 >> 2) & 1);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = ___ZL31_LSServer_OpenApplicationCommonP8NSStringP8BSActionbP9LSAppLinkP19_LSAppLinkOpenStateP15NSXPCConnectionmP12NSDictionaryIS0_P11objc_objectEU13block_pointerFvbP7NSErrorE_block_invoke;
      v29[3] = &unk_1E103FE30;
      v30 = v21;
      -[_LSSpringBoardCall callWithCompletionHandler:](v24, "callWithCompletionHandler:", v29);

    }
    else if (v21)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 45, (uint64_t)"_LSServer_OpenApplicationCommon", 1235, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v27);

    }
  }
  else if (v21)
  {
    v31 = *MEMORY[0x1E0CB2938];
    v32[0] = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSServer_OpenApplicationCommon", 1230, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v26);

  }
  objc_autoreleasePoolPop(v22);

}

void sub_182990D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void _LSServer_OpenUserActivity(void *a1, void *a2, void *a3, char a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  char v57;

  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = v18;
  v46 = v20;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v45 = a10;
  if (!(v16 | v17))
  {
    v32 = v22;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSServer_OpenUserActivity(NSUUID *__strong, NSData *__strong, NSString *__strong, BOOL, NSString *__strong, LSAppLink *__strong, _LSAppLinkOpenState *__strong, NSDictionary<NSString *,id> *__strong, NSXPCConnection *__strong, __strong _LSDOpenServiceCompletionHandler)");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("LSOpenOperation.mm"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuidOrNil != nil || activityDataOrNil != nil"));

    v22 = v32;
  }
  v25 = v46;
  if (!v21)
  {
    v35 = v22;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSServer_OpenUserActivity(NSUUID *__strong, NSData *__strong, NSString *__strong, BOOL, NSString *__strong, LSAppLink *__strong, _LSAppLinkOpenState *__strong, NSDictionary<NSString *,id> *__strong, NSXPCConnection *__strong, __strong _LSDOpenServiceCompletionHandler)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("LSOpenOperation.mm"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activityType != nil"));

    v25 = v46;
    v22 = v35;
    if (v19)
      goto LABEL_5;
LABEL_7:
    v38 = v22;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSServer_OpenUserActivity(NSUUID *__strong, NSData *__strong, NSString *__strong, BOOL, NSString *__strong, LSAppLink *__strong, _LSAppLinkOpenState *__strong, NSDictionary<NSString *,id> *__strong, NSXPCConnection *__strong, __strong _LSDOpenServiceCompletionHandler)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("LSOpenOperation.mm"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != nil"));

    v25 = v46;
    v22 = v38;
    goto LABEL_5;
  }
  if (!v19)
    goto LABEL_7;
LABEL_5:
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = ___LSServer_OpenUserActivity_block_invoke;
  v47[3] = &unk_1E10446C0;
  v43 = (id)v16;
  v48 = v43;
  v42 = (id)v17;
  v49 = v42;
  v41 = v21;
  v50 = v41;
  v26 = v19;
  v51 = v26;
  v57 = a4;
  v27 = v25;
  v52 = v27;
  v28 = v22;
  v53 = v28;
  v29 = v24;
  v54 = v29;
  v30 = v23;
  v55 = v30;
  v31 = v45;
  v56 = v31;
  _LSAsyncOpenContext(v47);

}

void sub_182991138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_182991594(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

Class initFBSOpenApplicationService(void)
{
  Class result;

  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  result = objc_getClass("FBSOpenApplicationService");
  classFBSOpenApplicationService = (uint64_t)result;
  getFBSOpenApplicationServiceClass = (uint64_t (*)(void))FBSOpenApplicationServiceFunction;
  return result;
}

{
  Class result;

  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  result = objc_getClass("FBSOpenApplicationService");
  classFBSOpenApplicationService = (uint64_t)result;
  getFBSOpenApplicationServiceClass = (uint64_t (*)(void))FBSOpenApplicationServiceFunction;
  return result;
}

id FBSOpenApplicationServiceFunction(void)
{
  return (id)classFBSOpenApplicationService;
}

{
  return (id)classFBSOpenApplicationService;
}

void ___ZL19_LSAsyncOpenContextU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD v3[4];
  id v4;

  _LSServer_DatabaseExecutionContext();
  v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = ___ZL19_LSAsyncOpenContextU13block_pointerFvvE_block_invoke_2;
  v3[3] = &unk_1E1041740;
  v4 = *(id *)(a1 + 32);
  -[LSDBExecutionContext syncRead:](v2, v3);

}

void sub_182991758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t ___ZL19_LSAsyncOpenContextU13block_pointerFvvE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZL24_LSOpenOperationGetQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS open operation queue", v2);
  v1 = (void *)_LSOpenOperationGetQueue(void)::result;
  _LSOpenOperationGetQueue(void)::result = (uint64_t)v0;

}

void ___ZL23_LSOpenOperationPerformP5NSURLP12NSFileHandleP8NSStringbS4_P12NSDictionaryIS4_P11objc_objectES9_PU42objcproto31LSOpenResourceOperationDelegate11objc_objectP15NSXPCConnectionU13block_pointerFvbP7NSErrorE_block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(a1[4], "openResourceOperation:didFinishCopyingResource:", 0, v5);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZL23_LSOpenOperationPerformP5NSURLP12NSFileHandleP8NSStringbS4_P12NSDictionaryIS4_P11objc_objectES9_PU42objcproto31LSOpenResourceOperationDelegate11objc_objectP15NSXPCConnectionU13block_pointerFvbP7NSErrorE_block_invoke_2;
    v7[3] = &unk_1E1044708;
    v8 = a1[5];
    v9 = v5;
    v10 = a1[6];
    v11 = a1[7];
    v12 = a1[8];
    v13 = a1[9];
    _LSAsyncOpenContext(v7);

  }
  else
  {
    (*((void (**)(void))a1[9] + 2))();
  }

}

void sub_1829918E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void ___ZL23_LSOpenOperationPerformP5NSURLP12NSFileHandleP8NSStringbS4_P12NSDictionaryIS4_P11objc_objectES9_PU42objcproto31LSOpenResourceOperationDelegate11objc_objectP15NSXPCConnectionU13block_pointerFvbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _LSSpringBoardCall *v3;
  id v4;

  _LSGetOptionsDictionaryContainingSourceApplication(*(void **)(a1 + 32), 0, *(void **)(a1 + 40), 0, 0, 0, 0, *(void **)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), getFBSOpenApplicationOptionKeyPayloadURL());
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, getFBSOpenApplicationOptionKeyPayloadAnnotation());
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], getFBSOpenApplicationOptionKeyActivateSuspended());
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], getFBSOpenApplicationOptionKeyDocumentOpen4LS());
  v3 = objc_alloc_init(_LSSpringBoardCall);
  -[_LSSpringBoardCall setBundleIdentifier:](v3, "setBundleIdentifier:", *(_QWORD *)(a1 + 64));
  -[_LSSpringBoardCall setLaunchOptions:](v3, "setLaunchOptions:", v4);
  -[_LSSpringBoardCall setClientXPCConnection:](v3, "setClientXPCConnection:", *(_QWORD *)(a1 + 32));
  -[_LSSpringBoardCall setCallCompletionHandlerWhenFullyComplete:](v3, "setCallCompletionHandlerWhenFullyComplete:", 0);
  -[_LSSpringBoardCall callWithCompletionHandler:](v3, "callWithCompletionHandler:", *(_QWORD *)(a1 + 72));

}

void sub_182991A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id _LSGetOptionsDictionaryContainingSourceApplication(void *a1, void *a2, void *a3, unsigned int a4, void *a5, void *a6, int a7, void *a8)
{
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  char v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  BOOL v56;
  NSObject *v57;
  void *v58;
  BOOL v59;
  void *v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  id v69;
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v64 = a1;
  v65 = a2;
  v63 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v62 = v16;
  if (v16)
  {
    v17 = objc_msgSend(v16, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;
  if (v14 | v15)
  {
LABEL_9:
    if (!a7)
      goto LABEL_16;
    goto LABEL_10;
  }
  v19 = objc_opt_class();
  objc_msgSend(v18, "objectForKey:", CFSTR("_LSAppLinkOpenStateLaunchOptionKey"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v19 || !v20 || (objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (unint64_t)v21;
    goto LABEL_9;
  }

  v15 = 0;
  if (!a7)
    goto LABEL_16;
LABEL_10:
  if (v15)
  {
    objc_msgSend((id)v15, "openConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "frontBoardOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && objc_msgSend(v23, "count"))
    {
      objc_msgSend(v18, "addEntriesFromDictionary:", v23);
      objc_msgSend(v18, "removeObjectForKey:", getFBSOpenApplicationOptionKeyPayloadIsValid4LS());
      LOBYTE(a7) = 0;
    }
    else
    {
      LOBYTE(a7) = 1;
    }

  }
LABEL_16:
  objc_msgSend(v18, "removeObjectForKey:", CFSTR("_LSAppLinkOpenStateLaunchOptionKey"));
  if (v65 || v14 || v15)
  {
    if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    {
      FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
      if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
      {
LABEL_49:
        FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
        if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
          goto LABEL_53;
        goto LABEL_50;
      }
    }
    if (v65 && getFBSOpenApplicationOptionKeyActions())
    {
      v70[0] = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, getFBSOpenApplicationOptionKeyActions());

    }
    if (v14 && getFBSOpenApplicationOptionKeyAppLink4LS())
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, getFBSOpenApplicationOptionKeyAppLink4LS());
    if (v15)
    {
      v25 = (id)v15;
      objc_msgSend(v25, "browserState");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = getFBSOpenApplicationOptionKeyBrowserAppLinkState4LS() == 0;

        if (!v27)
        {
          objc_msgSend(v25, "browserState");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, getFBSOpenApplicationOptionKeyBrowserAppLinkState4LS());

        }
      }
      objc_msgSend(v25, "openConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "targetConnectionEndpoint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LSTargetBSServiceConnectionEndpointKey"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31 == 0;

        if (v32)
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v30, CFSTR("LSTargetBSServiceConnectionEndpointKey"));
      }
      objc_msgSend(v25, "openConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "clickAttribution");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        if (getUISOpenApplicationOptionClickAttribution())
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", getUISOpenApplicationOptionClickAttribution());
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35 == 0;

          if (v36)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, getUISOpenApplicationOptionClickAttribution());
        }
      }
      objc_msgSend(v25, "openConfiguration");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "pasteSharingToken");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        if (getUISOpenApplicationOptionPasteSharingToken())
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", getUISOpenApplicationOptionPasteSharingToken());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39 == 0;

          if (v40)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v38, getUISOpenApplicationOptionPasteSharingToken());
        }
      }

    }
    v41 = a7 ^ 1;
    if (!v14)
      v41 = 1;
    if ((v41 & 1) == 0 && getFBSOpenApplicationOptionKeyPayloadIsValid4LS())
      objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], getFBSOpenApplicationOptionKeyPayloadIsValid4LS());
  }
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    goto LABEL_49;
LABEL_50:
  if (v65)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v42, CFSTR("__UserActivity4LS"));

  }
  else
  {
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("__UserActivity4LS"));
  }
LABEL_53:
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("__PayloadOptions"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43 == 0;

  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v46)
      goto LABEL_64;
LABEL_57:
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v46, CFSTR("__PayloadOptions"));
    if (!v64)
      goto LABEL_64;
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47 == 0;

    if (!v48)
    {
      objc_msgSend(v64, "_xpcConnection");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = _LSCheckEntitlementForXPCConnection(v49, CFSTR("com.apple.private.launchservices.canspecifysourceapplication")) == 0;

      if (!v50)
        goto LABEL_64;
      objc_msgSend(v46, "removeObjectForKey:", CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));
    }
    objc_msgSend(v64, "_xpcConnection");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)_LSCopyBundleIdentifierForXPCConnection(v51, 0);

    if (v52)
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v52, CFSTR("UIApplicationLaunchOptionsSourceApplicationKey"));

    goto LABEL_64;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("__PayloadOptions"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "mutableCopy");

  if (v46)
    goto LABEL_57;
LABEL_64:
  if (getUISOpenApplicationOptionClickAttribution())
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", getUISOpenApplicationOptionClickAttribution());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53 == 0;

    if (!v54)
    {
      if (!v63)
        goto LABEL_70;
      objc_msgSend(v63, "scheme");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55 == 0;

      if (v56)
        goto LABEL_70;
      objc_msgSend(v63, "scheme");
      v57 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject caseInsensitiveCompare:](v57, "caseInsensitiveCompare:", CFSTR("http")))
      {
LABEL_72:

        goto LABEL_73;
      }
      objc_msgSend(v63, "scheme");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "caseInsensitiveCompare:", CFSTR("https")) == 0;

      if (!v59)
      {
LABEL_70:
        objc_msgSend(v18, "removeObjectForKey:", getUISOpenApplicationOptionClickAttribution());
        _LSDefaultLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109379;
          v67 = objc_msgSend(v64, "processIdentifier");
          v68 = 2113;
          v69 = v63;
          _os_log_impl(&dword_182882000, v57, OS_LOG_TYPE_DEFAULT, "pid %i not allowed to set click attribution option for URL %{private}@.", buf, 0x12u);
        }
        goto LABEL_72;
      }
    }
  }
LABEL_73:

  return v18;
}

void sub_182992234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke_cold_1();

  MEMORY[0x186DAF214]();
}

void sub_182992464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke_126(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138477827;
      v9 = v7;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Set default handler to %{private}@", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke_cold_1();
  }

  MEMORY[0x186DAF214]();
}

void sub_182992574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t initFBSOpenApplicationOptionKeyPayloadIsValid4LS(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyPayloadIsValid4LS");
  constantFBSOpenApplicationOptionKeyPayloadIsValid4LS = result;
  getFBSOpenApplicationOptionKeyPayloadIsValid4LS = FBSOpenApplicationOptionKeyPayloadIsValid4LSFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyPayloadIsValid4LSFunction(void)
{
  return constantFBSOpenApplicationOptionKeyPayloadIsValid4LS;
}

uint64_t initFBSOpenApplicationOptionKeyActions(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyActions");
  constantFBSOpenApplicationOptionKeyActions = result;
  getFBSOpenApplicationOptionKeyActions = FBSOpenApplicationOptionKeyActionsFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyActionsFunction(void)
{
  return constantFBSOpenApplicationOptionKeyActions;
}

uint64_t initFBSOpenApplicationOptionKeyAppLink4LS(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyAppLink4LS");
  constantFBSOpenApplicationOptionKeyAppLink4LS = result;
  getFBSOpenApplicationOptionKeyAppLink4LS = FBSOpenApplicationOptionKeyAppLink4LSFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyAppLink4LSFunction(void)
{
  return constantFBSOpenApplicationOptionKeyAppLink4LS;
}

uint64_t initFBSOpenApplicationOptionKeyBrowserAppLinkState4LS(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyBrowserAppLinkState4LS");
  constantFBSOpenApplicationOptionKeyBrowserAppLinkState4LS = result;
  getFBSOpenApplicationOptionKeyBrowserAppLinkState4LS = FBSOpenApplicationOptionKeyBrowserAppLinkState4LSFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyBrowserAppLinkState4LSFunction(void)
{
  return constantFBSOpenApplicationOptionKeyBrowserAppLinkState4LS;
}

uint64_t initUISOpenApplicationOptionClickAttribution(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)UIKitServicesLibrary(void)::frameworkLibrary;
  if (!UIKitServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/UIKitServices.framework/UIKitServices", 2);
    UIKitServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "UISOpenApplicationOptionClickAttribution");
  constantUISOpenApplicationOptionClickAttribution = result;
  getUISOpenApplicationOptionClickAttribution = UISOpenApplicationOptionClickAttributionFunction;
  return result;
}

uint64_t UISOpenApplicationOptionClickAttributionFunction(void)
{
  return constantUISOpenApplicationOptionClickAttribution;
}

uint64_t initUISOpenApplicationOptionPasteSharingToken(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)UIKitServicesLibrary(void)::frameworkLibrary;
  if (!UIKitServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/UIKitServices.framework/UIKitServices", 2);
    UIKitServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "UISOpenApplicationOptionPasteSharingToken");
  constantUISOpenApplicationOptionPasteSharingToken = result;
  getUISOpenApplicationOptionPasteSharingToken = UISOpenApplicationOptionPasteSharingTokenFunction;
  return result;
}

uint64_t UISOpenApplicationOptionPasteSharingTokenFunction(void)
{
  return constantUISOpenApplicationOptionPasteSharingToken;
}

uint64_t initFBSOpenApplicationOptionKeyPayloadAnnotation(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyPayloadAnnotation");
  constantFBSOpenApplicationOptionKeyPayloadAnnotation = result;
  getFBSOpenApplicationOptionKeyPayloadAnnotation = FBSOpenApplicationOptionKeyPayloadAnnotationFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyPayloadAnnotationFunction(void)
{
  return constantFBSOpenApplicationOptionKeyPayloadAnnotation;
}

uint64_t initFBSOpenApplicationOptionKeyActivateSuspended(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyActivateSuspended");
  constantFBSOpenApplicationOptionKeyActivateSuspended = result;
  getFBSOpenApplicationOptionKeyActivateSuspended = FBSOpenApplicationOptionKeyActivateSuspendedFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyActivateSuspendedFunction(void)
{
  return constantFBSOpenApplicationOptionKeyActivateSuspended;
}

uint64_t initFBSOpenApplicationOptionKeyDocumentOpen4LS(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyDocumentOpen4LS");
  constantFBSOpenApplicationOptionKeyDocumentOpen4LS = result;
  getFBSOpenApplicationOptionKeyDocumentOpen4LS = FBSOpenApplicationOptionKeyDocumentOpen4LSFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyDocumentOpen4LSFunction(void)
{
  return constantFBSOpenApplicationOptionKeyDocumentOpen4LS;
}

void ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke(uint64_t a1)
{
  _LSAppLinkOpenState *v2;
  void *v3;
  void *v4;
  _LSOpenConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_alloc_init(_LSAppLinkOpenState);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _LSTryUniversalLink(NSURL *__strong, NSString *__strong, NSDictionary<NSString *,id> *__strong, NSXPCConnection *__strong, void (^__strong)(BOOL))_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("LSOpenOperation.mm"), 962, CFSTR("failed to create universal link state object"));

  }
  -[_LSAppLinkOpenState setURL:](v2, "setURL:", *(_QWORD *)(a1 + 32));
  -[_LSAppLinkOpenState setXPCConnection:](v2, "setXPCConnection:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("LSBlockUntilComplete"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("ReferrerURL"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("LSTargetBSServiceConnectionEndpointKey"));
    if (getUISOpenApplicationOptionClickAttribution())
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, getUISOpenApplicationOptionClickAttribution());
    v5 = objc_alloc_init(_LSOpenConfiguration);
    -[_LSOpenConfiguration setFrontBoardOptions:](v5, "setFrontBoardOptions:", v4);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("ReferrerURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSOpenConfiguration setReferrerURL:](v5, "setReferrerURL:", v6);

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("LSTargetBSServiceConnectionEndpointKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSOpenConfiguration setTargetConnectionEndpoint:](v5, "setTargetConnectionEndpoint:", v7);

    -[_LSAppLinkOpenState setOpenConfiguration:](v2, "setOpenConfiguration:", v5);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke_2;
  v10[3] = &unk_1E103FE30;
  v11 = *(id *)(a1 + 56);
  +[LSAppLink _openWithAppLink:state:completionHandler:](LSAppLink, "_openWithAppLink:state:completionHandler:", 0, v2, v10);

}

void sub_182992B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke_2(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke_3;
    v2[3] = &unk_1E1043AB0;
    v3 = *(id *)(a1 + 32);
    _LSAsyncOpenContext(v2);

  }
}

void sub_182992C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZL19_LSTryUniversalLinkP5NSURLP8NSStringP12NSDictionaryIS2_P11objc_objectEP15NSXPCConnectionU13block_pointerFvbE_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void ___ZL31_LSServer_OpenApplicationCommonP8NSStringP8BSActionbP9LSAppLinkP19_LSAppLinkOpenStateP15NSXPCConnectionmP12NSDictionaryIS0_P11objc_objectEU13block_pointerFvbP7NSErrorE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    if (v6)
    {
      _LSDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        softLinkFBSOpenApplicationErrorCodeToString(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "application launch failed - received error %@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_182992D90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t initFBSOpenApplicationErrorCodeToString(uint64_t a1)
{
  void *v2;

  v2 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  softLinkFBSOpenApplicationErrorCodeToString = (uint64_t (*)(uint64_t))dlsym(v2, "FBSOpenApplicationErrorCodeToString");
  return softLinkFBSOpenApplicationErrorCodeToString(a1);
}

Class initUIActivityContinuationAction(void)
{
  Class result;

  if (!UIKitLibrary(void)::frameworkLibrary)
    UIKitLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 2);
  result = objc_getClass("UIActivityContinuationAction");
  classUIActivityContinuationAction = (uint64_t)result;
  getUIActivityContinuationActionClass = (uint64_t (*)(void))UIActivityContinuationActionFunction;
  return result;
}

id UIActivityContinuationActionFunction(void)
{
  return (id)classUIActivityContinuationAction;
}

uint64_t _LSPersistentIdentifierCompare(void *a1, void *a2)
{
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const unsigned __int8 *v8;
  id v9;
  const unsigned __int8 *v10;
  LaunchServices::PersistentIdentifier *v11;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  LaunchServices::PersistentIdentifier *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v22;
  int v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const unsigned __int8 *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const unsigned __int8 *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "length");
  v5 = objc_msgSend(a2, "length");
  v6 = 0;
  if (v4 >= 0x1C && v4 == v5)
  {
    v7 = objc_retainAutorelease(a1);
    v8 = (const unsigned __int8 *)objc_msgSend(v7, "bytes");
    v9 = objc_retainAutorelease(a2);
    v10 = (const unsigned __int8 *)objc_msgSend(v9, "bytes");
    v11 = (LaunchServices::PersistentIdentifier *)memcmp(v8, v10, v4);
    if (!(_DWORD)v11)
    {
      LaunchServices::PersistentIdentifier::getLog(v11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        _LSPersistentIdentifierCompare_cold_1();
      v6 = 100;
      goto LABEL_13;
    }
    if (*v8 == *v10)
    {
      v12 = v8 + 12;
      v13 = v10 + 12;
      v14 = (LaunchServices::PersistentIdentifier *)uuid_compare(v12, v10 + 12);
      v15 = (int)v14;
      LaunchServices::PersistentIdentifier::getLog(v14);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (!v15)
      {
        if (v17)
          _LSPersistentIdentifierCompare_cold_2();
        v6 = 200;
        goto LABEL_13;
      }
      if (v17)
      {
        v24 = 134219266;
        v25 = v7;
        v26 = 2048;
        v27 = v9;
        v28 = 1040;
        v29 = 16;
        v30 = 2096;
        v31 = v12;
        v32 = 1040;
        v33 = 16;
        v34 = 2096;
        v35 = v13;
        v18 = "Persistent identifiers %p and %p have different databases (%{uuid_t}.16P vs. %{uuid_t}.16P)";
        v19 = v16;
        v20 = 54;
LABEL_19:
        _os_log_debug_impl(&dword_182882000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v24, v20);
      }
    }
    else
    {
      LaunchServices::PersistentIdentifier::getLog(v11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v22 = *v8;
        v23 = *v10;
        v24 = 134218752;
        v25 = v7;
        v26 = 2048;
        v27 = v9;
        v28 = 1024;
        v29 = v22;
        v30 = 1024;
        LODWORD(v31) = v23;
        v18 = "Persistent identifiers %p and %p have different versions (%u vs. %u)";
        v19 = v16;
        v20 = 34;
        goto LABEL_19;
      }
    }
    v6 = 0;
LABEL_13:

  }
  return v6;
}

id LaunchServices::PersistentIdentifier::getLog(LaunchServices::PersistentIdentifier *this)
{
  if (LaunchServices::PersistentIdentifier::getLog(void)::once != -1)
    dispatch_once(&LaunchServices::PersistentIdentifier::getLog(void)::once, &__block_literal_global_54);
  return (id)LaunchServices::PersistentIdentifier::getLog(void)::result;
}

__CFString *_LSPersistentIdentifierGetDebugDescription(void *a1)
{
  unint64_t v2;
  unint64_t v3;
  id v4;
  unsigned __int8 *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  char out[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 0x1C)
  {
    v10 = 0;
  }
  else
  {
    v3 = v2;
    v4 = objc_retainAutorelease(a1);
    v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
    memset(out, 0, 37);
    uuid_unparse(v5 + 12, out);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<LSPersistentIdentifier %p> { v = %u, t = 0x%llx, u = 0x%llx, db = %s"), v4, *v5, *((unsigned int *)v5 + 2), *((unsigned int *)v5 + 1), out);
    v7 = v3 - 28;
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v5 + 28, v7, 0);
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), v9);

    }
    objc_msgSend(v6, "appendString:", CFSTR(" }"));
    v10 = (__CFString *)objc_msgSend(v6, "copy");

  }
  if (v10)
    v11 = v10;
  else
    v11 = &stru_1E10473A0;
  v12 = v11;

  return v12;
}

void sub_182993268(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id _LSPersistentIdentifierGetKnowledgeUUIDInternal(void *a1)
{
  uint64_t v2;
  void *v4;
  void *v5;

  if ((unint64_t)objc_msgSend(a1, "length") <= 0x1B)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUUID *_LSPersistentIdentifierGetKnowledgeUUIDInternal(const __strong LSPersistentIdentifier _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("LSPersistentIdentifier.mm"), 102, CFSTR("persistent identifier of length %zu is too short to extract database UUID!"), objc_msgSend(a1, "length"));

  }
  v2 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v2 + 12);
}

void sub_182993364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _LSPersistentIdentifierGetKnowledgeUUID4CoreDevice(void *a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(a1, "length") < 0x1C)
  {
    v2 = 0;
  }
  else
  {
    _LSPersistentIdentifierGetKnowledgeUUIDInternal(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _LSPersistentIdentifierGetSequenceNumber4CoreDevice(void *a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(a1, "length") < 0x24)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", _LSApplicationRecordPersistentIdentifierGetSequenceNumberInternal(a1));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void ___ZN14LaunchServices20PersistentIdentifierL6getLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "record-pi");
  v1 = (void *)LaunchServices::PersistentIdentifier::getLog(void)::result;
  LaunchServices::PersistentIdentifier::getLog(void)::result = (uint64_t)v0;

}

uint64_t _LSPlistAdd(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x186DAE7A0]();
  v5 = 0;
  if (a1 && a2)
  {
    if (_NSIsNSDictionary())
    {
      _LSPlistCompact(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "length");
        objc_msgSend(objc_retainAutorelease(v7), "bytes");
        v5 = CSStoreAllocUnitWithData();
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  objc_autoreleasePoolPop(v4);
  return v5;
}

void sub_18299352C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSPlistRemove(uint64_t result, int a2)
{
  if (result)
  {
    if (a2)
      return CSStoreFreeUnit();
  }
  return result;
}

void _LSPlistGetVisualizationFunctions(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = LaunchServices::PropertyLists::display;
  a1[2] = 0;
}

BOOL LaunchServices::PropertyLists::display(LaunchServices::PropertyLists *this, LSContext *a2, uint64_t a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;

  _LSPlistGet(*(_QWORD *)this, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPlistDataGetDictionary(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  if (v10)
  {
    objc_msgSend(v10, "removeObjectForKey:", *MEMORY[0x1E0C9AAD0]);
    v11 = objc_msgSend(v10, "count");
    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1616), a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::format(a4, 0, CFSTR("%lu values (%@)"), v11, v12);

    objc_msgSend(v10, "description");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (v13)
      CSStore2::AttributedStringWriter::string(a4, v13);

  }
  return v10 != 0;
}

void sub_1829936A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _LSPlistCompact(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v9;

  if (a1)
  {
    v2 = (void *)MEMORY[0x186DAE7A0]();
    v9 = 0;
    v3 = (void *)_LSPlistCreateTransformed(a1, (uint64_t)_LSPlistCompactString, &v9);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", objc_msgSend(v4, "length") + 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendBytes:length:", &_LSPlistCompactedMarker, 4);
      objc_msgSend(v6, "appendData:", v5);
      v7 = objc_msgSend(v6, "copy");

      v5 = (void *)v7;
    }

    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_1829937D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18299388C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _LSGetPluginNotificationAndIconCacheQueue()
{
  if (_LSGetPluginNotificationAndIconCacheQueue::once != -1)
    dispatch_once(&_LSGetPluginNotificationAndIconCacheQueue::once, &__block_literal_global_56);
  return (id)_LSGetPluginNotificationAndIconCacheQueue::result;
}

void LSPluginSendNotification(void *a1, uint64_t a2, const void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD v7[6];

  v5 = a1;
  if (CFDictionaryGetCount((CFDictionaryRef)a3) >= 1 && -[_LSDatabase isSeeded]((uint64_t)v5))
  {
    _LSDatabaseCommit((uint64_t)v5);
    CFRetain(a3);
    _LSGetPluginNotificationAndIconCacheQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __LSPluginSendNotification_block_invoke;
    v7[3] = &__block_descriptor_48_e5_v8__0l;
    v7[4] = a2;
    v7[5] = a3;
    dispatch_async(v6, v7);

  }
}

void sub_182993A40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSPluginAddInfoToPayloadDict(void *a1, __CFDictionary *a2, int a3, uint64_t a4, int a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  const void *v16;
  id v17;
  uint64_t v18;
  __CFDictionary *Mutable;
  const void *v20;
  const void *v21;
  const void *v22;
  __int128 v23;
  CFStringRef v24;
  void *v25;
  _BOOL4 v26;
  _OWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = v8;
  if (a5)
  {
    v10 = v8;
    if (_LSGetPlugin((uint64_t)v10, a3))
    {
      v11 = (void *)_CSStringCopyCFString();
      if (_LSIsNewsWidgetBundleIdentifier(v11))
      {
        +[LSApplicationRestrictionsManager sharedInstance]();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[LSApplicationRestrictionsManager isAppExtensionRestricted:]((_BOOL8)v12, v11);

        if (v13)
        {
          _LSDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v27[0]) = 138412290;
            *(_QWORD *)((char *)v27 + 4) = v11;
            _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "plugin %@ is restricted for notifications", (uint8_t *)v27, 0xCu);
          }

          goto LABEL_33;
        }
      }

    }
  }
  v15 = v9;
  if (_LSGetPlugin((uint64_t)v15, a3))
    v16 = (const void *)_CSStringCopyCFString();
  else
    v16 = 0;

  v17 = v15;
  v18 = _LSGetPlugin((uint64_t)v17, a3);
  if (v18)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v20 = (const void *)_CSStringCopyCFString();
    v21 = (const void *)_CSStringCopyCFString();
    v22 = (const void *)_CSStringCopyCFString();
    v23 = *(_OWORD *)(v18 + 44);
    v27[0] = *(_OWORD *)(v18 + 28);
    v27[1] = v23;
    v24 = _LSVersionNumberCopyStringRepresentation(v27);
    _LSAliasGetPath(v17, *(_DWORD *)v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
      CFDictionaryAddValue(Mutable, CFSTR("_LSBundlePath"), v25);

    if (v20)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0C9AE78], v20);
      CFRelease(v20);
    }
    if (v21)
    {
      CFDictionaryAddValue(Mutable, CFSTR("NSExtensionIdentifier"), v21);
      CFRelease(v21);
    }
    if (v22)
    {
      CFDictionaryAddValue(Mutable, CFSTR("LSEffectiveIdentifier"), v22);
      CFRelease(v22);
    }
    if (v24)
    {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0C9AE90], v24);
      CFRelease(v24);
    }

    v26 = Mutable != 0;
    if (v16 && Mutable)
    {
      CFDictionaryAddValue(a2, v16, Mutable);
      v26 = 1;
    }
    else if (!v16)
    {
      goto LABEL_31;
    }
  }
  else
  {

    if (!v16)
      goto LABEL_33;
    Mutable = 0;
    v26 = 0;
  }
  CFRelease(v16);
LABEL_31:
  if (v26)
    CFRelease(Mutable);
LABEL_33:

}

void sub_182993E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _LSPluginAdd(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  v4 = v3;
  if (v3 && *((_QWORD *)v3 + 1))
  {
    *(_DWORD *)(a2 + 24) = (int)CFAbsoluteTimeGetCurrent();
    v5 = CSStoreAllocUnitWithData();
    if ((_DWORD)v5
      && !_LSBindableActivate(v4, v5)
      && (!*(_DWORD *)(a2 + 176) || !_LSBindableActivate(v4, v5))
      && !_LSBindableActivate(v4, v5)
      && !_LSBindableActivate(v4, v5))
    {
      _LSBindableActivate(v4, v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_18299401C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSPluginComparePriority_BindableComparitor()
{
  return 0;
}

void _LSPluginRemove(void *a1, int a2)
{
  id v3;
  void *v4;
  int *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, int);
  void *v25;
  id v26;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    if (a2)
    {
      if (*((_QWORD *)v3 + 1))
      {
        v5 = (int *)_LSGetPlugin((uint64_t)v3, a2);
        if (v5)
        {
          v18 = v5[24];
          v19 = *v5;
          v12 = v5[26];
          v13 = v5[28];
          v14 = v5[34];
          v15 = v5[23];
          v16 = v5[36];
          v17 = v5[35];
          v10 = v5[38];
          v11 = v5[29];
          v9 = v5[42];
          v20 = v5[44];
          v6 = v5[58];
          _LSBindableDeactivate(v4, a2);
          if (v20)
            _LSBindableDeactivate(v4, a2);
          _LSBindableDeactivate(v4, a2);
          _LSBindableDeactivate(v4, a2);
          _CSStringRelease();
          if (v6)
          {
            v22 = MEMORY[0x1E0C809B0];
            v23 = 3221225472;
            v24 = ___LSPluginRemove_block_invoke;
            v25 = &unk_1E103FD40;
            v26 = v4;
            _CSArrayEnumerateAllValues();
            _CSArrayDispose();

          }
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _CSStringRelease();
          _LSPlistRemove((uint64_t)v4, v17);
          _LSPlistRemove((uint64_t)v4, v16);
          _LSDatabaseDisposeStringArray(v4, v15);
          _LSPlistRemove((uint64_t)v4, v14);
          if (v19)
            _LSAliasRemove(v4, v19);
          if (v18)
            _LSAliasRemove(v4, v18);
          LaunchServices::LocalizedString::Remove((LaunchServices::LocalizedString *)v4, (_LSDatabase *)v13);
          LaunchServices::LocalizedString::Remove((LaunchServices::LocalizedString *)v4, (_LSDatabase *)v12);
          LaunchServices::LocalizedString::Remove((LaunchServices::LocalizedString *)v4, (_LSDatabase *)v11);
          _LSPlistRemove((uint64_t)v4, v10);
          CSStoreFreeUnit();
          if ((v9 & 4) != 0)
          {
            v7 = (const __CFString *)_CSStringCopyCFString();
            if (v7)
            {
              v21 = 0;
              v8 = _LSPluginFindWithPlatformInfo(v4, 0, v7, 1, 0, 0, &v21, 0);
              if (v8 && (*(_DWORD *)(v8 + 168) & 0xC) == 8)
                _CSStoreWriteToUnit();
              CFRelease(v7);
            }
          }
        }
      }
    }
  }

}

void sub_18299441C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSPluginUnregister(void *a1, int a2)
{
  id v3;
  int v4;
  const void *v5;
  __CFDictionary *Mutable;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _QWORD v11[9];
  id v12;
  int v13;
  int v14;
  int v15;

  v3 = a1;
  v4 = *(_DWORD *)(_LSGetPlugin((uint64_t)v3, a2) + 224);
  v5 = (const void *)_CSStringCopyCFString();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v7 = _LSBundleGet(v3, v4);
  if (v7)
  {
    v8 = *(_DWORD *)(v7 + 476);
    if (v8)
    {
      v11[5] = MEMORY[0x1E0C809B0];
      v11[6] = 3221225472;
      v11[7] = ___LSPluginUnregister_block_invoke;
      v11[8] = &unk_1E10448B0;
      v13 = a2;
      v12 = v3;
      v14 = v8;
      v15 = v4;
      _CSArrayEnumerateAllValues();

    }
  }
  if (v5)
  {
    if (IconServicesLibrary(void)::frameworkLibrary
      || (IconServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      _LSGetPluginNotificationAndIconCacheQueue();
      v9 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = ___LSPluginUnregister_block_invoke_2;
      v11[3] = &__block_descriptor_40_e5_v8__0l;
      v11[4] = v5;
      dispatch_async(v9, v11);

    }
    else
    {
      CFRelease(v5);
    }
  }
  LSPluginAddInfoToPayloadDict(v3, Mutable, a2, 0, 0);
  _LSPluginRemove(v3, a2);
  if (Mutable)
  {
    LSPluginSendNotification(v3, (uint64_t)CFSTR("com.apple.LaunchServices.pluginsunregistered"), Mutable);
    CFRelease(Mutable);
  }

  return 0;
}

void sub_182994628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1829947A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSPluginGetVisualizationFunctions(unsigned int *(**a1)(LaunchServices::Plugins *this, LSContext *a2, int a3)@<X8>)
{
  *a1 = LaunchServices::Plugins::getSummary;
  a1[1] = (unsigned int *(*)(LaunchServices::Plugins *, LSContext *, int))LaunchServices::Plugins::display;
  a1[2] = 0;
}

unsigned int *LaunchServices::Plugins::getSummary(LaunchServices::Plugins *this, LSContext *a2, int a3)
{
  unsigned int *v4;
  int *v5;
  uint64_t v6;

  v4 = (unsigned int *)_LSGetPlugin(*(_QWORD *)this, a3);
  if (v4)
  {
    v5 = (int *)v4;
    v6 = LaunchServices::LocalizedString::Get(*(LaunchServices::LocalizedString **)this, (_LSDatabase *)v4[26]);
    if (!v6
      || (LaunchServices::LocalizedString::localizeUnsafely(v6, *(void **)this, 0),
          (v4 = (unsigned int *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = (unsigned int *)_CSStringCopyCFString();
      if (!v4)
      {
        _LSAliasGetPath(*(void **)this, *v5);
        v4 = (unsigned int *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v4;
}

BOOL LaunchServices::Plugins::display(LaunchServices::Plugins *this, LSContext *a2, unsigned int a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  unsigned int *v8;
  void *v9;
  int IsValid;
  __CFString *v11;
  __CFString *v12;
  NSString *v13;
  uint64_t v14;
  unsigned __int16 *v15;
  NSString *v16;
  NSNumber *v17;
  NSNumber *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  __int128 v23;
  __int128 v24;
  NSNumber *v25;
  NSString *v26;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  __CFString *v34;
  CSStore2::AttributedStringWriter *v35;
  __CFString *v36;
  int v37;
  char v38;
  LSVersionNumber v39;
  LSVersionNumber v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = (unsigned int *)_LSGetPlugin(*(_QWORD *)this, a3);
  if (v8)
  {
    v9 = *(void **)this;
    v36 = 0;
    IsValid = _LSPluginIsValid(v9, a3, (uint64_t)v8, 0, 0, (const __CFString **)&v36);
    v11 = v36;
    v12 = v11;
    if (!IsValid)
    {
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = ___ZN14LaunchServices7PluginsL7displayEP9LSContextjjPNS_10DumpWriterE_block_invoke;
      v33 = &unk_1E103FAD8;
      v35 = a4;
      v34 = v11;
      CSStore2::AttributedStringWriter::withWarningColors();

    }
    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1596), v8[1], 0);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(a4, CFSTR("container"), v13);

    v14 = _LSContainerGet();
    v15 = (unsigned __int16 *)v14;
    if (v14)
    {
      _LSContainerStateGetDescription(*(char *)(v14 + 2));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, CFSTR("mount state"), v16);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*v15 >> 1) & 1);
      v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::number(a4, CFSTR("isOnRootVolume"), v17);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*v15 >> 4) & 1);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::number(a4, CFSTR("isSystemManaged"), v18);

    }
    CSStore2::AttributedStringWriter::stringArray(a4, CFSTR("Mach-O UUIDs"));
    LaunchServices::DumpWriter::platform(a4, CFSTR("platform"), v8[5]);
    _LSSliceMaskWriteDescription(a4);
    _LSBundleBaseFlagsWriteDescription(a4);
    CSStore2::AttributedStringWriter::string(a4, CFSTR("identifier"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("bundleID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("effectiveID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("teamID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("name"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("displayName"));
    CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("localizedNames"));
    CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("localizedShortNames"));
    CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("localizedMicrophoneUsage"));
    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 20), v8[56], 0);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(a4, CFSTR("parent"), v19);

    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1600), *v8, 0);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(a4, CFSTR("path"), v20);

    LaunchServices::DumpWriter::directoryClass((uint64_t)a4, CFSTR("directory"), *((unsigned __int8 *)v8 + 148));
    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1600), v8[24], 0);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(a4, CFSTR("dataContainer"), v21);

    v29 = 0;
    v28 = 0;
    _LSExtensionPointFindWithStringID(*(void **)this, v8[45], v8[5], 0, &v29, &v28);
    CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1608), v29, 0);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string(a4, CFSTR("extension point ID"), v22);

    CSStore2::AttributedStringWriter::string(a4, CFSTR("raw extension point ID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("extension point name"));
    v23 = *(_OWORD *)(v8 + 11);
    *(_OWORD *)v40._opaque = *(_OWORD *)(v8 + 7);
    *(_OWORD *)&v40._opaque[16] = v23;
    LaunchServices::DumpWriter::version(a4, CFSTR("version"), &v40);
    v24 = *(_OWORD *)(v8 + 19);
    *(_OWORD *)v39._opaque = *(_OWORD *)(v8 + 15);
    *(_OWORD *)&v39._opaque[16] = v24;
    LaunchServices::DumpWriter::version(a4, CFSTR("sdkVersion"), &v39);
    CSStore2::AttributedStringWriter::string(a4, CFSTR("UUID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("CodeInfoID"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("signerOrg"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("signer identity"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8[40]);
    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number(a4, CFSTR("code signature version"), v25);

    CSStore2::AttributedStringWriter::beginFlags(a4, CFSTR("flags"));
    v37 = 255;
    v38 = 1;
    CSStore2::AttributedStringWriter::flag();
    LOBYTE(v37) = 0;
    v38 = 0;
    CSStore2::AttributedStringWriter::flag();
    LOBYTE(v37) = 0;
    v38 = 0;
    CSStore2::AttributedStringWriter::flag();
    LOBYTE(v37) = 0;
    v38 = 0;
    CSStore2::AttributedStringWriter::flag();
    LOBYTE(v37) = 0;
    v38 = 0;
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::endFlags(a4);
    if (*((_BYTE *)v8 + 149))
    {
      _LSProfileValidationStateGetVisualizationDescription(*((unsigned __int8 *)v8 + 149));
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, CFSTR("validation"), v26);

    }
    CSStore2::AttributedStringWriter::timestamp(a4, CFSTR("reg date"), (double)(int)v8[6]);
    CSStore2::AttributedStringWriter::string(a4, CFSTR("appProtectionEffectiveContainer"));
    if (v8[35])
      CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("entitlements"));
    if (v8[36])
      CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("grpContainers"));
    if (v8[34])
      CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("PKDict"));
    if (v8[45])
    {
      if (v29)
        CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("SDKData"));
      else
        CSStore2::AttributedStringWriter::string(a4, CFSTR("SDKData"), &stru_1E10473A0);
    }

  }
  return v8 != 0;
}

void sub_182994F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1829950A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t ___ZN14LaunchServices7PluginsL7displayEP9LSContextjjPNS_10DumpWriterE_block_invoke(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 40), 0, CFSTR("** invalid plugin! %@**"), *(_QWORD *)(a1 + 32));
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4_7(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_182995234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_182995344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829953C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1829954D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829955DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_182995680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_182995768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_182995A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

void sub_182995C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_182996AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t initIMMessagePayloadProviderExtensionPointName()
{
  void *v0;
  uint64_t result;

  v0 = (void *)IMSharedUtilitiesLibrary_frameworkLibrary;
  if (!IMSharedUtilitiesLibrary_frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/IMSharedUtilities.framework/IMSharedUtilities", 2);
    IMSharedUtilitiesLibrary_frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "IMMessagePayloadProviderExtensionPointName");
  constantIMMessagePayloadProviderExtensionPointName = result;
  getIMMessagePayloadProviderExtensionPointName[0] = IMMessagePayloadProviderExtensionPointNameFunction;
  return result;
}

uint64_t IMMessagePayloadProviderExtensionPointNameFunction()
{
  return constantIMMessagePayloadProviderExtensionPointName;
}

void sub_18299700C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a16, 8);

  _Unwind_Resume(a1);
}

void __pluginQueryFault_block_invoke_0()
{
  NSObject *v0;

  _LSPluginFaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __pluginQueryFault_block_invoke_cold_1_0(v0);

}

void sub_182997328(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_182997610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_182997728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  uint64_t v16;

  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1829977F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829979A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_182997A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_182997B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_182997CB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_182997DA4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_182998280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_182998470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1829984D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_182998740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id getValueForKeyFromPlugin(NSString *a1, const LSPluginData *a2, _LSDatabase *a3)
{
  NSString *v5;
  _LSDatabase *v6;
  void *v7;
  unsigned int var8;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a1;
  v6 = a3;
  if (-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("NSExtensionIdentifier"))
    || -[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("NSExtensionPointName"))
    || -[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("NSExtensionPointIdentifier"))
    || -[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.uuid")))
  {
    v7 = (void *)_CSStringCopyCFString();
    goto LABEL_6;
  }
  if (!-[NSString isEqualToString:](v5, "isEqualToString:", CFSTR("NSExtensionContainingApp")))
    goto LABEL_17;
  var8 = a2->var8;
  if (!var8)
    goto LABEL_17;
  if (!v6)
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      getValueForKeyFromPlugin(v14, v15, v16, v17, v18, v19, v20, v21);

    goto LABEL_17;
  }
  v10 = (int *)_LSBundleGet(v6, var8);
  if (!v10 || !*v10)
  {
LABEL_17:
    v7 = 0;
    goto LABEL_6;
  }
  v11 = _LSAliasCopyResolvedNode(v6, *v10, 0, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "URL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

LABEL_6:
  return v7;
}

void sub_182998918(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id getValueForKeyFromPlist(NSString *a1, NSDictionary *a2)
{
  NSString *v3;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("NSExtension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("NSExtensionAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "objectForKey:", v3), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSDictionary objectForKey:](v4, "objectForKey:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void sub_1829989F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_182998A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_182998E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41)
{
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  _Unwind_Resume(a1);
}

void sub_182998FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id __copy_helper_block_ea8_48c14_ZTS9LSContext(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_ea8_48c14_ZTS9LSContext(uint64_t a1)
{

}

void sub_18299906C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_182999170(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_182999274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL16pluginQueryFaultv_block_invoke()
{
  NSObject *v0;

  _LSPluginFaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    ___ZL16pluginQueryFaultv_block_invoke_cold_1(v0);

}

void ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke()
{
  void *v0;
  char *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v0 = (void *)misLibrary(void)::libLibrary;
  if (misLibrary(void)::libLibrary
    || (v0 = dlopen("/usr/lib/libmis.dylib", 2), (misLibrary(void)::libLibrary = (uint64_t)v0) != 0))
  {
    getkMISMinSupportedSignatureVersion_ptr(void)::ptr = (uint64_t)dlsym(v0, "kMISMinSupportedSignatureVersion");
    if (getkMISMinSupportedSignatureVersion_ptr(void)::ptr)
      return;
    v1 = dlerror();
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_2((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8);
  }
  else
  {
    v9 = dlerror();
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_1((uint64_t)v9, v2, v10, v11, v12, v13, v14, v15);
  }

}

void sub_182999648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a18, 8);

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::Add(void *a1, int a2, int a3)
{
  _DWORD *v5;
  uint64_t v6;
  uint64_t i;
  _OWORD *v8;
  _DWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
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

  v5 = a1;
  v6 = CSStoreAllocUnit();
  if ((_DWORD)v6)
  {
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v10[2] = a2;
    v10[3] = v5[26 * a3 + 58];
    v12 = 0;
    v13 = 0;
    v11 = 0;
    for (i = 10; i != 58; i += 8)
    {
      v8 = &v10[i];
      *v8 = kLSVersionNumberNull;
      v8[1] = *(_OWORD *)algn_1829FAD90;
    }
    v10[0] = CSBindableKeyMapNextKey();
    v10[1] = 1;
    _CSStringRetain();
    _CSStringRetain();
    _CSStoreWriteToUnit();
    _LSBindableActivate(v5, v6 | 1);
  }

  return v6;
}

void sub_182999B30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSHandlerPref::Remove(LSHandlerPref *this, _LSDatabase *a2)
{
  int v2;
  uint64_t Unit;
  uint64_t i;
  LSHandlerPref *v5;

  v2 = (int)a2;
  v5 = this;
  if (v5 && v2 && *((_QWORD *)v5 + 1))
  {
    Unit = CSStoreGetUnit();
    CSMapRemoveValue();
    if (_LSDatabaseFindBindingMapIndex((uint64_t)v5, *(_DWORD *)(Unit + 12)) != -1)
      _LSBindableDeactivate(v5, v2 | 1);
    _CSStringRelease();
    _CSStringRelease();
    for (i = 0; i != 24; i += 4)
      _CSStringRelease();
    CSStoreFreeUnit();
  }

}

void sub_182999C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::Get(LSHandlerPref *this, _LSDatabase *a2)
{
  if (this && (_DWORD)a2)
    return CSStoreGetUnit();
  else
    return 0;
}

uint64_t LSHandlerPref::GetOrCreateTagForContentType(void *a1, const __CFString *a2, int a3, int *a4)
{
  id v7;
  uint64_t v8;
  __CFString *FirstTag;
  int v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t StringForCFString;

  v7 = a1;
  v8 = 0;
  if (v7 && a2 && a4)
  {
    *a4 = -1;
    if (_UTTypeIdentifierIsValid(a2))
    {
      if (_UTTypeIdentifierIsDynamic(a2))
      {
        FirstTag = (__CFString *)_UTDynamicGetFirstTag(a2, CFSTR("public.filename-extension"));
        if (FirstTag)
        {
          v10 = 1;
        }
        else
        {
          FirstTag = (__CFString *)_UTDynamicGetFirstTag(a2, CFSTR("public.mime-type"));
          if (!FirstTag)
          {
            v12 = 0;
            if (*a4 == -1)
            {
              v8 = 0;
LABEL_18:

              goto LABEL_21;
            }
LABEL_14:
            if (a3)
              StringForCFString = _LSDatabaseCreateStringForCFString(v7, v12, 0);
            else
              StringForCFString = _LSDatabaseGetStringForCFString(v7, v12, 0);
            v8 = StringForCFString;
            goto LABEL_18;
          }
          v10 = 2;
        }
        *a4 = v10;
        v12 = FirstTag;
        goto LABEL_14;
      }
      *a4 = 0;
      if (a3)
        v11 = _LSDatabaseCreateStringForCFString(v7, a2, 1);
      else
        v11 = _LSDatabaseGetStringForCFString(v7, a2, 1);
      v8 = v11;
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_21:

  return v8;
}

void sub_182999E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::GetTagForContentType(void *a1, const __CFString *a2, int *a3)
{
  return LSHandlerPref::GetOrCreateTagForContentType(a1, a2, 0, a3);
}

uint64_t LSHandlerPref::CreateTagForContentType(void *a1, const __CFString *a2, int *a3)
{
  return LSHandlerPref::GetOrCreateTagForContentType(a1, a2, 1, a3);
}

uint64_t LSHandlerPref::GetOrAddHandlerPref(void *a1, int a2, int a3, int a4, _DWORD *a5)
{
  id v9;
  uint64_t v10;
  _LSDatabase *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = a1;
  _LSDatabaseEnumeratingBindingMap();
  v10 = v14[3];
  if (a4 && !v10)
  {
    v11 = (_LSDatabase *)LSHandlerPref::Add(v9, a2, a3);
    if (a5)
      *a5 = (_DWORD)v11;
    v10 = LSHandlerPref::Get((LSHandlerPref *)v9, v11);
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

void sub_182999F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13LSHandlerPref19GetOrAddHandlerPrefEP11_LSDatabasej14LSBindingMapIDhPj_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  _LSDatabase *v4;
  uint64_t v7;
  _DWORD *v8;

  v4 = (_LSDatabase *)(a3 & 0xFFFFFFFC);
  if ((a3 & 3) == 1 && (_DWORD)v4 != 0)
  {
    v7 = result;
    v8 = *(_DWORD **)(result + 48);
    if (v8)
      *v8 = (_DWORD)v4;
    result = LSHandlerPref::Get(*(LSHandlerPref **)(result + 32), v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v7 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t LSHandlerPref::GetHandlerPref(void *a1, int a2, int a3, _DWORD *a4)
{
  return LSHandlerPref::GetOrAddHandlerPref(a1, a2, a3, 0, a4);
}

void LSHandlerPref::UpdateBindingGenerationForTag(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  CSStoreGetGeneration();
  v2 = v1;
  _LSDatabaseEnumeratingBindingMap();

}

void sub_18299A090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void ___ZN13LSHandlerPref29UpdateBindingGenerationForTagEP11_LSDatabasej14LSBindingMapID_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _LSBindableSetGeneration(*(void **)(a1 + 32), a3, *(_DWORD *)(a1 + 40));
}

void LSHandlerPref::SetRoleHandlerForTag(void *a1, int a2, int a3, unsigned int a4, int a5, __int128 *a6)
{
  id v11;
  __int128 v12;
  LSVersionNumber *v13;
  unsigned int v14;
  __int128 v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v14 = 0;
  LSHandlerPref::GetOrAddHandlerPref(v11, a2, a3, 1, &v14);
  v12 = a6[1];
  v15[0] = *a6;
  v15[1] = v12;
  LSHandlerPref::SetRoleHandler((LSHandlerPref *)v11, (_LSDatabase *)v14, a4, a5, v15, v13);
  LSHandlerPref::UpdateBindingGenerationForTag(v11);

}

void sub_18299A188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSHandlerPref::SetRoleHandler(LSHandlerPref *this, _LSDatabase *a2, unsigned int a3, int a4, __int128 *a5, LSVersionNumber *a6)
{
  int v9;
  LSHandlerPref *v10;
  uint64_t Unit;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t i;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[40];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v9 = (int)a2;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = this;
  if (v10)
  {
    if (v9)
    {
      Unit = CSStoreGetUnit();
      if (Unit)
      {
        v12 = *(_OWORD *)Unit;
        v13 = *(_OWORD *)(Unit + 32);
        v37[1] = *(_OWORD *)(Unit + 16);
        v38 = v13;
        v37[0] = v12;
        v14 = *(_OWORD *)(Unit + 48);
        v15 = *(_OWORD *)(Unit + 64);
        v16 = *(_OWORD *)(Unit + 96);
        v41 = *(_OWORD *)(Unit + 80);
        v42 = v16;
        v39 = v14;
        v40 = v15;
        v17 = *(_OWORD *)(Unit + 112);
        v18 = *(_OWORD *)(Unit + 128);
        v19 = *(_OWORD *)(Unit + 160);
        v45 = *(_OWORD *)(Unit + 144);
        v46 = v19;
        v43 = v17;
        v44 = v18;
        v20 = *(_OWORD *)(Unit + 176);
        v21 = *(_OWORD *)(Unit + 192);
        v22 = *(_OWORD *)(Unit + 208);
        *(_QWORD *)&v48[32] = *(_QWORD *)(Unit + 224);
        *(_OWORD *)v48 = v21;
        *(_OWORD *)&v48[16] = v22;
        v47 = v20;
        if (a3 != -1)
        {
          v23 = 8;
          v24 = 168;
          while (1)
          {
            if (((a3 >> (v23 - 4)) & 1) != 0)
            {
              v25 = *((_DWORD *)v37 + v23);
              if (a4)
              {
                if (v25)
                {
                  if (a4 == v25)
                  {
                    v26 = a5[1];
                    v51 = *a5;
                    v52 = v26;
                    v27 = *(_OWORD *)((char *)&v37[1] + v24);
                    v49 = *(_OWORD *)((char *)v37 + v24);
                    v50 = v27;
                    if (!_LSVersionNumberCompare(&v51, &v49))
                      goto LABEL_21;
                  }
                  if (a4 == DWORD1(v38))
                  {
                    a4 = 0;
                    *a5 = kLSVersionNumberNull;
                    a5[1] = *(_OWORD *)algn_1829FAD90;
                  }
                  _CSStringRelease();
                  _CSStringRetain();
                }
                else
                {
                  if (a4 == DWORD1(v38))
                  {
                    v31 = a5[1];
                    v51 = *a5;
                    v52 = v31;
                    v32 = *(_OWORD *)((char *)&v37[1] + v24);
                    v49 = *(_OWORD *)((char *)v37 + v24);
                    v50 = v32;
                    if (!_LSVersionNumberCompare(&v51, &v49))
                      goto LABEL_21;
                  }
                  _CSStringRetain();
                }
                *((_DWORD *)v37 + v23) = a4;
                v28 = (_OWORD *)((char *)v37 + v24);
                v29 = *a5;
                v30 = a5[1];
              }
              else
              {
                if (!v25)
                {
                  a4 = 0;
                  goto LABEL_21;
                }
                _CSStringRelease();
                a4 = 0;
                *((_DWORD *)v37 + v23) = 0;
                v28 = (_OWORD *)((char *)v37 + v24);
                v29 = kLSVersionNumberNull;
                v30 = *(_OWORD *)algn_1829FAD90;
              }
              *v28 = v29;
              v28[1] = v30;
            }
LABEL_21:
            --v23;
            v24 -= 32;
            if (v23 == 3)
              goto LABEL_31;
          }
        }
        for (i = 0; i != -10; i -= 2)
        {
          if (*(_DWORD *)((char *)&v37[2] + i * 2))
          {
            _CSStringRelease();
            *(_DWORD *)((char *)&v37[2] + i * 2) = 0;
            v34 = &v37[i];
            *(_OWORD *)((char *)v34 + 168) = kLSVersionNumberNull;
            *(_OWORD *)((char *)v34 + 184) = *(_OWORD *)algn_1829FAD90;
          }
        }
        if (DWORD1(v38) != a4
          || (v51 = *(_OWORD *)&v48[8],
              v52 = *(_OWORD *)&v48[24],
              v35 = a5[1],
              v49 = *a5,
              v50 = v35,
              _LSVersionNumberCompare(&v51, &v49)))
        {
          _CSStringRelease();
          _CSStringRetain();
          DWORD1(v38) = a4;
          v36 = a5[1];
          *(_OWORD *)&v48[8] = *a5;
          *(_OWORD *)&v48[24] = v36;
        }
LABEL_31:
        DWORD1(v37[0]) = CSStoreGetGeneration() + 1;
        _CSStoreWriteToUnit();
      }
    }
  }

}

void sub_18299A4D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveHandlersForTag(void *a1, int a2, int a3)
{
  LSHandlerPref *v5;
  LSVersionNumber *v6;
  _BYTE v7[52];

  *(_QWORD *)&v7[44] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  *(_DWORD *)v7 = 0;
  if (LSHandlerPref::GetOrAddHandlerPref(v5, a2, a3, 0, v7))
  {
    memset(&v7[4], 0, 32);
    LSHandlerPref::SetRoleHandler(v5, (_LSDatabase *)*(unsigned int *)v7, 0xFFFFFFFF, 0, (__int128 *)&v7[4], v6);
    LSHandlerPref::UpdateBindingGenerationForTag(v5);
  }

}

void sub_18299A5B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveRoleHandlerForTag(void *a1, int a2, int a3, unsigned int a4)
{
  LSHandlerPref *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  char v23;
  uint64_t i;
  _OWORD v25[14];
  uint64_t v26;
  unsigned int v27;

  v7 = a1;
  v27 = 0;
  if (LSHandlerPref::GetOrAddHandlerPref(v7, a2, a3, 0, &v27))
  {
    v8 = LSHandlerPref::Get(v7, (_LSDatabase *)v27);
    if (v8)
    {
      v9 = *(_OWORD *)v8;
      v10 = *(_OWORD *)(v8 + 32);
      v25[1] = *(_OWORD *)(v8 + 16);
      v25[2] = v10;
      v25[0] = v9;
      v11 = *(_OWORD *)(v8 + 48);
      v12 = *(_OWORD *)(v8 + 64);
      v13 = *(_OWORD *)(v8 + 96);
      v25[5] = *(_OWORD *)(v8 + 80);
      v25[6] = v13;
      v25[3] = v11;
      v25[4] = v12;
      v14 = *(_OWORD *)(v8 + 112);
      v15 = *(_OWORD *)(v8 + 128);
      v16 = *(_OWORD *)(v8 + 160);
      v25[9] = *(_OWORD *)(v8 + 144);
      v25[10] = v16;
      v25[7] = v14;
      v25[8] = v15;
      v17 = *(_OWORD *)(v8 + 176);
      v18 = *(_OWORD *)(v8 + 192);
      v19 = *(_OWORD *)(v8 + 208);
      v26 = *(_QWORD *)(v8 + 224);
      v25[12] = v18;
      v25[13] = v19;
      v25[11] = v17;
      v20 = 8;
      v21 = 168;
      do
      {
        if (((a4 >> (v20 - 4)) & 1) != 0)
        {
          *((_DWORD *)v25 + v20) = 0;
          v22 = (_OWORD *)((char *)v25 + v21);
          *v22 = kLSVersionNumberNull;
          v22[1] = *(_OWORD *)algn_1829FAD90;
        }
        --v20;
        v21 -= 32;
      }
      while (v20 != 3);
      v23 = 1;
      for (i = 32; i != 12; i -= 4)
      {
        if (*(_DWORD *)((char *)v25 + i))
          v23 = 0;
      }
      if (v23)
      {
        LSHandlerPref::Remove(v7, (_LSDatabase *)v27);
      }
      else if (_CSStoreWriteToUnit())
      {
        LSHandlerPref::UpdateBindingGenerationForTag(v7);
      }
    }
  }

}

void sub_18299A754(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveRoleHandlersMatchingBundleID(LSHandlerPref *this, _LSDatabase *a2)
{
  LSHandlerPref *v2;
  LSVersionNumber *v3;
  int v4;
  unsigned int *v5;
  unsigned int *i;
  _LSDatabase *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  __n128 (*v15)(__n128 *, __n128 *);
  void (*v16)(uint64_t);
  const char *v17;
  void *__p;
  void *v19;
  uint64_t v20;
  __int128 v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x4812000000;
  v15 = __Block_byref_object_copy__39;
  v16 = __Block_byref_object_dispose__39;
  v17 = "";
  __p = 0;
  v19 = 0;
  v20 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = this;
  _CSStoreEnumerateUnits();
  if (*((_DWORD *)v9 + 6))
  {
    do
    {
      _CSStringRelease();
      v4 = *((_DWORD *)v9 + 6) - 1;
      *((_DWORD *)v9 + 6) = v4;
    }
    while (v4);
  }
  v5 = (unsigned int *)v13[6];
  for (i = (unsigned int *)v13[7]; v5 != i; ++v5)
  {
    v7 = (_LSDatabase *)*v5;
    memset(v21, 0, sizeof(v21));
    LSHandlerPref::SetRoleHandler(v2, v7, 0xFFFFFFFF, 0, v21, v3);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }

}

void sub_18299A94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  void *v29;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  if (__p)
  {
    a29 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZN13LSHandlerPref34RemoveRoleHandlersMatchingBundleIDEP11_LSDatabasej_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  char v5;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  int v14;
  char *v15;
  _DWORD *v16;
  int v17;
  int v18;
  _OWORD *v19;
  _QWORD *v20;
  char *v21;
  unint64_t v22;
  _DWORD *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  int v32;
  _OWORD v33[14];
  uint64_t v34;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = *(_OWORD *)(a3 + 208);
  v33[12] = *(_OWORD *)(a3 + 192);
  v33[13] = v7;
  v34 = *(_QWORD *)(a3 + 224);
  v8 = *(_OWORD *)(a3 + 144);
  v33[8] = *(_OWORD *)(a3 + 128);
  v33[9] = v8;
  v9 = *(_OWORD *)(a3 + 176);
  v33[10] = *(_OWORD *)(a3 + 160);
  v33[11] = v9;
  v10 = *(_OWORD *)(a3 + 80);
  v33[4] = *(_OWORD *)(a3 + 64);
  v33[5] = v10;
  v11 = *(_OWORD *)(a3 + 112);
  v33[6] = *(_OWORD *)(a3 + 96);
  v33[7] = v11;
  v12 = *(_OWORD *)(a3 + 16);
  v33[0] = *(_OWORD *)a3;
  v33[1] = v12;
  v13 = *(_OWORD *)(a3 + 48);
  v33[2] = *(_OWORD *)(a3 + 32);
  v33[3] = v13;
  while (1)
  {
    v14 = *(_DWORD *)(a1 + 56);
    v15 = (char *)v33 + 4 * v4;
    v17 = *((_DWORD *)v15 + 4);
    v16 = v15 + 16;
    if (v14 != v17)
      break;
LABEL_6:
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *v16 = 0;
    v19 = &v33[2 * v4];
    *(_OWORD *)((char *)v19 + 40) = kLSVersionNumberNull;
    *(_OWORD *)((char *)v19 + 56) = *(_OWORD *)algn_1829FAD90;
    ++v4;
    v5 = 1;
    if (v4 == 6)
    {
      if ((v6 & 1) == 0)
      {
        v20 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
        v21 = (char *)v20[7];
        v22 = v20[8];
        if ((unint64_t)v21 >= v22)
        {
          v24 = (char *)v20[6];
          v25 = (v21 - v24) >> 2;
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 62)
            abort();
          v27 = v22 - (_QWORD)v24;
          if (v27 >> 1 > v26)
            v26 = v27 >> 1;
          if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
            v28 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v28 = v26;
          if (v28)
          {
            v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v20 + 8), v28);
            v24 = (char *)v20[6];
            v21 = (char *)v20[7];
          }
          else
          {
            v29 = 0;
          }
          v30 = &v29[4 * v25];
          v31 = &v29[4 * v28];
          *(_DWORD *)v30 = a2;
          v23 = v30 + 4;
          while (v21 != v24)
          {
            v32 = *((_DWORD *)v21 - 1);
            v21 -= 4;
            *((_DWORD *)v30 - 1) = v32;
            v30 -= 4;
          }
          v20[6] = v30;
          v20[7] = v23;
          v20[8] = v31;
          if (v24)
            operator delete(v24);
        }
        else
        {
          *(_DWORD *)v21 = a2;
          v23 = v21 + 4;
        }
        v20[7] = v23;
        return;
      }
LABEL_11:
      _CSStoreWriteToUnit();
      return;
    }
  }
  while (v4 != 5)
  {
    v18 = v16[1];
    ++v16;
    ++v4;
    if (v14 == v18)
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
  if ((v5 & 1) != 0)
    goto LABEL_11;
}

uint64_t LSHandlerPref::roleHandler(LSHandlerPref *this, unsigned int a2, LSVersionNumber *a3)
{
  __int128 *v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (a2 != -1 || (v4 = (char *)this + 36, !*((_DWORD *)this + 9)))
  {
    v3 = (__int128 *)((char *)this + 168);
    v4 = (char *)this + 32;
    v5 = 5;
    while (((a2 >> (v5 - 1)) & 1) == 0 || !*(_DWORD *)v4)
    {
      v3 -= 2;
      v4 -= 4;
      if (!--v5)
      {
        if (a3)
        {
          v6 = *(_OWORD *)((char *)this + 216);
          *(_OWORD *)a3->_opaque = *(_OWORD *)((char *)this + 200);
          *(_OWORD *)&a3->_opaque[16] = v6;
        }
        v4 = (char *)this + 36;
        return *(unsigned int *)v4;
      }
    }
    if (!a3)
      return *(unsigned int *)v4;
    v7 = *v3;
    v8 = v3[1];
    goto LABEL_14;
  }
  if (a3)
  {
    v7 = *(_OWORD *)((char *)this + 200);
    v8 = *(_OWORD *)((char *)this + 216);
LABEL_14:
    *(_OWORD *)a3->_opaque = v7;
    *(_OWORD *)&a3->_opaque[16] = v8;
  }
  return *(unsigned int *)v4;
}

void LSHandlerPref::GetVisualizationFunctions(id (**a1)(LSHandlerPref **this, LSContext *a2, _LSDatabase *a3)@<X8>)
{
  *a1 = LaunchServices::HandlerPrefs::getSummary;
  a1[1] = (id (*)(LSHandlerPref **, LSContext *, _LSDatabase *))LaunchServices::HandlerPrefs::display;
  a1[2] = 0;
}

id LaunchServices::HandlerPrefs::getSummary(LSHandlerPref **this, LSContext *a2, _LSDatabase *a3)
{
  void *v3;

  v3 = (void *)LSHandlerPref::Get(*this, a3);
  if (v3)
    v3 = (void *)_CSStringCopyCFString();
  return v3;
}

BOOL LaunchServices::HandlerPrefs::display(LSHandlerPref **this, LSContext *a2, _LSDatabase *a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  int *v7;
  int BindingMapIndex;
  int v9;
  NSString *v10;
  NSString *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  uint64_t v16;
  __int128 v17;
  int v18;
  NSString *v19;
  NSString *v20;
  uint64_t i;
  NSString *v22;
  uint64_t j;
  _OWORD v25[2];
  LSVersionNumber v26;
  LSVersionNumber v27;
  unsigned int v28[4];
  __int128 v29;
  const __CFString *v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[4];
  LSVersionNumber v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (int *)LSHandlerPref::Get(*this, a3);
  if (v7)
  {
    v33[0] = xmmword_1E1044CC8;
    v33[1] = *(_OWORD *)&off_1E1044CD8;
    v33[2] = xmmword_1E1044CE8;
    v33[3] = *(_OWORD *)&off_1E1044CF8;
    BindingMapIndex = _LSDatabaseFindBindingMapIndex((uint64_t)*this, v7[3]);
    if (BindingMapIndex <= 0)
      v9 = BindingMapIndex;
    else
      v9 = 6;
    if (v9)
    {
      CSStore2::AttributedStringWriter::string(a4, *((NSString **)v33 + v9));
    }
    else
    {
      v28[0] = 0;
      _UTGetActiveTypeForIdentifier(*this, v7[2], v28);
      v10 = *(NSString **)&v33[0];
      CSStore2::AttributedStringWriter::link(a4, *((unsigned int *)*this + 8), v28[0], 0);
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, v10, v11);

    }
    v12 = v7[9];
    if (v12)
    {
LABEL_13:
      v15 = (__int128 *)(v7 + 50);
    }
    else
    {
      v13 = -168;
      v14 = 8;
      while (1)
      {
        v12 = v7[v14];
        if (v12)
          break;
        v13 += 32;
        --v14;
        if (v13 == -8)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v15 = (__int128 *)&v7[v13 / 0xFFFFFFFFFFFFFFFCLL];
    }
    v16 = 0;
    v17 = v15[1];
    v31 = *v15;
    v32 = v17;
    do
    {
      *(_OWORD *)v28 = xmmword_1E1044D08;
      v29 = xmmword_1E1044D18;
      v30 = CFSTR("importer");
      memset(&v27, 0, sizeof(v27));
      v18 = LSHandlerPref::roleHandler((LSHandlerPref *)v7, 1 << v16, &v27);
      if (v18)
      {
        if (v18 != v12)
        {
          CSStore2::AttributedStringWriter::string(a4, *(NSString **)&v28[2 * v16]);
          v35 = kLSVersionNumberNull;
          v36 = *(_OWORD *)algn_1829FAD90;
          v34 = v27;
          if (_LSVersionNumberCompare(&v35, &v34))
          {
            objc_msgSend(*(id *)&v28[2 * v16], "stringByAppendingString:", CFSTR(" (bundle ver)"));
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            v26 = v27;
            _LSVersionNumberGetStringRepresentation(&v26);
            v20 = (NSString *)objc_claimAutoreleasedReturnValue();
            CSStore2::AttributedStringWriter::string(a4, v19, v20);

          }
        }
      }
      for (i = 8; i != -2; i -= 2)

      ++v16;
    }
    while (v16 != 5);
    if (v12)
    {
      CSStore2::AttributedStringWriter::string(a4, CFSTR("all roles"));
      *(_OWORD *)v28 = kLSVersionNumberNull;
      v29 = *(_OWORD *)algn_1829FAD90;
      v35 = v31;
      v36 = v32;
      if (_LSVersionNumberCompare(v28, &v35))
      {
        v25[0] = v31;
        v25[1] = v32;
        _LSVersionNumberGetStringRepresentation(v25);
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::string(a4, CFSTR("all roles (bundle ver)"), v22);

      }
    }
    for (j = 56; j != -8; j -= 8)

  }
  return v7 != 0;
}

void sub_18299AF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  void *v35;
  uint64_t i;

  for (i = 56; i != -8; i -= 8)
  _Unwind_Resume(a1);
}

void LSHandlerPref::RemoveAll(LSHandlerPref *this, _LSDatabase *a2)
{
  LSHandlerPref *v2;
  unsigned int *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __n128 (*v8)(__n128 *, __n128 *);
  void (*v9)(uint64_t);
  const char *v10;
  void *__p;
  void *v12;
  uint64_t v13;

  v2 = this;
  v5 = 0;
  v6 = &v5;
  v7 = 0x4812000000;
  v8 = __Block_byref_object_copy__39;
  v9 = __Block_byref_object_dispose__39;
  v10 = "";
  __p = 0;
  v12 = 0;
  v13 = 0;
  _CSStoreEnumerateUnits();
  v3 = (unsigned int *)v6[6];
  v4 = (unsigned int *)v6[7];
  while (v3 != v4)
    LSHandlerPref::Remove(v2, (_LSDatabase *)*v3++);
  _Block_object_dispose(&v5, 8);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }

}

void sub_18299B0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  void *v21;

  _Block_object_dispose(&a14, 8);
  if (__p)
  {
    a21 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ___ZN13LSHandlerPref9RemoveAllEP11_LSDatabase_block_invoke(uint64_t a1, int a2)
{
  _QWORD *v3;
  char *v4;
  unint64_t v5;
  _DWORD *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;

  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (char *)v3[7];
  v5 = v3[8];
  if ((unint64_t)v4 >= v5)
  {
    v7 = (char *)v3[6];
    v8 = (v4 - v7) >> 2;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62)
      abort();
    v10 = v5 - (_QWORD)v7;
    if (v10 >> 1 > v9)
      v9 = v10 >> 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
    {
      v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v3 + 8), v11);
      v7 = (char *)v3[6];
      v4 = (char *)v3[7];
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[4 * v8];
    v14 = &v12[4 * v11];
    *(_DWORD *)v13 = a2;
    v6 = v13 + 4;
    while (v4 != v7)
    {
      v15 = *((_DWORD *)v4 - 1);
      v4 -= 4;
      *((_DWORD *)v13 - 1) = v15;
      v13 -= 4;
    }
    v3[6] = v13;
    v3[7] = v6;
    v3[8] = v14;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *(_DWORD *)v4 = a2;
    v6 = v4 + 4;
  }
  v3[7] = v6;
}

uint64_t LSHandlerPref::CopyHandlers(LSHandlerPref *this)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___ZN13LSHandlerPref12CopyHandlersEv_block_invoke;
  v5[3] = &unk_1E1044B88;
  v5[4] = &v6;
  _LSWithSecurePreferences(v5);
  v1 = v7[3];
  if (!v1)
  {
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = _CFGetEUID();
      *(_DWORD *)buf = 67109120;
      v11 = v3;
      _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "Handler prefs NOT found, will use empty array; uid = %d\n",
        buf,
        8u);
    }

    v1 = MEMORY[0x1E0C9AA60];
    v7[3] = MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v6, 8);
  return v1;
}

void sub_18299B324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18299B420(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::Load(LSHandlerPref *this, _LSDatabase *a2, const __CFArray *a3)
{
  LSHandlerPref *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFArray *v10;
  CFTypeID v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v16;
  CFTypeID v17;
  LSHandlerPref *v18;
  CFTypeID TypeID;
  __CFString *Value;
  __CFString *v21;
  int StringForCFString;
  int BindingMapIndex;
  _OWORD *v24;
  unint64_t j;
  unint64_t v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  CFTypeID v29;
  uint64_t v30;
  _OWORD *v31;
  __CFString *v32;
  __CFString *v33;
  CFTypeID v34;
  __int128 v35;
  __int128 *v36;
  unint64_t v37;
  __CFString *v38;
  CFTypeID v39;
  const __CFString *v40;
  const __CFString *v41;
  int v42;
  LSVersionNumber *v43;
  unsigned int v44;
  __int128 v45;
  CFTypeID v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  CFTypeID v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  int v55;
  CFTypeID v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  CFIndex v61;
  CFIndex v63;
  _OWORD v64[12];
  _DWORD v65[5];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  void *v83;
  id v84;
  __int128 v85[2];
  _BYTE v86[128];
  _OWORD v87[2];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = this;
  v4 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = MEMORY[0x1E0C809B0];
  v81 = 3221225472;
  v82 = ___ZN13LSHandlerPref4LoadEP11_LSDatabasePK9__CFArray_block_invoke;
  v83 = &unk_1E103FD18;
  v84 = v5;
  _CSStoreEnumerateUnits();
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v6 = v84;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v77 != v8)
          objc_enumerationMutation(v6);
        LSHandlerPref::Remove(v3, (_LSDatabase *)objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "unsignedLongLongValue"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v7);
  }

  v10 = (const __CFArray *)a2;
  objc_autoreleasePoolPop(v4);
  if (a2)
  {
    v11 = CFGetTypeID(a2);
    if (v11 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)a2);
      v13 = Count;
      if (Count >= 1)
      {
        v14 = 0;
        v61 = Count;
        do
        {
          v63 = v14;
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v14);
          v16 = ValueAtIndex;
          v65[0] = 0;
          if (ValueAtIndex)
          {
            v17 = CFGetTypeID(ValueAtIndex);
            if (v17 == CFDictionaryGetTypeID())
            {
              if (CFDictionaryContainsKey(v16, CFSTR("LSHandlerContentType")))
              {
                v18 = v3;
                *(_QWORD *)&v64[0] = v18;
                TypeID = CFStringGetTypeID();
                Value = (__CFString *)CFDictionaryGetValue(v16, CFSTR("LSHandlerContentType"));
                v21 = Value;
                if (Value
                  && CFGetTypeID(Value) == TypeID
                  && LaunchServices::BindingEvaluator::ContentTypeBindingAllowsOverride((LSContext *)v64, (LSContext *)v21, (NSString *)0xFFFFFFFFLL))
                {
                  StringForCFString = _LSDatabaseCreateStringForCFString(v18, v21, 1);
                  BindingMapIndex = 0;
                }
                else
                {
                  StringForCFString = 0;
                  BindingMapIndex = -1;
                }

LABEL_21:
                if (StringForCFString)
                {
                  LSHandlerPref::GetOrAddHandlerPref(v3, StringForCFString, BindingMapIndex, 1, v65);
                  v24 = v64;
                  for (j = 7; j > 1; --j)
                  {
                    *v24 = kLSVersionNumberNull;
                    v24[1] = *(_OWORD *)algn_1829FAD90;
                    v24 += 2;
                  }
                  if (BindingMapIndex == 5)
                    v26 = 5;
                  else
                    v26 = 0;
                  v27 = (const __CFDictionary *)CFDictionaryGetValue(v16, CFSTR("LSHandlerPreferredVersions"));
                  v28 = v27;
                  if (v27)
                  {
                    v29 = CFGetTypeID(v27);
                    if (v29 == CFDictionaryGetTypeID())
                    {
                      v30 = 0;
                      v31 = v64;
                      do
                      {
                        v32 = (__CFString *)CFDictionaryGetValue(v28, kLSHandlerRoleKeys[v30]);
                        v33 = v32;
                        if (v32)
                        {
                          v34 = CFGetTypeID(v32);
                          if (v34 == CFStringGetTypeID())
                          {
                            _LSGetVersionFromString(v33, v87);
                            v35 = v87[1];
                            *v31 = v87[0];
                            v31[1] = v35;
                          }
                        }
                        v31 += 2;
                        ++v30;
                      }
                      while (v30 != 6);
                    }
                  }
                  v73 = v64[8];
                  v74 = v64[9];
                  v75[0] = v64[10];
                  v75[1] = v64[11];
                  v69 = v64[4];
                  v70 = v64[5];
                  v71 = v64[6];
                  v72 = v64[7];
                  *(_OWORD *)&v65[1] = v64[0];
                  v66 = v64[1];
                  v36 = v75;
                  v37 = 5;
                  v67 = v64[2];
                  v68 = v64[3];
                  do
                  {
                    v38 = kLSHandlerRoleKeys[v37];
                    v39 = CFStringGetTypeID();
                    v40 = (const __CFString *)CFDictionaryGetValue(v16, v38);
                    v41 = v40;
                    if (v40 && CFGetTypeID(v40) == v39)
                    {
                      v42 = _LSDatabaseCreateStringForCFString(v3, v41, 0);
                      if (v37 == 5)
                        v44 = -1;
                      else
                        v44 = 1 << v37;
                      v45 = v36[1];
                      v85[0] = *v36;
                      v85[1] = v45;
                      LSHandlerPref::SetRoleHandler(v3, (_LSDatabase *)v65[0], v44, v42, v85, v43);
                    }
                    v36 -= 2;
                  }
                  while (v37-- > v26);
                  v10 = (const __CFArray *)a2;
                  v13 = v61;
                }
                goto LABEL_43;
              }
              if (CFDictionaryContainsKey(v16, CFSTR("LSHandlerContentTag")))
              {
                v47 = CFStringGetTypeID();
                v48 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("LSHandlerContentTagClass"));
                v49 = v48;
                if (v48)
                {
                  if (CFGetTypeID(v48) == v47)
                    v50 = v49;
                  else
                    v50 = 0;
                }
                else
                {
                  v50 = 0;
                }
                v55 = _LSDatabaseGetStringForCFString(v3, v50, 1);
                if (v55)
                {
                  BindingMapIndex = _LSDatabaseFindBindingMapIndex((uint64_t)v3, v55);
                  if (BindingMapIndex != -1)
                  {
                    v56 = CFStringGetTypeID();
                    v57 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("LSHandlerContentTag"));
                    v58 = v57;
                    if (v57)
                    {
                      if (CFGetTypeID(v57) == v56)
                        v59 = v58;
                      else
                        v59 = 0;
                    }
                    else
                    {
                      v59 = 0;
                    }
                    StringForCFString = _LSDatabaseCreateStringForCFString(v3, v59, *((unsigned __int8 *)v3 + 104 * BindingMapIndex + 236));
                    goto LABEL_21;
                  }
                }
              }
              else if (CFDictionaryContainsKey(v16, CFSTR("LSHandlerURLScheme")))
              {
                v51 = CFStringGetTypeID();
                v52 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("LSHandlerURLScheme"));
                v53 = v52;
                if (v52)
                {
                  if (CFGetTypeID(v52) == v51)
                    v54 = v53;
                  else
                    v54 = 0;
                }
                else
                {
                  v54 = 0;
                }
                StringForCFString = _LSDatabaseCreateStringForCFString(v3, v54, 1);
                BindingMapIndex = 5;
                goto LABEL_21;
              }
            }
          }
LABEL_43:
          _CSStringRelease();
          v14 = v63 + 1;
        }
        while (v63 + 1 != v13);
      }
    }
  }

  return 0;
}

void sub_18299BA28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN13LSHandlerPref4LoadEP11_LSDatabasePK9__CFArray_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void sub_18299BAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t LSHandlerPref::Save(LSHandlerPref *this, _LSDatabase *a2)
{
  LSHandlerPref *v2;
  CFMutableArrayRef Mutable;
  void *v4;
  void *v5;
  uint64_t v6;
  LSHandlerPref *v7;
  _QWORD v9[4];
  CFTypeRef cf;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  LSHandlerPref *v15;
  _QWORD *v16;
  CFTypeRef v17;
  _QWORD v18[6];
  CFTypeRef v19;

  v2 = this;
  v18[0] = 0;
  v18[1] = v18;
  v18[3] = __Block_byref_object_copy__12;
  v18[4] = __Block_byref_object_dispose__13;
  v18[2] = 0x3812000000;
  v18[5] = "";
  v19 = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static OSStatus LSHandlerPref::Save(__strong LSDatabaseRef)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("LSPrefs.mm"), 982, CFSTR("Failed to create empty CFArray."));

  }
  v6 = MEMORY[0x1E0C809B0];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3321888768;
  v13 = ___ZN13LSHandlerPref4SaveEP11_LSDatabase_block_invoke;
  v14 = &unk_1E103E260;
  v7 = v2;
  v15 = v7;
  v16 = v18;
  v17 = Mutable;
  if (Mutable)
    CFRetain(Mutable);
  _CSStoreEnumerateUnits();
  v9[0] = v6;
  v9[1] = 3321888768;
  v9[2] = ___ZN13LSHandlerPref4SaveEP11_LSDatabase_block_invoke_25;
  v9[3] = &__block_descriptor_40_ea8_32c29_ZTS10CFReleaserIP9__CFArrayE_e25_v16__0____CFDictionary__8l;
  cf = Mutable;
  if (Mutable)
    CFRetain(Mutable);
  _LSWithMutableSecurePreferences(v9);
  if (cf)
    CFRelease(cf);
  cf = 0;
  if (v17)
    CFRelease(v17);
  v17 = 0;

  _Block_object_dispose(v18, 8);
  if (v19)
    CFRelease(v19);
  if (Mutable)
    CFRelease(Mutable);

  return 0;
}

void sub_18299BCF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, CFTypeRef a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,CFTypeRef a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,CFTypeRef cf)
{
  void *v28;
  void *v29;
  void *v30;

  _Block_object_dispose(&a22, 8);
  if (cf)
    CFRelease(cf);

  _Unwind_Resume(a1);
}

CFTypeRef __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void ___ZN13LSHandlerPref4SaveEP11_LSDatabase_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v5;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  int BindingMapIndex;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  CFMutableDictionaryRef v14;
  uint64_t v15;
  __CFDictionary *v16;
  uint64_t v17;
  const void **v18;
  const void *v19;
  uint64_t v20;
  __int128 v21;
  CFStringRef v22;
  __CFDictionary *v23;
  const void *v24;
  void *value;
  _OWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a3 + 36))
  {
    v11 = 32;
    while (!*(_DWORD *)(a3 + v11))
    {
      v11 -= 4;
      if (v11 == 12)
        return;
    }
  }
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v7 = Mutable;
    BindingMapIndex = _LSDatabaseFindBindingMapIndex(*(_QWORD *)(a1 + 32), *(_DWORD *)(a3 + 12));
    v9 = (void *)_CSStringCopyCFString();
    if (!v9)
    {
LABEL_32:
      CFRelease(v7);
      return;
    }
    value = v9;
    if (BindingMapIndex == 5)
    {
      v10 = CFSTR("LSHandlerURLScheme");
    }
    else
    {
      if (BindingMapIndex)
      {
        v12 = _CSStringCopyCFString();
        if (!v12)
        {
LABEL_31:
          CFRelease(value);
          goto LABEL_32;
        }
        v13 = (const void *)v12;
        CFDictionarySetValue(v7, CFSTR("LSHandlerContentTag"), value);
        CFDictionarySetValue(v7, CFSTR("LSHandlerContentTagClass"), v13);
        CFRelease(v13);
LABEL_15:
        v14 = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(__CFDictionary **)(v15 + 48);
        if (v16 != v14)
        {
          *(_QWORD *)(v15 + 48) = v14;
          v14 = v16;
        }
        if (v14)
          CFRelease(v14);
        v17 = 0;
        v18 = (const void **)kLSHandlerRoleKeys;
        do
        {
          if (*(_DWORD *)(a3 + v17 + 16))
          {
            v19 = (const void *)_CSStringCopyCFString();
            if (!v19)
              goto LABEL_31;
            v20 = a3 + 8 * v17;
            v21 = *(_OWORD *)(v20 + 56);
            v26[0] = *(_OWORD *)(v20 + 40);
            v26[1] = v21;
            v22 = _LSVersionNumberCopyStringRepresentation(v26);
            v23 = *(__CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
            v24 = *v18;
            if (v22)
              CFDictionarySetValue(v23, *v18, v22);
            else
              CFDictionarySetValue(v23, *v18, CFSTR("-"));
            CFDictionarySetValue(v7, v24, v19);
            CFRelease(v19);
            if (v22)
              CFRelease(v22);
          }
          v17 += 4;
          ++v18;
        }
        while (v17 != 24);
        if (CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)) >= 1)
          CFDictionarySetValue(v7, CFSTR("LSHandlerPreferredVersions"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), v7);
        goto LABEL_31;
      }
      v10 = CFSTR("LSHandlerContentType");
    }
    CFDictionarySetValue(v7, v10, v9);
    goto LABEL_15;
  }
}

void sub_18299C0AC(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

CFTypeRef __copy_helper_block_ea8_48c29_ZTS10CFReleaserIP9__CFArrayE(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_ea8_48c29_ZTS10CFReleaserIP9__CFArrayE(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 48) = 0;
}

void ___ZN13LSHandlerPref4SaveEP11_LSDatabase_block_invoke_25(uint64_t a1, CFMutableDictionaryRef theDict)
{
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFDictionarySetValue(theDict, CFSTR("LSHandlers"), v2);
  else
    CFDictionaryRemoveValue(theDict, CFSTR("LSHandlers"));
}

CFTypeRef __copy_helper_block_ea8_32c29_ZTS10CFReleaserIP9__CFArrayE(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __destroy_helper_block_ea8_32c29_ZTS10CFReleaserIP9__CFArrayE(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 32) = 0;
}

void _LSHandlerPrefRemoveAllWithBundleID(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  void (*v22[4])(_QWORD, _QWORD);
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  v3 = a1;
  v4 = a2;
  v5 = (void *)os_transaction_create();
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0
    || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) == 0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke;
    v28[3] = &unk_1E1044BE0;
    v29 = v3;
    v31 = v4;
    v30 = v5;
    v10 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v28);
    v11 = &v29;
    v12 = &v31;
    v13 = &v30;
    if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      v10[2](v10);
      goto LABEL_8;
    }
    +[LSDBExecutionContext sharedServerInstance]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_31;
    v26[3] = &unk_1E1041740;
    v17 = v10;
    v27 = v17;
    -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v15, v26);
    v14 = (id *)&v27;
    v10 = v17;
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v22[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v22[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v22[2] = (void (*)(_QWORD, _QWORD))___LSHandlerPrefRemoveAllWithBundleID_block_invoke_2;
    v22[3] = (void (*)(_QWORD, _QWORD))&unk_1E1044C08;
    v7 = v3;
    v23 = v7;
    v8 = v4;
    v25 = v8;
    v9 = v5;
    v24 = v9;
    +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v22);
    v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = ___LSHandlerPrefRemoveAllWithBundleID_block_invoke_35;
    v18[3] = &unk_1E1044C30;
    v19 = v7;
    v21 = v8;
    v20 = v9;
    objc_msgSend(v10, "removeAllHandlerPrefsForBundleID:completionHandler:", v19, v18);
    v11 = &v23;
    v12 = &v25;
    v13 = &v24;
    v14 = &v19;

    v15 = v21;
  }

LABEL_8:
}

void sub_18299C3E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

void sub_18299C740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void sub_18299C848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299C8D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

LaunchServices::PrefsStorage *LaunchServices::PrefsStorage::PrefsStorage(LaunchServices::PrefsStorage *this)
{
  LaunchServices::notifyd::NotifyToken *v2;
  LaunchServices::notifyd::NotifyToken *v3;
  uint64_t State;
  char v5;
  uint64_t v6;
  unsigned int v8;

  v2 = (LaunchServices::PrefsStorage *)((char *)this + 4);
  *(_QWORD *)this = 0xFFFFFFFF00000000;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  *((_QWORD *)this + 3) = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferencesUpdateNotificationName");
  v3 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterCheck(v3, &v8);
  LaunchServices::notifyd::NotifyToken::operator=(v2, (LaunchServices::notifyd::NotifyToken *)&v8);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v8);

  State = LaunchServices::notifyd::NotifyToken::getState(v2);
  if (v5)
  {
    v6 = State;
    os_unfair_lock_lock((os_unfair_lock_t)this);
    *((_QWORD *)this + 1) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)this);
  }
  LaunchServices::PrefsStorage::_update((os_unfair_lock_s *)this);
  return this;
}

void sub_18299C9A4(_Unwind_Exception *a1)
{
  LaunchServices::notifyd::NotifyToken *v1;
  uint64_t v2;

  LaunchServices::notifyd::NotifyToken::~NotifyToken(v1);
  _Unwind_Resume(a1);
}

void LaunchServices::PrefsStorage::_update(os_unfair_lock_s *this)
{
  void *v2;
  CFPropertyListRef DeepCopy;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__40;
  v11 = __Block_byref_object_dispose__41;
  v12 = 0;
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0
    || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke;
    v6[3] = &unk_1E1044B88;
    v6[4] = &v7;
    _LSWithInsecurePreferences(v6);
  }
  else
  {
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, __block_literal_global_60);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_43;
    v5[3] = &unk_1E1044C58;
    v5[4] = &v7;
    objc_msgSend(v2, "getPreferencesWithCompletionHandler:", v5);

  }
  if (v8[5])
  {
    os_unfair_lock_lock(this + 4);
    DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFPropertyListRef)v8[5], 1uLL);
    v4 = *(void **)&this[6]._os_unfair_lock_opaque;
    *(_QWORD *)&this[6]._os_unfair_lock_opaque = DeepCopy;

    os_unfair_lock_unlock(this + 4);
  }
  _Block_object_dispose(&v7, 8);

}

void sub_18299CB4C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::PrefsStorage::preferenceKeyMayBeSelfSet(LaunchServices::PrefsStorage *this, NSString *a2)
{
  return objc_msgSend(MEMORY[0x1E0C9AA60], "containsObject:", this);
}

BOOL LaunchServices::PrefsStorage::_needsUpdate(os_unfair_lock_s *this)
{
  uint64_t State;
  char v3;
  uint64_t v4;
  LaunchServices::PrefsStorage *v5;
  uint64_t v6;
  _BOOL8 v7;
  NSObject *v8;

  State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&this[1]);
  if (!v3)
    return 0;
  v4 = State;
  os_unfair_lock_lock(this);
  v6 = *(_QWORD *)&this[2]._os_unfair_lock_opaque;
  v7 = v6 != v4;
  if (v6 != v4)
  {
    LaunchServices::PrefsStorage::_GetLog(v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      LaunchServices::PrefsStorage::_needsUpdate(&this[2]._os_unfair_lock_opaque, v4, v8);

    *(_QWORD *)&this[2]._os_unfair_lock_opaque = v4;
  }
  os_unfair_lock_unlock(this);
  return v7;
}

id LaunchServices::PrefsStorage::_GetLog(LaunchServices::PrefsStorage *this)
{
  if (LaunchServices::PrefsStorage::_GetLog(void)::once != -1)
    dispatch_once(&LaunchServices::PrefsStorage::_GetLog(void)::once, &__block_literal_global_53_0);
  return (id)LaunchServices::PrefsStorage::_GetLog(void)::result;
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2(uint64_t a1, void *a2)
{
  LaunchServices::PrefsStorage *v2;
  NSObject *v3;

  v2 = a2;
  LaunchServices::PrefsStorage::_GetLog(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1();

}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v6;
  LaunchServices::PrefsStorage *v7;
  LaunchServices::PrefsStorage *v8;
  NSObject *v9;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    LaunchServices::PrefsStorage::_GetLog(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1();

  }
}

void LaunchServices::PrefsStorage::_updateOtherProcesses(os_unfair_lock_s *this)
{
  uint64_t State;
  char v3;
  LaunchServices::PrefsStorage *v4;
  NSObject *v5;

  os_unfair_lock_lock(this);
  State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&this[1]);
  if (v3)
  {
    v4 = (LaunchServices::PrefsStorage *)LaunchServices::notifyd::NotifyToken::setState((LaunchServices::notifyd::NotifyToken *)&this[1], State + 1);
    LaunchServices::PrefsStorage::_GetLog(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      LaunchServices::PrefsStorage::_updateOtherProcesses();

  }
  os_unfair_lock_unlock(this);
}

void LaunchServices::PrefsStorage::_setNeedsUpdate(os_unfair_lock_s *this)
{
  LaunchServices::PrefsStorage *v2;
  NSObject *v3;

  os_unfair_lock_lock(this);
  *(_QWORD *)&this[2]._os_unfair_lock_opaque = -1;
  LaunchServices::PrefsStorage::_GetLog(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    LaunchServices::PrefsStorage::_setNeedsUpdate(v3);

  os_unfair_lock_unlock(this);
}

__CFString *LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode(void *a1, _QWORD *a2)
{
  id v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  LaunchServices::PrefsStorage *v9;
  NSObject *v10;
  id v12;

  v3 = a1;
  v12 = 0;
  objc_msgSend(v3, "bundleIdentifierWithError:", &v12);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (!v4)
  {
    if (objc_msgSend(v5, "code") == -10813
      && (objc_msgSend(v6, "domain"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB2F90]),
          v7,
          v8))
    {
      LaunchServices::PrefsStorage::_GetLog(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode();

      v4 = &stru_1E10473A0;
    }
    else
    {
      v4 = 0;
      if (a2)
        *a2 = objc_retainAutorelease(v6);
    }
  }

  return v4;
}

void sub_18299CF50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray(LaunchServices::PrefsStorage *this, NSArray *a2, FSNode *a3)
{
  LaunchServices::PrefsStorage *v4;
  NSArray *v5;
  NSArray *v6;
  LaunchServices::PrefsStorage *v7;
  unint64_t v8;
  unint64_t i;
  void *v10;
  LaunchServices::PrefsStorage *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  unint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = this;
  v5 = a2;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static NSInteger LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray(NSArray *__strong, FSNode *__strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("LSPrefs.mm"), 1292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appNode != nil"));

  }
  v6 = v5;
  v7 = v4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static NSInteger LaunchServices::PrefsStorage::_GetIndexOfValueInPrefsArrayWithPredicate(NSArray *__strong, const Pred &) [Pred = (lambda at /Library/Caches/com.apple.xbs/Sources/CoreServices/LaunchServices.subprj/Source/LaunchServices/Info/LSPrefs.mm:1294:63)]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("LSPrefs.mm"), 1270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefsArray != nil"));

  }
  v8 = -[LaunchServices::PrefsStorage count](v7, "count");
  if (v8)
  {
    for (i = 0; i < v8; i += 2)
    {
      -[LaunchServices::PrefsStorage objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && _NSIsNSData()
        && (v11 = (LaunchServices::PrefsStorage *)_LSAliasMatchesNode(v10, v6), (_DWORD)v11)
        && (v12 = i + 1, i + 1 < v8))
      {
        LaunchServices::PrefsStorage::_GetLog(v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          -[LaunchServices::PrefsStorage objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i + 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218243;
          v21 = i;
          v22 = 2113;
          v23 = v14;
          _os_log_debug_impl(&dword_182882000, v13, OS_LOG_TYPE_DEBUG, "Found matched pref in prefs array at index %llu. Current value is %{private}@", buf, 0x16u);

        }
      }
      else
      {
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        break;
    }
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

void sub_18299D1F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(void *a1, void *a2, void *a3, uint64_t a4)
{
  LaunchServices::PrefsStorage *v7;
  NSArray *v8;
  FSNode *v9;
  id v10;
  LaunchServices::PrefsStorage *IndexOfValueForNodeInPrefsArray;
  NSObject *v12;
  _BOOL4 v13;
  _BOOL8 v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSArray *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v10 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(NSMutableArray *__strong, FSNode *__strong, __strong id, NSError *__autoreleasing *)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("LSPrefs.mm"), 1341, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefsArray != nil"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static BOOL LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(NSMutableArray *__strong, FSNode *__strong, __strong id, NSError *__autoreleasing *)");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("LSPrefs.mm"), 1342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appNode != nil"));

LABEL_3:
  IndexOfValueForNodeInPrefsArray = (LaunchServices::PrefsStorage *)LaunchServices::PrefsStorage::_GetIndexOfValueForNodeInPrefsArray(v7, v8, v9);
  LaunchServices::PrefsStorage::_GetLog(IndexOfValueForNodeInPrefsArray);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (IndexOfValueForNodeInPrefsArray == (LaunchServices::PrefsStorage *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
    {
      if (v13)
        LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();

      -[NSArray bookmarkDataRelativeToNode:error:](v8, "bookmarkDataRelativeToNode:error:", 0, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      v14 = v12 != 0;
      if (!v12)
        goto LABEL_16;
      -[LaunchServices::PrefsStorage addObject:](v7, "addObject:", v12);
      -[LaunchServices::PrefsStorage addObject:](v7, "addObject:", v10);
    }
    else if (v13)
    {
      LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();
    }
    v14 = 1;
LABEL_16:

    goto LABEL_21;
  }
  if (v10)
  {
    if (v13)
    {
      -[LaunchServices::PrefsStorage objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", IndexOfValueForNodeInPrefsArray);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v22 = v16;
      v23 = 2113;
      v24 = v8;
      v25 = 2113;
      v26 = v10;
      _os_log_debug_impl(&dword_182882000, v12, OS_LOG_TYPE_DEBUG, "Replacing value %{private}@ for app node %{private}@ with value %{private}@.", buf, 0x20u);

    }
    -[LaunchServices::PrefsStorage setObject:atIndexedSubscript:](v7, "setObject:atIndexedSubscript:", v10, IndexOfValueForNodeInPrefsArray);
  }
  else
  {
    if (v13)
      LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray();

    -[LaunchServices::PrefsStorage removeObjectAtIndex:](v7, "removeObjectAtIndex:", IndexOfValueForNodeInPrefsArray);
    -[LaunchServices::PrefsStorage removeObjectAtIndex:](v7, "removeObjectAtIndex:", (char *)IndexOfValueForNodeInPrefsArray - 1);
  }
  v14 = 1;
LABEL_21:

  return v14;
}

void sub_18299D54C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12PrefsStorage7_GetLogEv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "prefs-storage");
  v1 = (void *)LaunchServices::PrefsStorage::_GetLog(void)::result;
  LaunchServices::PrefsStorage::_GetLog(void)::result = (uint64_t)v0;

}

uint64_t LaunchServices::PrefsStorage::GetShared(LaunchServices::PrefsStorage *this)
{
  if (LaunchServices::PrefsStorage::GetShared(void)::once != -1)
    dispatch_once(&LaunchServices::PrefsStorage::GetShared(void)::once, &__block_literal_global_56_2);
  if (LaunchServices::PrefsStorage::_needsUpdate((os_unfair_lock_s *)LaunchServices::PrefsStorage::GetShared(void)::result))
    LaunchServices::PrefsStorage::_update((os_unfair_lock_s *)LaunchServices::PrefsStorage::GetShared(void)::result);
  return LaunchServices::PrefsStorage::GetShared(void)::result;
}

void sub_18299D670(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x186DADEF4](v1, 0x1080C4013E61A9FLL);
  _Unwind_Resume(a1);
}

id LaunchServices::PrefsStorage::getAllPreferences(LaunchServices::PrefsStorage *this)
{
  os_unfair_lock_s *v2;
  void *DeepCopy;

  v2 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *((CFPropertyListRef *)this + 3), 0);
  os_unfair_lock_unlock(v2);
  return DeepCopy;
}

BOOL LaunchServices::PrefsStorage::setValueForNode(uint64_t a1, void *a2, void *a3, void *a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  LaunchServices::PrefsStorage *v24;
  NSObject *v25;
  void *v26;
  _BOOL8 v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[6];
  void (*v33[5])(_QWORD, _QWORD);
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  const __CFString *v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0
    || !objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer"))
  {
    if (v9 && v10)
    {
      LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode(v10, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v19 = LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray(v18, v10, v11, (uint64_t)a5);
        *((_BYTE *)v35 + 24) = v19;
        if (v19)
        {
          objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            LaunchServices::PrefsStorage::_GetLog(0);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              LaunchServices::PrefsStorage::setValueForNode();

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:");
          }
          v22 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v15);

          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_60;
          v29[3] = &unk_1E1044CA8;
          v30 = v9;
          v23 = v20;
          v31 = v23;
          _LSWithMutableInsecurePreferences(v29);
          LaunchServices::PrefsStorage::_updateOtherProcesses((os_unfair_lock_s *)a1);

        }
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        if (*((_BYTE *)v35 + 24))
        {
          LaunchServices::PrefsStorage::_GetLog(v24);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543875;
            *(_QWORD *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2113;
            v41 = (uint64_t (*)(uint64_t, uint64_t))v11;
            _os_log_debug_impl(&dword_182882000, v25, OS_LOG_TYPE_DEBUG, "SET prefs[%{public}@][%{private}@] = %{private}@", buf, 0x20u);
          }

        }
      }

    }
    else if (a5)
    {
      v38 = *MEMORY[0x1E0CB2938];
      v39 = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"setValueForNode", 1524, v26);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__40;
    v42 = __Block_byref_object_dispose__41;
    v43 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v33[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v33[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v33[2] = (void (*)(_QWORD, _QWORD))___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke;
    v33[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
    v33[4] = (void (*)(_QWORD, _QWORD))buf;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_2;
    v32[3] = &unk_1E1044C80;
    v32[4] = &v34;
    v32[5] = buf;
    objc_msgSend(v13, "setPreferenceValue:forKey:forApplicationAtURL:completionHandler:", v11, v9, v14, v32);

    if (*((_BYTE *)v35 + 24))
    {
      LaunchServices::PrefsStorage::_setNeedsUpdate((os_unfair_lock_s *)a1);
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
  }
  v27 = *((_BYTE *)v35 + 24) != 0;
  _Block_object_dispose(&v34, 8);

  return v27;
}

void sub_18299DB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void ___ZN14LaunchServices12PrefsStorage15setValueForNodeEP8NSStringP6FSNodeP11objc_objectPU15__autoreleasingP7NSError_block_invoke_60(uint64_t a1, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, *(const void **)(a1 + 32), *(const void **)(a1 + 40));
}

void _LSWithMutableInsecurePreferences(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  __int16 v5;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)MEMORY[0x186DAE7A0]();
    v5 = 0;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___LSWithMutableInsecurePreferences_block_invoke;
    v3[3] = &unk_1E1044D40;
    v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }

}

void sub_18299DD30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSPreferences::With(_BYTE *a1, void *a2)
{
  uint64_t *v3;
  id v4;

  v4 = a2;
  if (a1 && v4)
  {
    if (_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::once != -1)
      dispatch_once(&_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::once, &__block_literal_global_61);
    v3 = &_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::insecurePrefs;
    if (*a1)
      v3 = &_LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::securePrefs;
    _LSPreferences::with((dispatch_queue_t *)*v3, (uint64_t)a1, v4);
  }

}

void sub_18299DDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _LSWithInsecurePreferences(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  __int16 v5;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)MEMORY[0x186DAE7A0]();
    v5 = 256;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___LSWithInsecurePreferences_block_invoke;
    v3[3] = &unk_1E1044D40;
    v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }

}

void sub_18299DE9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSWithMutableSecurePreferences(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  __int16 v5;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)MEMORY[0x186DAE7A0]();
    v5 = 1;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___LSWithMutableSecurePreferences_block_invoke;
    v3[3] = &unk_1E1044D40;
    v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }

}

void sub_18299DF64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSWithSecurePreferences(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;
  __int16 v5;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)MEMORY[0x186DAE7A0]();
    v5 = 257;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = ___LSWithSecurePreferences_block_invoke;
    v3[3] = &unk_1E1044D40;
    v4 = v1;
    _LSPreferences::With(&v5, v3);

    objc_autoreleasePoolPop(v2);
  }

}

void sub_18299E02C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSPreferences::_LSPreferences(_LSPreferences *this, char a2)
{
  LaunchServices::notifyd::NotifyToken *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  LaunchServices::notifyd::NotifyToken *v8;
  unsigned int v9;
  char __str[256];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)this = a2;
  *((_DWORD *)this + 8) = -1;
  v3 = (_LSPreferences *)((char *)this + 32);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 1) = 0;
  snprintf(__str, 0x100uLL, "com.apple.launchservices.prefs-%p", this);
  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(__str, v4);
  v6 = (void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = v5;

  _LSPreferences::load((dispatch_queue_t *)this, 0);
  v7 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferencesFileChangeNotificationName");
  v8 = (LaunchServices::notifyd::NotifyToken *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterCheck(v8, &v9);
  LaunchServices::notifyd::NotifyToken::operator=(v3, (LaunchServices::notifyd::NotifyToken *)&v9);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v9);

  objc_autoreleasePoolPop(v7);
}

void sub_18299E16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12)
{
  id *v12;
  LaunchServices::notifyd::NotifyToken *v13;
  void *v14;

  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&a12);

  LaunchServices::notifyd::NotifyToken::~NotifyToken(v13);
  _Unwind_Resume(a1);
}

void _LSPreferences::load(dispatch_queue_t *this, int a2)
{
  void (**v4)(_QWORD);
  void *v5;
  dispatch_block_t v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZN14_LSPreferences4loadEb_block_invoke;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  v7[4] = this;
  v4 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v7);
  v5 = v4;
  if (a2)
  {
    v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v4);

    dispatch_barrier_async(this[3], v6);
    v5 = v6;
  }
  else
  {
    v4[2](v4);
  }

}

void sub_18299E274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4loadEb_block_invoke(uint64_t a1)
{
  unsigned __int8 *v1;
  void *v2;
  void *v3;
  int v4;
  void *SharedInstance;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  char v23;
  id v24;

  v1 = *(unsigned __int8 **)(a1 + 32);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasPersistentPreferences"))
  {
    v2 = (void *)*((_QWORD *)v1 + 1);
    *((_QWORD *)v1 + 1) = 0;

    v3 = (void *)MEMORY[0x186DAE7A0]();
    v4 = *v1;
    SharedInstance = (void *)__LSDefaultsGetSharedInstance();
    if (v4)
      objc_msgSend(SharedInstance, "securePreferencesFileURL");
    else
      objc_msgSend(SharedInstance, "preferencesFileURL");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v1 + 2);
    *((_QWORD *)v1 + 2) = v6;

    objc_autoreleasePoolPop(v3);
    applyStorageACLToURL(*v1, *((NSURL **)v1 + 2));
    v8 = (void *)MEMORY[0x186DAE7A0]();
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    v10 = *((_QWORD *)v1 + 2);
    v24 = 0;
    v11 = objc_msgSend(v9, "initWithContentsOfURL:error:", v10, &v24);
    v12 = v24;
    v13 = (void *)*((_QWORD *)v1 + 1);
    *((_QWORD *)v1 + 1) = v11;

    if (!*((_QWORD *)v1 + 1))
    {
      v14 = *v1;
      v15 = *((id *)v1 + 2);
      dispatch_get_global_queue(-2, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = ___ZN14_LSPreferences4loadEb_block_invoke_2;
      v20[3] = &unk_1E1043CA0;
      v23 = v14;
      v21 = v15;
      v22 = v12;
      v17 = v15;
      dispatch_async(v16, v20);

    }
    objc_autoreleasePoolPop(v8);
  }
  if (!*((_QWORD *)v1 + 1))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v19 = (void *)*((_QWORD *)v1 + 1);
    *((_QWORD *)v1 + 1) = v18;

  }
}

void applyStorageACLToURL(int a1, NSURL *a2)
{
  NSURL *v3;
  char v4;
  _acl *v5;
  id v6;
  int *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  acl_permset_t permset_p;
  acl_entry_t entry_p;
  acl_t acl_p;
  _BYTE uu[18];
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  acl_p = 0;
  if (!a1 || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  permset_p = 0;
  entry_p = 0;
  *(_QWORD *)uu = 0;
  *(_QWORD *)&uu[8] = 0;
  acl_p = acl_init(1);
  if (acl_p)
  {
    if (acl_create_entry(&acl_p, &entry_p))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 72;
    }
    else if (mbr_identifier_to_uuid(5, "systemusers", 0xBuLL, uu))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 82;
    }
    else if (acl_get_permset(entry_p, &permset_p))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 88;
    }
    else if (acl_add_perm(permset_p, ACL_CHANGE_OWNER|ACL_WRITE_SECURITY|ACL_READ_SECURITY|ACL_WRITE_EXTATTRIBUTES|ACL_READ_EXTATTRIBUTES|ACL_WRITE_ATTRIBUTES|ACL_READ_ATTRIBUTES|ACL_ADD_SUBDIRECTORY|ACL_DELETE|ACL_ADD_FILE|ACL_LIST_DIRECTORY))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 94;
    }
    else if (acl_set_permset(entry_p, permset_p))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 100;
    }
    else if (acl_set_tag_type(entry_p, ACL_EXTENDED_ALLOW))
    {
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 106;
    }
    else
    {
      if (!acl_set_qualifier(entry_p, uu))
      {
        v4 = 0;
        v6 = 0;
        v5 = acl_p;
        goto LABEL_23;
      }
      v7 = __error();
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = 112;
    }
  }
  else
  {
    v7 = __error();
    v8 = (void *)*MEMORY[0x1E0CB2FE0];
    v9 = 66;
  }
  _LSMakeNSErrorImpl(v8, *v7, (uint64_t)"copyPreferencesACL", v9, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (acl_p)
    acl_free(acl_p);
  v5 = 0;
  v4 = 1;
LABEL_23:

  v10 = v6;
  if ((v4 & 1) != 0)
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uu = 138412802;
      *(_QWORD *)&uu[4] = v3;
      *(_WORD *)&uu[12] = 1024;
      *(_DWORD *)&uu[14] = a1;
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_182882000, v11, OS_LOG_TYPE_ERROR, "could not create ACL to apply to %@ (secure: %d): %@", uu, 0x1Cu);
    }

  }
  else if (v5)
  {
    -[NSURL path](v3, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = acl_set_file((const char *)objc_msgSend(v12, "fileSystemRepresentation"), ACL_TYPE_EXTENDED, v5) == 0;

    if (!v13)
    {
      v14 = *__error();
      _LSDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        applyStorageACLToURL((uint64_t)v3, v14, v15);

    }
    acl_free(v5);
  }

}

void sub_18299E73C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  acl_free(v3);

  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4loadEb_block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DAE7A0]();
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = 67109634;
    v7[1] = v4;
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_error_impl(&dword_182882000, v3, OS_LOG_TYPE_ERROR, "Failed to read LS preferences (secure? %{BOOL}i) from %@: %@", (uint8_t *)v7, 0x1Cu);

  }
  objc_autoreleasePoolPop(v2);
}

void sub_18299E88C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSPreferences::with(dispatch_queue_t *a1, uint64_t a2, void *a3)
{
  void (**v5)(_QWORD);
  unint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  dispatch_queue_t *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  void *v19;

  v5 = a3;
  if (v5)
  {
    v6 = LaunchServices::notifyd::NotifyToken::checkValue((LaunchServices::notifyd::NotifyToken *)(a1 + 4));
    if ((v6 & 0xFF00000000) != 0 && (_DWORD)v6)
      _LSPreferences::load(a1, 1);
    if (*(_BYTE *)(a2 + 1))
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__40;
      v18 = __Block_byref_object_dispose__40;
      v19 = 0;
      v7 = a1[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke;
      block[3] = &unk_1E1043230;
      block[4] = &v14;
      block[5] = a1;
      dispatch_sync(v7, block);
      if (v15[5])
        v5[2](v5);
      _Block_object_dispose(&v14, 8);
      v8 = v19;
    }
    else
    {
      v9 = a1[3];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke_2;
      v10[3] = &unk_1E10431E0;
      v12 = a1;
      v11 = v5;
      dispatch_barrier_sync(v9, v10);
      v8 = v11;
    }

  }
}

void sub_18299E9F4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 80), 8);

  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (v1)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v1);
}

void ___ZN14_LSPreferences4withEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke_2(uint64_t a1)
{
  id *v2;
  id v3;
  NSDictionary *v4;

  v2 = *(id **)(a1 + 40);
  v3 = v2[1];
  if (v3)
  {
    v4 = (NSDictionary *)objc_msgSend(v3, "mutableCopy");
    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if ((objc_msgSend(v2[1], "isEqual:", v4) & 1) == 0)
        _LSPreferences::save((_LSPreferences *)v2, v4);
    }

  }
}

void sub_18299EABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _LSPreferences::save(_LSPreferences *this, NSDictionary *a2)
{
  NSDictionary *v3;
  NSDictionary *v4;
  NSDictionary *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (NSDictionary *)*((_QWORD *)this + 1);
    if (v5)
      v6 = v5 == v3;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v3, 1);
      v8 = (void *)*((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v7;

    }
    if (*((_QWORD *)this + 2)
      && objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasPersistentPreferences"))
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v21;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "removeItemAtURL:error:", *((_QWORD *)this + 2), 0);

        v12 = *((_QWORD *)this + 2);
        v20 = v10;
        LOBYTE(v11) = objc_msgSend(v9, "writeToURL:options:error:", v12, 268435457, &v20);
        v13 = v20;

        v10 = v13;
        if ((v11 & 1) == 0)
        {
          _LSDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = *(unsigned __int8 *)this;
            objc_msgSend(*((id *)this + 2), "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            v23 = v18;
            v24 = 2112;
            v25 = v19;
            v26 = 2112;
            v27 = v10;
            _os_log_error_impl(&dword_182882000, v14, OS_LOG_TYPE_ERROR, "Failed to save LS preferences (secure? %{BOOL}i) to %@: %@", buf, 0x1Cu);

          }
        }
        applyStorageACLToURL(*(unsigned __int8 *)this, *((NSURL **)this + 2));
      }
      else
      {
        _LSDefaultLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = *(unsigned __int8 *)this;
          objc_msgSend(*((id *)this + 2), "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          v23 = v16;
          v24 = 2112;
          v25 = v17;
          v26 = 2112;
          v27 = v10;
          _os_log_error_impl(&dword_182882000, v15, OS_LOG_TYPE_ERROR, "Failed to serialize LS preferences (secure? %{BOOL}i) to %@: %@", buf, 0x1Cu);

        }
      }

    }
  }

}

void sub_18299ED3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void ___ZN14_LSPreferences4WithEPKNS_15SecurityContextEU13block_pointerFvPKvE_block_invoke()
{
  _LSPreferences *v0;
  _LSPreferences *v1;

  v0 = (_LSPreferences *)operator new();
  _LSPreferences::_LSPreferences(v0, 0);
  _LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::insecurePrefs = (uint64_t)v0;
  v1 = (_LSPreferences *)operator new();
  _LSPreferences::_LSPreferences(v1, 1);
  _LSPreferences::With(_LSPreferences::SecurityContext const*,void({block_pointer})(void const*))::securePrefs = (uint64_t)v1;
}

void sub_18299EE04(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x186DADEF4](v1, 0x1080C40C4863376);
  _Unwind_Resume(a1);
}

uint64_t _LSGetProfileValidationStateFromInstallDictionary(const __CFDictionary *a1)
{
  uint64_t result;

  result = (uint64_t)_LSGetBooleanFromDict(a1, CFSTR("ProfileValidated"));
  if ((_DWORD)result)
  {
    if (_LSGetBooleanFromDict(a1, CFSTR("UPPValidated")))
    {
      return 2;
    }
    else if (_LSGetBooleanFromDict(a1, CFSTR("FreeProfileValidated")))
    {
      return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

__CFString *_LSProfileValidationStateGetVisualizationDescription(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E1044D60[(char)a1];
}

void sub_18299EECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299EF30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F0B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL16pluginQueryFaultv_block_invoke_0()
{
  NSObject *v0;

  _LSPluginFaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __pluginQueryFault_block_invoke_cold_1_0(v0);

}

void sub_18299F260(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18299F450(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18299F548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18299F5D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18299F778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18299F7B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299F854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18299F8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_18299F994(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18299FAB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299FB0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299FB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299FBD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299FC80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18299FCE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id LaunchServices::Record::findSubclassForTable(LaunchServices::Record *this, LSContext *a2)
{
  if (*(_DWORD *)(*(_QWORD *)this + 20) == (_DWORD)a2
    || *(_DWORD *)(*(_QWORD *)this + 1604) == (_DWORD)a2
    || *(_DWORD *)(*(_QWORD *)this + 32) == (_DWORD)a2
    || *(_DWORD *)(*(_QWORD *)this + 24) == (_DWORD)a2
    || *(_DWORD *)(*(_QWORD *)this + 1608) == (_DWORD)a2
    || *(_DWORD *)(*(_QWORD *)this + 1620) == (_DWORD)a2)
  {
    return (id)objc_opt_class();
  }
  else
  {
    return 0;
  }
}

void sub_18299FEF4()
{
  __break(1u);
}

void sub_18299FF34(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1829A0058(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1829A0070(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1829A0230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  uint64_t v10;

  if (a2)
  {
    MEMORY[0x186DADEF4](v10, 0x10A0C408EF24B1CLL);

    objc_begin_catch(exception_object);
    os_unfair_recursive_lock_unlock();
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1829A0364(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1829A0390(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1829A0444(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1829A0470(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1829A05E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

void sub_1829A0684(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829A0738(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v2 = (_QWORD *)(a1 + 32);
  v2[2] = 0;
  std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>(v2, *(id **)(a2 + 32), *(id **)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 3);
}

void __destroy_helper_block_ea8_32c58_ZTSNSt3__16vectorIU6__weakP8LSRecordNS_9allocatorIS3_EEEE(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 32);
  std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100](&v1);
}

void sub_1829A08B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void std::vector<LSRecord *>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
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
    std::vector<LSRecord *>::__append((void **)a1, a2 - v3, a3);
  }
}

void sub_1829A0930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829A0AB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829A0E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
  void *v17;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a13);
  _Unwind_Resume(a1);
}

void sub_1829A0F94()
{
  __break(1u);
}

void sub_1829A0FCC()
{
  objc_end_catch();
  JUMPOUT(0x1829A0FD4);
}

void sub_1829A1190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829A13A8(_Unwind_Exception *a1)
{
  void *v1;
  const void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (v2)
    CFRelease(v2);

  _Unwind_Resume(a1);
}

void sub_1829A14C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __LSRECORD_IS_CRASHING_DUE_TO_A_CALLER_BUG__(uint64_t a1, const char *a2)
{
  const char *v2;

  if (!a2)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  v2 = a2;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  sel_getName(v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __LAUNCH_SERVICES_CLIENT_MAY_BE_EXFILTRATING_PRIVACY_SENSITIVE_INFORMATION__()
{
  NSObject *v0;
  uint8_t v1[16];

  _LSRecordLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_FAULT, "Process is attempting to encode sensitive data from Launch Services in order to send it to a non-privileged client. This is a privacy bug in this process; please file a bug report.",
      v1,
      2u);
  }

}

uint64_t ___ZN14LaunchServices6RecordL24checkForExfiltrationRiskEP7NSCoder_block_invoke()
{
  uint64_t result;
  const audit_token_t *v1;
  _OWORD *v2;

  result = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer");
  if ((result & 1) != 0
    || (result = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure"), (result & 1) != 0)
    || (v1 = (const audit_token_t *)_LSGetAuditTokenForSelf(),
        result = _LSCheckEntitlementForAuditToken(v1, CFSTR("com.apple.private.launchservices.canEncodeSensitiveData")),
        (_DWORD)result)
    || (v2 = (_OWORD *)_LSGetAuditTokenForSelf(), result = (uint64_t)_LSIsAuditTokenPlatformBinary(v2), !(_DWORD)result))
  {
    LaunchServices::Record::checkForExfiltrationRisk(NSCoder *)::isSafeToSendData = 1;
  }
  return result;
}

id *std::remove[abi:nn180100]<std::__wrap_iter<LSRecord * {__weak}*>,decltype(nullptr)>(id *a1, id *a2)
{
  id *v3;
  id *v4;
  id WeakRetained;
  id v7;

  v3 = std::__find_impl[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,decltype(nullptr),std::__identity>(a1, a2);
  v4 = v3 + 1;
  if (v3 != a2 && v4 != a2)
  {
    do
    {
      WeakRetained = objc_loadWeakRetained(v4);

      if (WeakRetained)
      {
        v7 = objc_loadWeakRetained(v4);
        objc_storeWeak(v3, v7);

        ++v3;
      }
      ++v4;
    }
    while (v4 != a2);
  }
  return v3;
}

id *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>(int a1, id *location, id *a3, id *a4)
{
  id *v5;
  id WeakRetained;

  v5 = location;
  if (location != a3)
  {
    do
    {
      WeakRetained = objc_loadWeakRetained(v5);
      objc_storeWeak(a4, WeakRetained);

      ++v5;
      ++a4;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

id *std::__find_impl[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,decltype(nullptr),std::__identity>(id *location, id *a2)
{
  id *v2;
  id WeakRetained;

  v2 = location;
  if (location != a2)
  {
    while (1)
    {
      WeakRetained = objc_loadWeakRetained(v2);

      if (!WeakRetained)
        break;
      if (++v2 == a2)
        return a2;
    }
  }
  return v2;
}

id *std::vector<LSRecord * {__weak}>::__insert_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(uint64_t a1, id *a2, void **a3, void **a4, uint64_t a5)
{
  id *v5;
  void **v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void **v22;
  uint64_t v23;
  id *v24;
  void *v25;
  void **v26;
  id *v27;
  uint64_t v28;
  id *v29;
  void *v30;
  void **v32;
  _QWORD v33[5];

  v5 = a2;
  if (a5 < 1)
    return v5;
  v7 = a3;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    v13 = *(id **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 >> 61)
      abort();
    v15 = a2 - v13;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 2 > v14)
      v14 = v16 >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v33[4] = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v9, v17);
    else
      v18 = 0;
    v27 = (id *)&v18[8 * v15];
    v33[0] = v18;
    v33[1] = v27;
    v33[3] = &v18[8 * v17];
    v28 = 8 * a5;
    v29 = &v27[a5];
    do
    {
      v30 = *v7++;
      objc_initWeak(v27++, v30);
      v28 -= 8;
    }
    while (v28);
    v33[2] = v29;
    v5 = std::vector<LSRecord * {__weak}>::__swap_out_circular_buffer((id **)a1, v33, v5);
    std::__split_buffer<LSRecord * {__weak}>::~__split_buffer((uint64_t)v33);
    return v5;
  }
  v19 = v12 - (_QWORD)a2;
  v20 = (uint64_t)(v12 - (_QWORD)a2) >> 3;
  if (v20 >= a5)
  {
    v26 = &a3[a5];
LABEL_18:
    std::vector<LSRecord * {__weak}>::__move_range(a1, v5, v12, (uint64_t)&v5[a5]);
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,LSRecord * const*,LSRecord * const*,LSRecord * {__weak}*,0>(v7, v26, v5);
    return v5;
  }
  v22 = &a3[v20];
  v32 = v22;
  v23 = *(_QWORD *)(v9 - 8);
  if (v22 != a4)
  {
    v24 = *(id **)(v9 - 8);
    do
    {
      v25 = *v22++;
      objc_initWeak(v24++, v25);
      v23 += 8;
    }
    while (v22 != a4);
  }
  *(_QWORD *)(a1 + 8) = v23;
  v26 = v32;
  if (v19 >= 1)
    goto LABEL_18;
  return v5;
}

void sub_1829A1A1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<LSRecord * {__weak}>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

id *std::vector<LSRecord * {__weak}>::__move_range(uint64_t a1, id *a2, unint64_t a3, uint64_t a4)
{
  id *v6;
  id *v7;
  id *v8;
  id *v10;
  char v12;

  v6 = *(id **)(a1 + 8);
  v7 = (id *)((char *)v6 + (_QWORD)a2 - a4);
  v8 = v6;
  if ((unint64_t)v7 < a3)
  {
    v10 = (id *)((char *)v6 + (_QWORD)a2 - a4);
    v8 = *(id **)(a1 + 8);
    do
      objc_moveWeak(v8++, v10++);
    while ((unint64_t)v10 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>((uint64_t)&v12, a2, v7, v6);
}

id *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*,LSRecord * {__weak}*>(uint64_t a1, id *a2, id *a3, id *a4)
{
  id *v7;
  id WeakRetained;

  if (a3 != a2)
  {
    v7 = a3;
    do
    {
      WeakRetained = objc_loadWeakRetained(--v7);
      objc_storeWeak(--a4, WeakRetained);

    }
    while (v7 != a2);
  }
  return a3;
}

void **std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,LSRecord * const*,LSRecord * const*,LSRecord * {__weak}*,0>(void **a1, void **a2, id *location)
{
  void **v4;
  void *v6;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      v6 = *v4++;
      objc_storeWeak(location++, v6);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

uint64_t std::unordered_map<objc_selector *,objc_object * {__strong}>::unordered_map(uint64_t a1, uint64_t a2)
{
  _QWORD *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(_QWORD **)(a2 + 16); i; i = (_QWORD *)*i)
    std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,std::pair<objc_selector * const,objc_object * {__strong}> const&>(a1, i + 2, i + 2);
  return a1;
}

void sub_1829A1BF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::__unordered_map_hasher<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::hash<objc_selector *>,std::equal_to<objc_selector *>,true>,std::__unordered_map_equal<objc_selector *,std::__hash_value_type<objc_selector *,objc_object * {__strong}>,std::equal_to<objc_selector *>,std::hash<objc_selector *>,true>,std::allocator<std::__hash_value_type<objc_selector *,objc_object * {__strong}>>>::__emplace_unique_key_args<objc_selector *,std::pair<objc_selector * const,objc_object * {__strong}> const&>(uint64_t a1, _QWORD *a2, _QWORD *a3)
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
  _QWORD *v14;
  void *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;

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
  v14 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v8;
  v15 = (void *)a3[1];
  i[2] = *a3;
  i[3] = v15;
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    v18 = 1;
    if (v9 >= 3)
      v18 = (v9 & (v9 - 1)) != 0;
    v19 = v18 | (2 * v9);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>>>::__rehash<true>(a1, v21);
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
  v22 = *(_QWORD *)a1;
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v23)
  {
    *i = *v23;
LABEL_38:
    *v23 = i;
    goto LABEL_39;
  }
  *i = *v14;
  *v14 = i;
  *(_QWORD *)(v22 + 8 * v3) = v14;
  if (*i)
  {
    v24 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9)
        v24 %= v9;
    }
    else
    {
      v24 &= v9 - 1;
    }
    v23 = (_QWORD *)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1829A1E70(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,LSApplicationRecord * {__strong}>,void *>>>::operator()[abi:nn180100](v2, v1);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * const*,LSRecord * const*>(_QWORD *result, void **a2, void **a3, unint64_t a4)
{
  _QWORD *v6;
  id *v7;
  void *v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](result, a4);
    v7 = (id *)v6[1];
    while (a2 != a3)
    {
      v8 = *a2++;
      result = objc_initWeak(v7++, v8);
    }
    v6[1] = v7;
  }
  return result;
}

void std::vector<LSRecord * {__weak}>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        objc_destroyWeak(--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<LSRecord * {__weak}>::__init_with_size[abi:nn180100]<LSRecord * {__weak}*,LSRecord * {__weak}*>(_QWORD *a1, id *a2, id *a3, unint64_t a4)
{
  id *v7;

  if (a4)
  {
    std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](a1, a4);
    v7 = (id *)a1[1];
    while (a2 != a3)
      objc_copyWeak(v7++, a2++);
    a1[1] = v7;
  }
}

void std::vector<LSRecord *>::__append(void **a1, unint64_t a2, _QWORD *a3)
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
  char *v24;
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
      abort();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<os_eligibility_answer_t>>(v6, v14);
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
    v24 = (char *)*a1;
    v23 = (char *)a1[1];
    if (v23 != *a1)
    {
      do
      {
        v25 = *((_QWORD *)v23 - 1);
        v23 -= 8;
        *((_QWORD *)v18 - 1) = v25;
        v18 -= 8;
      }
      while (v23 != v24);
      v23 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<void const*,std::vector<std::pair<objc_selector *,void (*)(objc_object *,objc_selector *)>>>,void *>>>::operator()[abi:nn180100](uint64_t a1, _QWORD *__p)
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

id _LSGetCollapsedMIDictionaryForAppAndContentsDictionaries(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v1 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__44;
  v18 = __Block_byref_object_dispose__44;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__44;
  v12 = __Block_byref_object_dispose__44;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke;
  v7[3] = &unk_1E1044F00;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v7);
  v3 = (void *)v15[5];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = ___LSGetCollapsedMIDictionaryForAppAndContentsDictionaries_block_invoke_2;
  v6[3] = &unk_1E10421E8;
  v6[4] = &v8;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v4;
}

void sub_1829A23B4(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1829A253C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1829A2684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id _LSGetTeamIdentifierFromInstallDict(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v15;

  v1 = a1;
  v15 = 0;
  v2 = objc_opt_class();
  objc_msgSend(v1, "objectForKey:", CFSTR("Entitlements"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (!v3)
      goto LABEL_24;
  }
  else
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {

      v4 = 0;
      goto LABEL_24;
    }
  }
  v7 = objc_opt_class();
  objc_msgSend(v4, "objectForKey:", CFSTR("com.apple.developer.team-identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7 || !v8)
  {
    v15 = v8;
    if (v8)
      goto LABEL_24;
LABEL_17:
    v10 = objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("application-identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (!v11)
    {
      goto LABEL_23;
    }
    _LSSplitApplicationIdentifier(v12, &v15, 0);
    goto LABEL_23;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v15 = 0;
    goto LABEL_17;
  }
  v15 = v9;
LABEL_24:

  v13 = v15;
  return v13;
}

void sub_1829A2834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

CFTypeRef _LSCopyBundleInfoDictionary(__CFBundle *a1)
{
  void *v2;
  const __CFDictionary *InfoDictionary;
  __CFDictionary *DeepPropertyListCopy;
  const __CFAllocator *v5;
  void *v6;
  void *v7;
  CFTypeRef v8;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  InfoDictionary = CFBundleGetInfoDictionary(a1);
  DeepPropertyListCopy = InfoDictionary;
  if (!InfoDictionary)
    goto LABEL_7;
  if (CFDictionaryGetCount(InfoDictionary) >= 1)
  {
    v5 = CFGetAllocator(DeepPropertyListCopy);
    DeepPropertyListCopy = dictionaryCreateDeepPropertyListCopy(v5, DeepPropertyListCopy);
    if (DeepPropertyListCopy)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFMutableDictionaryRef _LSCopyBundleInfoDictionary(CFBundleRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("LSRegistration.mm"), 733, CFSTR("Failed to create mutable copy of dictionary, cannot safely proceed, aborting"));

  }
  DeepPropertyListCopy = 0;
LABEL_7:
  objc_autoreleasePoolPop(v2);
  if (!DeepPropertyListCopy)
    return 0;
  v8 = CFRetain(DeepPropertyListCopy);
  CFRelease(DeepPropertyListCopy);
  return v8;
}

void sub_1829A296C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFDictionary *dictionaryCreateDeepPropertyListCopy(const __CFAllocator *a1, const __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  CFIndex Count;
  const void **v6;
  const void **v7;
  CFPropertyListRef *v8;
  CFPropertyListRef *v9;
  CFPropertyListRef DeepCopy;
  CFPropertyListRef v11;
  const void *v12;

  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Count = CFDictionaryGetCount(a2);
  v6 = (const void **)CFAllocatorAllocate(a1, 8 * Count, 0);
  v7 = (const void **)CFAllocatorAllocate(a1, 8 * Count, 0);
  CFDictionaryGetKeysAndValues(a2, v6, v7);
  if (Count >= 1)
  {
    v8 = v6;
    v9 = v7;
    while (1)
    {
      DeepCopy = CFPropertyListCreateDeepCopy(a1, *v8, 1uLL);
      v11 = CFPropertyListCreateDeepCopy(a1, *v9, 1uLL);
      v12 = v11;
      if (DeepCopy && v11 != 0)
        break;
      if (DeepCopy)
        goto LABEL_13;
      if (v11)
        goto LABEL_10;
LABEL_11:
      ++v9;
      ++v8;
      if (!--Count)
        goto LABEL_15;
    }
    CFDictionaryAddValue(Mutable, DeepCopy, v11);
LABEL_13:
    CFRelease(DeepCopy);
    if (!v12)
      goto LABEL_11;
LABEL_10:
    CFRelease(v12);
    goto LABEL_11;
  }
LABEL_15:
  CFAllocatorDeallocate(a1, v6);
  CFAllocatorDeallocate(a1, v7);
  return Mutable;
}

__CFDictionary *copyDeepMutableDictionary(__CFDictionary *result)
{
  void *v1;
  void *v2;

  if (result)
  {
    result = dictionaryCreateDeepPropertyListCopy((const __CFAllocator *)*MEMORY[0x1E0C9AE00], result);
    if (!result)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFMutableDictionaryRef copyDeepMutableDictionary(CFDictionaryRef)");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("LSRegistration.mm"), 747, CFSTR("Failed to create mutable copy of dictionary, cannot safely proceed, aborting"));

      return 0;
    }
  }
  return result;
}

void sub_1829A2B88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CFPropertyListRef _LSCopyiTunesMetadataDictionaryForAppContainerURL(CFURLRef url)
{
  const __CFAllocator *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  CFTypeID TypeID;

  if (!url)
    return 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], url, CFSTR("iTunesMetadata.plist"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFReadStreamCreateWithFile(v1, v2);
  if (v4)
  {
    v5 = v4;
    if (CFReadStreamOpen(v4))
    {
      v6 = CFPropertyListCreateWithStream(v1, v5, 0, 0, 0, 0);
      if (v6)
      {
        TypeID = CFDictionaryGetTypeID();
        if (TypeID != CFGetTypeID(v6))
        {
          CFRelease(v6);
          v6 = 0;
        }
      }
      CFReadStreamClose(v5);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

void _LSPromoteiTunesMetadataKeys(const __CFDictionary *a1, __CFDictionary *a2)
{
  const void *Value;
  CFTypeID TypeID;
  const void *v6;
  CFTypeID v7;
  const void *v8;
  CFTypeID v9;
  const void *v10;
  CFTypeID v11;
  const void *v12;
  CFTypeID v13;
  const void *v14;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  CFTypeID v19;
  const void *v20;
  CFTypeID v21;
  const void *v22;
  CFTypeID v23;
  const void *v24;
  CFTypeID v25;
  const void *v26;
  CFTypeID v27;
  const void *v28;
  CFTypeID v29;
  const void *v30;
  CFTypeID v31;
  const void *v32;
  CFTypeID v33;
  const void *v34;
  CFTypeID v35;
  const void *v36;
  CFTypeID v37;
  const void *v38;
  CFTypeID v39;
  const void *v40;
  CFTypeID v41;
  CFTypeID v42;
  const void *v43;
  const void *v44;
  const void *v45;
  CFTypeID v46;
  CFTypeID v47;
  const void *v48;
  CFTypeID v49;
  CFTypeID v50;
  const void *v51;
  CFTypeID v52;
  CFTypeID v53;
  const __CFDictionary *v54;
  CFTypeID v55;
  const void *v56;
  CFTypeID v57;
  const void *v58;
  CFTypeID v59;

  if (a1 && a2)
  {
    Value = CFDictionaryGetValue(a1, CFSTR("initialODRSize"));
    TypeID = CFNumberGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      CFDictionaryAddValue(a2, CFSTR("initialODRSize"), Value);
    v6 = CFDictionaryGetValue(a1, CFSTR("itemId"));
    v7 = CFNumberGetTypeID();
    if (v6 && (!v7 || CFGetTypeID(v6) == v7))
      CFDictionaryAddValue(a2, CFSTR("itemId"), v6);
    v8 = CFDictionaryGetValue(a1, CFSTR("artistName"));
    v9 = CFStringGetTypeID();
    if (v8 && (!v9 || CFGetTypeID(v8) == v9))
      CFDictionaryAddValue(a2, CFSTR("artistName"), v8);
    v10 = CFDictionaryGetValue(a1, CFSTR("itemName"));
    v11 = CFStringGetTypeID();
    if (v10 && (!v11 || CFGetTypeID(v10) == v11))
      CFDictionaryAddValue(a2, CFSTR("itemName"), v10);
    v12 = CFDictionaryGetValue(a1, CFSTR("storeCohort"));
    v13 = CFStringGetTypeID();
    if (v12 && (!v13 || CFGetTypeID(v12) == v13))
      CFDictionaryAddValue(a2, CFSTR("storeCohort"), v12);
    v14 = CFDictionaryGetValue(a1, CFSTR("s"));
    v15 = CFNumberGetTypeID();
    if (v14 && (!v15 || CFGetTypeID(v14) == v15))
      CFDictionaryAddValue(a2, CFSTR("s"), v14);
    v16 = CFDictionaryGetValue(a1, CFSTR("softwareVersionExternalIdentifier"));
    v17 = CFNumberGetTypeID();
    if (v16 && (!v17 || CFGetTypeID(v16) == v17))
      CFDictionaryAddValue(a2, CFSTR("softwareVersionExternalIdentifier"), v16);
    v18 = CFDictionaryGetValue(a1, CFSTR("betaExternalVersionIdentifier"));
    v19 = CFNumberGetTypeID();
    if (v18 && (!v19 || CFGetTypeID(v18) == v19))
      CFDictionaryAddValue(a2, CFSTR("betaExternalVersionIdentifier"), v18);
    v20 = CFDictionaryGetValue(a1, CFSTR("DeviceBasedVPP"));
    v21 = CFBooleanGetTypeID();
    if (v20 && (!v21 || CFGetTypeID(v20) == v21))
      CFDictionaryAddValue(a2, CFSTR("DeviceBasedVPP"), v20);
    v22 = CFDictionaryGetValue(a1, CFSTR("is-purchased-redownload"));
    v23 = CFBooleanGetTypeID();
    if (v22 && (!v23 || CFGetTypeID(v22) == v23))
      CFDictionaryAddValue(a2, CFSTR("is-purchased-redownload"), v22);
    v24 = CFDictionaryGetValue(a1, CFSTR("gameCenterEnabled"));
    v25 = CFBooleanGetTypeID();
    if (v24 && (!v25 || CFGetTypeID(v24) == v25))
      CFDictionaryAddValue(a2, CFSTR("gameCenterEnabled"), v24);
    v26 = CFDictionaryGetValue(a1, CFSTR("gameCenterEverEnabled"));
    v27 = CFBooleanGetTypeID();
    if (v26 && (!v27 || CFGetTypeID(v26) == v27))
      CFDictionaryAddValue(a2, CFSTR("gameCenterEverEnabled"), v26);
    v28 = CFDictionaryGetValue(a1, CFSTR("sourceApp"));
    v29 = CFStringGetTypeID();
    if (v28 && (!v29 || CFGetTypeID(v28) == v29))
      CFDictionaryAddValue(a2, CFSTR("sourceApp"), v28);
    v30 = CFDictionaryGetValue(a1, CFSTR("variantID"));
    v31 = CFStringGetTypeID();
    if (v30 && (!v31 || CFGetTypeID(v30) == v31))
      CFDictionaryAddValue(a2, CFSTR("variantID"), v30);
    v32 = CFDictionaryGetValue(a1, CFSTR("managementDeclarationIdentifier"));
    v33 = CFStringGetTypeID();
    if (v32 && (!v33 || CFGetTypeID(v32) == v33))
      CFDictionaryAddValue(a2, CFSTR("managementDeclarationIdentifier"), v32);
    v34 = CFDictionaryGetValue(a1, CFSTR("genre"));
    v35 = CFStringGetTypeID();
    if (v34 && (!v35 || CFGetTypeID(v34) == v35))
      CFDictionaryAddValue(a2, CFSTR("genre"), v34);
    v36 = CFDictionaryGetValue(a1, CFSTR("genreId"));
    v37 = CFNumberGetTypeID();
    if (v36 && (!v37 || CFGetTypeID(v36) == v37))
      CFDictionaryAddValue(a2, CFSTR("genreId"), v36);
    v38 = CFDictionaryGetValue(a1, CFSTR("subgenres"));
    v39 = CFArrayGetTypeID();
    if (v38 && (!v39 || CFGetTypeID(v38) == v39))
      CFDictionaryAddValue(a2, CFSTR("subgenres"), v38);
    v40 = CFDictionaryGetValue(a1, CFSTR("distributorInfo"));
    v41 = CFDictionaryGetTypeID();
    if (v40 && (!v41 || CFGetTypeID(v40) == v41))
      CFDictionaryAddValue(a2, CFSTR("distributorInfo"), v40);
    v42 = CFArrayGetTypeID();
    v43 = CFDictionaryGetValue(a1, CFSTR("categories"));
    if (v43)
    {
      v44 = v43;
      if (CFGetTypeID(v43) == v42)
        CFDictionaryAddValue(a2, CFSTR("categories"), v44);
    }
    v45 = CFDictionaryGetValue(a1, CFSTR("com.apple.iTunesStore.downloadInfo"));
    v46 = CFDictionaryGetTypeID();
    if (v45 && (!v46 || CFGetTypeID(v45) == v46))
    {
      v47 = CFGetTypeID(v45);
      if (v47 == CFDictionaryGetTypeID())
      {
        v48 = CFDictionaryGetValue((CFDictionaryRef)v45, CFSTR("accountInfo"));
        v49 = CFDictionaryGetTypeID();
        if (v48)
        {
          if (!v49 || CFGetTypeID(v48) == v49)
          {
            v50 = CFGetTypeID(v48);
            if (v50 == CFDictionaryGetTypeID())
            {
              if ((v51 = CFDictionaryGetValue((CFDictionaryRef)v48, CFSTR("PurchaserID")),
                    v52 = CFNumberGetTypeID(),
                    v51)
                && (!v52 || CFGetTypeID(v51) == v52)
                || (v51 = CFDictionaryGetValue((CFDictionaryRef)v48, CFSTR("DSPersonID")), v53 = CFNumberGetTypeID(),
                                                                                           v51)
                && (!v53 || CFGetTypeID(v51) == v53))
              {
                CFDictionaryAddValue(a2, CFSTR("PurchaserID"), v51);
              }
            }
          }
        }
      }
    }
    v54 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("rating"));
    v55 = CFDictionaryGetTypeID();
    if (v54 && (!v55 || CFGetTypeID(v54) == v55))
    {
      v56 = CFDictionaryGetValue(v54, CFSTR("rank"));
      v57 = CFNumberGetTypeID();
      if (v56 && (!v57 || CFGetTypeID(v56) == v57))
        CFDictionaryAddValue(a2, CFSTR("rank"), v56);
      v58 = CFDictionaryGetValue(v54, CFSTR("label"));
      v59 = CFStringGetTypeID();
      if (v58 && (!v59 || CFGetTypeID(v58) == v59))
        CFDictionaryAddValue(a2, CFSTR("label"), v58);
    }
  }
}

void sub_1829A37A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1829A3A40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829A3AC0()
{
  JUMPOUT(0x1829A3AB4);
}

void sub_1829A3BC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _LSPathIsTrusted(const char *a1)
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  while (1)
  {
    v3 = strlen(_LSPathIsTrusted(char const*)::trustedPaths[v2]);
    if (!strncmp(a1, _LSPathIsTrusted(char const*)::trustedPaths[v2], v3))
      break;
    if (++v2 == 10)
      return 0;
  }
  return 1;
}

BOOL _LSRegisterPluginNode(LSContext *a1, void *a2, FSNode *a3, int a4, unsigned int a5, _QWORD *a6)
{
  FSNode *v11;
  LSRegistrationInfo *v12;
  LSRegistrationInfo *v13;
  int v14;
  _BOOL8 v15;
  unsigned int *v17;
  _BYTE v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  HIDWORD(v17) = a5;
  v12 = objc_alloc_init(LSRegistrationInfo);
  LODWORD(v17) = 0;
  -[FSNode bookmarkDataRelativeToNode:error:](v11, "bookmarkDataRelativeToNode:error:", 0, a6);
  v13 = (LSRegistrationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v13 || !_LSContainerFindOrRegisterWithNode((id *)&a1->db, v11, a4, &v17, 0, 0, a6))
    goto LABEL_11;
  v12->bundleClass = 12;
  v12->version = 7;
  v12->action = 204;
  v12->options = a4;
  v12->containerUnit = v17;
  if (a5 || (_LSPluginFindWithInfo(a1->db, 0, 0, 0, v11, (_DWORD *)&v17 + 1, 0), (a5 = HIDWORD(v17)) != 0))
    v12->bundleUnit = a5;
  if (-[FSNode getFileSystemRepresentation:error:](v11, "getFileSystemRepresentation:error:", v18, a6))
  {
    v14 = _LSRegisterDirectoryNode(a1, v11, (FSNode *)v12, v13, a3, 0, 0, (const __CFURL *)((char *)&v17 + 4), v17);
    v15 = v14 == 0;
    if (a6 && v14)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v14, (uint64_t)"_LSRegisterPluginNode", 1977, 0);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_11:
    v15 = 0;
  }

  return v15;
}

void sub_1829A3E64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterDirectoryNode(LSContext *a1, FSNode *a2, FSNode *a3, LSRegistrationInfo *a4, FSNode *a5, const __CFArray **a6, const __CFArray **a7, const __CFURL *a8, unsigned int *a9)
{
  FSNode *v16;
  FSNode *v17;
  LSRegistrationInfo *v18;
  NSData *v19;
  uint64_t v20;
  const __CFArray **v22;
  unsigned __int8 *v23;

  v16 = a2;
  v17 = a3;
  v18 = a4;
  -[FSNode URL](v16, "URL");
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();

  v20 = _LSDispatchRegistration(a1, (char *)v17, v18, v19, a5, a8, a6, (unsigned __int8 *)a7, v22, v23);
  return v20;
}

void sub_1829A3F48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL _LSRegisterBundleURL(void **a1, void *a2, unsigned int a3, FSNode *a4, _QWORD *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  FSNode *v12;
  _BOOL8 v13;

  v9 = a2;
  v10 = v9;
  if ((a3 & 1) != 0)
  {
    v11 = objc_msgSend(v9, "copy");

    v10 = (void *)v11;
  }
  v12 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v10, 0, a5);
  if (v12)
    v13 = _LSRegisterBundleNode(a1, v12, a3, a4, a5);
  else
    v13 = 0;

  return v13;
}

void sub_1829A400C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _LSRegisterBundleNode(void **a1, void *a2, unsigned int a3, FSNode *a4, _QWORD *a5)
{
  FSNode *v9;
  _LSDServiceDomain *v10;
  LSContext *v11;
  int v12;
  _BOOL8 v13;
  _LSDServiceDomain *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v22;
  void **v23;
  id v24;
  char v25;
  id v26;

  v9 = a2;
  v23 = a1;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v23, v10, 0);

  if (!v11)
  {
    if (a5)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v23, v14, 0);

      if (v15)
        v16 = 0;
      else
        v16 = objc_retainAutorelease(v26);
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v12 = _LSFindOrRegisterBundleNode(v11, v9, 0, a3, a4, 0, 0);
  if (v12 == -10811)
  {
    v22 = -1;
    v17 = (void *)_LSGetLibraryBundleIdentifierAndItemIndexForNode(v11, v9, &v22);
    if (v17 && v22 == -1)
    {
      v13 = _LSRegisterLibrary(v11, v17, 1, a5);
      goto LABEL_19;
    }
    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10811, (uint64_t)"_LSRegisterBundleNode", 2524, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
  if (v12)
  {
    if (a5)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v12, (uint64_t)"_LSRegisterBundleNode", 2529, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v16 = v18;
LABEL_18:
      v13 = 0;
      *a5 = v16;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  v13 = 1;
LABEL_19:
  if (v23 && v25)
    _LSContextDestroy(v23);
  v19 = v24;
  v23 = 0;
  v24 = 0;

  v25 = 0;
  v20 = v26;
  v26 = 0;

  return v13;
}

void sub_1829A4234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

uint64_t _LSGetLibraryBundleIdentifierAndItemIndexForNode(LSContext *a1, FSNode *a2, uint64_t *a3)
{
  FSNode *v5;
  size_t v6;
  uint64_t v7;
  const char **v8;
  const char **v9;
  size_t v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  size_t v19;
  int v20;
  _QWORD v21[5];
  int v22;
  uint64_t v23;
  int v24;
  _OWORD v25[2];
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v24 = 0;
  v23 = 0;
  bzero(v26, 0x400uLL);
  *a3 = -1;
  if (!-[FSNode getFileSystemRepresentation:error:](v5, "getFileSystemRepresentation:error:", v26, 0))
    goto LABEL_8;
  v6 = strlen(v26);
  v7 = 0;
  while (1)
  {
    getLibIDs();
    v8 = (const char **)_LSPathForBundleLibraryIdentifier((const __CFString *)getLibIDs(void)::klibIDs[v7]);
    v9 = v8;
    if (v8)
    {
      v10 = *(int *)v8;
      if (v6 > v10 && !strncasecmp(v26, v8[1], *(int *)v8) && v26[v10] == 47)
        break;
    }
    if (++v7 == 4)
      goto LABEL_8;
  }
  getLibIDs();
  v13 = (void *)getLibIDs(void)::klibIDs[v7];
  memset(v25, 0, sizeof(v25));
  if (_LSBundleFindWithInfo((uint64_t)a1, 0, v13, 0, v25, 8, 128, &v24, &v23))
  {
LABEL_8:
    v11 = 0;
  }
  else
  {
    getLibIDs();
    v11 = getLibIDs(void)::klibIDs[v7];
    if (v24)
    {
      v14 = 0;
      v15 = *(int *)v9;
      v16 = &v26[v15 + 1];
      v17 = ~v15 + v6;
      while (1)
      {
        v18 = kLibrarySubfolders[v14];
        if (v17 > v18
          && !strncasecmp(v16, *(const char **)&kLibrarySubfolders[v14 + 2], kLibrarySubfolders[v14])
          && v16[v18] == 47)
        {
          break;
        }
        v14 += 6;
        if (v14 == 60)
          goto LABEL_8;
      }
      if (*(_DWORD *)(v23 + 464))
      {
        if (-[FSNode isDirectory](v5, "isDirectory"))
        {
          MEMORY[0x1E0C80A78]();
          strlcpy((char *)v21 - ((v17 + 17) & 0xFFFFFFFFFFFFFFF0), v16, v19);
          *(_WORD *)((char *)v21 + v17 - ((v17 + 17) & 0xFFFFFFFFFFFFFFF0)) = 47;
          v20 = _CSGetStringForCharacters();
        }
        else
        {
          v20 = _CSGetStringForCharacters();
        }
        if (v20)
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = ___ZL48_LSGetLibraryBundleIdentifierAndItemIndexForNodeP9LSContextP6FSNodePl_block_invoke;
          v21[3] = &__block_descriptor_44_e14_v24__0I8I12_16l;
          v22 = v20;
          v21[4] = a3;
          _CSArrayEnumerateAllValues();
        }
      }
    }
  }

  return v11;
}

void sub_1829A4554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _LSRegisterLibrary(LSContext *a1, void *a2, int a3, _QWORD *a4)
{
  __CFString *v7;
  uint64_t v8;
  FSNode *v9;
  int v10;
  LSRegistrationInfo *v11;
  LSRegistrationInfo *v12;
  FSNode *v13;
  NSData *v14;
  int v15;
  _BOOL8 v16;
  id v17;
  int v18;
  const __CFArray **v20;
  unsigned __int8 *v21;
  unsigned int v22;
  LSBundleData *v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = _LSPathForBundleLibraryIdentifier(v7);
  v24 = 0;
  v23 = 0;
  v22 = 0;
  v21 = 0;
  if (!v8)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -43, (uint64_t)"_LSRegisterLibrary", 3029, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      goto LABEL_19;
    }
    v9 = 0;
    goto LABEL_30;
  }
  v9 = -[FSNode initWithFileSystemRepresentation:flags:error:]([FSNode alloc], "initWithFileSystemRepresentation:flags:error:", *(_QWORD *)(v8 + 8), 8, a4);
  if (!v9)
    goto LABEL_30;
  v10 = _LSBundleFindWithNode((uint64_t)a1, v9, &v24, &v23);
  if (v10 != -9499)
  {
    if (v10)
    {
      if (a4)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v10, (uint64_t)"_LSRegisterLibrary", 3036, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
        v16 = 0;
        *a4 = v17;
        goto LABEL_31;
      }
LABEL_30:
      v16 = 0;
      goto LABEL_31;
    }
    if (!_LSBundleNeedsRegistration(a1, v9, a3, v24, v23))
      goto LABEL_30;
  }
  if (!_LSContainerFindOrRegisterWithNode((id *)&a1->db, v9, a3, &v22, 0, (id *)&v21, a4))
    goto LABEL_30;
  if (!v24)
  {
    v18 = _LSBundleFindWithNode((uint64_t)a1, v9, &v24, &v23);
    if (v18 != -9499)
    {
      if (!v18)
      {
        if (!_LSBundleNeedsRegistration(a1, v9, a3, v24, v23))
          goto LABEL_30;
        goto LABEL_8;
      }
      if (a4)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v18, (uint64_t)"_LSRegisterLibrary", 3050, 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      goto LABEL_30;
    }
  }
LABEL_8:
  v11 = objc_alloc_init(LSRegistrationInfo);
  v11->version = 7;
  v11->action = 205;
  v11->options = a3;
  v11->containerUnit = v22;
  v11->bundleUnit = v24;
  v11->bundleClass = 8;
  if (_LSGetItemInfoFlagsForNode(a1, v9, &v11->itemFlags, a4)
    && -[FSNode getContentModificationDate:error:](v9, "getContentModificationDate:error:", &v11->contentModDate, a4)
    && -[FSNode getInodeNumber:error:](v9, "getInodeNumber:error:", &v11->inoBundle, a4)
    && (-[FSNode bookmarkDataRelativeToNode:error:](v9, "bookmarkDataRelativeToNode:error:", v21, a4),
        (v12 = (LSRegistrationInfo *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v25 = *MEMORY[0x1E0C9AE78];
    v26[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v13 = (FSNode *)objc_claimAutoreleasedReturnValue();
    -[FSNode URL](v9, "URL");
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    v15 = _LSDispatchRegistration(a1, (char *)v11, v12, v14, v13, (const __CFURL *)&v11->bundleUnit, 0, 0, v20, v21);

    v16 = v15 == 0;
    if (a4 && v15)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v15, (uint64_t)"_LSRegisterLibrary", 3090, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v16 = 0;
  }

LABEL_31:
  return v16;
}

void sub_1829A4988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id getNeedsRegistrationLog(void)
{
  if (getNeedsRegistrationLog(void)::once != -1)
    dispatch_once(&getNeedsRegistrationLog(void)::once, &__block_literal_global_210);
  return (id)getNeedsRegistrationLog(void)::result;
}

BOOL _LSRegisterBundleNode(LSContext *a1, unsigned int a2, void *a3, void *a4, unsigned int a5, FSNode *a6, const __CFArray **a7, const __CFArray **a8, const __CFURL *a9, id *a10)
{
  FSNode *v16;
  LSRegistrationInfo *v17;
  unsigned int bundleClass;
  id v20;
  _BOOL8 v21;
  LSRegistrationInfo *v22;
  void *v23;
  int v24;
  NSString *Value;
  CFTypeID TypeID;
  __CFString *v27;
  unsigned int *v29;
  id v31;
  int v32;
  char v33[1024];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v16 = a4;
  v17 = objc_alloc_init(LSRegistrationInfo);
  v17->bundleClass = _LSGetBundleClassForNode((uint64_t)a1, v16);
  bundleClass = v17->bundleClass;
  if (bundleClass == 3 || bundleClass == 0)
  {
    if (a10)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10811, (uint64_t)"_LSRegisterBundleNode", 2052, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v22 = 0;
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  if ((a5 & 0x40) != 0 && bundleClass == 2)
    v17->bundleClass = 16;
  v17->version = 7;
  v17->action = 203;
  v17->options = a5;
  v17->containerUnit = a2;
  if (*(_DWORD *)a9)
    v17->bundleUnit = *(_DWORD *)a9;
  if (!_LSGetItemInfoFlagsForNode(a1, v16, &v17->itemFlags, a10)
    || !-[FSNode getContentModificationDate:error:](v16, "getContentModificationDate:error:", &v17->contentModDate, a10))
  {
LABEL_28:
    v21 = 0;
    v22 = 0;
    goto LABEL_29;
  }
  -[FSNode bookmarkDataRelativeToNode:error:](v16, "bookmarkDataRelativeToNode:error:", v31, a10);
  v22 = (LSRegistrationInfo *)objc_claimAutoreleasedReturnValue();
  if (!v22
    || !-[FSNode getInodeNumber:error:](v16, "getInodeNumber:error:", &v17->inoBundle, a10)
    || !-[FSNode getFileSystemRepresentation:error:](v16, "getFileSystemRepresentation:error:", v33, a10))
  {
    goto LABEL_43;
  }
  if ((v17->options & 4) != 0)
    goto LABEL_23;
  v32 = -2;
  if (!-[FSNode getOwnerUID:error:](v16, "getOwnerUID:error:", &v32, a10))
  {
LABEL_43:
    v21 = 0;
    if (!a6)
      goto LABEL_42;
    goto LABEL_30;
  }
  if (!v32 && _LSPathIsTrusted(v33))
    v17->options |= 2u;
LABEL_23:
  v23 = (void *)MEMORY[0x186DAE7A0]();
  v24 = _LSRegisterDirectoryNode(a1, v16, (FSNode *)v17, v22, a6, a7, a8, a9, v29);
  objc_autoreleasePoolPop(v23);
  v21 = v24 == 0;
  if (a10 && v24)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v24, (uint64_t)"_LSRegisterBundleNode", 2147, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
LABEL_26:
    *a10 = v20;
    if (!a6)
      goto LABEL_42;
LABEL_30:
    if (*MEMORY[0x1E0C9AE78])
    {
      Value = (NSString *)CFDictionaryGetValue((CFDictionaryRef)a6, (const void *)*MEMORY[0x1E0C9AE78]);
      TypeID = CFStringGetTypeID();
      if (!Value || !TypeID || CFGetTypeID(Value) == TypeID)
      {
        if (v21)
        {
LABEL_35:
          v27 = CFSTR("success");
LABEL_41:
          _LSLogStepFinished(4, v21, Value, CFSTR("Registered bundle status = %@"), v27);

          goto LABEL_42;
        }
LABEL_38:
        if (a10)
        {
          objc_msgSend(*a10, "description");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = CFSTR("untracked error");
        }
        goto LABEL_41;
      }
    }
    else
    {
      CFStringGetTypeID();
    }
    Value = 0;
    if (v21)
      goto LABEL_35;
    goto LABEL_38;
  }
LABEL_29:
  if (a6)
    goto LABEL_30;
LABEL_42:

  return v21;
}

void sub_1829A4E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t _LSPathForBundleLibraryIdentifier(const __CFString *a1)
{
  uint64_t v2;

  if (CFEqual(a1, CFSTR("com.apple.system-library")))
  {
    v2 = 0;
    return (uint64_t)&libPaths + 16 * v2;
  }
  if (CFEqual(a1, CFSTR("com.apple.local-library")))
  {
    v2 = 1;
    return (uint64_t)&libPaths + 16 * v2;
  }
  if (CFEqual(a1, CFSTR("com.apple.network-library")))
  {
    v2 = 2;
    return (uint64_t)&libPaths + 16 * v2;
  }
  if (CFEqual(a1, CFSTR("com.apple.apple-internal-library")))
  {
    v2 = 3;
    return (uint64_t)&libPaths + 16 * v2;
  }
  return 0;
}

uint64_t _LSDispatchRegistration(LSContext *a1, char *a2, LSRegistrationInfo *a3, NSData *a4, FSNode *a5, const __CFURL *a6, const __CFArray **a7, unsigned __int8 *a8, const __CFArray **a9, unsigned __int8 *a10)
{
  char *v17;
  LSRegistrationInfo *v18;
  uint64_t BundleDataAndRegister;
  LSRegistrationInfo *v20;
  LSRegistrationInfo *v21;
  NSObject *v22;
  void *context;
  uint8_t buf[4];
  NSData *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a3;
  context = (void *)MEMORY[0x186DAE7A0]();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer"))
  {
    if ((v17[19] & 1) == 0)
    {
      BundleDataAndRegister = _LSRegisterItemInfo(v17, v18, 0, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);
      goto LABEL_14;
    }
  }
  else if (!v17)
  {
    v20 = objc_alloc_init(LSRegistrationInfo);
    goto LABEL_7;
  }
  v20 = (LSRegistrationInfo *)objc_msgSend(v17, "mutableCopy");
LABEL_7:
  v21 = v20;
  BundleDataAndRegister = _LSServerCreateBundleDataAndRegister(a1, v20, (NSData *)v18, (const __CFURL *)a4, a5, (unsigned int *)a6, a7, a8);
  if ((_DWORD)BundleDataAndRegister == -10675)
  {
    if ((v21->options & 2) != 0)
    {
      BundleDataAndRegister = 4294956621;
    }
    else
    {
      _LSInstallLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = a4;
        _os_log_impl(&dword_182882000, v22, OS_LOG_TYPE_DEFAULT, "Retrying registration of %@ with trusted bit", buf, 0xCu);
      }

      v21->options |= 2u;
      BundleDataAndRegister = _LSServerCreateBundleDataAndRegister(a1, v21, (NSData *)v18, (const __CFURL *)a4, a5, (unsigned int *)a6, a7, a8);
    }
  }

LABEL_14:
  objc_autoreleasePoolPop(context);

  return BundleDataAndRegister;
}

void sub_1829A5120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterBundle(void **a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  int v12;
  _LSDServiceDomain *v13;
  void **v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t SequenceNumber;
  id v21;
  id v22;
  uint64_t v23;
  id v25;
  _QWORD v26[5];
  void (*v27[12])(_QWORD, _QWORD);
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  void **v33;
  id v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  _BYTE v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = -10810;
  v6 = (void *)MEMORY[0x186DAE7A0]();
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) == 0
    && (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) != 0)
  {
    v7 = MEMORY[0x1E0C809B0];
    v27[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
    v27[1] = (void (*)(_QWORD, _QWORD))3221225472;
    v27[2] = (void (*)(_QWORD, _QWORD))___LSUnregisterBundle_block_invoke_129;
    v27[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
    v27[4] = (void (*)(_QWORD, _QWORD))&v37;
    +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = ___LSUnregisterBundle_block_invoke_2;
    v26[3] = &unk_1E10440F0;
    v26[4] = &v37;
    objc_msgSend(v8, "unregisterBundleUnit:options:completionHandler:", a2, a3, v26);
    if ((a3 & 0x3000000) == 0x2000000 && !*((_DWORD *)v38 + 6))
    {
      v25 = 0;
      v9 = _LSContextUpdate(a1, 1, &v25);
      v10 = v25;
      v11 = v10;
      if ((v9 & 1) != 0)
        v12 = 0;
      else
        v12 = _LSGetOSStatusFromNSError(v10);
      *((_DWORD *)v38 + 6) = v12;

    }
    goto LABEL_32;
  }
  v33 = a1;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v14 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v33, v13, 0);

  if (v14)
  {
    *((_DWORD *)v38 + 6) = 0;
    if ((a3 & 0x20000000) != 0)
    {
      if (CSStoreGetUnit())
      {
        v18 = _LSPluginUnregister(*v14, a2);
LABEL_20:
        *((_DWORD *)v38 + 6) = v18;
        if (!v18)
        {
          SequenceNumber = _LSDatabaseGetSequenceNumber();
          _LSDatabaseSetSequenceNumber((uint64_t)*v14, SequenceNumber + 1);
          if (!*((_DWORD *)v38 + 6))
            _LSArmSaveTimer(5);
        }
        goto LABEL_25;
      }
    }
    else if (CSStoreGetUnit())
    {
      v15 = _LSBundleGet(*v14, a2);
      if (*(_DWORD *)(v15 + 168) == 2)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        v27[5] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
        v27[6] = (void (*)(_QWORD, _QWORD))3221225472;
        v27[7] = (void (*)(_QWORD, _QWORD))___LSUnregisterBundle_block_invoke;
        v27[8] = (void (*)(_QWORD, _QWORD))&unk_1E1044F28;
        v28 = a2;
        v27[10] = (void (*)(_QWORD, _QWORD))v14;
        v27[11] = (void (*)(_QWORD, _QWORD))v15;
        v27[9] = (void (*)(_QWORD, _QWORD))&v29;
        _LSDatabaseEnumeratingBindingMap();
        if (!*((_BYTE *)v30 + 24))
        {
          _LSAppProtectionLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = (void *)_CSStringCopyCFString();
            _LSUnregisterBundle_cold_1(v17, (uint64_t)v41, v16);
          }

          +[_LSDAppProtectionClient cleanupDeletedApplication:](_LSDAppProtectionClient, "cleanupDeletedApplication:", _CSStringCopyCFString());
        }
        _Block_object_dispose(&v29, 8);
      }
      v18 = _LSBundleRemove(*v14, a2, 1);
      goto LABEL_20;
    }
    v19 = -9499;
  }
  else
  {
    v19 = LaunchServices::Database::Context::status((id *)&v33);
  }
  *((_DWORD *)v38 + 6) = v19;
LABEL_25:
  if (v33 && v35)
    _LSContextDestroy(v33);
  v21 = v34;
  v33 = 0;
  v34 = 0;

  v35 = 0;
  v22 = v36;
  v36 = 0;

LABEL_32:
  objc_autoreleasePoolPop(v6);
  v23 = *((unsigned int *)v38 + 6);
  _Block_object_dispose(&v37, 8);
  return v23;
}

void sub_1829A554C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;
  uint64_t v30;

  _Block_object_dispose(&a29, 8);
  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)(v30 - 176));
  _Block_object_dispose((const void *)(v30 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1829A56AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829A5718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _LSUpdateContainerState(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  id v19;
  int v20;
  uint64_t *v21;
  _BOOL4 v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t *v25;
  BOOL v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v33;
  void (**v34)(_QWORD);
  void *v35;
  int v36;
  uint64_t v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[6];
  void (*v44[5])(_QWORD, _QWORD);
  _QWORD v45[4];
  void (**v46)(_QWORD);
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  int v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  __n128 (*v57)(__n128 *, __n128 *);
  uint64_t (*v58)();
  const char *v59;
  __int128 v60;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  int v65;

  v5 = a1;
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = -10810;
  if (v5)
  {
    if ((_DWORD)a2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus _LSUpdateContainerState(__strong LSDatabaseRef, LSContainerID, LSContainerData *)");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("LSRegistration.mm"), 3342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inDB != NULL"));

    if ((_DWORD)a2)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus _LSUpdateContainerState(__strong LSDatabaseRef, LSContainerID, LSContainerData *)");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("LSRegistration.mm"), 3343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inContainerUnit != kCSStoreNullID"));

LABEL_3:
  v6 = (void *)MEMORY[0x186DAE7A0]();
  v7 = _LSContainerGet();
  if (v7)
  {
    v54 = 0;
    v55 = &v54;
    v56 = 0x4812000000;
    v57 = __Block_byref_object_copy__139;
    v58 = __Block_byref_object_dispose__140;
    v59 = "";
    v8 = *(_OWORD *)v7;
    v61 = *(_DWORD *)(v7 + 16);
    v60 = v8;
    if (_LSContainerDataNeedsUpdate((uint64_t)&v60))
    {
      if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0
        || (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer") & 1) == 0)
      {
        v53 = 0;
        v11 = *(_DWORD *)(v7 + 12);
        if (v11)
        {
          _LSAliasGet(v5, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v52 = 0;
            v13 = +[FSNode getVolumeIdentifier:forBookmarkData:error:](FSNode, "getVolumeIdentifier:forBookmarkData:error:", &v53, v12, &v52);
            v14 = v52;
            v15 = v14;
            if (v13)
              v16 = 0;
            else
              v16 = _LSGetOSStatusFromNSError(v14);
            *((_DWORD *)v63 + 6) = v16;

          }
          else
          {
            *((_DWORD *)v63 + 6) = -41;
          }

        }
        else if ((*(_WORD *)v7 & 2) != 0)
        {
          +[FSNode rootVolumeNode](FSNode, "rootVolumeNode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          v18 = objc_msgSend(v17, "getVolumeIdentifier:error:", &v53, &v51);
          v19 = v51;

          if ((v18 & 1) != 0)
            v20 = 0;
          else
            v20 = _LSGetOSStatusFromNSError(v19);
          *((_DWORD *)v63 + 6) = v20;

        }
        else
        {
          *((_DWORD *)v63 + 6) = -35;
        }
        v21 = v63;
        v22 = *((_DWORD *)v63 + 6) == 0;
        v23 = v53;
        v24 = v53 != 0;
        v25 = v55;
        v26 = !v22 || !v24;
        if (v22 && v24)
          v27 = 1;
        else
          v27 = -1;
        if (v26)
          v23 = 0;
        *((_BYTE *)v55 + 50) = v27;
        *(uint64_t *)((char *)v25 + 52) = v23;
        *((_DWORD *)v21 + 6) = 0;
        v28 = v25[6];
        v29 = v25[7];
        v30 = *((unsigned int *)v25 + 16);
        if (v28 != *(_QWORD *)v7 || v29 != *(_QWORD *)(v7 + 8) || v30 != *(_DWORD *)(v7 + 16))
        {
          v33 = MEMORY[0x1E0C809B0];
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = ___LSUpdateContainerState_block_invoke;
          v47[3] = &unk_1E1044F50;
          v49 = &v54;
          v48 = v5;
          v50 = a2;
          v34 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v47);
          if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
          {
            +[LSDBExecutionContext sharedServerInstance]();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v45[0] = v33;
            v45[1] = 3221225472;
            v45[2] = ___LSUpdateContainerState_block_invoke_2;
            v45[3] = &unk_1E1041740;
            v46 = v34;
            -[LSDBExecutionContext performAsyncWrite:]((uint64_t)v35, v45);

          }
          else
          {
            v34[2](v34);
          }

        }
      }
      else
      {
        v9 = MEMORY[0x1E0C809B0];
        v44[0] = (void (*)(_QWORD, _QWORD))MEMORY[0x1E0C809B0];
        v44[1] = (void (*)(_QWORD, _QWORD))3221225472;
        v44[2] = (void (*)(_QWORD, _QWORD))___LSUpdateContainerState_block_invoke_3;
        v44[3] = (void (*)(_QWORD, _QWORD))&unk_1E103FB88;
        v44[4] = (void (*)(_QWORD, _QWORD))&v62;
        +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)_LSDModifyService, v44);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = v9;
        v43[1] = 3221225472;
        v43[2] = ___LSUpdateContainerState_block_invoke_4;
        v43[3] = &unk_1E1044F78;
        v43[4] = &v62;
        v43[5] = &v54;
        objc_msgSend(v10, "updateContainerUnit:completionHandler:", a2, v43);

      }
    }
    else
    {
      *((_DWORD *)v63 + 6) = 0;
    }
    if (a3 && !*((_DWORD *)v63 + 6))
    {
      v36 = *((_DWORD *)v55 + 16);
      *(_OWORD *)a3 = *((_OWORD *)v55 + 3);
      *(_DWORD *)(a3 + 16) = v36;
    }
    _Block_object_dispose(&v54, 8);
  }
  else
  {
    *((_DWORD *)v63 + 6) = -10817;
  }
  objc_autoreleasePoolPop(v6);
  v37 = *((unsigned int *)v63 + 6);
  _Block_object_dispose(&v62, 8);

  return v37;
}

void sub_1829A5C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  _Block_object_dispose((const void *)(v4 - 128), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__139(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[4].n128_u32[0] = a2[4].n128_u32[0];
  a1[3] = result;
  return result;
}

void sub_1829A5D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829A5E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsForBundle(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  id v9;
  id v10;
  int v11;
  uint64_t v12;

  v9 = a1;
  v10 = a5;
  if (a3)
    v11 = *(_DWORD *)(a3 + 472);
  else
    v11 = 0;
  v12 = _LSRegisterTypeDeclarationsCommon(v9, a2, v11, a4, v10);

  return v12;
}

void sub_1829A5EEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsCommon(void *a1, uint64_t a2, int a3, const void *a4, void *a5)
{
  id v8;
  id v9;
  uint64_t v10;
  CFTypeID v11;
  CFIndex Count;
  CFIndex i;
  const void *ValueAtIndex;
  CFTypeID TypeID;

  v8 = a1;
  v9 = a5;
  v10 = 0;
  if (v8 && a3 && a4)
  {
    v11 = CFGetTypeID(a4);
    if (v11 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)a4);
      if (Count < 1)
      {
        v10 = 0;
      }
      else
      {
        for (i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a4, i);
          TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex && TypeID)
            CFGetTypeID(ValueAtIndex);
          v10 = _UTTypeAddWithDeclarationDictionary();
          if (!(_DWORD)v10)
            _CSArrayAppendValue();
        }
      }
    }
    else
    {
      v10 = 4294956479;
    }
  }

  return v10;
}

void sub_1829A6044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterTypeDeclarationsForPlugin(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  id v9;
  id v10;
  int v11;
  uint64_t v12;

  v9 = a1;
  v10 = a5;
  if (a3)
    v11 = *(_DWORD *)(a3 + 232);
  else
    v11 = 0;
  v12 = _LSRegisterTypeDeclarationsCommon(v9, a2, v11, a4, v10);

  return v12;
}

void sub_1829A60E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterDocumentTypes(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  uint64_t v6;
  unsigned int v7;
  CFTypeID v8;
  __int128 v9;
  CFIndex v10;
  void *ValueAtIndex;
  CFTypeID TypeID;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  CFIndex j;
  const void *v36;
  CFTypeID v37;
  unsigned int *v38;
  uint64_t v39;
  NSObject *v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  const char *v44;
  CFTypeID v45;
  int v46;
  uint32_t v47;
  const void *v48;
  int v49;
  __int16 v50;
  int v51;
  CFTypeID v52;
  void *Value;
  void *v54;
  id v55;
  void *v56;
  const __CFArray *v57;
  CFTypeID v58;
  CFIndex v59;
  int v60;
  CFIndex v61;
  const __CFString *v62;
  CFTypeID v63;
  int StringForCFString;
  char *v65;
  const __CFString *v66;
  CFTypeID v67;
  const __CFString *v68;
  CFTypeID v69;
  const __CFString *v70;
  CFTypeID v71;
  const __CFString *v72;
  CFTypeID v73;
  int v74;
  CFIndex Length;
  unsigned int v76;
  const void *v77;
  CFTypeID v78;
  CFTypeID v79;
  CFIndex v80;
  int v81;
  CFIndex k;
  const __CFString *v83;
  CFTypeID v84;
  CFTypeID v85;
  uint64_t active;
  unsigned int v87;
  const __CFArray *v88;
  CFTypeID v89;
  CFIndex v90;
  CFIndex m;
  const __CFString *v92;
  CFTypeID v93;
  CFTypeID v94;
  unsigned int v95;
  unsigned int *v96;
  NSObject *v97;
  uint64_t v98;
  const __CFArray *v99;
  CFTypeID v100;
  CFIndex v101;
  CFIndex n;
  const __CFString *v103;
  CFTypeID v104;
  unsigned int v105;
  int v106;
  uint64_t v107;
  __int128 v109;
  void *v110;
  void *v111;
  CFIndex Count;
  void *v113;
  const __CFArray *theArray;
  void *key;
  void *v116;
  CFIndex idx;
  unsigned int v118;
  id v119;
  unsigned int *v120;
  void *v121;
  id v122;
  CFArrayRef v123;
  uint64_t v124;
  unsigned int v125[2048];
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;
  uint8_t buf[32];
  __int128 v133;
  __int128 v134;
  _DWORD v135[4];
  __int128 v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  CFRange v140;

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v124 = v6;
  v118 = v7;
  v139 = *MEMORY[0x1E0C80C00];
  v120 = v1;
  v119 = v3;
  if (v5 && (theArray = v5, v8 = CFGetTypeID(v5), v8 == CFArrayGetTypeID()))
  {
    Count = CFArrayGetCount(v5);
    _LSBindingListBufferInit((uint64_t)v120, v125);
    if (Count >= 1)
    {
      v10 = 0;
      v116 = (void *)*MEMORY[0x1E0C9AB18];
      key = (void *)*MEMORY[0x1E0C9AB10];
      v110 = (void *)*MEMORY[0x1E0C9AB08];
      v113 = (void *)*MEMORY[0x1E0C9AE78];
      *(_QWORD *)&v9 = 138412290;
      v109 = v9;
      v111 = (void *)*MEMORY[0x1E0C9AB00];
      do
      {
        idx = v10;
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v10);
        TypeID = CFDictionaryGetTypeID();
        if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
        {
          v13 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v123 = (CFArrayRef)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_class();
          objc_msgSend(ValueAtIndex, "objectForKey:", CFSTR("LSHandlerRank"));
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v14 && v15 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v16 = 0;
          }
          v17 = objc_opt_class();
          objc_msgSend(ValueAtIndex, "objectForKey:", CFSTR("LSItemContentTypes"));
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v17 && v18 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v19 = 0;
          }
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("Owner"), v109) && objc_msgSend(v19, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v21 = objc_claimAutoreleasedReturnValue();
            v121 = v13;
            v133 = 0u;
            v134 = 0u;
            memset(buf, 0, sizeof(buf));
            v22 = v19;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", buf, &v127, 16);
            if (v23)
            {
              v24 = **(_QWORD **)&buf[16];
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (**(_QWORD **)&buf[16] != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * i);
                  if ((_NSIsNSString() & 1) != 0)
                  {
                    if (_UTTypeIsWildcard(v26))
                      v27 = (void *)v20;
                    else
                      v27 = (void *)v21;
                    objc_msgSend(v27, "addObject:", v26);
                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", buf, &v127, 16);
              }
              while (v23);
            }

            v13 = v121;
            v28 = (void *)v21;
            v29 = (void *)v20;
          }
          else
          {
            v28 = 0;
            v29 = 0;
          }
          if (objc_msgSend(v29, "count"))
          {
            _LSDefaultLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v136) = v109;
              *(_QWORD *)((char *)&v136 + 4) = v29;
              _os_log_debug_impl(&dword_182882000, v32, OS_LOG_TYPE_DEBUG, "Decomposeing docuemnt claim for types: %@", (uint8_t *)&v136, 0xCu);
            }

            v33 = (void *)objc_msgSend(ValueAtIndex, "mutableCopy");
            objc_msgSend(v33, "setObject:forKey:", v29, CFSTR("LSItemContentTypes"));
            objc_msgSend(v33, "setObject:forKey:", CFSTR("Default"), CFSTR("LSHandlerRank"));
            -[__CFArray addObject:](v123, "addObject:", v33);
            if (objc_msgSend(v28, "count"))
            {
              v34 = (void *)objc_msgSend(ValueAtIndex, "mutableCopy");
              objc_msgSend(v34, "setObject:forKey:", v28, CFSTR("LSItemContentTypes"));
              -[__CFArray addObject:](v123, "addObject:", v34);

            }
          }
          else
          {
            -[__CFArray addObject:](v123, "addObject:", ValueAtIndex);
          }

          objc_autoreleasePoolPop(v13);
          if (v123)
          {
            for (j = 0; ; ++j)
            {
              if (j >= CFArrayGetCount(v123))
              {
                CFRelease(v123);
                goto LABEL_197;
              }
              v36 = CFArrayGetValueAtIndex(v123, j);
              v37 = CFDictionaryGetTypeID();
              if (v36 && v37 && CFGetTypeID(v36) != v37)
                v36 = 0;
              v38 = v120;
              v122 = v119;
              v126 = 0;
              v131 = 0;
              v129 = 0u;
              v130 = 0u;
              v127 = 0u;
              v128 = 0u;
              *(_QWORD *)&v136 = 0;
              *((_QWORD *)&v136 + 1) = &v136;
              v137 = 0x2020000000;
              v138 = 0;
              v39 = *(_QWORD *)(v124 + 172);
              if (*(_DWORD *)(v124 + 20) == 6 && (v39 & 0x200000000) == 0)
              {
                _LSRegistrationLog();
                v40 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  goto LABEL_62;
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v118;
                v41 = buf;
                v42 = v40;
                v43 = OS_LOG_TYPE_INFO;
                v44 = "Skipping document claims for bundle %llu because it is Mac Catalyst but does not support open-in-place";
LABEL_60:
                v47 = 12;
                goto LABEL_61;
              }
              if ((v39 & 0x1000000000000000) != 0)
              {
                _LSDefaultLog();
                v40 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  goto LABEL_62;
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v118;
                v41 = buf;
                v42 = v40;
                v43 = OS_LOG_TYPE_INFO;
                v44 = "Skipping document claims for bundle %llu because it is an App Clip";
                goto LABEL_60;
              }
              if (v36)
              {
                v45 = CFGetTypeID(v36);
                if (v45 == CFDictionaryGetTypeID())
                {
                  DWORD2(v127) = 32;
                  if (_LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("LSDefaultShareModeCollaboration")))
                  {
                    v46 = 2080;
                    DWORD2(v127) = 2080;
                  }
                  else
                  {
                    v46 = 32;
                  }
                  if (_LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("LSTypeIsPackage")))
                  {
                    v46 |= 8u;
                    DWORD2(v127) = v46;
                  }
                  if (_LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("LSIsAppleDefaultForType")))
                  {
                    v46 |= 1u;
                    DWORD2(v127) = v46;
                    *(_BYTE *)(*((_QWORD *)&v136 + 1) + 24) = 1;
                  }
                  if ((*(_BYTE *)(v124 + 164) & 0x10) != 0
                    && _LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("LSIsAppleDefaultNoOverrideForType")))
                  {
                    v46 |= 3u;
                    DWORD2(v127) = v46;
                    *(_BYTE *)(*((_QWORD *)&v136 + 1) + 24) = 1;
                  }
                  if ((*(_BYTE *)(v124 + 164) & 1) != 0)
                    DWORD2(v127) = v46 | 4;
                  WORD6(v127) = _LSGetHandlerRankFromDictKey((const __CFDictionary *)v36, v48);
                  v49 = _LSGetRoleFromDictKey((const __CFDictionary *)v36, v116);
                  LOBYTE(v50) = v49;
                  HIWORD(v127) = v49;
                  v51 = *(_DWORD *)(v124 + 168);
                  if (!v49)
                  {
                    if (v51 == 2)
                      v50 = 2;
                    else
                      v50 = 1;
                    HIWORD(v127) = v50;
                  }
                  if (v51 == 2 || (v50 & 0x11) != 0)
                    break;
                }
              }
LABEL_63:
              _Block_object_dispose(&v136, 8);

              _LSBindingListBufferReset(v38, (uint64_t)v125);
            }
            v52 = CFStringGetTypeID();
            Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v36, key);
            v54 = Value;
            if (Value && CFGetTypeID(Value) == v52)
            {
              v55 = v54;
              objc_msgSend(v122, "objectForKeyedSubscript:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              DWORD1(v128) = LaunchServices::LocalizedString::Add(v38, v56, v55);

            }
            if (!_LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("CFBundleTypeIconSystemGenerated")))
            {
              v57 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("CFBundleTypeIconFiles"));
              v58 = CFArrayGetTypeID();
              if (v57 && (!v58 || CFGetTypeID(v57) == v58))
              {
                v59 = CFArrayGetCount(v57);
                if (v59 >= 1)
                {
                  v60 = 0;
                  v61 = 0;
                  do
                  {
                    v62 = (const __CFString *)CFArrayGetValueAtIndex(v57, v61);
                    v63 = CFStringGetTypeID();
                    if (v62 && (!v63 || CFGetTypeID(v62) == v63))
                    {
                      StringForCFString = _LSDatabaseCreateStringForCFString(v38, v62, 0);
                      v65 = (char *)&v127 + 4 * v60++;
                      *((_DWORD *)v65 + 7) = StringForCFString;
                    }
                    ++v61;
                  }
                  while (v61 < v59 && v60 < 8);
                }
              }
              else if (v110)
              {
                v66 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v36, v110);
                v67 = CFStringGetTypeID();
                if (v66 && (!v67 || CFGetTypeID(v66) == v67))
                  HIDWORD(v128) = _LSDatabaseCreateStringForCFString(v38, v66, 0);
              }
              else
              {
                CFStringGetTypeID();
              }
              v68 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("LSIconName"));
              v69 = CFStringGetTypeID();
              if (v68 && (!v69 || CFGetTypeID(v68) == v69))
                HIDWORD(v130) = _LSDatabaseCreateStringForCFString(v38, v68, 0);
            }
            if (_LSGetBooleanFromDict((const __CFDictionary *)v36, CFSTR("NSResolvesUbiquitousConflicts"))|| CFDictionaryContainsKey((CFDictionaryRef)v36, CFSTR("NSDocumentClass")))
            {
              DWORD2(v127) |= 0x200u;
            }
            v70 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("_LSBundleLibraryDelegate"));
            v71 = CFStringGetTypeID();
            if (v70 && v71 && CFGetTypeID(v70) != v71)
              v70 = 0;
            LODWORD(v131) = _LSDatabaseCreateStringForCFString(v38, v70, 0);
            if (!(_DWORD)v131)
              goto LABEL_126;
            if (v113)
            {
              v72 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v36, v113);
              v73 = CFStringGetTypeID();
              if (v72 && (!v73 || CFGetTypeID(v72) == v73))
              {
                v74 = DWORD2(v127);
                Length = CFStringGetLength(v72);
                if (Length > CFStringGetLength(CFSTR("com.apple.")))
                {
                  v140.length = CFStringGetLength(CFSTR("com.apple."));
                  v140.location = 0;
                  if (CFStringCompareWithOptions(v72, CFSTR("com.apple."), v140, 1uLL) == kCFCompareEqualTo)
                  {
                    v76 = v74 | 4;
                    goto LABEL_125;
                  }
                }
LABEL_124:
                v76 = v74 & 0xFFFFFFFB;
LABEL_125:
                DWORD2(v127) = v76;
LABEL_126:
                LODWORD(v128) = v118;
                HIDWORD(v131) = 0;
                v77 = CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("LSItemContentTypes"));
                v78 = CFArrayGetTypeID();
                if (v77 && (!v78 || CFGetTypeID(v77) == v78))
                {
                  v79 = CFGetTypeID(v77);
                  if (v79 == CFArrayGetTypeID())
                  {
                    v80 = CFArrayGetCount((CFArrayRef)v77);
                    if (v80 >= 1)
                    {
                      v81 = 0;
                      for (k = 0; k != v80; ++k)
                      {
                        v83 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v77, k);
                        v84 = CFStringGetTypeID();
                        if (v83 && (!v84 || CFGetTypeID(v83) == v84))
                        {
                          v85 = CFStringGetTypeID();
                          if (v85 == CFGetTypeID(v83)
                            && ((v50 & 8) == 0 || !UTTypeEqual(v83, CFSTR("com.apple.application"))))
                          {
                            active = _UTGetActiveTypeForCFStringIdentifier(v38, v83, 0);
                            if (active && (*(_BYTE *)(active + 9) & 2) != 0)
                            {
                              DWORD2(v127) |= 0x400u;
                              v81 = 1;
                            }
                            v87 = _LSDatabaseCreateStringForCFString(v38, v83, 1);
                            if (v87)
                            {
                              if (!_LSBindingListBufferAppend(v38, v125, v120[58], v87))
                                goto LABEL_63;
                              _CSStringRelease();
                            }
                          }
                        }
                      }
                      goto LABEL_186;
                    }
                  }
                  goto LABEL_188;
                }
                if (*(_DWORD *)(v124 + 20) >= 2u)
                {
                  _LSDefaultLog();
                  v97 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
                  {
                    v98 = *(unsigned int *)(v124 + 20);
                    *(_DWORD *)buf = 134218240;
                    *(_QWORD *)&buf[4] = v118;
                    *(_WORD *)&buf[12] = 2048;
                    *(_QWORD *)&buf[14] = v98;
                    _os_log_impl(&dword_182882000, v97, OS_LOG_TYPE_INFO, "Skipping legacy claim registration for bundle %llu because it's the wrong platform (is %llu)", buf, 0x16u);
                  }

                  goto LABEL_188;
                }
                if (v111)
                {
                  v88 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v36, v111);
                  v89 = CFArrayGetTypeID();
                  if (v88 && (!v89 || CFGetTypeID(v88) == v89))
                  {
                    v90 = CFArrayGetCount(v88);
                    if (v90 >= 1)
                    {
                      v81 = 0;
                      for (m = 0; m != v90; ++m)
                      {
                        v92 = (const __CFString *)CFArrayGetValueAtIndex(v88, m);
                        v93 = CFStringGetTypeID();
                        if (v92 && (!v93 || CFGetTypeID(v92) == v93))
                        {
                          v94 = CFStringGetTypeID();
                          if (v94 == CFGetTypeID(v92) && (CFStringCompare(v92, CFSTR("app"), 1uLL) || (v50 & 8) == 0))
                          {
                            v95 = _LSDatabaseCreateStringForCFString(v38, v92, 1);
                            if (v95)
                            {
                              if (!_LSBindingListBufferAppend(v38, v125, v120[84], v95))
                                goto LABEL_63;
                              _CSStringRelease();
                            }
                            if (CFStringCompare(v92, CFSTR("*"), 0))
                            {
                              if (*(_BYTE *)(*((_QWORD *)&v136 + 1) + 24))
                              {
                                *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                                *(_QWORD *)&buf[8] = 3221225472;
                                *(_QWORD *)&buf[16] = ___ZL23_LSRegisterDocumentTypeP11_LSDatabasejPK12LSBundleDataPK14__CFDictionaryP12NSDictionaryIP8NSStringPS7_IS9_S9_EEP19LSBindingListBuffer_block_invoke;
                                *(_QWORD *)&buf[24] = &unk_1E1040268;
                                v96 = v38;
                                *(_QWORD *)&v134 = v125;
                                *(_QWORD *)&v133 = v96;
                                *((_QWORD *)&v133 + 1) = &v136;
                                _CSStringBindingEnumerate();

                              }
                            }
                            else
                            {
                              DWORD2(v127) |= 0x10u;
                              v81 = 1;
                            }
                          }
                        }
                      }
LABEL_173:
                      v99 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v36, CFSTR("CFBundleTypeMIMETypes"));
                      v100 = CFArrayGetTypeID();
                      if (v99 && (!v100 || CFGetTypeID(v99) == v100))
                      {
                        v101 = CFArrayGetCount(v99);
                        if (v101 >= 1)
                        {
                          for (n = 0; n != v101; ++n)
                          {
                            v103 = (const __CFString *)CFArrayGetValueAtIndex(v99, n);
                            v104 = CFStringGetTypeID();
                            if (v103 && v104 && CFGetTypeID(v103) != v104)
                              v103 = 0;
                            v105 = _LSDatabaseCreateStringForCFString(v38, v103, 1);
                            if (v105)
                            {
                              if (!_LSBindingListBufferAppend(v38, v125, v120[110], v105))
                                goto LABEL_63;
                              _CSStringRelease();
                            }
                          }
                        }
                      }
LABEL_186:
                      if (v81)
                      {
                        _LSBundleGet(v38, v118);
                        _LSBundleSetFlags();
                      }
LABEL_188:
                      v106 = _LSBindingListCreate(v38, v125, &v126);
                      if (v106
                        || (HIDWORD(v131) = v126, (v106 = _LSClaimAdd(v38, (uint64_t)&v127, (_DWORD *)&v126 + 1)) != 0)
                        || (_CSArrayAppendValue(), (_DWORD)v126)
                        && !_LSBundleDataIsInUnsupportedLocation((uint64_t)v38, v124)
                        && !_LSBundleDataGetUnsupportedFormatFlag()
                        && (v106 = _LSBindingListActivate()) != 0)
                      {
                        _LSRegistrationLog();
                        v40 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                        {
                          v135[0] = 67109120;
                          v135[1] = v106;
                          v41 = (uint8_t *)v135;
                          v42 = v40;
                          v43 = OS_LOG_TYPE_ERROR;
                          v44 = "Failed to register document type with error code: %d";
                          v47 = 8;
LABEL_61:
                          _os_log_impl(&dword_182882000, v42, v43, v44, v41, v47);
                        }
LABEL_62:

                        goto LABEL_63;
                      }
                      goto LABEL_63;
                    }
                  }
                }
                else
                {
                  CFArrayGetTypeID();
                }
                v81 = 0;
                goto LABEL_173;
              }
            }
            else
            {
              CFStringGetTypeID();
            }
            v74 = DWORD2(v127);
            goto LABEL_124;
          }
        }
        else
        {
          _LSRegistrationLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = CFArrayGetValueAtIndex(theArray, idx);
            LODWORD(v127) = 138477827;
            *(_QWORD *)((char *)&v127 + 4) = v31;
            _os_log_impl(&dword_182882000, v30, OS_LOG_TYPE_ERROR, "Unexpected value in document types array, not dictionary as expected, but %{private}@", (uint8_t *)&v127, 0xCu);
          }

        }
LABEL_197:
        v10 = idx + 1;
      }
      while (idx + 1 != Count);
    }
    v107 = 0;
  }
  else
  {
    v107 = 4294956479;
  }

  return v107;
}

void sub_1829A7204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,void *a40,uint64_t a41,CFTypeRef cf)
{

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterURLTypes(uint64_t a1)
{
  void *v1;
  const void *v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int *v8;
  CFTypeID v9;
  CFIndex Count;
  uint64_t v11;
  CFIndex v12;
  const void *v13;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  CFTypeID v16;
  const void *v17;
  int v18;
  __int16 v19;
  int v20;
  void *Value;
  CFTypeID v22;
  CFTypeID v23;
  CFTypeID v24;
  CFTypeID v25;
  void *v26;
  void *v27;
  id v28;
  const __CFString *v29;
  CFTypeID v30;
  CFTypeID v31;
  CFTypeID v32;
  const __CFString *v33;
  CFTypeID v34;
  const __CFString *v35;
  CFTypeID v36;
  int v37;
  CFIndex Length;
  unsigned int v39;
  char v40;
  const __CFArray *v41;
  CFTypeID v42;
  CFIndex v43;
  CFIndex i;
  const __CFString *v45;
  CFTypeID v46;
  unsigned int StringForCFString;
  NSObject *v48;
  void *v50;
  CFTypeRef cf;
  void *v52;
  void *v53;
  void *key;
  void *v55;
  unsigned int v56;
  CFIndex v57;
  uint64_t v58;
  int v59;
  int v60;
  unsigned int v61[2048];
  __int128 buf;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  CFRange v68;

  v1 = (void *)MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v56 = v6;
  v67 = *MEMORY[0x1E0C80C00];
  v7 = v1;
  v8 = v7;
  v60 = 0;
  v58 = v5;
  if ((*(_BYTE *)(v5 + 179) & 0x10) == 0)
  {
    _LSBindingListBufferInit((uint64_t)v7, v61);
    cf = (CFTypeRef)_CSStringCopyCFString();
    if (v3)
    {
      v9 = CFGetTypeID(v3);
      if (v9 != CFArrayGetTypeID())
      {
        v11 = 4294956479;
LABEL_95:
        if (cf)
          CFRelease(cf);
        goto LABEL_97;
      }
      Count = CFArrayGetCount((CFArrayRef)v3);
      if (Count >= 1)
      {
        v57 = Count;
        v11 = 0;
        v12 = 0;
        v55 = (void *)*MEMORY[0x1E0C9AB18];
        key = (void *)*MEMORY[0x1E0C9AB28];
        v50 = (void *)*MEMORY[0x1E0C9AB20];
        v52 = (void *)*MEMORY[0x1E0C9AE78];
        v53 = (void *)*MEMORY[0x1E0C9AB30];
        while (1)
        {
          v66 = 0;
          v64 = 0u;
          v65 = 0u;
          buf = 0u;
          v63 = 0u;
          v59 = 0;
          v13 = v3;
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v12);
          TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
          {
            v16 = CFGetTypeID(ValueAtIndex);
            if (v16 == CFDictionaryGetTypeID())
            {
              DWORD2(buf) |= 0x40u;
              if (_LSGetBooleanFromDict((const __CFDictionary *)ValueAtIndex, CFSTR("LSIsAppleDefaultForScheme")))DWORD2(buf) |= 1u;
              if ((*(_BYTE *)(v58 + 164) & 1) != 0)
                DWORD2(buf) |= 4u;
              WORD6(buf) = _LSGetHandlerRankFromDictKey((const __CFDictionary *)ValueAtIndex, v17);
              v18 = _LSGetRoleFromDictKey((const __CFDictionary *)ValueAtIndex, v55);
              v19 = v18 ? v18 : 2;
              HIWORD(buf) = v19;
              v20 = *(_DWORD *)(v58 + 168);
              if (v20 == 2 || v20 == 14 || v19 == 1)
              {
                Value = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("CFBundleRequiredCapabilities"));
                v22 = CFArrayGetTypeID();
                if (!Value || v22 && CFGetTypeID(Value) != v22)
                {
                  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("SBRequiredCapabilities"));
                  v23 = CFArrayGetTypeID();
                  if (!Value || v23 && CFGetTypeID(Value) != v23)
                    goto LABEL_29;
                }
                v24 = CFGetTypeID(Value);
                if (v24 != CFArrayGetTypeID())
                  goto LABEL_29;
                DWORD2(v63) = _LSDatabaseCreateStringArray(v8, Value, 0, 0);
                if (DWORD2(v63))
                {
                  v11 = 0;
LABEL_29:
                  v25 = CFStringGetTypeID();
                  v26 = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, key);
                  v27 = v26;
                  if (v26 && CFGetTypeID(v26) == v25)
                  {
                    v28 = v27;
                    DWORD1(v63) = LaunchServices::LocalizedString::Add(v8, MEMORY[0x1E0C9AA70], v28);

                  }
                  if (!_LSGetBooleanFromDict((const __CFDictionary *)ValueAtIndex, CFSTR("CFBundleTypeIconSystemGenerated")))
                  {
                    v29 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("_LSIconPath"));
                    v30 = CFStringGetTypeID();
                    if (v29 && (!v30 || CFGetTypeID(v29) == v30))
                    {
                      v31 = CFStringGetTypeID();
                      if (v31 == CFGetTypeID(v29))
                      {
                        DWORD2(buf) |= 0x1000u;
                        goto LABEL_45;
                      }
                    }
                    if (v50)
                    {
                      v29 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v50);
                      v32 = CFStringGetTypeID();
                      if (!v29 || !v32 || CFGetTypeID(v29) == v32)
                      {
LABEL_45:
                        HIDWORD(v63) = _LSDatabaseCreateStringForCFString(v8, v29, 0);
                        goto LABEL_46;
                      }
                    }
                    else
                    {
                      CFStringGetTypeID();
                    }
                    v29 = 0;
                    goto LABEL_45;
                  }
LABEL_46:
                  v33 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("_LSBundleLibraryDelegate"));
                  v34 = CFStringGetTypeID();
                  if (v33 && v34 && CFGetTypeID(v33) != v34)
                    v33 = 0;
                  LODWORD(v66) = _LSDatabaseCreateStringForCFString(v8, v33, 0);
                  if (!(_DWORD)v66)
                    goto LABEL_62;
                  if (v52)
                  {
                    v35 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v52);
                    v36 = CFStringGetTypeID();
                    if (v35 && (!v36 || CFGetTypeID(v35) == v36))
                    {
                      v37 = DWORD2(buf);
                      Length = CFStringGetLength(v35);
                      if (Length > CFStringGetLength(CFSTR("com.apple.")))
                      {
                        v68.length = CFStringGetLength(CFSTR("com.apple."));
                        v68.location = 0;
                        if (CFStringCompareWithOptions(v35, CFSTR("com.apple."), v68, 1uLL) == kCFCompareEqualTo)
                        {
                          v39 = v37 | 4;
                          goto LABEL_61;
                        }
                      }
LABEL_60:
                      v39 = v37 & 0xFFFFFFFB;
LABEL_61:
                      DWORD2(buf) = v39;
LABEL_62:
                      LODWORD(v63) = v56;
                      HIDWORD(v66) = 0;
                      if (!_LSGetBooleanFromDict((const __CFDictionary *)ValueAtIndex, CFSTR("CFBundleURLIsPrivate"))|| (v40 = BYTE8(buf), DWORD2(buf) |= 0x80u, (v40 & 4) != 0))
                      {
                        if (_LSGetBooleanFromDict((const __CFDictionary *)ValueAtIndex, CFSTR("CFBundleURLAlwaysAvailable")))DWORD2(buf) |= 0x100u;
                        if (v53)
                        {
                          v41 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, v53);
                          v42 = CFArrayGetTypeID();
                          if (v41 && (!v42 || CFGetTypeID(v41) == v42))
                          {
                            v43 = CFArrayGetCount(v41);
                            if (v43 >= 1)
                            {
                              for (i = 0; i != v43; ++i)
                              {
                                v45 = (const __CFString *)CFArrayGetValueAtIndex(v41, i);
                                v46 = CFStringGetTypeID();
                                if (v45 && (!v46 || CFGetTypeID(v45) == v46))
                                {
                                  StringForCFString = _LSDatabaseCreateStringForCFString(v8, v45, 1);
                                  if (StringForCFString)
                                  {
                                    if (!_LSBindingListBufferAppend(v8, v61, v8[188], StringForCFString))
                                      goto LABEL_87;
                                    _CSStringRelease();
                                  }
                                }
                              }
                            }
                          }
                        }
                        else
                        {
                          CFArrayGetTypeID();
                        }
                        v11 = _LSBindingListCreate(v8, v61, &v59);
                        if (!(_DWORD)v11)
                        {
                          HIDWORD(v66) = v59;
                          v11 = _LSClaimAdd(v8, (uint64_t)&buf, &v60);
                          if (!(_DWORD)v11)
                          {
                            _CSArrayAppendValue();
                            if (!v59
                              || _LSBundleDataIsInUnsupportedLocation((uint64_t)v8, v58)
                              || _LSBundleDataGetUnsupportedFormatFlag())
                            {
                              v11 = 0;
                            }
                            else
                            {
                              v11 = _LSBindingListActivate();
                            }
                          }
                        }
                      }
                      goto LABEL_87;
                    }
                  }
                  else
                  {
                    CFStringGetTypeID();
                  }
                  v37 = DWORD2(buf);
                  goto LABEL_60;
                }
                v11 = 4294957803;
              }
            }
          }
LABEL_87:
          _LSBindingListBufferReset(v8, (uint64_t)v61);
          ++v12;
          v3 = v13;
          if (v12 == v57)
            goto LABEL_95;
        }
      }
    }
    v11 = 0;
    goto LABEL_95;
  }
  _LSDefaultLog();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v56;
    _os_log_impl(&dword_182882000, v48, OS_LOG_TYPE_INFO, "Skipping URL claims for bundle %llu because it is an App Clip", (uint8_t *)&buf, 0xCu);
  }

  v11 = 0;
LABEL_97:

  return v11;
}

void sub_1829A7AD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSGetHandlerRankFromDictKey(const __CFDictionary *a1, const void *a2)
{
  const __CFString *Value;
  CFTypeID TypeID;
  CFTypeID v4;

  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("LSHandlerRank"));
    TypeID = CFStringGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      v4 = CFGetTypeID(Value);
      if (v4 == CFStringGetTypeID())
        return _LSNumericHandlerRankFromHandlerRankString(Value);
    }
  }
  else
  {
    CFStringGetTypeID();
  }
  return 2;
}

uint64_t _LSGetRoleFromDictKey(const __CFDictionary *a1, const void *a2)
{
  const __CFString *Value;
  CFTypeID TypeID;
  CFTypeID v4;
  uint64_t v5;

  if (!a1 || !a2)
  {
    CFStringGetTypeID();
    return 0;
  }
  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  TypeID = CFStringGetTypeID();
  if (!Value || TypeID && CFGetTypeID(Value) != TypeID)
    return 0;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 0;
  v5 = 1;
  if (CFStringCompare(Value, CFSTR("None"), 1uLL))
  {
    if (CFStringCompare(Value, CFSTR("Viewer"), 1uLL))
    {
      if (CFStringCompare(Value, CFSTR("Editor"), 1uLL))
      {
        if (CFStringCompare(Value, CFSTR("Shell"), 1uLL))
        {
          if (CFStringCompare(Value, CFSTR("MDImporter"), 1uLL))
            return 32 * (CFStringCompare(Value, CFSTR("QLGenerator"), 1uLL) == kCFCompareEqualTo);
          else
            return 16;
        }
        else
        {
          return 8;
        }
      }
      else
      {
        return 4;
      }
    }
    else
    {
      return 2;
    }
  }
  return v5;
}

uint64_t _LSRegisterExtensionPoint(void *a1, uint64_t a2, __CFString *a3, uint64_t a4, const __CFDictionary *a5, void *a6)
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  const __CFDictionary *Value;
  CFTypeID TypeID;
  const __CFDictionary *v16;
  CFTypeID v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  __CFString *v29;
  CFTypeID v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  const __CFString *v36;
  CFTypeID v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  int StringForCFString;
  int v42;
  unsigned int v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  id v60;
  void *v61;
  int v62;
  int v63;
  int v64;
  int log;
  NSObject *loga;
  id v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  _OWORD v91[8];
  _BYTE buf[40];
  uint64_t *v93;
  uint64_t *v94;
  int v95;
  int v96;
  __int128 v97;
  __int128 v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  uint64_t v106;
  int v107;
  _DWORD v108[2];
  __int128 v109;
  __int128 v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  _OWORD v119[2];
  _OWORD v120[2];
  _OWORD v121[2];
  _OWORD v122[2];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer"))
  {
    if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
    {
      v12 = 0;
      goto LABEL_105;
    }
    v67 = v11;
    v90 = 0;
    _LSRegistrationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = a6;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = a5;
      _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_INFO, "Registering extension point: %@ platform: %u declaring framework: %@ SDK: %@", buf, 0x26u);
    }

    v68 = v67;
    if (!v67)
    {
      v12 = _LSContextInit(&v90);
      v68 = v90;
      if ((_DWORD)v12)
      {
LABEL_104:

        goto LABEL_105;
      }
    }
    v125 = kLSVersionNumberNull;
    v126 = *(_OWORD *)algn_1829FAD90;
    v88 = 0;
    v89 = 0;
    v123 = 0u;
    v124 = 0u;
    if (a5)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a5, CFSTR("NSExtension"));
      TypeID = CFDictionaryGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        v16 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("NSExtensionAttributes"));
        v17 = CFDictionaryGetTypeID();
        if (!v16 || !v17 || CFGetTypeID(v16) == v17)
        {
LABEL_20:
          v18 = objc_opt_class();
          -[__CFDictionary objectForKey:](a5, "objectForKey:", CFSTR("EXExtensionPointIsPublic"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v18 && v19 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v20 = 0;
          }
          log = objc_msgSend(v20, "BOOLValue");

          v21 = objc_opt_class();
          -[__CFDictionary objectForKey:](a5, "objectForKey:", CFSTR("EXRequiresLegacyInfrastructure"));
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v21 && v22 && (objc_opt_isKindOfClass() & 1) == 0)
          {

            v23 = 0;
          }
          v24 = objc_msgSend(v23, "BOOLValue");

          if ((v24 & 1) != 0)
          {
            v64 = 1;
          }
          else
          {
            v25 = objc_opt_class();
            -[__CFDictionary objectForKey:](a5, "objectForKey:", CFSTR("EXTCCPolicy"));
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = (void *)v26;
            if (v25 && v26 && (objc_opt_isKindOfClass() & 1) == 0)
            {

              v27 = 0;
            }
            if ((objc_msgSend(v27, "isEqualToString:", CFSTR("prompt-container-personality")) & 1) != 0)
            {
              v28 = 1;
            }
            else if (objc_msgSend(v27, "isEqualToString:", CFSTR("prompt-host-personality")))
            {
              v28 = 2;
            }
            else
            {
              v28 = 0;
            }
            v64 = v28;

          }
          if (v16
            && (v29 = (__CFString *)CFDictionaryGetValue(v16, CFSTR("NSExtensionPointVersion")),
                v30 = CFStringGetTypeID(),
                v29)
            && (!v30 || CFGetTypeID(v29) == v30))
          {
            _LSGetVersionFromString(v29, buf);
            v31 = 0;
          }
          else
          {
            v29 = 0;
            memset(buf, 0, 32);
            v31 = 1;
          }
          v125 = *(_OWORD *)buf;
          v126 = *(_OWORD *)&buf[16];
          if (!_LSExtensionPointFindWithIdentifier(v68, a3, a4, a2, &v89, &v88) && (_DWORD)v89)
          {
            v32 = *(_OWORD *)(v88 + 24);
            v122[0] = *(_OWORD *)(v88 + 8);
            v122[1] = v32;
            v121[0] = v125;
            v121[1] = v126;
            if (_LSVersionNumberCompare(v122, v121))
            {
              v33 = *(_OWORD *)(v88 + 24);
              v120[0] = *(_OWORD *)(v88 + 8);
              v120[1] = v33;
              v119[0] = v125;
              v119[1] = v126;
              if (_LSVersionNumberCompare(v120, v119) != -1)
              {
                _LSRegistrationLog();
                loga = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
                {
                  v34 = *(_OWORD *)(v88 + 24);
                  v91[0] = *(_OWORD *)(v88 + 8);
                  v91[1] = v34;
                  _LSVersionNumberGetStringRepresentation(v91);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = a3;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v29;
                  *(_WORD *)&buf[22] = 2112;
                  *(_QWORD *)&buf[24] = v35;
                  _os_log_impl(&dword_182882000, loga, OS_LOG_TYPE_ERROR, "Not registering extension point %@, it has a lower version (%@) than existing registered extension point with that identifer (%@)", buf, 0x20u);

                }
                v12 = 0;
                goto LABEL_102;
              }
            }
            _LSExtensionPointRemove(v68, v89);
          }
          if (!v16
            || (v36 = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("NSExtensionPointName")),
                v37 = CFStringGetTypeID(),
                !v36)
            || v37 && CFGetTypeID(v36) != v37)
          {
            _LSRegistrationLog();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = a3;
              _os_log_impl(&dword_182882000, v38, OS_LOG_TYPE_ERROR, "ExtensionPoint %@ does not specify NSExtensionPointName", buf, 0xCu);
            }

            v36 = a3;
          }
          if (!CFEqual(v36, a3))
          {
            _LSRegistrationLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = a3;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v36;
            }

          }
          if (-[__CFString hasPrefix:](a3, "hasPrefix:", CFSTR("com.apple.")))
            v40 = log;
          else
            v40 = 2;
          v63 = v40;
          loga = a5;
          StringForCFString = _LSDatabaseCreateStringForCFString(v68, a3, 0);
          v42 = _LSDatabaseCreateStringForCFString(v68, v36, 0);
          if ((v31 & 1) != 0)
            memset(buf, 0, 32);
          else
            _LSGetVersionFromString(v29, buf);
          v123 = *(_OWORD *)buf;
          v124 = *(_OWORD *)&buf[16];
          v62 = _LSPlistAdd((uint64_t)v68, loga);
          -[NSObject objectForKey:](loga, "objectForKey:", CFSTR("EXDiscoverFromHiddenApps"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v61, "BOOLValue");
          if (a6)
          {
            v87 = 0;
            LODWORD(a6) = _LSAliasAddURL(v68, a6, &v87);
            v44 = v87;
            if (v44)
            {
              _LSRegistrationLog();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = a3;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v44;
                _os_log_impl(&dword_182882000, v45, OS_LOG_TYPE_ERROR, "couldn't set declaring framework of extension point %@: %@", buf, 0x16u);
              }

            }
          }
          v109 = v123;
          v46 = v43;
          v108[0] = 0;
          v108[1] = StringForCFString;
          v110 = v124;
          v111 = v42;
          v112 = a4;
          v113 = v62;
          v114 = (int)a6;
          v115 = a2;
          v116 = v63;
          v117 = v64;
          v118 = v43;
          HIDWORD(v89) = _LSExtensionPointAdd(v68, v108);
          if (!HIDWORD(v89))
          {
            v12 = 4294956477;
LABEL_101:

LABEL_102:
            if (!v67)
              _LSContextDestroy(&v90);
            goto LABEL_104;
          }
          v60 = v11;
          v47 = _LSBundleGet(v68, a2);
          if (v47)
          {
            if (!*(_DWORD *)(v47 + 484))
            {
              LODWORD(v91[0]) = 0;
              LODWORD(v91[0]) = _CSArrayCreate();
              if (LODWORD(v91[0]))
              {
                *(_QWORD *)buf = 0;
                if (_CSStoreWriteToUnit())
                  v12 = 0;
                else
                  v12 = _LSGetOSStatusFromNSError(*(void **)buf);

              }
              else
              {
                v12 = 0;
              }
              v49 = StringForCFString;
              goto LABEL_93;
            }
            _CSArrayAppendValue();
          }
          else
          {
            _LSRegistrationLog();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = a2;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = a3;
              _os_log_impl(&dword_182882000, v48, OS_LOG_TYPE_ERROR, "Failed to fetch app bundle unit: %llu for extension point: %@", buf, 0x16u);
            }

          }
          v49 = StringForCFString;
          v12 = 0;
LABEL_93:
          v81 = 0;
          v82 = &v81;
          v83 = 0x3032000000;
          v84 = __Block_byref_object_copy__44;
          v85 = __Block_byref_object_dispose__44;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v86 = (id)objc_claimAutoreleasedReturnValue();
          v75 = 0;
          v76 = &v75;
          v77 = 0x3032000000;
          v78 = __Block_byref_object_copy__44;
          v79 = __Block_byref_object_dispose__44;
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v80 = (id)objc_claimAutoreleasedReturnValue();
          v50 = MEMORY[0x1E0C809B0];
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke;
          *(_QWORD *)&buf[24] = &unk_1E1045110;
          v95 = 0;
          v96 = v49;
          v97 = v123;
          v98 = v124;
          v99 = v42;
          v100 = a4;
          v101 = v62;
          v102 = (int)a6;
          v103 = a2;
          v104 = v63;
          v106 = v46;
          v105 = v64;
          v107 = v42;
          v93 = &v75;
          v94 = &v81;
          v51 = v68;
          *(_QWORD *)&buf[32] = v51;
          v11 = v60;
          v52 = (void *)MEMORY[0x186DAE9BC](buf);
          _CSStoreEnumerateUnits();
          v53 = (void *)v76[5];
          v73[0] = v50;
          v73[1] = 3221225472;
          v73[2] = ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke_2;
          v73[3] = &unk_1E1045138;
          v54 = v51;
          v74 = v54;
          objc_msgSend(v53, "enumerateKeysAndObjectsUsingBlock:", v73);
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v55 = (id)v82[5];
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
          if (v56)
          {
            v57 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v56; ++i)
              {
                if (*(_QWORD *)v70 != v57)
                  objc_enumerationMutation(v55);
                _LSBindableActivate(v54, objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "intValue"));
              }
              v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
            }
            while (v56);
          }

          _Block_object_dispose(&v75, 8);
          _Block_object_dispose(&v81, 8);

          goto LABEL_101;
        }
      }
    }
    else
    {
      CFDictionaryGetTypeID();
    }
    v16 = 0;
    goto LABEL_20;
  }
  v12 = _LSRegisterExtensionPointClient((uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6);
LABEL_105:

  return v12;
}

void sub_1829A880C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterFrameworkExtensionPointIfNecessary(void *a1, int a2, __CFString *a3, uint64_t a4, const __CFDictionary *a5, void *a6)
{
  id v11;
  void *v12;
  const __CFDictionary *Value;
  CFTypeID TypeID;
  const __CFDictionary *v15;
  CFTypeID v16;
  __CFString *v17;
  CFTypeID v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v23;
  int v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  uint8_t buf[16];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = v11;
  if (!a2 && a6)
  {
    v24 = 0;
    v23 = 0;
    if (_LSExtensionPointFindWithIdentifier(v11, a3, a4, 0, &v24, &v23)
      || !v23
      || !*(_DWORD *)(v23 + 52))
    {
      goto LABEL_25;
    }
    if (a5)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a5, CFSTR("NSExtension"));
      TypeID = CFDictionaryGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        v15 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("NSExtensionAttributes"));
        v16 = CFDictionaryGetTypeID();
        if (v15)
        {
          if (!v16 || CFGetTypeID(v15) == v16)
          {
            v17 = (__CFString *)CFDictionaryGetValue(v15, CFSTR("NSExtensionPointVersion"));
            v18 = CFStringGetTypeID();
            if (v17)
            {
              if (!v18 || CFGetTypeID(v17) == v18)
              {
                v25 = 0u;
                v26 = 0u;
                _LSGetVersionFromString(v17, &v25);
LABEL_22:
                v21 = *(_OWORD *)(v23 + 24);
                *(_OWORD *)buf = *(_OWORD *)(v23 + 8);
                v29 = v21;
                v27[0] = v25;
                v27[1] = v26;
                if (!_LSVersionNumberCompare(buf, v27) && v24)
                {
                  v20 = 0;
                  goto LABEL_26;
                }
LABEL_25:
                v20 = _LSRegisterExtensionPoint(v12, 0, a3, a4, a5, a6);
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
    else
    {
      CFDictionaryGetTypeID();
    }
    v25 = kLSVersionNumberNull;
    v26 = *(_OWORD *)algn_1829FAD90;
    goto LABEL_22;
  }
  _LSRegistrationLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_ERROR, "No declaringFrameworkURL or parentBundleUnit != nullID, so returning kLSApplicationNotFoundErr", buf, 2u);
  }

  v20 = 4294956482;
LABEL_26:

  return v20;
}

void sub_1829A8BE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterExtensionPoint(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, __CFString *a5)
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v13;
  uint64_t v15;
  int v16;
  void *v17;
  _OWORD v18[2];
  _OWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "hasServer"))
  {
    v10 = _LSUnregisterExtensionPointClient((uint64_t)a2, a3, (uint64_t)a5, a4);
  }
  else if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    v11 = v9;
    v17 = 0;
    v12 = v11;
    if (v11 || (v10 = _LSContextInit(&v17), v12 = v17, !(_DWORD)v10))
    {
      v16 = 0;
      v15 = 0;
      v10 = _LSExtensionPointFindWithIdentifier(v12, a2, a3, a4, &v16, &v15);
      if (!(_DWORD)v10)
      {
        if (!a5
          || (v13 = *(_OWORD *)(v15 + 24),
              v19[0] = *(_OWORD *)(v15 + 8),
              v19[1] = v13,
              _LSGetVersionFromString(a5, v18),
              !_LSVersionNumberCompare(v19, v18)))
        {
          _LSExtensionPointRemove(v12, v16);
        }
      }
      if (!v11)
        _LSContextDestroy(&v17);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1829A8D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t _LSRegisterPlugins(void *a1, int a2, int a3, uint64_t a4, const void *a5, int a6)
{
  CFIndex Count;
  CFTypeID v9;
  CFTypeID v10;
  CFMutableDictionaryRef Mutable;
  char *v12;
  char *v13;
  CFIndex v14;
  void *Value;
  void *v16;
  const void *v17;
  CFTypeID TypeID;
  CFTypeID v19;
  CFTypeID v20;
  const __CFString *v21;
  CFTypeID v22;
  CFTypeID v23;
  CFTypeID v24;
  CFTypeID v25;
  CFURLRef v26;
  CFURLRef v27;
  CFTypeID v28;
  void *v29;
  const __CFDictionary *v30;
  void *v31;
  CFTypeID v32;
  void *v33;
  void *v34;
  id v35;
  CFTypeID v36;
  CFTypeID v37;
  CFTypeID v38;
  CFTypeID v39;
  CFTypeID v40;
  CFTypeID v41;
  uint64_t v42;
  void *v43;
  CFURLRef v44;
  CFTypeID v45;
  const __CFString *v46;
  CFTypeID v47;
  CFTypeID v48;
  CFTypeID v49;
  void *v50;
  void *v51;
  void *v52;
  CFTypeID v53;
  const void *v54;
  const void *v55;
  const void *v56;
  CFTypeID v57;
  const void *v58;
  const void *v59;
  const void *v60;
  unsigned int v61;
  int v62;
  unsigned int v63;
  CFTypeID v64;
  CFTypeID v65;
  CFTypeID v66;
  CFTypeID v67;
  CFTypeID v68;
  CFTypeID v69;
  const void *v70;
  CFTypeID v71;
  const void *v72;
  CFTypeID v73;
  CFTypeID v74;
  CFTypeID v75;
  const void *v76;
  const void *v77;
  const void *v78;
  const void *v79;
  CFTypeID v80;
  CFTypeID v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  CFTypeID v104;
  __CFString *v105;
  CFTypeID v106;
  unsigned int v107;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  __CFDictionary *v114;
  CFTypeRef v115;
  CFTypeRef v116;
  const __CFString *v120;
  CFTypeRef v121;
  CFTypeRef v122;
  CFTypeRef v123;
  CFTypeRef v124;
  CFTypeRef v125;
  CFTypeRef v126;
  CFTypeRef v127;
  CFTypeRef v128;
  const __CFString *v129;
  const __CFAllocator *allocator;
  int v131;
  CFTypeRef cf;
  CFTypeRef v133;
  CFIndex v134;
  CFIndex v135;
  id v136;
  _LSDatabase *v137;
  void **values;
  void *v139;
  uint64_t v140;
  void **keys;
  void *v142;
  uint64_t v143;
  _LSDatabase *context;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  id v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  CFTypeRef v154;
  id v155;
  id v156;
  id v157;
  id v158;
  __int128 v159;
  _BYTE v160[32];
  __int128 v161;
  __int128 v162;
  _QWORD v163[5];
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  CFTypeRef v174[2];
  __int128 v175;
  _OWORD v176[4];

  v136 = a1;
  if (!a4)
    goto LABEL_228;
  cf = a5;
  Count = CFDictionaryGetCount((CFDictionaryRef)a4);
  if (Count < 1)
  {
    a4 = 0;
    goto LABEL_228;
  }
  v9 = CFGetTypeID((CFTypeRef)a4);
  if (v9 != CFDictionaryGetTypeID() || cf && (v10 = CFGetTypeID(cf), v10 != CFDictionaryGetTypeID()))
  {
    a4 = 4294956479;
    goto LABEL_228;
  }
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (cf)
    v135 = CFDictionaryGetCount((CFDictionaryRef)cf);
  else
    v135 = 0;
  keys = 0;
  v142 = 0;
  v143 = 0;
  std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](&keys, Count);
  v12 = (char *)v142;
  bzero(v142, 8 * Count);
  v142 = &v12[8 * Count];
  values = 0;
  v139 = 0;
  v140 = 0;
  std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](&values, Count);
  v114 = Mutable;
  v13 = (char *)v139;
  bzero(v139, 8 * Count);
  v134 = Count;
  v139 = &v13[8 * Count];
  CFDictionaryGetKeysAndValues((CFDictionaryRef)a4, (const void **)keys, (const void **)values);
  v14 = 0;
  Value = 0;
  v109 = (void *)*MEMORY[0x1E0C9AE70];
  v112 = (void *)*MEMORY[0x1E0C9AAF0];
  v113 = (void *)*MEMORY[0x1E0C9AE78];
  v110 = (void *)*MEMORY[0x1E0C9AAC8];
  v111 = (void *)*MEMORY[0x1E0C9AE88];
  do
  {
    v16 = values[v14];
    if (v14 >= v135)
      goto LABEL_20;
    if (!cf || (v17 = keys[v14]) == 0)
    {
      CFDictionaryGetTypeID();
LABEL_19:
      Value = 0;
      goto LABEL_20;
    }
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)cf, v17);
    TypeID = CFDictionaryGetTypeID();
    if (Value && TypeID && CFGetTypeID(Value) != TypeID)
      goto LABEL_19;
LABEL_20:
    v137 = (_LSDatabase *)v136;
    v175 = 0u;
    memset(v176, 0, 48);
    v173 = 0u;
    *(_OWORD *)v174 = 0u;
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v166 = 0u;
    v19 = CFGetTypeID(v16);
    if (v19 != CFDictionaryGetTypeID())
      goto LABEL_221;
    if (Value)
    {
      v20 = CFGetTypeID(Value);
      if (v20 != CFDictionaryGetTypeID())
      {
LABEL_221:
        v44 = 0;
        v27 = 0;
        v30 = 0;
        a4 = 4294956479;
        goto LABEL_66;
      }
      v21 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("Path"));
      v22 = CFStringGetTypeID();
      if (!v21)
        goto LABEL_63;
      v23 = v22;
      if (v22)
      {
LABEL_29:
        if (CFGetTypeID(v21) != v23)
          goto LABEL_63;
      }
    }
    else
    {
      if (!v16)
      {
        CFStringGetTypeID();
LABEL_63:
        v44 = 0;
        v27 = 0;
        goto LABEL_64;
      }
      v21 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v16, CFSTR("Path"));
      v24 = CFStringGetTypeID();
      if (!v21)
        goto LABEL_63;
      v23 = v24;
      if (v24)
        goto LABEL_29;
    }
    v25 = CFGetTypeID(v21);
    if (v25 != CFStringGetTypeID())
      goto LABEL_63;
    v26 = CFURLCreateWithFileSystemPath(allocator, v21, kCFURLPOSIXPathStyle, 1u);
    v27 = v26;
    if (!v26)
      goto LABEL_77;
    v28 = CFGetTypeID(v26);
    if (v28 != CFURLGetTypeID())
      goto LABEL_77;
    v29 = (void *)MEMORY[0x186DAE7A0]();
    objc_msgSend(v16, "_ls_normalizedPluginPlist");
    v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v29);
    v31 = (void *)MEMORY[0x186DAE7A0]();
    v32 = CFNumberGetTypeID();
    v33 = (void *)CFDictionaryGetValue(v30, CFSTR("LSExecutablePlatformKey"));
    v34 = v33;
    if (v33 && CFGetTypeID(v33) == v32)
    {
      v35 = v34;
      v131 = objc_msgSend(v35, "unsignedLongLongValue");

    }
    else
    {
      v131 = 0;
    }
    objc_autoreleasePoolPop(v31);
    if (!v30)
    {
      CFDictionaryGetTypeID();
LABEL_77:
      v44 = 0;
LABEL_64:
      v30 = 0;
LABEL_65:
      a4 = 0;
      goto LABEL_66;
    }
    v133 = CFDictionaryGetValue(v30, CFSTR("NSExtension"));
    v36 = CFDictionaryGetTypeID();
    if (!v133 || v36 && CFGetTypeID(v133) != v36 || (v37 = CFGetTypeID(v133), v37 != CFDictionaryGetTypeID()))
    {
      v44 = 0;
      goto LABEL_65;
    }
    if (!Value)
    {
      v44 = 0;
      v116 = 0;
      v128 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
LABEL_99:
      v115 = 0;
      goto LABEL_100;
    }
    v126 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("CodeInfoIdentifier"));
    v38 = CFStringGetTypeID();
    if (!v126 || v38 && CFGetTypeID(v126) != v38)
      v126 = 0;
    v125 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("SignerOrganization"));
    v39 = CFStringGetTypeID();
    if (!v125 || v39 && CFGetTypeID(v125) != v39)
      v125 = 0;
    v124 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("SignerIdentity"));
    v40 = CFStringGetTypeID();
    if (!v124 || v40 && CFGetTypeID(v124) != v40)
      v124 = 0;
    v128 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("Entitlements"));
    v41 = CFDictionaryGetTypeID();
    if (!v128 || v41 && CFGetTypeID(v128) != v41)
      v128 = 0;
    _LSGetTeamIdentifierFromInstallDict(Value);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)*((_QWORD *)&v169 + 1);
    *((_QWORD *)&v169 + 1) = v42;

    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0)
    {
      v116 = 0;
LABEL_89:
      v44 = 0;
      goto LABEL_90;
    }
    v116 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("GroupContainers"));
    v45 = CFDictionaryGetTypeID();
    if (!v116 || v45 && CFGetTypeID(v116) != v45)
      v116 = 0;
    if (!CFDictionaryContainsKey((CFDictionaryRef)Value, CFSTR("Container")))
      goto LABEL_89;
    v46 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("Container"));
    v47 = CFStringGetTypeID();
    if (v46 && v47 && CFGetTypeID(v46) != v47)
      v46 = 0;
    v44 = CFURLCreateWithFileSystemPath(allocator, v46, kCFURLPOSIXPathStyle, 1u);
LABEL_90:
    BYTE4(v176[2]) = _LSGetProfileValidationStateFromInstallDictionary((const __CFDictionary *)Value);
    if (CFDictionaryContainsKey((CFDictionaryRef)Value, CFSTR("LSHasOverride")))
      LODWORD(v166) = v166 | 8;
    if (!v128)
    {
      v128 = 0;
      goto LABEL_99;
    }
    if (!CFDictionaryContainsKey((CFDictionaryRef)v128, CFSTR("com.apple.developer.replace-plugin")))
      goto LABEL_99;
    LODWORD(v166) = v166 | 4;
    v115 = CFDictionaryGetValue((CFDictionaryRef)v128, CFSTR("com.apple.developer.replace-plugin"));
    v48 = CFStringGetTypeID();
    if (!v115 || v48 && CFGetTypeID(v115) != v48)
      goto LABEL_99;
LABEL_100:
    if (CFStringFind(v21, CFSTR(".framework/"), 1uLL).location != -1)
      LODWORD(v166) = v166 | 2;
    v49 = CFArrayGetTypeID();
    v50 = (void *)CFDictionaryGetValue(v30, CFSTR("_LSSliceInfosKey"));
    v51 = v50;
    if (v50)
    {
      if (CFGetTypeID(v50) == v49)
        v52 = v51;
      else
        v52 = 0;
    }
    else
    {
      v52 = 0;
    }
    objc_storeStrong((id *)v176, v52);
    v53 = CFArrayGetTypeID();
    v54 = CFDictionaryGetValue(v30, CFSTR("UTExportedTypeDeclarations"));
    v55 = v54;
    if (v54)
    {
      if (CFGetTypeID(v54) == v53)
        v56 = v55;
      else
        v56 = 0;
    }
    else
    {
      v56 = 0;
    }
    *(_QWORD *)&v176[1] = v56;
    v57 = CFArrayGetTypeID();
    v58 = CFDictionaryGetValue(v30, CFSTR("UTImportedTypeDeclarations"));
    v59 = v58;
    if (v58)
    {
      if (CFGetTypeID(v58) == v57)
        v60 = v59;
      else
        v60 = 0;
    }
    else
    {
      v60 = 0;
    }
    *((_QWORD *)&v176[1] + 1) = v60;
    v61 = _LSGetBooleanFromDict(v30, CFSTR("_LSRequiresGarbageCollection"));
    v62 = BYTE12(v176[2]) & 0xFD | (2 * (v61 != 0));
    BYTE12(v176[2]) = BYTE12(v176[2]) & 0xFD | (2 * (v61 != 0));
    v63 = v62 & 0xFFFFFFFB | (4 * (_LSGetBooleanFromDict(v30, CFSTR("NSBuiltWithThreadSanitizer")) != 0));
    BYTE12(v176[2]) = v63;
    v127 = CFDictionaryGetValue(v30, CFSTR("MachOUUIDs"));
    v64 = CFArrayGetTypeID();
    if (!v127 || v64 && CFGetTypeID(v127) != v64)
      v127 = 0;
    if (!v113)
    {
      CFStringGetTypeID();
LABEL_127:
      v129 = 0;
      goto LABEL_128;
    }
    v129 = (const __CFString *)CFDictionaryGetValue(v30, v113);
    v65 = CFStringGetTypeID();
    if (!v129 || v65 && CFGetTypeID(v129) != v65)
      goto LABEL_127;
LABEL_128:
    if (!v112)
    {
      CFStringGetTypeID();
LABEL_134:
      v120 = 0;
      goto LABEL_135;
    }
    v120 = (const __CFString *)CFDictionaryGetValue(v30, v112);
    v66 = CFStringGetTypeID();
    if (!v120 || v66 && CFGetTypeID(v120) != v66)
      goto LABEL_134;
LABEL_135:
    if (!v111)
    {
      CFStringGetTypeID();
LABEL_141:
      v123 = 0;
      goto LABEL_142;
    }
    v123 = CFDictionaryGetValue(v30, v111);
    v67 = CFStringGetTypeID();
    if (!v123 || v67 && CFGetTypeID(v123) != v67)
      goto LABEL_141;
LABEL_142:
    if (!v110)
    {
      CFStringGetTypeID();
LABEL_148:
      v122 = 0;
      goto LABEL_149;
    }
    v122 = CFDictionaryGetValue(v30, v110);
    v68 = CFStringGetTypeID();
    if (!v122 || v68 && CFGetTypeID(v122) != v68)
      goto LABEL_148;
LABEL_149:
    if (!v109)
    {
      CFStringGetTypeID();
LABEL_155:
      v121 = 0;
      goto LABEL_156;
    }
    v121 = CFDictionaryGetValue(v30, v109);
    v69 = CFStringGetTypeID();
    if (!v121 || v69 && CFGetTypeID(v121) != v69)
      goto LABEL_155;
LABEL_156:
    v70 = CFDictionaryGetValue(v30, CFSTR("LSExecutableSDKVersion"));
    v71 = CFStringGetTypeID();
    if (v70 && v71 && CFGetTypeID(v70) != v71)
      v70 = 0;
    if (CFDictionaryContainsKey(v30, CFSTR("_LSIsLinkEnabled")))
    {
      v63 = v63 & 0xFFFFFFF7 | (8 * (_LSGetBooleanFromDict(v30, CFSTR("_LSIsLinkEnabled")) != 0));
      BYTE12(v176[2]) = v63;
    }
    v72 = CFDictionaryGetValue(v30, CFSTR("LSIsSecuredSystemContent"));
    v73 = CFBooleanGetTypeID();
    if (v72 && (!v73 || CFGetTypeID(v72) == v73) && CFBooleanGetValue((CFBooleanRef)v72))
    {
      LOBYTE(v63) = v63 | 0x10;
      BYTE12(v176[2]) = v63;
    }
    if (v129)
    {
      v74 = CFStringGetTypeID();
      if (v74 == CFGetTypeID(v129))
      {
        if (CFStringHasPrefix(v129, CFSTR("com.apple.")))
        {
          LOBYTE(v63) = v63 | 1;
          BYTE12(v176[2]) = v63;
        }
      }
    }
    if ((v63 & 0x10) != 0)
    {
      v75 = CFStringGetTypeID();
      v76 = CFDictionaryGetValue(v30, CFSTR("APSystemPlugInEffectiveContainer"));
      v77 = v76;
      if (v76)
      {
        if (CFGetTypeID(v76) == v75)
          v78 = v77;
        else
          v78 = 0;
      }
      else
      {
        v78 = 0;
      }
      *((_QWORD *)&v176[0] + 1) = v78;
    }
    v79 = CFDictionaryGetValue(v30, CFSTR("APProtectedShieldOptOut"));
    v80 = CFBooleanGetTypeID();
    if (v79 && (!v80 || CFGetTypeID(v79) == v80) && CFBooleanGetValue((CFBooleanRef)v79))
      LODWORD(v166) = v166 | 0x10;
    *((_QWORD *)&v167 + 1) = v27;
    *(_QWORD *)&v168 = v44;
    *((_QWORD *)&v168 + 1) = v129;
    *(_QWORD *)&v170 = v123;
    *((_QWORD *)&v170 + 1) = v122;
    v81 = CFStringGetTypeID();
    v82 = (void *)CFDictionaryGetValue(v30, CFSTR("NSMicrophoneUsageDescription"));
    v83 = v82;
    if (v82)
    {
      if (CFGetTypeID(v82) == v81)
        v84 = v83;
      else
        v84 = 0;
    }
    else
    {
      v84 = 0;
    }
    objc_storeStrong((id *)&v175, v84);
    *((_QWORD *)&v171 + 1) = v125;
    *(_QWORD *)&v172 = v124;
    *((_QWORD *)&v172 + 1) = v128;
    *(_QWORD *)&v173 = v116;
    LODWORD(v176[2]) = a2;
    *((_QWORD *)&v173 + 1) = v121;
    *(_QWORD *)&v171 = v126;
    *(_QWORD *)&v169 = v115;
    *((_QWORD *)&v166 + 1) = v127;
    *(_QWORD *)&v167 = v70;
    DWORD1(v166) = v131;
    v85 = objc_opt_class();
    objc_msgSend(Value, "objectForKey:", CFSTR("SignatureVersion"));
    v86 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v86;
    if (v85 && v86 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v87 = 0;
    }
    DWORD2(v176[2]) = objc_msgSend(v87, "unsignedLongLongValue");

    v88 = (void *)MEMORY[0x186DAE7A0]();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke;
    v164[3] = &unk_1E10421C0;
    v90 = v89;
    v165 = v90;
    -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v30, "enumerateKeysAndObjectsUsingBlock:", v164);
    v91 = v90;

    v174[0] = v91;
    objc_autoreleasePoolPop(v88);
    v92 = (void *)MEMORY[0x186DAE7A0]();
    v93 = objc_opt_class();
    objc_msgSend(v16, "objectForKey:", CFSTR("_LSLocalizedStringsDictionary"));
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = (void *)v94;
    if (v93 && v94 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v95 = 0;
    }
    context = 0;
    *(_QWORD *)&v145 = &context;
    *((_QWORD *)&v145 + 1) = 0x2020000000;
    LOBYTE(v146) = 0;
    v96 = (void *)objc_opt_class();
    v97 = (void *)objc_opt_class();
    LOBYTE(v146) = _LSIsDictionaryWithKeysAndValuesOfClass(v95, v96, v97);
    if (*(_BYTE *)(v145 + 24))
    {
      v163[0] = MEMORY[0x1E0C809B0];
      v163[1] = 3221225472;
      v163[2] = ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke_2;
      v163[3] = &unk_1E10421E8;
      v163[4] = &context;
      objc_msgSend(v95, "enumerateKeysAndObjectsUsingBlock:", v163);
      if (*(_BYTE *)(v145 + 24))
        objc_storeStrong((id *)&v174[1], v95);
    }
    _Block_object_dispose(&context, 8);

    objc_autoreleasePoolPop(v92);
    v98 = (void *)MEMORY[0x186DAE7A0]();
    v99 = objc_opt_class();
    -[__CFDictionary objectForKey:](v30, "objectForKey:", CFSTR("_LSIntentDefinitionURLs"));
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)v100;
    if (v99 && v100 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v101 = 0;
    }
    v102 = (void *)*((_QWORD *)&v175 + 1);
    *((_QWORD *)&v175 + 1) = v101;

    objc_autoreleasePoolPop(v98);
    if (CFDictionaryContainsKey((CFDictionaryRef)v133, CFSTR("Multiple")))
    {
      v161 = 0u;
      v162 = 0u;
      *(_OWORD *)&v160[16] = 0u;
      context = v137;
      v145 = v166;
      v146 = v167;
      v147 = v168;
      v148 = v169;
      v149 = *((id *)&v169 + 1);
      v152 = v172;
      v153 = v173;
      v154 = v174[0];
      v150 = v170;
      v151 = v171;
      v155 = (id)v174[1];
      v156 = (id)v175;
      v157 = v101;
      v103 = *(id *)&v176[0];
      v159 = *(_OWORD *)((char *)v176 + 8);
      *(_OWORD *)v160 = *(_OWORD *)((char *)&v176[1] + 8);
      *(_QWORD *)&v160[14] = *(_QWORD *)((char *)&v176[2] + 6);
      v158 = v103;
      *(_QWORD *)&v160[24] = v120;
      *(_QWORD *)&v161 = v133;
      DWORD2(v161) = a3;
      BYTE12(v161) = a6;
      *(_QWORD *)&v162 = v114;
      DWORD2(v162) = 0;
      a4 = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)v133, CFSTR("Multiple"));
      v104 = CFDictionaryGetTypeID();
      if (a4)
      {
        if (v104 && CFGetTypeID((CFTypeRef)a4) != v104)
        {
          a4 = 0;
        }
        else
        {
          CFDictionaryApplyFunction((CFDictionaryRef)a4, (CFDictionaryApplierFunction)_LSPluginRegistration_CFDictionaryApplier, &context);
          a4 = DWORD2(v162);
        }
      }

    }
    else
    {
      v105 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v133, CFSTR("NSExtensionAttributes"));
      v106 = CFDictionaryGetTypeID();
      if (v105 && v106 && CFGetTypeID(v105) != v106)
        v105 = 0;
      LODWORD(context) = 0;
      v107 = _LSRegisterPlugin(v137, (const LSPluginInfo *)&v166, v105, v129, v120, (const __CFDictionary *)v133, a3, (unsigned int *)&context);
      if (!a6 && !v107 && (_DWORD)context)
      {
        LSPluginAddInfoToPayloadDict(v137, v114, (int)context, 1, 1);
        goto LABEL_65;
      }
      if (v107 == -10651)
        a4 = 0;
      else
        a4 = v107;
    }
LABEL_66:
    if (v174[0])
      CFRelease(v174[0]);
    if (v30)
      CFRelease(v30);
    if (v27)
      CFRelease(v27);
    if (v44)
      CFRelease(v44);

    ++v14;
  }
  while (v134 != v14);
  if (values)
  {
    v139 = values;
    operator delete(values);
  }
  if (keys)
  {
    v142 = keys;
    operator delete(keys);
  }
  if (v114)
  {
    LSPluginSendNotification(v137, (uint64_t)CFSTR("com.apple.LaunchServices.pluginsregistered"), v114);
    CFRelease(v114);
  }
LABEL_228:

  return a4;
}

void sub_1829A9EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47)
{

  _Unwind_Resume(a1);
}

uint64_t _LSCopyPluginsWithURL(uint64_t a1, const __CFURL *a2)
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = (void *)MEMORY[0x186DAE7A0]();
  if (a2)
  {
    v7 = (__CFString *)CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
    v4 = v7;
    _CSStoreEnumerateUnits();

  }
  objc_autoreleasePoolPop(v3);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1829AA0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _LSUnregisterPlugin(void **a1, uint64_t a2)
{
  return _LSUnregisterBundle(a1, a2, 0x20000000);
}

uint64_t _LSServerBundleRegistration(id *a1, void *a2, void *a3, void *a4, const __CFDictionary *a5, unsigned int *a6, uint64_t a7, char *a8, _BYTE *a9)
{
  _DWORD *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  CFTypeID TypeID;
  const __CFString *Value;
  CFTypeID v22;
  _BOOL4 v23;
  uint64_t v24;
  id v25;
  __CFString *v26;
  int StringForCFString;
  NSString *v28;
  char v29;
  NSObject *v30;
  unsigned int v31;
  char v32;
  void *v33;
  CFTypeID v34;
  NSString *v35;
  CFTypeID v36;
  NSString *v37;
  CFTypeID v38;
  BOOL v39;
  NSString *v40;
  _BOOL4 v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  NSObject *v49;
  NSObject *v50;
  int v51;
  int v52;
  uint64_t v53;
  _BOOL4 v54;
  NSString *v55;
  NSString *v56;
  int v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD v67[2];
  _OWORD v68[2];
  __int128 buf;
  void (*v70)(uint64_t, int, int *, uint64_t, _BYTE *);
  void *v71;
  id v72;
  NSString *v73;
  uint64_t *v74;
  unsigned int *v75;
  int v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  +[LSRecordBuilder recordBuilderForType:](LSRecordBuilder, "recordBuilderForType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 4294956479;
  if (!a1 || !v13)
    goto LABEL_84;
  v18 = v13[3];
  if (v18 == 203)
  {
    if (!v14)
    {
      v16 = 0;
      goto LABEL_84;
    }
  }
  else
  {
    v16 = 0;
    if (!v14 || v18 != 205)
      goto LABEL_84;
  }
  v19 = *a1;
  v16 = v19;
  if (!v19)
    goto LABEL_84;
  if (!a4)
    goto LABEL_84;
  if (!*((_QWORD *)v19 + 1))
    goto LABEL_84;
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(a4))
    goto LABEL_84;
  objc_msgSend(v15, "setRegistrationInfo:alias:", v13, v14);
  objc_msgSend(v15, "setDatabase:", v16);
  if (a5)
  {
    HIDWORD(v53) = _LSGetBooleanFromDict(a5, CFSTR("IsPlaceholder"));
    Value = (const __CFString *)CFDictionaryGetValue(a5, CFSTR("ApplicationType"));
    v22 = CFStringGetTypeID();
    v23 = Value
       && (!v22 || CFGetTypeID(Value) == v22)
       && CFStringCompare(Value, CFSTR("SystemAppPlaceholder"), 1uLL) == kCFCompareEqualTo;
    v52 = _LSGetBooleanFromDict(a5, CFSTR("LSAppDowngrade"));
    LODWORD(v53) = v23;
  }
  else
  {
    v52 = 0;
    v53 = 0;
  }
  if (CSStoreGetUnit())
  {
    v61 = v13[7];
    v24 = _LSBundleGet(v16, v61);
  }
  else
  {
    v51 = v13[6];
    v25 = v16;
    v63 = 0;
    v64 = &v63;
    v65 = 0x2020000000;
    v66 = 0;
    v55 = (NSString *)v14;
    +[FSNode nameForBookmarkData:error:](FSNode, "nameForBookmarkData:error:");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      StringForCFString = _LSDatabaseGetStringForCFString(v25, v26, 1);

      if (StringForCFString)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v70 = ___ZL61_LSFindExistingRegisteredBundleWithContainerMatchingAliasDataP11_LSDatabasejP6NSDataPj_block_invoke;
        v71 = &unk_1E1045160;
        v76 = StringForCFString;
        v77 = v51;
        v72 = v25;
        v28 = v55;
        v75 = &v61;
        v73 = v28;
        v74 = &v63;
        _CSStoreEnumerateUnits();

      }
    }
    v24 = v64[3];
    _Block_object_dispose(&v63, 8);

  }
  v62 = v24;
  if (v24)
  {
    if (!HIDWORD(v53)
      && (_LSGetBooleanFromDict((const __CFDictionary *)a4, CFSTR("_LSInfoPlistIsMissing"))
       || _LSGetBooleanFromDict((const __CFDictionary *)a4, CFSTR("_LSNoExecutableInfo")))
      && (*(_QWORD *)(v62 + 172) & 0x20000000000200) == 0)
    {
      _LSInstallLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_182882000, v49, OS_LOG_TYPE_DEFAULT, "skipping registration of an incomplete bundle", (uint8_t *)&buf, 2u);
      }

      v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    if ((*(_BYTE *)(v62 + 172) & 0x80) == 0 && (v13[4] & 2) == 0)
    {
      _LSInstallLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_182882000, v30, OS_LOG_TYPE_DEFAULT, "refusing to replace a trusted bundle with an untrusted one at the same path", (uint8_t *)&buf, 2u);
      }

      v17 = 4294956621;
      goto LABEL_84;
    }
    if (_LSBundleDataIsIncomplete(*a1, v62))
    {
      v31 = *(unsigned __int8 *)(v62 + 509);
      if (v31 < 0x3C)
        LOBYTE(v31) = v31 + 1;
      objc_msgSend(v15, "setRetries:", v31);
    }
    if ((v29 & 1) != 0)
    {
      if (v62)
      {
        v32 = 0;
LABEL_77:
        if (a6)
          *a6 = v61;
        if (a8)
        {
          if (!v61)
            v32 = 0;
          *a8 = v32;
        }
        _LSDatabaseSetSequenceNumber((uint64_t)v16, v60);
        v17 = 0;
        goto LABEL_84;
      }
    }
    else
    {
      objc_msgSend(v15, "setPreviousInstallType:", *(unsigned int *)(v62 + 332));
      v17 = _LSBundleRemove(v16, v61, 0);
      if ((_DWORD)v17)
        goto LABEL_84;
      v62 = 0;
      v61 = 0;
    }
  }
  if (!CSStoreGetUnit())
  {
    v17 = 4294957797;
    goto LABEL_84;
  }
  if (!*MEMORY[0x1E0C9AE78])
  {
    v34 = CFStringGetTypeID();
LABEL_53:
    v37 = 0;
    goto LABEL_54;
  }
  v33 = (void *)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E0C9AE78]);
  v34 = CFStringGetTypeID();
  if (!v33)
    goto LABEL_53;
  v36 = v34;
  if (v34)
  {
    v34 = CFGetTypeID(v33);
    if (v34 != v36)
      goto LABEL_53;
  }
  v37 = (NSString *)v33;
LABEL_54:
  _LSLogStepStart(v34, 0, v37, v35);
  v56 = v37;
  if (!v37)
    goto LABEL_67;
  v38 = CFGetTypeID(v37);
  v39 = v38 == CFStringGetTypeID();
  v40 = v56;
  if (!v39)
    goto LABEL_67;
  v61 = 0;
  v59 = 0;
  v63 = 0;
  if ((_DWORD)v53
    || (memset(v68, 0, sizeof(v68)),
        v54 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)a1, 0, v56, 0, v68, 2, 128, 0, 0, &v61, &v62, 0),
        memset(v67, 0, sizeof(v67)),
        v41 = _LSBundleFindWithInfoAndNo_IOFilter((uint64_t)a1, 0, v56, 0, v67, 2, 1152, 0, 0, &v59, &v63, 0),
        v40 = v56,
        !v54 && !v41))
  {
    _LSInstallLog();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v40;
      _os_log_impl(&dword_182882000, v44, OS_LOG_TYPE_DEFAULT, "No bundles to remove for %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_67;
  }
  if (!v41)
  {
    v17 = 0;
    v63 = 0;
    v59 = 0;
    if (!v54)
    {
      v62 = 0;
      v61 = 0;
      goto LABEL_67;
    }
    goto LABEL_89;
  }
  v42 = _LSBundleGet(v16, v59);
  objc_msgSend(v15, "setPreviousInstallType:", *(unsigned int *)(v42 + 332));
  objc_msgSend(v15, "addBundleFlag:", *(_QWORD *)(v42 + 172) & 0x80000);
  v17 = _LSBundleRemove(v16, v59, 0);
  _LSInstallLog();
  v43 = objc_claimAutoreleasedReturnValue();
  v40 = v56;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v56;
    _os_log_impl(&dword_182882000, v43, OS_LOG_TYPE_DEFAULT, "Removed existing registered placeholder for %@", (uint8_t *)&buf, 0xCu);
  }

  v63 = 0;
  v59 = 0;
  if (v54)
  {
LABEL_89:
    if (!HIDWORD(v53) || v52)
    {
      objc_msgSend(v15, "setPreviousInstallType:", *(unsigned int *)(_LSBundleGet(v16, v61) + 332));
      v17 = _LSBundleRemove(v16, v61, v52);
      _LSInstallLog();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v40;
        _os_log_impl(&dword_182882000, v50, OS_LOG_TYPE_DEFAULT, "Removed existing registered bundle for %@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v15, "addBundleFlag:", 0x80000);
      *(_QWORD *)&buf = *(_QWORD *)(v62 + 172) | 0x400000000000;
      _CSStoreWriteToUnit();
      if (objc_msgSend(a4, "_LS_BoolForKey:", CFSTR("LSRequiresPostProcessing")))
        _CSStoreWriteToUnit();
    }
  }
  v62 = 0;
  v61 = 0;
  if ((_DWORD)v17 && (_DWORD)v17 != -10814)
    goto LABEL_84;
LABEL_67:
  v45 = _LSDatabaseGetSequenceNumber() + 1;
  v60 = v45;
  objc_msgSend(v15, "setSequenceNumber:", v45);
  if (objc_msgSend(v15, "parseInfoPlist:", a4)
    && (objc_msgSend(v15, "parseInstallationInfo:", a5) & 1) != 0)
  {
    v17 = 0;
    v46 = 1;
  }
  else
  {
    v46 = 0;
    v17 = 4294967246;
  }
  objc_msgSend(v15, "parseActivityTypesFromDictionary:", a4);
  objc_msgSend(v15, "parseNSExtensionSDKDefinitionsFromDictionary:", a4);
  _LSLogStepFinished(5, v46, v56, CFSTR("Built bundle record for app"));
  v61 = objc_msgSend(v15, "registerBundleRecord:error:", v16, 0);
  v47 = objc_msgSend(v15, "registerChildItemsTrusted");
  if (a9)
    *a9 = v47;
  if ((_DWORD)v46)
  {
    if (v45 < v61)
    {
      v60 = v61;
      _CSStoreWriteToUnit();
    }
    _CSStoreGarbageCollect();
    v32 = 1;
    goto LABEL_77;
  }
LABEL_84:

  return v17;
}

void sub_1829AAC28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void _LSLogStepStart(uint64_t a1, uint64_t a2, NSString *a3, NSString *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _LSLogStep(5, 1, 1, a3, CFSTR("Building bundle record for app"), (uint64_t)va);
}

{
  va_list va;

  va_start(va, a4);
  _LSLogStep(1, 0, a3, CFSTR("_LSServerRegisterItemInfo begin"), (uint64_t)va);
}

{
  va_list va;

  va_start(va, a4);
  _LSLogStep(a1, 1, 1, a3, a4, (uint64_t)va);
}

void _LSLogStepFinished(uint64_t a1, uint64_t a2, NSString *a3, NSString *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _LSLogStep(a1, 2, a2, a3, a4, (uint64_t)va);
}

{
  va_list va;

  va_start(va, a4);
  _LSLogStep(2, a2, a3, CFSTR("_LSServerRegisterItemInfo result = %@"), (uint64_t)va);
}

{
  va_list va;

  va_start(va, a4);
  _LSLogStep(a1, 2, a2, a3, a4, (uint64_t)va);
}

uint64_t _LSSliceMaskForSliceArray(void *a1)
{
  id v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v1 = a1;
  v2 = 0;
  v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "type", (_QWORD)v12);
        if (v7 <= 16777222)
        {
          switch(v7)
          {
            case 7:
              v2 |= 4u;
              break;
            case 12:
              switch(objc_msgSend(v6, "subtype") & 0xFFFFFF)
              {
                case 6:
                  v2 |= 0x20u;
                  break;
                case 9:
                  v2 |= 0x40u;
                  break;
                case 0xALL:
                  v2 |= 0x200u;
                  break;
                case 0xBLL:
                  v2 |= 0x400u;
                  break;
                case 0xCLL:
                  v2 |= 0x800u;
                  break;
                case 0xFLL:
                  v2 |= 0x1000u;
                  break;
                case 0x10:
                  v2 |= 0x2000u;
                  break;
                default:
                  continue;
              }
              break;
            case 18:
              v2 |= 1u;
              break;
          }
        }
        else if (v7 > 16777233)
        {
          if (v7 == 16777234)
          {
            v2 |= 2u;
          }
          else if (v7 == 33554444)
          {
            v9 = objc_msgSend(v6, "subtype") & 0xFFFFFF;
            if ((_DWORD)v9 == 1)
            {
              v2 |= 0xFFFF8000;
            }
            else if (!(_DWORD)v9)
            {
              v2 |= 0x4000u;
            }
          }
        }
        else if (v7 == 16777223)
        {
          v10 = objc_msgSend(v6, "subtype") & 0xFFFFFF;
          if ((_DWORD)v10 == 3)
          {
            v2 |= 8u;
          }
          else if ((_DWORD)v10 == 8)
          {
            v2 |= 0x10u;
          }
        }
        else if (v7 == 16777228)
        {
          v8 = objc_msgSend(v6, "subtype") & 0xFFFFFF;
          if ((_DWORD)v8 == 2)
          {
            v2 |= 0x100u;
          }
          else if (!(_DWORD)v8)
          {
            v2 |= 0x80u;
          }
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

  return (unsigned __int16)v2;
}

void sub_1829AAFD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSGetMinimumOSVersionStringAndReferencePlatformForPlatformSDKLinkage(void *a1, uint64_t a2, _OWORD *a3, id *a4, _DWORD *a5)
{
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int active_platform;
  _QWORD v19[4];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a3[1];
  v20[0] = *a3;
  v20[1] = v9;
  _LSMakeVersionNumber(14, 5, 0, v19);
  if (_LSVersionNumberCompare(v20, v19) == -1)
  {
    v14 = objc_opt_class();
    objc_msgSend(v8, "objectForKey:", CFSTR("LSMinimumSystemVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v15;
    if (v14 && v15)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_17;

    }
    else if (v15)
    {
      goto LABEL_17;
    }
    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKey:", CFSTR("MinimumOSVersion"));
    v17 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v17;
    if (v16 && v17 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
  }
  else
  {
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKey:", CFSTR("MinimumOSVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11 && (objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
    else
    {
      v13 = v12;
    }
  }
LABEL_17:
  active_platform = dyld_get_active_platform();
  if (a4)
    objc_storeStrong(a4, v13);
  if (a5)
    *a5 = active_platform;

}

void sub_1829AB1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFDictionary *_LSCreateRegistrationData(uint64_t *a1, void *a2, void *a3, FSNode *a4, const __CFArray **a5)
{
  _DWORD *v9;
  int v10;
  LSRegistrationInfo *v11;
  FSNode *v12;
  _LSBundleProvider *v13;
  _LSBundleProvider *v14;
  const __CFArray **v15;
  NSObject *v16;
  const __CFArray **v17;
  __CFDictionary *v18;
  NSObject *v19;
  const __CFAllocator *v20;
  __CFDictionary *MutableCopy;
  int v22;
  const void *v23;
  const void *v24;
  LSRegistrationInfo *v25;
  const void *v26;
  const __CFString *v27;
  CFTypeID v28;
  const UInt8 **v29;
  const __CFAllocator *v30;
  __CFDictionary *Copy;
  const __CFURL *v32;
  const void *v34;
  void *Value;
  CFTypeID TypeID;
  CFDictionaryRef v37;
  CFTypeID v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t i;
  __CFDictionary *v50;
  const void *v51;
  _LSBundleProvider *v52;
  const void *v53;
  __CFBundle *cf;
  CFTypeRef cfa;
  __CFDictionary *theDict;
  CFDictionaryRef theDicta;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  CFDictionaryRef v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  if (a1 && -[_LSDatabase accessContext](*a1))
    _CSStoreAccessContextAssertReading();
  v10 = v9[3];
  if ((v10 - 203) < 2)
  {
    v11 = v9;
    if (a3)
    {
      v12 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", a3, 48, 0);
      v13 = (_LSBundleProvider *)v12;
      if (v12)
      {
        if (-[FSNode isDirectory](v12, "isDirectory"))
        {
          cf = (__CFBundle *)-[_LSBundleProvider copyCFBundleWithError:](v13, "copyCFBundleWithError:", 0);
          if (cf)
          {
            v14 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]([_LSBundleProvider alloc], "initWithURL:useCacheIfPossible:", a3, 1);
            theDict = _LSCreateRegistrationDataForDirectoryNode((LSContext *)a1, v11, (const __CFURL *)v14, v13, a4, a5, v15);
            if (-[_LSBundleProvider usingCachedItem](v14, "usingCachedItem"))
            {
              _LSRegistrationLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                v64 = a3;
                _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_DEBUG, "Validating item %{private}@, which used the cache for registration", buf, 0xCu);
              }

              v52 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]([_LSBundleProvider alloc], "initWithURL:useCacheIfPossible:", a3, 0);
              v18 = _LSCreateRegistrationDataForDirectoryNode((LSContext *)a1, v11, (const __CFURL *)v52, v13, a4, a5, v17);
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = ___ZL34_LSCreateRegistrationDataForBundleP9LSContextP18LSRegistrationInfoPK7__CFURLPK14__CFDictionaryPPK9__CFArray_block_invoke;
              v62[3] = &__block_descriptor_40_e13_B24__0_v8_v16l;
              v62[4] = theDict;
              if (CFDictionaryApplyBlock(v18, (uint64_t)v62))
              {
                _LSRegistrationLog();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138739971;
                  v64 = a3;
                  _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_INFO, "REGISTRATION: Successfully registered %{sensitive}@ using the boot cache", buf, 0xCu);
                }

              }
              if (v18)
                CFRelease(v18);

            }
            if (theDict)
            {
              v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
              MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theDict);
              if (softLinkLNIsLinkEnabled)
              {
                v22 = softLinkLNIsLinkEnabled(cf);
                v23 = (const void *)*MEMORY[0x1E0C9AE40];
                if (v22)
                  v24 = (const void *)*MEMORY[0x1E0C9AE50];
                else
                  v24 = (const void *)*MEMORY[0x1E0C9AE40];
              }
              else
              {
                v23 = (const void *)*MEMORY[0x1E0C9AE40];
                v24 = (const void *)*MEMORY[0x1E0C9AE40];
              }
              CFDictionaryAddValue(MutableCopy, CFSTR("_LSIsLinkEnabled"), v24);
              CFRelease(theDict);
              CFRelease(cf);
              if (MutableCopy)
              {
                if (CFDictionaryContainsKey(MutableCopy, CFSTR("bundlePersonas"))
                  || CFDictionaryContainsKey(MutableCopy, CFSTR("_LSUsesSystemPersona")))
                {
                  Copy = CFDictionaryCreateMutableCopy(v20, 0, MutableCopy);
                  CFDictionaryRemoveValue(Copy, CFSTR("bundlePersonas"));
                  CFDictionaryRemoveValue(Copy, CFSTR("_LSUsesSystemPersona"));
                  CFRelease(MutableCopy);
                  if (!Copy)
                    goto LABEL_36;
                }
                else
                {
                  Copy = MutableCopy;
                }
                v34 = (const void *)*MEMORY[0x1E0C9AE78];
                if (!CFDictionaryContainsKey(Copy, (const void *)*MEMORY[0x1E0C9AE78]) || v11->action != 203)
                  goto LABEL_36;
                if (v34)
                {
                  Value = (void *)CFDictionaryGetValue(Copy, v34);
                  TypeID = CFStringGetTypeID();
                  if (!Value || !TypeID || CFGetTypeID(Value) == TypeID)
                    goto LABEL_58;
                }
                else
                {
                  CFStringGetTypeID();
                }
                Value = 0;
LABEL_58:
                v37 = Value;
                v38 = CFSetGetTypeID();
                v39 = (void *)CFDictionaryGetValue((CFDictionaryRef)a4, CFSTR("LSPersonaUniqueStrings"));
                v40 = v39;
                v53 = v23;
                if (v39 && CFGetTypeID(v39) == v38)
                {
                  v41 = v40;
                  objc_msgSend(v41, "allObjects");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  +[_LSPersonaDatabase sharedInstance]();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_LSPersonaDatabase personasWithAttributesForBundleIdentifier:](v43, v37);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v43;
                }

                if (objc_msgSend(v42, "count"))
                {
                  theDicta = v37;
                  _LSRegistrationLog();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138543874;
                    v64 = v42;
                    v65 = 2114;
                    v66 = a3;
                    v67 = 2114;
                    v68 = v37;
                    _os_log_impl(&dword_182882000, v44, OS_LOG_TYPE_INFO, "- Got personas %{public}@ for application at %{public}@/%{public}@", buf, 0x20u);
                  }

                  v60 = 0u;
                  v61 = 0u;
                  v58 = 0u;
                  v59 = 0u;
                  v45 = v42;
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
                  cfa = v42;
                  v47 = 0;
                  if (v46)
                  {
                    v48 = *(_QWORD *)v59;
                    do
                    {
                      for (i = 0; i != v46; ++i)
                      {
                        if (*(_QWORD *)v59 != v48)
                          objc_enumerationMutation(v45);
                        v47 |= -[_LSPersonaWithAttributes personaType](*(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i)) == 3;
                      }
                      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v58, buf, 16);
                    }
                    while (v46);
                  }

                  v42 = (void *)cfa;
                  v37 = theDicta;
                  v50 = CFDictionaryCreateMutableCopy(v20, 0, Copy);
                  CFDictionarySetValue(v50, CFSTR("bundlePersonas"), v45);
                  if ((v47 & 1) != 0)
                    v51 = (const void *)*MEMORY[0x1E0C9AE50];
                  else
                    v51 = v53;
                  CFDictionarySetValue(v50, CFSTR("_LSUsesSystemPersona"), v51);
                  CFRelease(Copy);
                  Copy = CFDictionaryCreateCopy(v20, v50);
                  CFRelease(v50);
                }

                goto LABEL_36;
              }
            }
            else
            {
              CFRelease(cf);
            }
          }
        }
      }
    }
    else
    {
      _LSRegistrationLog();
      v13 = (_LSBundleProvider *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182882000, &v13->super, OS_LOG_TYPE_ERROR, "Unexpected nil bundle URL when registering.", buf, 2u);
      }
    }
    Copy = 0;
LABEL_36:

    goto LABEL_40;
  }
  if (v10 == 205)
  {
    v25 = v9;
    if (a4)
    {
      v26 = (const void *)*MEMORY[0x1E0C9AE78];
      if (*MEMORY[0x1E0C9AE78])
      {
        v27 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E0C9AE78]);
        v28 = CFStringGetTypeID();
        if (v27 && (!v28 || CFGetTypeID(v27) == v28))
        {
          v29 = (const UInt8 **)_LSPathForBundleLibraryIdentifier(v27);
          v30 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          Copy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          CFDictionarySetValue(Copy, v26, v27);
          v32 = CFURLCreateFromFileSystemRepresentation(v30, v29[1], *(int *)v29, 1u);
          _LSAddBundleLibraryInfo((LSContext *)a1, v32, 0, v25, Copy, 1, 0);
          if (v32)
            CFRelease(v32);
          goto LABEL_39;
        }
      }
      else
      {
        CFStringGetTypeID();
      }
    }
    Copy = 0;
LABEL_39:

    goto LABEL_40;
  }
  Copy = 0;
LABEL_40:

  return Copy;
}

void sub_1829AB954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t _LSServerItemInfoRegistration(id *a1, void *a2, void *a3, void *a4, const __CFDictionary *a5, unsigned int *a6, uint64_t a7, char *a8, _BYTE *a9)
{
  _DWORD *v15;
  uint64_t v16;
  id v17;
  int v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  const __CFURL *v25;
  void *Value;
  CFTypeID v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFURL *v31;
  const __CFArray *v32;
  CFIndex Count;
  CFIndex i;
  void *ValueAtIndex;
  CFTypeID TypeID;
  const __CFString *v37;
  int v38;
  const void *v39;
  CFRange v40;
  const __CFAllocator *v41;
  NSObject *v42;
  int v44;
  CFDictionaryRef v45;
  const __CFString *string;
  void *v47;
  void *v48;
  _DWORD *v49;
  id v50;
  CFDictionaryRef theDict;
  void *keys;
  int v53;
  id v54;
  _QWORD v55[6];
  __int128 buffer;
  uint64_t v57;
  CFTypeRef (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  const char *v60;
  CFTypeRef cf;
  uint64_t v62;
  CFRange v63;

  v62 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v17 = a3;
  v18 = v15[3];
  if (v18 == 203 || v18 == 205)
  {
    v21 = _LSServerBundleRegistration(a1, v15, v17, a4, a5, a6, v16, a8, a9);
  }
  else
  {
    if (v18 == 204)
    {
      v49 = v15;
      v19 = v17;
      v54 = 0;
      v53 = 0;
      theDict = (CFDictionaryRef)a4;
      keys = 0;
      v47 = v19;
      v20 = 0;
      if (!a1)
      {
        v48 = 0;
        v21 = 4294956479;
        goto LABEL_72;
      }
      v21 = 4294956479;
      if (!v19)
      {
        v48 = 0;
        goto LABEL_72;
      }
      v48 = 0;
      if (v49[3] != 204)
      {
LABEL_72:

        goto LABEL_73;
      }
      v22 = *a1;
      if (!v22)
      {
        v20 = 0;
        v48 = 0;
        goto LABEL_72;
      }
      v48 = v22;
      if (!*((_QWORD *)v22 + 1))
      {
        v20 = 0;
        goto LABEL_72;
      }
      v50 = 0;
      v20 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]([FSNode alloc], "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:", v47, 0, 0, &v50);
      v23 = v50;
      v24 = v23;
      if (v20)
      {

      }
      else
      {
        v21 = _LSGetOSStatusFromNSError(v23);

        if ((_DWORD)v21)
          goto LABEL_70;
      }
      objc_msgSend(v20, "URL");
      v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      string = CFURLCopyFileSystemPath(v25, kCFURLPOSIXPathStyle);

      if (!string)
      {
        v21 = 0;
        if (!a5)
          goto LABEL_72;
        goto LABEL_71;
      }
      if (!theDict)
      {
LABEL_29:
        if (a5)
        {
          CFRetain(a5);
        }
        else
        {
          if (!keys)
            goto LABEL_61;
          *(_QWORD *)&buffer = 0;
          *((_QWORD *)&buffer + 1) = &buffer;
          v57 = 0x3812000000;
          v58 = __Block_byref_object_copy__425;
          v59 = __Block_byref_object_dispose__426;
          v60 = "";
          cf = 0;
          v55[0] = MEMORY[0x1E0C809B0];
          v55[1] = 3221225472;
          v55[2] = ___ZL31createInstallationDictForPluginPK10__CFString_block_invoke;
          v55[3] = &unk_1E1045210;
          v55[4] = &buffer;
          v55[5] = keys;
          ((void (*)(void *, void *))softLinkMobileInstallationEnumerateAllInstalledItemDictionaries[0])(0, v55);
          v39 = *(const void **)(*((_QWORD *)&buffer + 1) + 48);
          if (v39)
            a5 = (const __CFDictionary *)CFRetain(v39);
          else
            a5 = 0;
          _Block_object_dispose(&buffer, 8);
          if (cf)
            CFRelease(cf);
          if (!a5)
          {
LABEL_61:
            _LSRegistrationLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buffer) = 138412290;
              *(_QWORD *)((char *)&buffer + 4) = keys;
              _os_log_impl(&dword_182882000, v42, OS_LOG_TYPE_ERROR, "Cannot register app extension %@ without MobileInstallation data. Installation dictionary was NULL", (uint8_t *)&buffer, 0xCu);
            }

            a5 = 0;
            v45 = 0;
            v37 = 0;
            v32 = 0;
            v21 = 4294956479;
            goto LABEL_64;
          }
        }
        if (theDict && keys)
        {
          v45 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&keys, (const void **)&theDict, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        }
        else
        {
          if (CFStringGetFileSystemRepresentation(string, (char *)&buffer, 1024))
          {
            _LSDefaultLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              _LSServerItemInfoRegistration_cold_1((uint64_t)&buffer, v28);

          }
          v45 = 0;
        }
        v29 = _LSGetPlugin((uint64_t)v48, v49[7]);
        if (v29)
        {
          v30 = v49[7];
          v44 = *(_DWORD *)(v29 + 224);
          v53 = v44;
          _LSUnregisterBundle(a1, v30, 0x20000000);
          objc_msgSend(v20, "URL");
          v31 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
          v32 = (const __CFArray *)_LSCopyPluginsWithURL((uint64_t)a1, v31);

          if (v32)
          {
            Count = CFArrayGetCount(v32);
            if (Count >= 1)
            {
              for (i = 0; i != Count; ++i)
              {
                ValueAtIndex = (void *)CFArrayGetValueAtIndex(v32, i);
                TypeID = CFNumberGetTypeID();
                if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
                  _LSUnregisterBundle(a1, objc_msgSend(ValueAtIndex, "unsignedLongLongValue"), 0x20000000);
              }
            }
            CFRelease(v32);
            v32 = 0;
          }
          v37 = 0;
          v38 = v44;
        }
        else
        {
          v40 = CFStringFind(string, CFSTR(".app/"), 4uLL);
          if (v40.location == -1)
          {
            v38 = 0;
            v32 = 0;
            v37 = 0;
          }
          else
          {
            v63.length = v40.location + v40.length;
            v41 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v63.location = 0;
            v37 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], string, v63);
            v32 = CFURLCreateWithFileSystemPath(v41, v37, kCFURLPOSIXPathStyle, 1u);
            FSNodeCreateWithURL((uint64_t)v32, 0, &v54);
            _LSBundleFindWithNode((uint64_t)a1, v54, &v53, 0);
            v38 = v53;
          }
        }
        v21 = _LSRegisterPlugins(v48, v49[6], v38, (uint64_t)v45, a5, 0);
LABEL_64:
        CFRelease(string);
        if (v32)
          CFRelease(v32);
        if (v37)
          CFRelease(v37);
        if (v45)
          CFRelease(v45);
LABEL_70:
        if (a5)
        {
LABEL_71:
          CFRelease(a5);
          goto LABEL_72;
        }
        goto LABEL_72;
      }
      if (*MEMORY[0x1E0C9AE78])
      {
        Value = (void *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AE78]);
        v27 = CFStringGetTypeID();
        if (!Value || !v27 || CFGetTypeID(Value) == v27)
          goto LABEL_28;
      }
      else
      {
        CFStringGetTypeID();
      }
      Value = 0;
LABEL_28:
      keys = Value;
      goto LABEL_29;
    }
    v21 = 4294967246;
  }
LABEL_73:

  return v21;
}

void sub_1829AC09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,CFTypeRef cf)
{
  void *v33;
  void *v34;
  void *v35;

  _Unwind_Resume(a1);
}

void getLibIDs(void)
{
  unsigned __int8 v0;

  if ((v0 & 1) == 0)
  {
    {
      getLibIDs(void)::klibIDs = (uint64_t)CFSTR("com.apple.system-library");
      *(_QWORD *)algn_1EDCCCFE8 = CFSTR("com.apple.local-library");
      qword_1EDCCCFF0 = (uint64_t)CFSTR("com.apple.network-library");
      unk_1EDCCCFF8 = CFSTR("com.apple.user-library");
      qword_1EDCCD000 = (uint64_t)CFSTR("com.apple.apple-internal-library");
    }
  }
}

uint64_t ___ZL48_LSGetLibraryBundleIdentifierAndItemIndexForNodeP9LSContextP6FSNodePl_block_invoke(uint64_t result, unsigned int a2, int a3, _BYTE *a4)
{
  if (*(_DWORD *)(result + 40) == a3)
  {
    **(_QWORD **)(result + 32) = a2;
    *a4 = 1;
  }
  return result;
}

void ___ZL23getNeedsRegistrationLogv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.launchservices", "needs-reg");
  v1 = (void *)getNeedsRegistrationLog(void)::result;
  getNeedsRegistrationLog(void)::result = (uint64_t)v0;

}

uint64_t _LSServerCreateBundleDataAndRegister(LSContext *a1, LSRegistrationInfo *a2, NSData *a3, const __CFURL *a4, FSNode *a5, unsigned int *a6, const __CFArray **a7, unsigned __int8 *a8)
{
  LSRegistrationInfo *v15;
  NSData *v16;
  __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a2;
  v16 = a3;
  kdebug_trace();
  v17 = _LSCreateRegistrationData((uint64_t *)a1, v15, a4, a5, a7);
  kdebug_trace();
  kdebug_trace();
  v19 = _LSServerItemInfoRegistration((id *)&a1->db, v15, v16, v17, (const __CFDictionary *)a5, a6, v18, 0, a8);
  v20 = v19;
  if (a1 && !(_DWORD)v19)
    _LSDatabaseCommit((uint64_t)a1->db);
  kdebug_trace();

  return v20;
}

void sub_1829AC36C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZL23_LSRegisterDocumentTypeP11_LSDatabasejPK12LSBundleDataPK14__CFDictionaryP12NSDictionaryIP8NSStringPS7_IS9_S9_EEP19LSBindingListBuffer_block_invoke(uint64_t result, uint64_t a2, int a3, _BYTE *a4)
{
  uint64_t v5;
  _DWORD *v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;

  if ((a3 & 3) == 0 && (a3 & 0xFFFFFFFC) != 0)
  {
    v5 = result;
    v6 = *(_DWORD **)(result + 32);
    v7 = *(unsigned int **)(result + 48);
    v8 = v6[58];
    v9 = _UTTypeGet();
    result = _LSBindingListBufferAppend(v6, v7, v8, *(_DWORD *)(v9 + 12));
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

uint64_t ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke(uint64_t result, uint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v3 = result;
    if (a3[45] == *(_DWORD *)(result + 60) && a3[5] == *(_DWORD *)(result + 100))
    {
      v5 = a3[46];
      if (v5 != *(_DWORD *)(result + 132))
      {
        if (v5)
        {
          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v8, v9);

        }
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        _CSStringRetain();
        return _CSStoreWriteToUnit();
      }
    }
  }
  return result;
}

void sub_1829AC574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL31_LSServerRegisterExtensionPointP11_LSDatabasejPK10__CFStringjPK14__CFDictionaryPK7__CFURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v8, "intValue");
  objc_msgSend(v5, "intValue");
  _LSBindableDeactivate(v6, v7);
  objc_msgSend(v5, "intValue");
  _CSStringRelease();

}

void sub_1829AC630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (_NSIsNSString()
    && (objc_msgSend(v6, "hasPrefix:", CFSTR("DT")) & 1) == 0
    && (objc_msgSend(v6, "isEqual:", CFSTR("_LSLocalizedStringsDictionary")) & 1) == 0
    && (objc_msgSend(v6, "isEqual:", CFSTR("_LSSliceInfosKey")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
  }

}

void sub_1829AC6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL25_LSPluginRegisterWithInfoP11_LSDatabasePK14__CFDictionaryS3_hPS1_jj_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_opt_class();
  v7 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v8, v6, v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void sub_1829AC774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _LSPluginRegistration_CFDictionaryApplier(const __CFString *a1, CFDictionaryRef theDict, char *a3)
{
  __CFString *Value;
  CFTypeID TypeID;
  int v7;
  unsigned int v8;

  v8 = 0;
  if (!theDict)
  {
    CFDictionaryGetTypeID();
LABEL_7:
    Value = 0;
    goto LABEL_8;
  }
  Value = (__CFString *)CFDictionaryGetValue(theDict, CFSTR("NSExtensionAttributes"));
  TypeID = CFDictionaryGetTypeID();
  if (Value && TypeID && CFGetTypeID(Value) != TypeID)
    goto LABEL_7;
LABEL_8:
  v7 = _LSRegisterPlugin(*(_LSDatabase **)a3, (const LSPluginInfo *)(a3 + 8), Value, a1, *((const __CFString **)a3 + 27), *((const __CFDictionary **)a3 + 28), *((_DWORD *)a3 + 58), &v8);
  if (v7 || !v8)
  {
    if (v7 == -10651)
      return;
  }
  else if (!a3[236])
  {
    LSPluginAddInfoToPayloadDict(*(void **)a3, *((__CFDictionary **)a3 + 30), v8, 1, 1);
    return;
  }
  *((_DWORD *)a3 + 62) = v7;
}

void LSRegisterPluginState::~LSRegisterPluginState(id *this)
{

}

uint64_t _LSRegisterPlugin(_LSDatabase *a1, const LSPluginInfo *a2, __CFString *a3, const __CFString *a4, const __CFString *a5, const __CFDictionary *a6, int a7, unsigned int *a8)
{
  _LSDatabase *v13;
  CFTypeID v14;
  CFTypeID TypeID;
  const __CFString *Value;
  CFTypeID v17;
  const __CFString *v18;
  CFTypeID v19;
  __CFString *v20;
  CFTypeID v21;
  CFTypeID v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  int StringForCFString;
  __CFString *v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  id v44;
  const __CFAllocator *v45;
  const __CFUUID *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  int StringArray;
  __CFString *v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  FSNode *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const __CFArray *v73;
  CFIndex Count;
  char *v75;
  const __CFArray *v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  __CFString *v81;
  NSObject *v82;
  __CFString *v83;
  const __CFString *v86;
  unsigned int v87;
  __CFString *v88;
  __CFString *cf;
  _QWORD block[4];
  __CFString *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  _OWORD v102[13];
  _OWORD v103[2];
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _OWORD v107[2];
  uint8_t buf[32];
  __int16 v109;
  id v110;
  __int128 v111;
  __int128 v112;
  _OWORD v113[6];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _OWORD v119[4];
  _OWORD v120[2];
  __int128 v121;
  __int128 v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v118 = 0u;
  memset(v119, 0, 60);
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  memset(v113, 0, sizeof(v113));
  v111 = kLSVersionNumberNull;
  v112 = *(_OWORD *)algn_1829FAD90;
  v101 = 0;
  v87 = *((_DWORD *)a2 + 1);
  v100 = 0;
  v99 = 0;
  if (!a6 || (v86 = a5, a3) && (v14 = CFGetTypeID(a3), v14 != CFDictionaryGetTypeID()))
  {
    v41 = 0;
    v29 = 4294967246;
    goto LABEL_139;
  }
  cf = (__CFString *)CFDictionaryGetValue(a6, CFSTR("NSExtensionPointIdentifier"));
  TypeID = CFStringGetTypeID();
  if (!cf || TypeID && CFGetTypeID(cf) != TypeID)
    cf = 0;
  if (a3)
  {
    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("NSExtensionPointName"))
      || (Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("NSExtensionPointName")),
          v17 = CFStringGetTypeID(),
          Value)
      && v17
      && CFGetTypeID(Value) != v17)
    {
      Value = 0;
    }
    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("NSExtensionIdentifier"))
      || (v18 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("NSExtensionIdentifier")),
          v19 = CFStringGetTypeID(),
          v18)
      && v19
      && CFGetTypeID(v18) != v19)
    {
      v18 = 0;
    }
    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("NSExtensionVersion"))
      || (v20 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("NSExtensionVersion")),
          v21 = CFStringGetTypeID(),
          v20)
      && v21
      && CFGetTypeID(v20) != v21)
    {
      v20 = 0;
    }
    if (!CFDictionaryContainsKey((CFDictionaryRef)a3, CFSTR("NSExtensionPointVersion"))
      || (a3 = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("NSExtensionPointVersion")),
          v22 = CFStringGetTypeID(),
          a3)
      && v22
      && CFGetTypeID(a3) != v22)
    {
      a3 = 0;
    }
  }
  else
  {
    Value = 0;
    v20 = 0;
    v18 = 0;
  }
  if (v18)
    v23 = v18;
  else
    v23 = a4;
  v88 = (__CFString *)v23;
  v24 = _LSBundleGet(v13, a7);
  if (!v24
    || (*(_BYTE *)(v24 + 179) & 0x10) == 0
    || cf && (-[__CFString isEqualToString:](cf, "isEqualToString:", CFSTR("com.apple.widgetkit-extension")) & 1) != 0)
  {
    v25 = (void *)*((_QWORD *)a2 + 3);
    v98 = 0;
    v26 = _LSAliasAddURL(v13, v25, &v98);
    v27 = v98;
    v28 = v27;
    if (v26)
    {

    }
    else
    {
      v29 = _LSGetOSStatusFromNSError(v27);

      if ((_DWORD)v29)
        goto LABEL_101;
    }
    *(_QWORD *)&v113[0] = __PAIR64__(*((_DWORD *)a2 + 48), v26);
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) != 0)
      goto LABEL_44;
    v30 = (void *)*((_QWORD *)a2 + 4);
    if (!v30)
      goto LABEL_44;
    v97 = 0;
    v31 = _LSAliasAddURL(v13, v30, &v97);
    v32 = v97;
    v33 = v32;
    LODWORD(v114) = v31;
    if (v31)
    {

      goto LABEL_44;
    }
    v29 = _LSGetOSStatusFromNSError(v32);

    if (!(_DWORD)v29)
    {
LABEL_44:
      HIDWORD(v113[0]) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 5), 0);
      v34 = (const __CFString *)*((_QWORD *)a2 + 7);
      if (!v34)
      {
        if ((*((_BYTE *)a2 + 204) & 1) == 0)
          goto LABEL_48;
        v34 = CFSTR("0000000000");
      }
      LODWORD(v113[1]) = _LSDatabaseCreateStringForCFString(v13, v34, 0);
LABEL_48:
      if (cf)
        v35 = cf;
      else
        v35 = Value;
      StringForCFString = _LSDatabaseCreateStringForCFString(v13, v88, 0);
      if (v20)
        v37 = v20;
      else
        v37 = (__CFString *)v86;
      HIDWORD(v118) = StringForCFString;
      _LSGetVersionFromString(v37, buf);
      *(_OWORD *)((char *)&v113[1] + 12) = *(_OWORD *)buf;
      *(_OWORD *)((char *)&v113[2] + 12) = *(_OWORD *)&buf[16];
      if (a3)
        _LSGetVersionFromString(a3, buf);
      else
        memset(buf, 0, sizeof(buf));
      *(_OWORD *)((char *)v119 + 12) = *(_OWORD *)buf;
      *(_OWORD *)((char *)&v119[1] + 12) = *(_OWORD *)&buf[16];
      DWORD1(v113[1]) = v87;
      if (Value)
      {
        v38 = _LSDatabaseCreateStringForCFString(v13, Value, 0);
        goto LABEL_74;
      }
      if (_LSExtensionPointFindWithIdentifier(v13, v35, v87, 0, &v100, &v99) == -10814)
      {
        _LSRegistrationLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v88;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v35;
          _os_log_impl(&dword_182882000, v39, OS_LOG_TYPE_INFO, "Registering extension %@ but haven't yet registered extension point %@", buf, 0x16u);
        }
      }
      else
      {
        if (!a3
          || (*(_OWORD *)buf = *(_OWORD *)((char *)v119 + 12),
              *(_OWORD *)&buf[16] = *(_OWORD *)((char *)&v119[1] + 12),
              v42 = *(_OWORD *)(v99 + 24),
              v121 = *(_OWORD *)(v99 + 8),
              v122 = v42,
              !_LSVersionNumberCompare(buf, &v121)))
        {
LABEL_70:
          if (v99 && (_CSStringRetain(), v99))
            v38 = *(_DWORD *)(v99 + 40);
          else
            v38 = 0;
LABEL_74:
          DWORD2(v119[0]) = v38;
          DWORD1(v119[0]) = _LSDatabaseCreateStringForCFString(v13, v35, 0);
          DWORD1(v114) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 8), 0);
          HIDWORD(v114) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 9), 0);
          DWORD2(v113[0]) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 15), 0);
          HIDWORD(v115) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 10), 0);
          LODWORD(v116) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 11), 0);
          DWORD1(v116) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 12), 0);
          objc_msgSend(*((id *)a2 + 1), "sortedArrayUsingSelector:", sel_compare_);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if ((*((_BYTE *)a2 + 204) & 0x10) != 0)
          {
            _LSAliasGet(v13, v113[0]);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)objc_msgSend(v48, "mutableCopy");

            v95 = 0u;
            v96 = 0u;
            v93 = 0u;
            v94 = 0u;
            v50 = v41;
            v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
            if (v51)
            {
              v52 = *(_QWORD *)v94;
              do
              {
                for (i = 0; i != v51; ++i)
                {
                  if (*(_QWORD *)v94 != v52)
                    objc_enumerationMutation(v50);
                  objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "dataUsingEncoding:", 4);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "appendData:", v54);

                }
                v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
              }
              while (v51);
            }

            objc_msgSend(MEMORY[0x1E0CB3A28], "_LS_UUIDWithData:digestType:", v49, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "UUIDString");
            v47 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v45 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v46 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
            v47 = (__CFString *)CFUUIDCreateString(v45, v46);
            CFRelease(v46);
          }
          HIDWORD(v119[2]) = _LSDatabaseCreateStringForCFString(v13, v47, 0);
          if (objc_msgSend(v41, "count"))
            StringArray = _LSDatabaseCreateStringArray(v13, *((void **)a2 + 1), 0, 0);
          else
            StringArray = 0;
          v57 = (__CFString *)*((_QWORD *)a2 + 2);
          if (v57)
          {
            _LSGetVersionFromString(v57, buf);
            v111 = *(_OWORD *)buf;
            v112 = *(_OWORD *)&buf[16];
          }
          *(_OWORD *)((char *)&v113[3] + 12) = v111;
          *(_OWORD *)((char *)&v113[4] + 12) = v112;
          HIDWORD(v116) = _LSPlistAdd((uint64_t)v13, *((void **)a2 + 13));
          if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) == 0)
            LODWORD(v117) = _LSPlistAdd((uint64_t)v13, *((void **)a2 + 14));
          DWORD2(v116) = _LSPlistAdd((uint64_t)v13, *((void **)a2 + 16));
          HIDWORD(v113[5]) = StringArray;
          LODWORD(v119[3]) = a7;
          v58 = *(_DWORD *)a2;
          if ((*(_DWORD *)a2 & 4) != 0)
          {
            v59 = _LSPluginFindWithInfo(v13, 0, *((const __CFString **)a2 + 6), 0, 0, &v101, 0);
            v60 = v59;
            if (v59 && *(_DWORD *)(v59 + 184) != DWORD2(v119[0]))
            {
              v29 = 0;
              v58 &= ~4u;
            }
            else
            {
              LODWORD(v119[0]) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 6), 0);
              if (v60)
              {
                LODWORD(v121) = *(_DWORD *)(v60 + 168) | 8;
                *(_QWORD *)buf = 0;
                if (_CSStoreWriteToUnit())
                  v29 = 0;
                else
                  v29 = _LSGetOSStatusFromNSError(*(void **)buf);

              }
              else
              {
                v29 = 0;
              }
            }
          }
          else
          {
            v29 = 0;
            LODWORD(v119[0]) = 0;
          }
          WORD6(v117) = _LSSliceMaskForSliceArray(*((void **)a2 + 20));
          LODWORD(v118) = *((_DWORD *)a2 + 50);
          DWORD2(v118) = v58;
          BYTE4(v118) = *((_BYTE *)a2 + 204);
          v61 = (void *)MEMORY[0x186DAE7A0]();
          v62 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", *((_QWORD *)a2 + 3), 0, 0);
          BYTE4(v117) = _LSGetDirectoryClassForNode(v62);

          objc_autoreleasePoolPop(v61);
          v63 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(*((id *)a2 + 17), "objectForKeyedSubscript:", *MEMORY[0x1E0C9AAC8]);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v115) = LaunchServices::LocalizedString::Add(v13, v64, *((void **)a2 + 9));

          objc_autoreleasePoolPop(v63);
          v65 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(*((id *)a2 + 17), "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE88]);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          DWORD2(v114) = LaunchServices::LocalizedString::Add(v13, v66, *((void **)a2 + 9));

          objc_autoreleasePoolPop(v65);
          v67 = (void *)MEMORY[0x186DAE7A0]();
          objc_msgSend(*((id *)a2 + 17), "objectForKeyedSubscript:", CFSTR("NSMicrophoneUsageDescription"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          DWORD1(v115) = LaunchServices::LocalizedString::Add(v13, v68, *((void **)a2 + 18));

          objc_autoreleasePoolPop(v67);
          DWORD2(v117) = _LSPlistAdd((uint64_t)v13, *((void **)a2 + 19));
          BYTE5(v117) = *((_BYTE *)a2 + 196);
          v104 = *(_OWORD *)((char *)&v113[3] + 12);
          v105 = *(_OWORD *)((char *)&v113[4] + 12);
          v69 = DWORD1(v113[1]) - 1;
          if ((DWORD1(v113[1]) - 1) > 0xA)
          {
            v70 = -1;
            v71 = -1;
            v72 = -1;
          }
          else
          {
            v70 = qword_1829FABF8[v69];
            v71 = qword_1829FAC50[v69];
            v72 = qword_1829FACA8[v69];
          }
          _LSMakeVersionNumber(v70, v71, v72, v120);
          *(_OWORD *)buf = v104;
          *(_OWORD *)&buf[16] = v105;
          v121 = v120[0];
          v122 = v120[1];
          if ((unint64_t)_LSVersionNumberCompare(buf, &v121) > 1)
          {
            v75 = 0;
          }
          else
          {
            v73 = (const __CFArray *)*((_QWORD *)a2 + 22);
            if (v73)
              Count = CFArrayGetCount(v73);
            else
              Count = 0;
            v76 = (const __CFArray *)*((_QWORD *)a2 + 23);
            if (v76)
              v76 = (const __CFArray *)CFArrayGetCount(v76);
            v75 = (char *)v76 + Count;
          }
          DWORD1(v119[3]) = _LSDatabaseCreateStringForCFString(v13, *((const __CFString **)a2 + 21), 0);
          if (v75)
            v77 = _CSArrayCreateWithCapacity();
          else
            v77 = 0;
          DWORD2(v119[3]) = v77;
          v102[12] = v119[1];
          v103[0] = v119[2];
          v102[8] = v116;
          v102[9] = v117;
          v102[10] = v118;
          v102[11] = v119[0];
          v102[4] = v113[4];
          v102[5] = v113[5];
          v102[6] = v114;
          v102[7] = v115;
          v102[0] = v113[0];
          v102[1] = v113[1];
          v102[2] = v113[2];
          v102[3] = v113[3];
          *(_OWORD *)((char *)v103 + 12) = *(_OWORD *)((char *)&v119[2] + 12);
          v78 = _LSPluginAdd(v13, (uint64_t)v102);
          HIDWORD(v101) = v78;
          if ((_DWORD)v78)
          {
            if (DWORD2(v119[3]))
            {
              if (a7)
                _LSBundleGet(v13, a7);
              _LSRegisterTypeDeclarationsForPlugin(v13, v78, (uint64_t)v113, *((const void **)a2 + 23), *((void **)a2 + 17));
              _LSRegisterTypeDeclarationsForPlugin(v13, v78, (uint64_t)v113, *((const void **)a2 + 22), *((void **)a2 + 17));
            }
            v79 = _LSBundleGet(v13, a7);
            if (!v79)
              goto LABEL_131;
            if (*(_DWORD *)(v79 + 476))
            {
              _CSArrayAppendValue();
              goto LABEL_131;
            }
            *(_QWORD *)buf = 0;
            LODWORD(v121) = _CSArrayCreate();
            if (!(_DWORD)v121 && (v29 = _LSGetOSStatusFromNSError(*(void **)buf), (_DWORD)v29))
            {

            }
            else
            {
              if (_CSStoreWriteToUnit())
              {

LABEL_130:
                v29 = 0;
LABEL_131:
                if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) == 0)
                {
                  v80 = (void *)IconServicesLibrary(void)::frameworkLibrary;
                  if (!IconServicesLibrary(void)::frameworkLibrary)
                  {
                    v80 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2);
                    IconServicesLibrary(void)::frameworkLibrary = (uint64_t)v80;
                  }
                  if (v88 && v80)
                  {
                    v81 = v88;
                    _LSGetPluginNotificationAndIconCacheQueue();
                    v82 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = ___ZL17_LSRegisterPluginP11_LSDatabaseRK12LSPluginInfoPK14__CFDictionaryPK10__CFStringS9_S6_jPj_block_invoke;
                    block[3] = &unk_1E10418C8;
                    v83 = v81;
                    v92 = v83;
                    dispatch_async(v82, block);

                  }
                }
                goto LABEL_137;
              }
              v29 = _LSGetOSStatusFromNSError(*(void **)buf);

              if (!(_DWORD)v29)
                goto LABEL_130;
            }
          }
          else
          {
            v29 = 4294956479;
          }
LABEL_137:
          if (v47)
            CFRelease(v47);
          goto LABEL_139;
        }
        _LSRegistrationLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v43 = *(_OWORD *)(v99 + 24);
          v107[0] = *(_OWORD *)(v99 + 8);
          v107[1] = v43;
          _LSVersionNumberGetStringRepresentation(v107);
          v44 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v88;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = a3;
          *(_WORD *)&buf[22] = 2112;
          *(_QWORD *)&buf[24] = v35;
          v109 = 2112;
          v110 = v44;
          _os_log_impl(&dword_182882000, v39, OS_LOG_TYPE_INFO, "Extension %@ specified NSExtensionPointVersion %@ that does not match the active extensionPoint <%@:%@>", buf, 0x2Au);

        }
      }

      goto LABEL_70;
    }
LABEL_101:
    v41 = 0;
    goto LABEL_139;
  }
  _LSInstallLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    _LSRegisterPlugin((uint64_t)v88, (uint64_t)cf, v40);

  v41 = 0;
  v29 = 4294956645;
LABEL_139:
  if (HIDWORD(v101))
    *a8 = HIDWORD(v101);

  return v29;
}

void sub_1829AD7C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void LSPluginInfo::~LSPluginInfo(id *this)
{

}

void ___ZL17_LSRegisterPluginP11_LSDatabaseRK12LSPluginInfoPK14__CFDictionaryPK10__CFStringS9_S6_jPj_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  softLink_ISInvalidateCacheEntriesForBundleIdentifier(*(NSString **)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_1829ADA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL61_LSFindExistingRegisteredBundleWithContainerMatchingAliasDataP11_LSDatabasejP6NSDataPj_block_invoke(uint64_t a1, int a2, int *a3, uint64_t a4, _BYTE *a5)
{
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _DWORD *v16;
  void *v17;

  if (a3)
  {
    if (a3[80] == *(_DWORD *)(a1 + 64))
    {
      v9 = *(_DWORD *)(a1 + 68);
      if (!v9 || v9 == a3[1])
      {
        _LSAliasGet(*(void **)(a1 + 32), *a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v17 = v10;
          v11 = +[FSNode compareBookmarkData:toBookmarkData:](FSNode, "compareBookmarkData:toBookmarkData:", *(_QWORD *)(a1 + 40), v10);
          v10 = v17;
          if (!v11)
          {
LABEL_12:
            v16 = *(_DWORD **)(a1 + 56);
            if (v16)
              *v16 = a2;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
            *a5 = 1;
            goto LABEL_17;
          }
          if (v11 == 2)
          {
            +[FSNode pathForBookmarkData:error:](FSNode, "pathForBookmarkData:error:", *(_QWORD *)(a1 + 40), 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            +[FSNode pathForBookmarkData:error:](FSNode, "pathForBookmarkData:error:", v17, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (*(_DWORD *)(a1 + 68) == a3[1] && v12 && v13)
            {
              v15 = objc_msgSend(v12, "isEqualToString:", v13);

              v10 = v17;
              if ((v15 & 1) != 0)
                goto LABEL_12;
            }
            else
            {

              v10 = v17;
            }
          }
        }
LABEL_17:

      }
    }
  }
}

void sub_1829ADBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void _LSLogStep(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v11 = a5;
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, a6);
  else
    v12 = 0;
  objc_msgSend((id)getAITransactionLogClass(), "logStep:byParty:phase:success:forBundleID:description:", a1, 5, a2, a3, v13, v12);

}

{
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v11 = a5;
  if (v11)
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v11, a6);
  else
    v12 = 0;
  objc_msgSend((id)getAITransactionLogClass(), "logStep:byParty:phase:success:forBundleID:description:", a1, 5, a2, a3, v13, v12);

}

void sub_1829ADC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

Class initAITransactionLog(void)
{
  Class result;

  if (!MobileInstallationLibrary(void)::frameworkLibrary)
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 2);
  result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

{
  Class result;

  if (!MobileInstallationLibrary(void)::frameworkLibrary)
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 2);
  result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

{
  Class result;

  if (!MobileInstallationLibrary(void)::frameworkLibrary)
    MobileInstallationLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation", 2);
  result = objc_getClass("AITransactionLog");
  classAITransactionLog = (uint64_t)result;
  getAITransactionLogClass = (uint64_t (*)(void))AITransactionLogFunction;
  return result;
}

id AITransactionLogFunction(void)
{
  return (id)classAITransactionLog;
}

{
  return (id)classAITransactionLog;
}

{
  return (id)classAITransactionLog;
}

__CFDictionary *_LSCreateRegistrationDataForDirectoryNode(LSContext *a1, LSRegistrationInfo *a2, const __CFURL *a3, _LSBundleProvider *a4, FSNode *a5, const __CFArray **a6, const __CFArray **a7)
{
  __CFDictionary *v9;
  __CFDictionary *Mutable;
  const void *Value;
  CFTypeID TypeID;
  _LSBundleProvider *v13;
  const __CFString *v14;
  CFTypeID v15;
  const __CFURL *v16;
  const __CFDictionary *v17;
  void *v18;
  const void *v19;
  _LSBundleProvider *v20;
  const void *v21;
  const __CFURL *v22;
  const __CFURL *v23;
  const __CFString *v24;
  CFStringRef v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const void *v30;
  BOOL v31;
  char v32;
  const __CFString *v33;
  CFTypeID v34;
  unsigned int v35;
  const void *v36;
  BOOL v37;
  char v38;
  const __CFString *v39;
  CFTypeID v40;
  unsigned int v41;
  int v42;
  const __CFString *v43;
  CFTypeID v44;
  CFStringRef v45;
  __CFString *v46;
  CFStringRef v47;
  __CFString *v48;
  const __CFAllocator *v49;
  const char *v50;
  __CFString *v51;
  const char *v52;
  CFIndex Length;
  __CFString *v54;
  CFStringRef v55;
  const __CFString *v56;
  CFTypeID v57;
  CFStringRef v58;
  __CFString *v59;
  CFStringRef v60;
  __CFString *v61;
  const __CFAllocator *v62;
  const char *v63;
  __CFString *v64;
  const char *v65;
  CFIndex v66;
  __CFString *v67;
  CFStringRef v68;
  _LSBundleProvider *v69;
  const void *v70;
  CFTypeRef v71;
  const __CFBoolean *v72;
  CFTypeID v73;
  NSObject *v74;
  __CFBundle *v75;
  const void *v76;
  CFTypeID v77;
  CFStringRef PathComponent;
  CFStringRef v79;
  uint64_t v80;
  const __CFURL *v81;
  const __CFString *v82;
  const __CFURL *v83;
  const __CFString *v84;
  const __CFString *v85;
  CFStringRef v86;
  FSNode *v87;
  FSNode *v88;
  void *v89;
  void *v90;
  FSNode *v91;
  NSObject *v92;
  NSObject *v93;
  const __CFURL *v94;
  const __CFURL *v95;
  BOOL v96;
  void *v97;
  __CFBundle *v98;
  CFURLRef v99;
  _LSBundleProvider *v100;
  _LSBundleProvider *v101;
  __CFBundle *v102;
  CFTypeID v103;
  __CFString *v104;
  __CFString *v105;
  CFTypeID v106;
  __CFString *v107;
  _BOOL8 v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i;
  void *v116;
  void *v117;
  int v118;
  id v119;
  void *v120;
  int v121;
  void *v122;
  void *v123;
  void *v124;
  const void *v125;
  const __CFURL *v126;
  const __CFURL *v127;
  CFStringRef v128;
  FSNode *v129;
  void *v130;
  __CFArray *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t j;
  void *v137;
  void *v138;
  const void *v139;
  CFTypeID v140;
  CFTypeID v142;
  const __CFDictionary *v143;
  const __CFDictionary *v144;
  const __CFDictionary *v145;
  CFIndex v146;
  __CFBundle *ValueAtIndex;
  void *v148;
  void *v149;
  void *v150;
  __CFDictionary *v151;
  CFStringRef Identifier;
  const __CFURL *v153;
  CFURLRef v154;
  FSNode *v155;
  CFStringRef v156;
  FSNode *v157;
  int v158;
  _BOOL4 v159;
  _BOOL4 v160;
  uint64_t v161;
  void *v162;
  id v163;
  const void *v164;
  CFDictionaryRef v165;
  void *v166;
  void *v167;
  void *context;
  void *v169;
  void *v170;
  LSRegistrationInfo *v171;
  const __CFURL *v172;
  _LSBundleProvider *v173;
  __CFBundle *cfa;
  const __CFAllocator *cfb;
  CFTypeRef cfc;
  CFDictionaryRef v179;
  CFDictionaryRef v180;
  LSRegistrationInfo *v181;
  _LSBundleProvider *v182;
  char v183;
  _LSBundleProvider *v184;
  __CFDictionary *theDict;
  CFDictionaryRef v187;
  CFDictionaryRef v188;
  const __CFDictionary *v189;
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[3];
  uint8_t buf[1024];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v171 = a2;
  v172 = a3;
  v173 = a4;
  -[__CFURL infoDictionary](v172, "infoDictionary");
  v9 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  Mutable = copyDeepMutableDictionary(v9);

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  theDict = Mutable;
  if (!CFDictionaryGetCount(Mutable))
    CFDictionaryAddValue(Mutable, CFSTR("_LSInfoPlistIsMissing"), (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionaryRemoveValue(Mutable, CFSTR("LSIsSecuredSystemContent"));
  if (a5)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("ApplicationType"));
    TypeID = CFStringGetTypeID();
    if (Value
      && (!TypeID || CFGetTypeID(Value) == TypeID)
      && (CFEqual(Value, CFSTR("CoreServices"))
       || CFEqual(Value, CFSTR("System"))
       || CFEqual(Value, CFSTR("SystemAppPlaceholder"))
       || CFEqual(Value, CFSTR("Internal"))))
    {
      goto LABEL_16;
    }
  }
  else
  {
    CFStringGetTypeID();
  }
  if (-[_LSBundleProvider isSecuredSystemContent](v173, "isSecuredSystemContent"))
LABEL_16:
    CFDictionaryAddValue(Mutable, CFSTR("LSIsSecuredSystemContent"), (const void *)*MEMORY[0x1E0C9AE50]);
  v13 = v173;
  if (a5
    && (v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("BundleContainer")),
        v15 = CFStringGetTypeID(),
        v14)
    && (!v15 || CFGetTypeID(v14) == v15))
  {
    v16 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, kCFURLPOSIXPathStyle, 1u);
    v17 = (const __CFDictionary *)_LSCopyiTunesMetadataDictionaryForAppContainerURL(v16);
    if (v16)
      CFRelease(v16);

    if (v17)
    {
      _LSPromoteiTunesMetadataKeys(v17, theDict);
      CFRelease(v17);
    }
  }
  else
  {

  }
  v18 = (void *)MEMORY[0x186DAE7A0]();
  v19 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _LSGetDirectoryClassForNode(v13));
  CFDictionaryAddValue(theDict, CFSTR("_LSDirectoryClass"), v19);
  objc_autoreleasePoolPop(v18);
  v20 = v172;
  v21 = *(const void **)-[_LSBundleProvider provider](v20, "provider");
  if (v21)
  {
    v22 = (const __CFURL *)CFRetain(v21);
    v23 = v22;
    if (v22)
    {
      v25 = CFURLCopyFileSystemPath(v22, kCFURLPOSIXPathStyle);
      if (v25)
      {
        _LSPathifyIconKey(v20, theDict, (const __CFString *)*MEMORY[0x1E0C9AAD8], v24);
        _LSPathifyIconKeysInPlistKey(v20, theDict, (const __CFString *)*MEMORY[0x1E0C9AAD0], (const __CFString *)*MEMORY[0x1E0C9AB08], v26);
        _LSPathifyIconKeysInPlistKey(v20, theDict, (const __CFString *)*MEMORY[0x1E0C9AB38], (const __CFString *)*MEMORY[0x1E0C9AB20], v27);
        _LSPathifyIconKeysInPlistKey(v20, theDict, CFSTR("UTExportedTypeDeclarations"), CFSTR("UTTypeIconFile"), v28);
        _LSPathifyIconKeysInPlistKey(v20, theDict, CFSTR("UTImportedTypeDeclarations"), CFSTR("UTTypeIconFile"), v29);
        CFRelease(v25);
      }
      CFRelease(v23);
    }
  }

  v182 = v13;
  *(_DWORD *)buf = 0;
  LODWORD(v191) = 0;
  v30 = (const void *)*MEMORY[0x1E0C9AAE0];
  if (theDict)
    v31 = v30 == 0;
  else
    v31 = 1;
  v32 = !v31;
  if (v31)
  {
    CFStringGetTypeID();
  }
  else
  {
    v33 = (const __CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AAE0]);
    v34 = CFStringGetTypeID();
    if (!v33 || !v34 || CFGetTypeID(v33) == v34)
      goto LABEL_44;
  }
  v33 = 0;
LABEL_44:
  v35 = _LSGetRawOSTypeForPossibleString(v33);
  v36 = (const void *)*MEMORY[0x1E0C9AAF8];
  if (theDict)
    v37 = v36 == 0;
  else
    v37 = 1;
  v38 = !v37;
  v183 = v38;
  if (v37)
  {
    CFStringGetTypeID();
LABEL_56:
    v39 = 0;
    goto LABEL_57;
  }
  v39 = (const __CFString *)CFDictionaryGetValue(theDict, v36);
  v40 = CFStringGetTypeID();
  if (v39 && v40 && CFGetTypeID(v39) != v40)
    goto LABEL_56;
LABEL_57:
  v41 = _LSGetRawOSTypeForPossibleString(v39);
  if ((-[_LSBundleProvider getHFSType:creator:error:](v182, "getHFSType:creator:error:", buf, &v191, 0) & 1) == 0)
    goto LABEL_112;
  v42 = -[_LSBundleProvider isDirectory](v182, "isDirectory");
  if (*(_DWORD *)buf != v35)
  {
    if ((v32 & 1) != 0)
    {
      v43 = (const __CFString *)CFDictionaryGetValue(theDict, v30);
      v44 = CFStringGetTypeID();
      if (!v43 || !v44 || CFGetTypeID(v43) == v44)
      {
LABEL_66:
        if (!gLogRegistrationErrors)
        {
LABEL_81:
          if (*(_DWORD *)buf)
          {
            v55 = _LSCopyStringForOSType(*(unsigned int *)buf);
            if (v55)
            {
              CFDictionarySetValue(theDict, v30, v55);
              CFRelease(v55);
            }
          }
          else
          {
            CFDictionaryRemoveValue(theDict, v30);
          }
          goto LABEL_85;
        }
        v45 = _LSCopyStringForOSType(*(unsigned int *)buf);
        v46 = (__CFString *)v45;
        if (v43)
        {
          v47 = _LSCopyStringForOSType(v35);
          v48 = (__CFString *)v47;
          v49 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v50 = "file";
          if (v42)
            v50 = "PkgInfo";
          v51 = (__CFString *)CFStringCreateWithFormat(v49, 0, CFSTR("Type mismatch: %s type = '%@', plist CFBundlePackageType = '%@'"), v50, v46, v47);

          if (!v51)
            goto LABEL_76;
        }
        else
        {
          v49 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v52 = "file";
          if (v42)
            v52 = "PkgInfo";
          v51 = (__CFString *)CFStringCreateWithFormat(v49, 0, CFSTR("Type mismatch: %s type = '%@', plist CFBundlePackageType is missing"), v52, v45);
          if (!v51)
            goto LABEL_76;
        }
        _LSRegistrationWarning(v182, v51);
        CFRelease(v51);
LABEL_76:
        if (v43)
        {
          if (CFStringGetLength(v43) != 4)
          {
            Length = CFStringGetLength(v43);
            v54 = (__CFString *)CFStringCreateWithFormat(v49, 0, CFSTR("Value for CFBundlePackageType key has incorrect length %ld (should be 4)"), Length);
            if (v54)
            {
              _LSRegistrationWarning(v182, v54);
              CFRelease(v54);
            }
          }
        }

        goto LABEL_81;
      }
    }
    else
    {
      CFStringGetTypeID();
    }
    v43 = 0;
    goto LABEL_66;
  }
LABEL_85:
  if ((_DWORD)v191 == v41)
    goto LABEL_112;
  if ((v183 & 1) == 0)
  {
    CFStringGetTypeID();
LABEL_92:
    v56 = 0;
    goto LABEL_93;
  }
  v56 = (const __CFString *)CFDictionaryGetValue(theDict, v36);
  v57 = CFStringGetTypeID();
  if (v56 && v57 && CFGetTypeID(v56) != v57)
    goto LABEL_92;
LABEL_93:
  if (gLogRegistrationErrors)
  {
    v58 = _LSCopyStringForOSType(v191);
    v59 = (__CFString *)v58;
    if (v56)
    {
      v60 = _LSCopyStringForOSType(v41);
      v61 = (__CFString *)v60;
      v62 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v63 = "file";
      if (v42)
        v63 = "PkgInfo";
      v64 = (__CFString *)CFStringCreateWithFormat(v62, 0, CFSTR("Signature mismatch: %s signature = '%@', plist CFBundleSignature = '%@'"), v63, v59, v60);

      if (!v64)
        goto LABEL_103;
    }
    else
    {
      v62 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v65 = "file";
      if (v42)
        v65 = "PkgInfo";
      v64 = (__CFString *)CFStringCreateWithFormat(v62, 0, CFSTR("Signature mismatch: %s signature = '%@', plist CFBundleSignature is missing"), v65, v58);
      if (!v64)
        goto LABEL_103;
    }
    _LSRegistrationWarning(v182, v64);
    CFRelease(v64);
LABEL_103:
    if (v56)
    {
      if (CFStringGetLength(v56) != 4)
      {
        v66 = CFStringGetLength(v56);
        v67 = (__CFString *)CFStringCreateWithFormat(v62, 0, CFSTR("Value for CFBundleSignature key has incorrect length %ld (should be 4)"), v66);
        if (v67)
        {
          _LSRegistrationWarning(v182, v67);
          CFRelease(v67);
        }
      }
    }

  }
  if ((_DWORD)v191)
  {
    v68 = _LSCopyStringForOSType(v191);
    if (v68)
    {
      CFDictionarySetValue(theDict, v36, v68);
      CFRelease(v68);
    }
  }
  else
  {
    CFDictionaryRemoveValue(theDict, v36);
  }
LABEL_112:

  v69 = v20;
  v181 = v171;
  v184 = v69;
  v70 = *(const void **)-[_LSBundleProvider provider](v69, "provider");
  if (v70)
  {
    v71 = CFRetain(v70);
    if (v71)
    {
      if (a5)
      {
        v72 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a5, CFSTR("IsPlaceholder"));
        v73 = CFBooleanGetTypeID();
        if (v72)
        {
          if (!v73 || CFGetTypeID(v72) == v73)
          {
            if (CFBooleanGetValue(v72))
            {
              _LSRegistrationLog();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138477827;
                *(_QWORD *)&buf[4] = v71;
                _os_log_impl(&dword_182882000, v74, OS_LOG_TYPE_DEBUG, "bundle at %{private}@ is a placeholder; skipping executable lookup",
                  buf,
                  0xCu);
              }
LABEL_121:

LABEL_165:
              CFRelease(v71);
              goto LABEL_166;
            }
          }
        }
      }
      v75 = LSBundleProvider::CFBundleCopyExecutableURL((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider"));
      if (!v75)
      {
        _LSRegistrationLog();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          *(_QWORD *)&buf[4] = v71;
          _os_log_impl(&dword_182882000, v74, OS_LOG_TYPE_ERROR, "Failed to register bundle %{private}@ because no satisfactory executable could be found.", buf, 0xCu);
        }
        goto LABEL_121;
      }
      if (theDict && *MEMORY[0x1E0C9AE70])
      {
        v76 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AE70]);
        v77 = CFStringGetTypeID();
        if (v76 && (!v77 || CFGetTypeID(v76) == v77))
        {
          PathComponent = CFURLCopyLastPathComponent(v75);
          v79 = PathComponent;
          if (PathComponent)
          {
            if (CFEqual(PathComponent, v76) || (v80 = _CFBundleCopyExecutableURLInDirectory()) == 0)
              v80 = (uint64_t)v75;
            else
              CFRelease(v75);
            v75 = (__CFBundle *)v80;
            CFRelease(v79);
          }
        }
      }
      else
      {
        CFStringGetTypeID();
      }
      v81 = CFURLCopyAbsoluteURL((CFURLRef)v71);
      v82 = CFURLCopyFileSystemPath(v81, kCFURLPOSIXPathStyle);
      v83 = CFURLCopyAbsoluteURL(v75);
      if (v81)
        CFRelease(v81);
      v84 = CFURLCopyFileSystemPath(v83, kCFURLPOSIXPathStyle);
      v85 = v84;
      if (v82)
      {
        if (v84)
        {
          v86 = _LSCopyPathRelativeToBase(v84, v82);
          if (v86)
            CFDictionaryAddValue(theDict, CFSTR("_LSExecutablePath"), v86);
          v87 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v75, 1, 0);
          v88 = v87;
          if (v87)
          {
            if (-[FSNode isResolvable](v87, "isResolvable"))
            {
              -[FSNode resolvedNodeWithFlags:error:](v88, "resolvedNodeWithFlags:error:", 0, 0);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = v89;
              if (v89)
              {
                v91 = v89;

                v88 = v91;
              }

            }
            _LSAddExecutableFormatInfo();
            if (!-[FSNode getInodeNumber:error:](v88, "getInodeNumber:error:", &v181->inoExec, 0))
            {
              _LSRegistrationLog();
              v92 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138739971;
                *(_QWORD *)&buf[4] = v88;
                _os_log_impl(&dword_182882000, v92, OS_LOG_TYPE_ERROR, "Unable to get iNode for executable %{sensitive}@", buf, 0xCu);
              }

            }
            if (!-[FSNode getContentModificationDate:error:](v88, "getContentModificationDate:error:", &v181->executableModDate, 0))
            {
              _LSRegistrationLog();
              v93 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138739971;
                *(_QWORD *)&buf[4] = v88;
                _os_log_impl(&dword_182882000, v93, OS_LOG_TYPE_ERROR, "Unable to get modification date for bundle executable, %{sensitive}@", buf, 0xCu);
              }

            }
          }

          if (v86)
            CFRelease(v86);
          CFRelease(v85);
        }
        v85 = v82;
      }
      else if (!v84)
      {
        goto LABEL_162;
      }
      CFRelease(v85);
LABEL_162:
      if (v83)
        CFRelease(v83);
      CFRelease(v75);
      goto LABEL_165;
    }
  }
LABEL_166:

  -[_LSBundleProvider URL](v182, "URL");
  v94 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v95 = v94;
  if (softLink_GSIsDocumentRevision)
  {
    v96 = softLink_GSIsDocumentRevision(v94) == 0;

    if (!v96)
      CFDictionaryAddValue(theDict, CFSTR("_LSBundleIsInGenerationalStorage"), (const void *)*MEMORY[0x1E0C9AE50]);
  }
  else
  {

  }
  LSBundleProvider::intentURLPaths((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v97)
    CFDictionaryAddValue(theDict, CFSTR("_LSIntentDefinitionURLs"), v97);

  v98 = LSBundleProvider::XCFBundleCopyFolderURL((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider"), CFSTR("Library/"));
  if (v98)
  {
    _LSAddBundleLibraryInfo(a1, v98, v184, v181, theDict, 0, a6);
    CFRelease(v98);
  }
  if (a6 && !*a6 && (v181->options & 0x10000000) != 0)
  {
    v99 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/System/Library/CoreServices/CoreTypes.bundle/"), kCFURLPOSIXPathStyle, 1u);
    v100 = -[_LSBundleProvider initWithURL:useCacheIfPossible:]([_LSBundleProvider alloc], "initWithURL:useCacheIfPossible:", v99, 1);
    v101 = v100;
    if (v100)
    {
      v102 = LSBundleProvider::XCFBundleCopyFolderURL((LSBundleProvider *)-[_LSBundleProvider provider](v100, "provider"), CFSTR("Library/"));
      if (v102)
      {
        _LSAddBundleLibraryInfo(a1, v102, v101, v181, theDict, 0, a6);
        CFRelease(v102);
      }
    }

    if (v99)
      CFRelease(v99);
  }
  if (LSBundleProvider::CFBundleGetIdentifier((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider")))
  {
    if ((v103 = CFStringGetTypeID(),
          v104 = (__CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AE90]),
          (v105 = v104) != 0)
      && CFGetTypeID(v104) == v103
      || (v106 = CFStringGetTypeID(),
          v107 = (__CFString *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AAF0]),
          (v105 = v107) != 0)
      && CFGetTypeID(v107) == v106)
    {
      _LSGetVersionFromString(v105, buf);
    }
  }
  v108 = LSUseLegacyLocalizationList(theDict);
  +[_LSStringLocalizer gatherLocalizedStringsForCFBundle:infoDictionary:domains:delegatesMightBeMainBundle:legacyLocalizationList:](_LSStringLocalizer, "gatherLocalizedStringsForCFBundle:infoDictionary:domains:delegatesMightBeMainBundle:legacyLocalizationList:", LSBundleProvider::bundleRef((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider"), 1, "making string localizer"), theDict, 0xFFFFFFFFLL, 0, v108);
  cfa = LSBundleProvider::XCFBundleCopyFolderURL((LSBundleProvider *)-[_LSBundleProvider provider](v184, "provider"), CFSTR("Extensions/"));
  if (cfa)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "allowsUnentitledExtensionPointDeclaration"))
    {
      context = (void *)MEMORY[0x186DAE7A0]();
      v187 = (CFDictionaryRef)objc_opt_new();
      v109 = *MEMORY[0x1E0C99A18];
      v195[0] = *MEMORY[0x1E0C99A18];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v195, 1);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", cfa, v169, 1, 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();

      v193 = 0u;
      v194 = 0u;
      v191 = 0u;
      v192 = 0u;
      v112 = v111;
      v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
      if (v113)
      {
        v114 = *(_QWORD *)v192;
        do
        {
          for (i = 0; i != v113; ++i)
          {
            if (*(_QWORD *)v192 != v114)
              objc_enumerationMutation(v112);
            v116 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * i);
            v117 = (void *)MEMORY[0x186DAE7A0]();
            v190 = 0;
            v118 = objc_msgSend(v116, "getResourceValue:forKey:error:", &v190, v109, 0);
            v119 = v190;
            v120 = v119;
            if (v119)
              v121 = v118;
            else
              v121 = 0;
            if (v121 != 1 || (objc_msgSend(v119, "BOOLValue") & 1) != 0)
            {
              objc_msgSend(v116, "pathExtension");
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v122;
              if (v122
                && (!objc_msgSend(v122, "caseInsensitiveCompare:", CFSTR("appexpt"))
                 || !objc_msgSend(v123, "caseInsensitiveCompare:", CFSTR("appextensionpoint"))
                 || !objc_msgSend(v123, "caseInsensitiveCompare:", CFSTR("appextensionpoints"))))
              {
                -[__CFDictionary addObject:](v187, "addObject:", v116);
              }

            }
            objc_autoreleasePoolPop(v117);
          }
          v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
        }
        while (v113);
      }

      if (-[__CFDictionary count](v187, "count"))
      {
        v124 = (void *)-[__CFDictionary copy](v187, "copy");
        -[__CFDictionary setObject:forKey:](theDict, "setObject:forKey:", v124, CFSTR("_LSBundleExtensionPoints"));

      }
      objc_autoreleasePoolPop(context);
    }
    CFRelease(cfa);
  }
  if (v181->action == 204)
  {
    v125 = *(const void **)-[_LSBundleProvider provider](v184, "provider");
    if (v125)
    {
      v126 = (const __CFURL *)CFRetain(v125);
      v127 = v126;
      if (v126)
      {
        v128 = CFURLCopyFileSystemPath(v126, kCFURLPOSIXPathStyle);
        CFDictionarySetValue(theDict, CFSTR("Path"), v128);
        CFRelease(v127);
        CFRelease(v128);
      }
    }
    goto LABEL_236;
  }
  v129 = a5;
  if (a5)
  {
    v188 = (CFDictionaryRef)v129;
    -[FSNode objectForKey:](v129, "objectForKey:", CFSTR("_LSBundlePlugins"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v130 || !_NSIsNSDictionary() || !objc_msgSend(v130, "count"))
    {

      goto LABEL_236;
    }
    cfb = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v131 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v179 = (CFDictionaryRef)v130;
    objc_msgSend(v130, "allValues");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v193 = 0u;
    v194 = 0u;
    v191 = 0u;
    v192 = 0u;
    v133 = v132;
    v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
    if (v134)
    {
      v135 = *(_QWORD *)v192;
      do
      {
        for (j = 0; j != v134; ++j)
        {
          if (*(_QWORD *)v192 != v135)
            objc_enumerationMutation(v133);
          objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * j), "objectForKey:", CFSTR("Path"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v137, 1);
          LSBundleProvider::LSBundleProvider((LSBundleProvider *)v195, v138);
          if (LSBundleProvider::bundleRef((LSBundleProvider *)v195, 1, "checking for validity"))
          {
            v139 = (const void *)LSBundleProvider::bundleRef((LSBundleProvider *)v195, 1, 0);
            CFArrayAppendValue(v131, v139);
          }
          LSBundleProvider::~LSBundleProvider((LSBundleProvider *)v195);

        }
        v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v191, buf, 16);
      }
      while (v134);
    }

    if (v131)
    {
      if (theDict)
      {
        v170 = (void *)CFDictionaryGetValue(theDict, CFSTR("_LSBundlePlugins"));
        v140 = CFDictionaryGetTypeID();
        if (v170 && (!v140 || CFGetTypeID(v170) == v140))
          goto LABEL_241;
      }
      else
      {
        CFDictionaryGetTypeID();
      }
      if (CFArrayGetCount(v131) < 1)
      {
        v170 = 0;
      }
      else
      {
        v170 = CFDictionaryCreateMutable(cfb, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(theDict, CFSTR("_LSBundlePlugins"), v170);
        CFRelease(v170);
      }
LABEL_241:
      v142 = CFDictionaryGetTypeID();
      v143 = (const __CFDictionary *)CFDictionaryGetValue(v188, CFSTR("_LSBundlePlugins"));
      v144 = v143;
      if (v143)
      {
        if (CFGetTypeID(v143) == v142)
          v145 = v144;
        else
          v145 = 0;
        v189 = v145;
      }
      else
      {
        v189 = 0;
      }
      if (CFArrayGetCount(v131) < 1)
      {
LABEL_282:
        CFRelease(v131);
        goto LABEL_236;
      }
      v146 = 0;
      cfc = (CFTypeRef)*MEMORY[0x1E0C9AE50];
      v180 = (CFDictionaryRef)*MEMORY[0x1E0C9AE40];
      while (1)
      {
        ValueAtIndex = (__CFBundle *)CFArrayGetValueAtIndex(v131, v146);
        v148 = (void *)_LSCopyBundleInfoDictionary(ValueAtIndex);
        v149 = (void *)MEMORY[0x186DAE7A0]();
        CFAutorelease(v148);
        objc_msgSend(v148, "_ls_normalizedPluginPlist");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = (__CFDictionary *)objc_msgSend(v150, "mutableCopy");

        objc_autoreleasePoolPop(v149);
        Identifier = CFBundleGetIdentifier(ValueAtIndex);
        v153 = CFBundleCopyBundleURL(ValueAtIndex);
        v154 = CFBundleCopyExecutableURL(ValueAtIndex);
        if (v153)
        {
          v155 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v153, 0, 0);
          if (-[FSNode isSecuredSystemContent](v155, "isSecuredSystemContent"))
            CFDictionarySetValue(v151, CFSTR("LSIsSecuredSystemContent"), cfc);
          v156 = CFURLCopyFileSystemPath(v153, kCFURLPOSIXPathStyle);
          CFDictionarySetValue(v151, CFSTR("Path"), v156);
          CFRelease(v153);
          CFRelease(v156);

        }
        if (v154)
        {
          v157 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v154, 1, 0);
          if (v157)
          {
            bzero(buf, 0x400uLL);
            if (-[FSNode getFileSystemRepresentation:error:](v157, "getFileSystemRepresentation:error:", buf, 0))
            {
              *(_QWORD *)&v191 = 0;
              v158 = open((const char *)buf, 0, 511);
              if ((v158 & 0x80000000) == 0)
              {
                v159 = -[FSNode getLength:error:](v157, "getLength:error:", &v191, 0);
                if ((_QWORD)v191)
                  v160 = v159;
                else
                  v160 = 0;
                if (v160)
                {
                  v161 = fcntl(v158, 48, 1);
                  v162 = (void *)MEMORY[0x186DAE7A0](v161);
                  v163 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  _LSParseLoadCommands();
                  -[__CFDictionary setObject:forKey:](v151, "setObject:forKey:", v163, CFSTR("_LSSliceInfosKey"));

                  objc_autoreleasePoolPop(v162);
                }
                close(v158);
              }
            }
          }

          CFRelease(v154);
        }
        if (v189)
        {
          CFDictionaryGetTypeID();
          v164 = CFDictionaryGetValue(v189, Identifier);
          if (v164)
            CFGetTypeID(v164);
        }
        +[_LSStringLocalizer gatherLocalizedStringsForCFBundle:infoDictionary:domains:legacyLocalizationList:](_LSStringLocalizer, "gatherLocalizedStringsForCFBundle:infoDictionary:domains:legacyLocalizationList:", ValueAtIndex, v151, 3, LSUseLegacyLocalizationList(v151));
        v165 = v180;
        if (softLinkLNIsLinkEnabled)
        {
          if (softLinkLNIsLinkEnabled(ValueAtIndex))
            v165 = (CFDictionaryRef)cfc;
          else
            v165 = v180;
        }
        CFDictionaryAddValue(v151, CFSTR("_LSIsLinkEnabled"), v165);
        v166 = (void *)MEMORY[0x186DAE7A0]();
        if (softLinkINSchemaURLsForIntentNamesWithBundle)
        {
          softLinkINSchemaURLsForIntentNamesWithBundle(ValueAtIndex);
          v167 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v167 = 0;
        }
        if (objc_msgSend(v167, "count"))
          CFDictionarySetValue(v151, CFSTR("_LSIntentDefinitionURLs"), v167);

        objc_autoreleasePoolPop(v166);
        if (Identifier)
        {
          if (v151)
            break;
        }
        if (v151)
          goto LABEL_280;
LABEL_281:
        if (CFArrayGetCount(v131) <= ++v146)
          goto LABEL_282;
      }
      CFDictionaryAddValue((CFMutableDictionaryRef)v170, Identifier, v151);
LABEL_280:
      CFRelease(v151);
      goto LABEL_281;
    }
  }
LABEL_236:

  return theDict;
}

void sub_1829AF3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *a21,_Unwind_Exception *exception_object,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  const void *v34;
  const void *v35;

  CFRelease(v35);
  CFRelease(v34);

  _Unwind_Resume(a1);
}

uint64_t ___ZL34_LSCreateRegistrationDataForBundleP9LSContextP18LSRegistrationInfoPK7__CFURLPK14__CFDictionaryPPK9__CFArray_block_invoke(uint64_t a1, const void *a2, const void *a3)
{
  const void *Value;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const void *v12;
  int v13;
  const void *v14;
  __int16 v15;
  const void *v16;
  __int16 v17;
  const void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 32), a2))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
    if (CFEqual(a3, Value))
      return 1;
    _LSRegistrationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
      v13 = 138543874;
      v14 = a2;
      v15 = 2114;
      v16 = a3;
      v17 = 2114;
      v18 = v12;
      v9 = "REGISTRATION CACHE ERROR: Difference, %{public}@   %{public}@ vs (wrong) %{public}@";
      v10 = v8;
      v11 = 32;
      goto LABEL_8;
    }
  }
  else
  {
    _LSRegistrationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = a2;
      v15 = 2114;
      v16 = a3;
      v9 = "REGISTRATION CACHE ERROR: Missing, %{public}@   %{public}@";
      v10 = v8;
      v11 = 22;
LABEL_8:
      _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
    }
  }

  return 0;
}

void sub_1829AF874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSAddBundleLibraryInfo(LSContext *a1, const __CFURL *a2, _LSBundleProvider *a3, LSRegistrationInfo *a4, __CFDictionary *a5, int a6, const __CFArray **a7)
{
  _LSBundleProvider *v13;
  LSRegistrationInfo *v14;
  const void *v15;
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef v18;
  const void *v19;
  const __CFURL *v20;
  const __CFURL *v21;
  CFStringRef v22;
  uint64_t i;
  const __CFArray *v24;
  __int128 v25;
  uint64_t v26;
  CFTypeRef cf[2];
  CFTypeRef v28[2];
  id v29;
  id v30;

  v13 = a3;
  v14 = a4;
  if ((v14->options & 0x10000000) != 0)
  {
    v30 = 0;
    if (FSNodeCreateWithURL((uint64_t)a2, 1, &v30))
    {
LABEL_31:

      goto LABEL_32;
    }
    if (a6)
    {
      v15 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _LSGetDirectoryClassForNode(v30));
      CFDictionaryAddValue(a5, CFSTR("_LSDirectoryClass"), v15);
    }
    v29 = 0;
    *(_OWORD *)cf = 0u;
    *(_OWORD *)v28 = 0u;
    v16 = CFRetain(a2);
    if (v16)
      cf[0] = v16;
    v17 = CFRetain(a5);
    v18 = v28[0];
    if (v28[0] != v17)
    {
      v28[0] = v17;
      v17 = v18;
    }
    if (v17)
      CFRelease(v17);
    objc_storeStrong(&v29, a4);
    if (v13)
    {
      v19 = *(const void **)-[_LSBundleProvider provider](v13, "provider");
      if (v19)
      {
        v20 = (const __CFURL *)CFRetain(v19);
        v21 = v20;
        if (v20)
        {
          v22 = XCFURLCopyRelativeFileSystemPath(v20, a2, kCFURLPOSIXPathStyle);
          if (!v22)
          {
            CFRelease(v21);
            if (a7)
            {
LABEL_22:
              v24 = (const __CFArray *)v28[1];
              if (v28[1])
                v24 = (const __CFArray *)CFRetain(v28[1]);
              *a7 = v24;
            }
LABEL_25:

            if (v28[1])
              CFRelease(v28[1]);
            v28[1] = 0;
            if (v28[0])
              CFRelease(v28[0]);
            v28[0] = 0;
            if (cf[0])
              CFRelease(cf[0]);
            goto LABEL_31;
          }
          CFDictionarySetValue(a5, CFSTR("_LSBundleLibraryPath"), v22);
          CFRelease(v22);
          CFRelease(v21);
        }
      }
    }
    if ((v14->options & 0x10000000) != 0)
    {
      v25 = xmmword_1829FABE0;
      v26 = 1;
      cf[1] = &v25;
      _LSHoistLibraryItems((uint64_t)a1, cf);
    }
    else
    {
      for (i = 0; i != 60; i += 6)
      {
        cf[1] = &kLibrarySubfolders[i];
        _LSHoistLibraryItems((uint64_t)a1, cf);
      }
    }
    if (a7)
      goto LABEL_22;
    goto LABEL_25;
  }
LABEL_32:

}

void sub_1829AFAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  const void *v20;
  const void *v21;

  CFRelease(v20);
  CFRelease(v21);
  _LSHoistingState::~_LSHoistingState(&a13);

  _Unwind_Resume(a1);
}

BOOL LSUseLegacyLocalizationList(const __CFDictionary *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64x2_t v12[2];
  uint64x2_t v13;
  uint64x2_t v14;
  _OWORD v15[2];
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_opt_class();
  -[__CFDictionary objectForKey:](a1, "objectForKey:", CFSTR("LSExecutablePlatformKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  v6 = objc_msgSend(v4, "unsignedIntegerValue");

  v7 = objc_opt_class();
  -[__CFDictionary objectForKey:](a1, "objectForKey:", CFSTR("LSExecutableSDKVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      return 0;
    }
  }
  else if (!v8)
  {
    return 0;
  }
  v13 = 0u;
  v14 = 0u;
  _LSVersionNumberMakeWithString(&v13, v9);
  v16[0] = v13;
  v16[1] = v14;
  memset(v15, 0, sizeof(v15));
  if (_LSVersionNumberCompare(v16, v15))
  {
    v12[0] = v13;
    v12[1] = v14;
    v10 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:](_LSStringLocalizer, "useLegacyLocalizationListForPlatform:sdkVersion:", v6, _LSMakeDYLDVersionFromVersionNumber(v12));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1829AFCC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _LSPathifyIconKey(_LSBundleProvider *a1, __CFDictionary *a2, const __CFString *a3, const __CFString *a4)
{
  const __CFString *Value;
  CFTypeID TypeID;
  __CFBundle *v8;
  __CFString *v9;
  int v10;
  __CFBundle *v11;
  const __CFString *v12;
  const __CFString *v13;
  CFStringRef v14;
  uint64_t ClassWithTypeID;
  const char *v16;
  const char *v17;
  __CFString *v18;
  _LSBundleProvider *v19;

  v19 = a1;
  if (a2 && a3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a2, a3);
    TypeID = CFStringGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      v8 = LSBundleProvider::copyIconResourceURL((LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"), Value, 0);
      v9 = (__CFString *)v8;
      v10 = gLogRegistrationErrors;
      if (v8 || !gLogRegistrationErrors)
      {
        if (v8)
        {
          v12 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
          if (v12)
          {
            v13 = CFURLCopyFileSystemPath(*(CFURLRef *)-[_LSBundleProvider provider](v19, "provider"), kCFURLPOSIXPathStyle);
            if (v13)
            {
              v14 = _LSCopyPathRelativeToBase(v12, v13);
              if (v14)
              {
                CFDictionarySetValue(a2, CFSTR("_LSIconPath"), v14);
                CFRelease(v14);
              }
              CFRelease(v13);
            }
            goto LABEL_26;
          }
LABEL_27:
          CFRelease(v9);
          goto LABEL_13;
        }
      }
      else
      {
        v11 = LSBundleProvider::CFBundleCopyResourceURL((LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"), Value, 0, 0);
        if (v11
          || (v11 = LSBundleProvider::CFBundleCopyResourceURL((LSBundleProvider *)-[_LSBundleProvider provider](v19, "provider"), Value, CFSTR("icns"), 0)) != 0)
        {
          CFRelease(v11);
        }
        else
        {
          v18 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("Can't find referenced icon resource \"%@\"."), Value);
          if (v18)
          {
            _LSRegistrationWarningPath((uint64_t)-[_LSBundleProvider bundlePath](v19, "bundlePath"), v18);
            CFRelease(v18);
          }
        }
        v10 = gLogRegistrationErrors;
      }
      if (v10)
      {
        CFGetTypeID(Value);
        ClassWithTypeID = _CFRuntimeGetClassWithTypeID();
        v16 = "<unknown>";
        if (ClassWithTypeID)
        {
          v17 = *(const char **)(ClassWithTypeID + 8);
          if (v17)
            v16 = v17;
        }
        v9 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("For plist key %@, value has class %s (should be CFString)."), a3, v16);
        if (v9)
        {
          v12 = CFURLCopyFileSystemPath(*(CFURLRef *)-[_LSBundleProvider provider](v19, "provider"), kCFURLPOSIXPathStyle);
          _LSRegistrationWarningPath((uint64_t)v12, v9);
          if (v12)
          {
LABEL_26:
            CFRelease(v12);
            goto LABEL_27;
          }
          goto LABEL_27;
        }
      }
    }
  }
  else
  {
    CFStringGetTypeID();
  }
LABEL_13:

}

void sub_1829AFF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void _LSPathifyIconKeysInPlistKey(_LSBundleProvider *a1, __CFDictionary *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  const __CFArray *Value;
  CFTypeID TypeID;
  CFTypeID v10;
  CFIndex Count;
  CFIndex i;
  __CFDictionary *ValueAtIndex;
  CFTypeID v14;
  const __CFString *v15;
  _LSBundleProvider *v16;

  v16 = a1;
  if (a2 && a3)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a2, a3);
    TypeID = CFArrayGetTypeID();
    if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
    {
      v10 = CFArrayGetTypeID();
      if (v10 == CFGetTypeID(Value))
      {
        Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          for (i = 0; i != Count; ++i)
          {
            ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, i);
            v14 = CFDictionaryGetTypeID();
            if (ValueAtIndex && (!v14 || CFGetTypeID(ValueAtIndex) == v14))
              _LSPathifyIconKey(v16, ValueAtIndex, a4, v15);
          }
        }
      }
    }
  }
  else
  {
    CFArrayGetTypeID();
  }

}

void sub_1829B00B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

CFStringRef _LSCopyPathRelativeToBase(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  CFRange v8;
  CFRange v9;

  Length = CFStringGetLength(a1);
  v5 = CFStringGetLength(a2);
  if (Length <= v5)
    return 0;
  v6 = v5;
  v8.location = 0;
  v8.length = v5;
  if (CFStringCompareWithOptions(a1, a2, v8, 0))
    return 0;
  if (CFStringGetCharacterAtIndex(a1, v6) == 47 && Length <= ++v6)
    return 0;
  v9.length = Length - v6;
  v9.location = v6;
  return CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v9);
}

uint64_t (*init_GSIsDocumentRevision(const __CFURL *a1))(const __CFURL *)
{
  void *v2;
  uint64_t (*result)(const __CFURL *);

  v2 = (void *)GenerationalStorageLibrary(void)::frameworkLibrary;
  if (!GenerationalStorageLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/GenerationalStorage.framework/GenerationalStorage", 2);
    GenerationalStorageLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  result = (uint64_t (*)(const __CFURL *))dlsym(v2, "_GSIsDocumentRevision");
  softLink_GSIsDocumentRevision = result;
  if (result)
    return (uint64_t (*)(const __CFURL *))result(a1);
  return result;
}

void _LSHoistLibraryItems(uint64_t a1, _QWORD *a2)
{
  const char *v4;
  size_t v5;
  const __CFURL *v6;
  const __CFURL *v7;
  CFTypeRef v8;
  _QWORD v9[6];

  v4 = *(const char **)(a2[1] + 8);
  if (!v4)
  {
    if (!*a2)
      return;
    v8 = CFRetain((CFTypeRef)*a2);
    if (!v8)
      return;
    goto LABEL_10;
  }
  v5 = strlen(v4);
  v6 = (const __CFURL *)MEMORY[0x186DAD534](*MEMORY[0x1E0C9AE00], v4, v5, 1, *a2);
  v7 = v6;
  if (v6)
  {
    v8 = CFURLResourceIsReachable(v6, 0) ? CFRetain(v7) : 0;
    CFRelease(v7);
    if (v8)
    {
LABEL_10:
      if (_LSGetBasicURLPropertyKeys(void)::once != -1)
        dispatch_once(&_LSGetBasicURLPropertyKeys(void)::once, &__block_literal_global_397);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke;
      v9[3] = &__block_descriptor_48_e59_v40__0____CFURLEnumerator__8____CFURL__16____CFError__24_32l;
      v9[4] = a1;
      v9[5] = a2;
      XCFURLEnumerate((uint64_t)v8, 0, _LSGetBasicURLPropertyKeys(void)::result, v9);
      CFRelease(v8);
    }
  }
}

void sub_1829B0334(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void _LSHoistingState::~_LSHoistingState(id *this)
{
  id v2;
  id v3;

  v2 = this[3];
  if (v2)
    CFRelease(v2);
  this[3] = 0;
  v3 = this[2];
  if (v3)
    CFRelease(v3);
  this[2] = 0;
  if (*this)
    CFRelease(*this);
  *this = 0;
}

void ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FSNode *v4;
  FSNode *v5;
  uint64_t v6;
  FSNode *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD v13[4];
  FSNode *v14;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    v4 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", a3, 0, 0);
    v5 = v4;
    if (v4)
    {
      v6 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_2;
      v13[3] = &unk_1E10451A8;
      v15 = *(_QWORD *)(a1 + 32);
      v7 = v4;
      v8 = *(_QWORD *)(a1 + 40);
      v14 = v7;
      v16 = v8;
      v9 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v13);
      if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") && !*(_QWORD *)(a1 + 32))
      {
        +[LSDBExecutionContext sharedServerInstance]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_3;
        v11[3] = &unk_1E1041740;
        v12 = v9;
        -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v11);

      }
      else
      {
        v9[2](v9);
      }

    }
  }
}

void sub_1829B04E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_2(uint64_t a1)
{
  _LSDServiceDomain *v2;
  LSContext *v3;
  const __CFURL **v4;
  id v5;
  const __CFURL *v6;
  const __CFURL *v7;
  CFStringRef v8;
  const __CFDictionary *v9;
  CFAllocatorRef *v10;
  void *Value;
  CFTypeID TypeID;
  CFTypeID v13;
  int v14;
  id v15;
  NSObject *v16;
  const __CFAllocator *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  CFURLRef v20;
  __CFArray *Mutable;
  __CFArray *v22;
  __CFArray *v23;
  __CFDictionary *InfoDictionaryRef;
  __CFDictionary *v25;
  id v26;
  id v27;
  void **v28;
  id v29;
  char v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = *(void ***)(a1 + 40);
  v29 = 0;
  v30 = 0;
  v31 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v28, v2, 0);

  if (v3
    && (!objc_msgSend(*(id *)(a1 + 32), "isDirectory")
     || _LSGetBundleClassForNode((uint64_t)v3, *(void **)(a1 + 32))
     || _LSNodeIsPackage(v3, *(void **)(a1 + 32), 0)))
  {
    v4 = *(const __CFURL ***)(a1 + 48);
    v5 = *(id *)(a1 + 32);
    v6 = *v4;
    objc_msgSend(v5, "URL");
    v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v8 = XCFURLCopyRelativeFileSystemPath(v6, v7, kCFURLPOSIXPathStyle);

    if (!v8)
    {
LABEL_41:

      goto LABEL_42;
    }
    v9 = v4[2];
    v10 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    if (v9)
    {
      Value = (void *)CFDictionaryGetValue(v9, CFSTR("_LSBundleLibraryItems"));
      TypeID = CFArrayGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        v13 = CFArrayGetTypeID();
        if (v13 == CFGetTypeID(Value))
          goto LABEL_14;
      }
    }
    else
    {
      CFArrayGetTypeID();
    }
    Value = CFArrayCreateMutable(*v10, 0, MEMORY[0x1E0C9B378]);
    CFDictionarySetValue(v4[2], CFSTR("_LSBundleLibraryItems"), Value);
    CFRelease(Value);
LABEL_14:
    CFArrayAppendValue((CFMutableArrayRef)Value, v8);
    v14 = _LSGetBundleClassForNode((uint64_t)v3, v5);
    if (!v14)
    {
      v15 = v5;
      if ((*((_BYTE *)v4[4] + 19) & 0x10) == 0
        || !objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal")
        || !objc_msgSend(v15, "isSymbolicLink"))
      {
        goto LABEL_22;
      }
      _LSRegistrationLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v15;
        _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_INFO, "Symlink %@ will be hoisted into Core Types.", buf, 0xCu);
      }

      objc_msgSend(v15, "resolvedNodeWithFlags:error:", 0, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
        v14 = _LSGetBundleClassForNode((uint64_t)v3, v15);
      else
LABEL_22:
        v14 = 0;

    }
    v17 = *v10;
    v18 = (const __CFURL *)MEMORY[0x186DAD558](v17, v8, 0, 1, *v4);
    v19 = v18;
    if (v18)
    {
      if (v14 == 2)
      {
        v20 = CFURLCopyAbsoluteURL(v18);
        if (v20)
        {
          Mutable = v4[3];
          if (!Mutable)
          {
            Mutable = CFArrayCreateMutable(v17, 0, MEMORY[0x1E0C9B378]);
            v22 = v4[3];
            v23 = Mutable;
            if (v22 != Mutable)
            {
              v4[3] = Mutable;
              v23 = v22;
            }
            if (v23)
            {
              CFRelease(v23);
              Mutable = v4[3];
            }
          }
          CFArrayAppendValue(Mutable, v20);
          CFRelease(v20);
        }
      }
      if (v14 && v14 == *((_DWORD *)v4[1] + 4))
      {
        LSBundleProvider::LSBundleProvider((LSBundleProvider *)buf, v19);
        if (LSBundleProvider::bundleRef((LSBundleProvider *)buf, 1, "checking for validity"))
        {
          InfoDictionaryRef = (__CFDictionary *)LSBundleProvider::GetInfoDictionaryRef((LSBundleProvider *)buf);
          v25 = copyDeepMutableDictionary(InfoDictionaryRef);
          if (v25)
          {
            _LSHoistDelegateDictionaries(v4[2], v25, CFSTR("UTExportedTypeDeclarations"), v8);
            _LSHoistDelegateDictionaries(v4[2], v25, CFSTR("UTImportedTypeDeclarations"), v8);
            _LSHoistDelegateDictionaries(v4[2], v25, (const __CFString *)*MEMORY[0x1E0C9AAD0], v8);
            _LSHoistDelegateDictionaries(v4[2], v25, (const __CFString *)*MEMORY[0x1E0C9AB38], v8);
            CFRelease(v25);
          }
        }
        LSBundleProvider::~LSBundleProvider((LSBundleProvider *)buf);
      }
      CFRelease(v19);
    }
    CFRelease(v8);
    goto LABEL_41;
  }
LABEL_42:
  if (v28 && v30)
    _LSContextDestroy(v28);
  v26 = v29;
  v28 = 0;
  v29 = 0;

  v30 = 0;
  v27 = v31;
  v31 = 0;

}

void sub_1829B0968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

uint64_t ___ZL20_LSHoistLibraryItemsP9LSContextP16_LSHoistingState_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

CFArrayRef ___ZL26_LSGetBasicURLPropertyKeysv_block_invoke()
{
  const void *v0;
  CFArrayRef result;
  const void *v2[4];

  v2[3] = *(const void **)MEMORY[0x1E0C80C00];
  v0 = (const void *)*MEMORY[0x1E0C9B4E0];
  v2[0] = *(const void **)MEMORY[0x1E0C9B5A0];
  v2[1] = v0;
  v2[2] = *(const void **)MEMORY[0x1E0C9B4D0];
  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, 3, MEMORY[0x1E0C9B378]);
  _LSGetBasicURLPropertyKeys(void)::result = (uint64_t)result;
  return result;
}

void _LSHoistDelegateDictionaries(__CFDictionary *a1, CFDictionaryRef theDict, const __CFString *key, const __CFString *a4)
{
  const void *Value;
  CFTypeID TypeID;
  CFTypeID v10;
  void *Mutable;
  CFTypeID v12;
  CFTypeID v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  CFTypeID v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex i;
  __CFDictionary *ValueAtIndex;
  CFTypeID v22;

  if (!theDict || !key)
  {
    CFArrayGetTypeID();
    return;
  }
  Value = CFDictionaryGetValue(theDict, key);
  TypeID = CFArrayGetTypeID();
  if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
  {
    v10 = CFGetTypeID(Value);
    if (v10 == CFArrayGetTypeID())
    {
      if (a1)
      {
        Mutable = (void *)CFDictionaryGetValue(a1, key);
        v12 = CFArrayGetTypeID();
        if (Mutable && (!v12 || CFGetTypeID(Mutable) == v12))
        {
          v13 = CFGetTypeID(Mutable);
          if (v13 != CFArrayGetTypeID())
            return;
LABEL_16:
          v14 = (const void *)*MEMORY[0x1E0C9AE78];
          if (*MEMORY[0x1E0C9AE78])
          {
            v15 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0C9AE78]);
            v16 = CFStringGetTypeID();
            if (!v15)
              goto LABEL_25;
            if (!v16 || CFGetTypeID(v15) == v16)
            {
              v17 = CFGetTypeID(v15);
              if (v17 != CFStringGetTypeID())
                v15 = 0;
              goto LABEL_25;
            }
          }
          else
          {
            CFStringGetTypeID();
          }
          v15 = 0;
LABEL_25:
          Count = CFArrayGetCount((CFArrayRef)Value);
          if (Count >= 1)
          {
            v19 = Count;
            for (i = 0; i != v19; ++i)
            {
              ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)Value, i);
              v22 = CFDictionaryGetTypeID();
              if (ValueAtIndex && (!v22 || CFGetTypeID(ValueAtIndex) == v22))
              {
                CFDictionarySetValue(ValueAtIndex, CFSTR("_LSBundleLibraryDelegate"), a4);
                if (v15)
                  CFDictionarySetValue(ValueAtIndex, v14, v15);
                CFArrayAppendValue((CFMutableArrayRef)Mutable, ValueAtIndex);
              }
            }
          }
          return;
        }
      }
      else
      {
        CFArrayGetTypeID();
      }
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      CFDictionarySetValue(a1, key, Mutable);
      CFRelease(Mutable);
      goto LABEL_16;
    }
  }
}

uint64_t (*initINSchemaURLsForIntentNamesWithBundle(__CFBundle *a1))(__CFBundle *)
{
  void *v2;
  uint64_t (*v3)(__CFBundle *);

  v2 = (void *)IntentsLibrary(void)::frameworkLibrary;
  if (!IntentsLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    IntentsLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  v3 = (uint64_t (*)(__CFBundle *))dlsym(v2, "INSchemaURLsForIntentNamesWithBundle");
  softLinkINSchemaURLsForIntentNamesWithBundle = v3;
  if (v3)
  {
    v3(a1);
    v3 = (uint64_t (*)(__CFBundle *))objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

{
  void *v2;
  uint64_t (*v3)(__CFBundle *);

  v2 = (void *)IntentsLibrary(void)::frameworkLibrary;
  if (!IntentsLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/Frameworks/Intents.framework/Intents", 2);
    IntentsLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  v3 = (uint64_t (*)(__CFBundle *))dlsym(v2, "INSchemaURLsForIntentNamesWithBundle");
  softLinkINSchemaURLsForIntentNamesWithBundle = v3;
  if (v3)
  {
    v3(a1);
    v3 = (uint64_t (*)(__CFBundle *))objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t (*initLNIsLinkEnabled(__CFBundle *a1))(__CFBundle *)
{
  void *v2;
  uint64_t (*result)(__CFBundle *);

  v2 = (void *)LinkServicesLibrary(void)::frameworkLibrary;
  if (!LinkServicesLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/LinkServices.framework/LinkServices", 2);
    LinkServicesLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  result = (uint64_t (*)(__CFBundle *))dlsym(v2, "LNIsLinkEnabled");
  softLinkLNIsLinkEnabled = result;
  if (result)
    return (uint64_t (*)(__CFBundle *))result(a1);
  return result;
}

CFTypeRef __Block_byref_object_copy__425(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = result;
  if (result)
    return CFRetain(result);
  return result;
}

void __Block_byref_object_dispose__426(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  *(_QWORD *)(a1 + 48) = 0;
}

void ___ZL31createInstallationDictForPluginPK10__CFString_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C9AE78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = v8;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(id *)(v6 + 48);
    if (v7 != v5)
    {
      *(_QWORD *)(v6 + 48) = v5;
      v5 = v7;
    }
    if (v5)
      CFRelease(v5);
  }

}

void sub_1829B0E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1829B0F20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _LSSchemaTransferCache(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___LSSchemaTransferCache_block_invoke;
  v2[3] = &__block_descriptor_40_e9_v16__0_v8l;
  v2[4] = a2;
  _LSSchemaCacheWrite(a1, v2);
}

void _LSSchemaClearAllCaches(uint64_t a1)
{
  _LSSchemaCacheWrite(a1, &__block_literal_global_1_0);
}

void std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
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

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear(_QWORD *result)
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

void std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::__move_assign(uint64_t a1, uint64_t *a2)
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

  std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::clear(a1);
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

void std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__move_assign(uint64_t a1, uint64_t *a2)
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

  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear((_QWORD *)a1);
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

void _LSSchemeApprovalFindWithCompletionHandler(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  int CanSuppressCustomSchemePrompt;
  void *v16;
  void *v17;
  BOOL v18;
  _BOOL4 v19;
  __CFString *v20;
  _LSDServiceDomain *v21;
  void **v22;
  int StringForCFString;
  LSHandlerPref *HandlerPref;
  int v25;
  int v26;
  BOOL v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  id v33;
  id v34;
  char v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  void **v42;
  id v43;
  char v44;
  id v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  if (!v11 || !v12)
  {
    if (!v12)
      goto LABEL_52;
    v46 = *MEMORY[0x1E0CB2938];
    v47 = CFSTR("invalid input parameters");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSSchemeApprovalFindWithCompletionHandler", 156, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v17);
    goto LABEL_8;
  }
  if (!v9)
  {
    v18 = 0;
    v16 = 0;
    v19 = v10 != 0;
    goto LABEL_10;
  }
  objc_msgSend(v9, "_xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CanSuppressCustomSchemePrompt = _LSXPCConnectionCanSuppressCustomSchemePrompt(v14, (uint64_t)v11);

  if (!CanSuppressCustomSchemePrompt)
  {
    objc_msgSend(v9, "_xpcConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)_LSCopyBundleIdentifierForXPCConnection(v28, 0);

    v18 = v16 != 0;
    v19 = v10 != 0;
    if (v10 && v16)
    {
      if ((objc_msgSend(v16, "isEqual:", v10) & 1) != 0)
        goto LABEL_50;
      v41 = v10;
      +[LSBundleProxy bundleProxyForIdentifier:](LSBundleProxy, "bundleProxyForIdentifier:", v16);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[LSBundleProxy bundleProxyForIdentifier:](LSBundleProxy, "bundleProxyForIdentifier:", v41);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = 0;
      if (v29 && v30)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v29, "teamID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v39 = 0;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v31, "teamID");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          v32 = 0;
          if (v39 && v37)
            v32 = objc_msgSend(v39, "isEqual:", v37);
        }
        else
        {
          v38 = 0;
          v32 = 0;
        }

      }
      if (v32)
        goto LABEL_50;
      v19 = 1;
      goto LABEL_11;
    }
LABEL_10:
    if (!v18)
    {
LABEL_12:
      if (v19 && _LSSchemeApprovalBundleIsAppleInternal((NSString *)v10))
        goto LABEL_50;
      v40 = (__CFString *)v10;
      v20 = (__CFString *)v11;
      v45 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      +[_LSDServiceDomain defaultServiceDomain]();
      v21 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v22 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v42, v21, 0);

      if (v22)
      {
        StringForCFString = _LSDatabaseGetStringForCFString(*v22, v20, 1);
        if (StringForCFString
          && (HandlerPref = (LSHandlerPref *)LSHandlerPref::GetHandlerPref(*v22, StringForCFString, 5, 0)) != 0)
        {
          v25 = LSHandlerPref::roleHandler(HandlerPref, 0xFFFFFFFF, 0);
          v26 = _LSDatabaseGetStringForCFString(*v22, v40, 0);
          if (v25)
            v27 = v25 == v26;
          else
            v27 = 0;
          LODWORD(v22) = v27;
        }
        else
        {
          LODWORD(v22) = 0;
        }
      }
      if (v42 && v44)
        _LSContextDestroy(v42);
      v33 = v43;
      v42 = 0;
      v43 = 0;

      v44 = 0;
      v34 = v45;
      v45 = 0;

      if ((_DWORD)v22)
      {
        v13[2](v13, 1, 0);
        goto LABEL_51;
      }
      v35 = !v19;
      if (!v9)
        v35 = 1;
      if ((v35 & 1) == 0)
      {
        _LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler(v9, v16, v40, v20, a4, v13);
        goto LABEL_51;
      }
      v48 = *MEMORY[0x1E0CB2938];
      v49[0] = CFSTR("invalid input parameters");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSSchemeApprovalFindWithCompletionHandler", 150, v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v36);

LABEL_8:
LABEL_51:

      goto LABEL_52;
    }
LABEL_11:
    if (_LSSchemeApprovalBundleIsAppleInternal((NSString *)v16))
    {
LABEL_50:
      v13[2](v13, 1, 0);
      goto LABEL_51;
    }
    goto LABEL_12;
  }
  v13[2](v13, 1, 0);
LABEL_52:

}

void sub_1829B1CF0(_Unwind_Exception *a1)
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

uint64_t _LSSchemeApprovalBundleIsAppleInternal(NSString *a1)
{
  NSString *v1;
  NSObject *p_super;
  id v3;
  LSApplicationRecord *v4;
  id v5;
  uint64_t v6;
  id v8;
  id v9;

  v1 = a1;
  v9 = 0;
  +[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v1, 0, &v9);
  p_super = objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (p_super)
    goto LABEL_4;
  v8 = v3;
  v4 = -[LSApplicationRecord initWithBundleIdentifierOfSystemPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifierOfSystemPlaceholder:error:", v1, &v8);
  v5 = v8;

  if (v4)
  {
    p_super = &v4->super.super.super;
    v3 = v5;
LABEL_4:
    v6 = -[NSObject isAppleInternal](p_super, "isAppleInternal");
    goto LABEL_5;
  }
  _LSDefaultLog();
  p_super = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    _LSSchemeApprovalBundleIsAppleInternal((uint64_t)v5, p_super);
  v6 = 0;
  v3 = v5;
LABEL_5:

  return v6;
}

void sub_1829B1EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  void *v6;
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, uint64_t, _QWORD);
  id v16;
  id v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  NSString *v57;
  _QWORD *v58;
  NSString *v59;
  id v60;
  id v61;
  void (**v62)(id, uint64_t, _QWORD);
  void *v63;
  void *v65;
  id v66;
  _QWORD v67[2];
  void (*v68)(uint64_t, int, void *);
  void *v69;
  __CFString *v70;
  id v71;
  void (**v72)(id, uint64_t, _QWORD);
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  id v77;
  _QWORD *v78;
  uint64_t v79;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = v11;
  v17 = v12;
  v66 = v14;
  if (v17)
  {
    v18 = v17;
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-->%@"), v18, v66);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(v16, "_xpcConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)_LSCopyBundleURLForXPCConnection(v20, 0);

  if (v21)
  {
    objc_msgSend(v21, "path");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_3;
  }
  v19 = 0;
LABEL_7:

  if (v19)
  {
    v65 = (void *)CFPreferencesCopyValue(v19, CFSTR("com.apple.launchservices.schemeapproval"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v65 && _NSIsNSString() && (objc_msgSend(v65, "isEqual:", v13) & 1) != 0)
    {
      v15[2](v15, 1, 0);
LABEL_48:

      goto LABEL_49;
    }
    v62 = v15;
    v63 = v16;
    _LSSchemeApprovalGetBouncebackHistory();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v22);
    v23 = objc_msgSend(v22, "count");
    v24 = v23 - 2;
    if (v23 < 2)
    {
      v30 = 0;
    }
    else
    {
      v60 = v13;
      objc_msgSend(v22, "objectAtIndexedSubscript:", v23 - 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "isEqual:", v6) & 1) != 0)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v28, "isEqual:", v29);

      }
      else
      {

        v30 = 0;
      }

      v13 = v60;
    }
    objc_sync_exit(v22);

    if (v30)
    {
      v15 = v62;
      v16 = v63;
      v62[2](v62, 1, 0);
      goto LABEL_48;
    }
    v15 = v62;
    v16 = v63;
    if ((a5 & 1) == 0)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -2026, (uint64_t)"_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler", 286, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v62)[2](v62, 0, v32);

      goto LABEL_48;
    }
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v68 = ___ZL59_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke;
    v69 = &unk_1E10452F0;
    v70 = v19;
    v71 = v13;
    v72 = v62;
    v56 = v63;
    v33 = (NSString *)v17;
    v59 = (NSString *)v71;
    v55 = v66;
    v57 = v33;
    v58 = v67;
    v61 = v13;
    if (!v17)
    {
      v36 = 0;
LABEL_32:
      applicationBundleNameForIdentifier(v59);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v36;
      v54 = v39;
      if (v39)
      {
        if (v36)
        {
          _LSSchemeApprovalGetLocalizedString(CFSTR("“%@” wants to open “%@”"), CFSTR("SCHEME_APPROVAL_PROMPT_TITLE"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v40, v36, v39);
        }
        else
        {
          _LSSchemeApprovalGetLocalizedString(CFSTR("Open in “%@”?"), CFSTR("SCHEME_APPROVAL_PROMPT_TITLE_NO_SOURCE"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v40, v39);
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (_LSSchemeApprovalDebugMode(void)::once != -1)
          dispatch_once(&_LSSchemeApprovalDebugMode(void)::once, &__block_literal_global_66);
        if (_LSSchemeApprovalDebugMode(void)::result)
        {
          v44 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v56, "description");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v57;
          if (!v17)
          {
            objc_msgSend(v56, "_xpcConnection");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)_LSCopyBundleURLForXPCConnection(v6, 0);
          }
          objc_msgSend(v44, "stringWithFormat:", CFSTR("[Internal Build Detected]\n\nSource XPC: %@\nSource: %@\nTarget: %@\nScheme: %@\nOptions: %llx"), v45, v46, v59, v55, a5);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {

          }
        }
        else
        {
          v47 = 0;
        }
        _LSSchemeApprovalGetLocalizedString(CFSTR("Open"), CFSTR("SCHEME_APPROVAL_OPEN_BUTTON"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _LSSchemeApprovalGetLocalizedString(CFSTR("Cancel"), CFSTR("SCHEME_APPROVAL_DO_NOT_OPEN_BUTTON"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = MEMORY[0x1E0C809B0];
        v73[1] = 3221225472;
        v73[2] = ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke;
        v73[3] = &unk_1E1045340;
        v41 = v43;
        v74 = v41;
        v50 = v47;
        v75 = v50;
        v51 = v48;
        v76 = v51;
        v77 = v49;
        v78 = v58;
        v79 = a5;
        v52 = v49;
        _LSAskForScreenUnlock(0, v73);

        v15 = v62;
        v16 = v63;
        v42 = v57;
        v36 = v53;
        v39 = v54;
      }
      else
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10813, (uint64_t)"_LSSchemeApprovalPromptWithCompletionHandler", 415, 0);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = v57;
        v68((uint64_t)v58, 0, v41);
      }

      v13 = v61;
      goto LABEL_48;
    }
    +[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v33, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "applicationType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", CFSTR("Hidden")))
      {

LABEL_29:
        v36 = 0;
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(v35, "appTags");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "containsObject:", CFSTR("hidden"));

      if ((v38 & 1) != 0)
        goto LABEL_29;
    }
    applicationBundleNameForIdentifier(v57);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4960, (uint64_t)"_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandler", 290, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v15)[2](v15, 0, v31);

LABEL_49:
}

void sub_1829B2668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,_Unwind_Exception *exception_object,void *a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  _Unwind_Resume(a1);
}

void _LSSchemeApprovalRememberForBouncebackCheck(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(v3, "_xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)_LSCopyBundleIdentifierForXPCConnection(v5, 0);

  }
  else
  {
    v6 = 0;
  }
  v7 = v4;
  _LSSchemeApprovalGetBouncebackHistory();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v9;
  v10 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v11);

  if (!v7)
  if (!v6)

  if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    objc_msgSend(v8, "removeObjectsInRange:", 0, objc_msgSend(v8, "count") - 2);
  objc_sync_exit(v8);

}

void sub_1829B2A84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!v3)

  objc_sync_exit(v5);
  _Unwind_Resume(a1);
}

id _LSSchemeApprovalGetBouncebackHistory(void)
{
  if (_LSSchemeApprovalGetBouncebackHistory(void)::once != -1)
    dispatch_once(&_LSSchemeApprovalGetBouncebackHistory(void)::once, &__block_literal_global_40);
  return (id)_LSSchemeApprovalGetBouncebackHistory(void)::result;
}

void ___ZL59_LSSchemeApprovalUsePreferenceOrPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    CFPreferencesSetValue(*(CFStringRef *)(a1 + 32), *(CFPropertyListRef *)(a1 + 40), CFSTR("com.apple.launchservices.schemeapproval"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_1829B2BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id applicationBundleNameForIdentifier(NSString *a1)
{
  NSString *v1;
  LSApplicationRecord *v2;
  void *v3;

  v1 = a1;
  v2 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v1, 1, 0);
  if (v2
    || (v2 = -[LSApplicationRecord initWithBundleIdentifierOfSystemPlaceholder:error:]([LSApplicationRecord alloc], "initWithBundleIdentifierOfSystemPlaceholder:error:", v1, 0)) != 0)
  {
    -[LSBundleRecord localizedName](v2, "localizedName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_1829B2C54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFString *_LSSchemeApprovalGetLocalizedString(NSString *a1, NSString *a2)
{
  NSString *v3;
  __CFString *v4;
  __CFBundle *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v3 = a1;
  v4 = a2;
  v5 = (__CFBundle *)_LSGetBundle();
  v6 = (__CFString *)CFBundleCopyLocalizedString(v5, v4, v4, CFSTR("SchemeApproval"));
  v7 = v6;
  if (!v6)
    v6 = (__CFString *)v3;
  v8 = v6;

  return v8;
}

void sub_1829B2CE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (a2)
  {
    MEMORY[0x186DAF208]();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke_2;
    v7[3] = &unk_1E1045318;
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v3 = (void *)MEMORY[0x186DAE9BC](v7);
    v4 = *(_QWORD *)(a1 + 72);
    _LSSchemeApprovalGetPromptQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((v4 & 2) != 0)
      dispatch_async(v5, v3);
    else
      dispatch_sync(v5, v3);

  }
}

uint64_t ___ZL44_LSSchemeApprovalPromptWithCompletionHandlerP15NSXPCConnectionP8NSStringS2_S2_mU13block_pointerFvbP7NSErrorE_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CFOptionFlags v7;

  v7 = 0;
  if (CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), *(CFStringRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), 0, &v7))
  {
    v2 = *(_QWORD *)(a1 + 64);
LABEL_4:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10826, (uint64_t)"_LSSchemeApprovalPromptWithCompletionHandler_block_invoke_2", 398, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    goto LABEL_5;
  }
  v2 = *(_QWORD *)(a1 + 64);
  if ((v7 & 3) != 0)
    goto LABEL_4;
  v3 = 0;
  v4 = 1;
LABEL_5:
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v3);
  if ((v4 & 1) == 0)

  return MEMORY[0x186DAF214](v5);
}

void sub_1829B2EC0(_Unwind_Exception *exception_object)
{
  void *v1;
  char v2;

  if ((v2 & 1) == 0)

  _Unwind_Resume(exception_object);
}

id _LSSchemeApprovalGetPromptQueue(void)
{
  if (_LSSchemeApprovalGetPromptQueue(void)::once != -1)
    dispatch_once(&_LSSchemeApprovalGetPromptQueue(void)::once, &__block_literal_global_38_0);
  return (id)_LSSchemeApprovalGetPromptQueue(void)::result;
}

void ___ZL26_LSSchemeApprovalDebugModev_block_invoke()
{
  CFPropertyListRef v0;
  void *v1;
  char v2;
  void *v3;

  v0 = CFPreferencesCopyValue(CFSTR("_DebugMode"), CFSTR("com.apple.launchservices.schemeapproval"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = (void *)v0;
  if (v0)
  {
    v3 = (void *)v0;
    v2 = objc_opt_respondsToSelector();
    v1 = v3;
    if ((v2 & 1) != 0)
    {
      _LSSchemeApprovalDebugMode(void)::result = objc_msgSend(v3, "BOOLValue");
      v1 = v3;
    }
  }

}

void sub_1829B2F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL31_LSSchemeApprovalGetPromptQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS scheme approval prompt queue", v2);
  v1 = (void *)_LSSchemeApprovalGetPromptQueue(void)::result;
  _LSSchemeApprovalGetPromptQueue(void)::result = (uint64_t)v0;

}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v1 = (void *)_LSSchemeApprovalGetBouncebackHistory(void)::result;
  _LSSchemeApprovalGetBouncebackHistory(void)::result = v0;

  v2 = atomic_load((unsigned __int8 *)&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken))
  {
    __cxa_atexit((void (*)(void *))LaunchServices::notifyd::NotifyToken::~NotifyToken, &_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken, &dword_182882000);
    __cxa_guard_release(&_ZGVZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  }
  dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::notifyd::NotifyToken::RegisterDispatch(CFSTR("com.apple.backboardd.backlight.changed"), v3, &__block_literal_global_44, &v6);
  LaunchServices::notifyd::NotifyToken::operator=((LaunchServices::notifyd::NotifyToken *)&_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken, (LaunchServices::notifyd::NotifyToken *)&v6);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v6);
  if (FrontBoardServicesLibrary(void)::frameworkLibrary
    || (FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2)) != 0)
  {
    v4 = objc_msgSend(objc_alloc((Class)getFBSDisplayLayoutMonitorClass()), "initWithDisplayType:handler:", 0, &__block_literal_global_46);
    v5 = (void *)_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E7monitor;
    _ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E7monitor = v4;

  }
}

void sub_1829B3130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  void *v11;

  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&a11);

  _Unwind_Resume(a1);
}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke_2()
{
  uint64_t State;
  char v1;
  BOOL v2;

  State = LaunchServices::notifyd::NotifyToken::getState((LaunchServices::notifyd::NotifyToken *)&_ZZZL37_LSSchemeApprovalGetBouncebackHistoryvEUb_E14backlightToken);
  if (v1)
    v2 = State == 0;
  else
    v2 = 0;
  if (v2)
    _LSSchemeApprovalClearBouncebackHistory();
}

void _LSSchemeApprovalClearBouncebackHistory(void)
{
  id obj;

  _LSSchemeApprovalGetBouncebackHistory();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  objc_msgSend(obj, "removeAllObjects");
  objc_sync_exit(obj);

}

void sub_1829B31CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);

  _Unwind_Resume(a1);
}

void ___ZL37_LSSchemeApprovalGetBouncebackHistoryv_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (SpringBoardServicesLibrary(void)::frameworkLibrary
    || (SpringBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2)) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v2, "elements", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v8, "isUIApplicationElement")
            && (unint64_t)(objc_msgSend(v8, "layoutRole") - 1) < 2)
          {
            objc_msgSend(v8, "bundleIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v9);

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }

  }
  _LSSchemeApprovalGetBouncebackHistory();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v11 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsObject:", v13))
    {

    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v3, "containsObject:", v14);

      if ((v15 & 1) == 0)
        _LSSchemeApprovalClearBouncebackHistory();
    }

  }
  objc_sync_exit(v10);

}

void sub_1829B340C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

Class initFBSDisplayLayoutMonitor(void)
{
  Class result;

  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  result = objc_getClass("FBSDisplayLayoutMonitor");
  classFBSDisplayLayoutMonitor = (uint64_t)result;
  getFBSDisplayLayoutMonitorClass = (uint64_t (*)(void))FBSDisplayLayoutMonitorFunction;
  return result;
}

id FBSDisplayLayoutMonitorFunction(void)
{
  return (id)classFBSDisplayLayoutMonitor;
}

void _LSAskForScreenUnlock(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _LSSpringBoardCall *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  _LSAssertRunningInServer((uint64_t)"void _LSAskForScreenUnlock(__strong dispatch_queue_t _Nullable, void (^__strong _Non"
                                    "null)(BOOL, NSError *__strong))");
  if (v3)
  {
    v5 = (void *)MEMORY[0x186DAE9BC](v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___LSAskForScreenUnlock_block_invoke;
    v11[3] = &unk_1E10453D0;
    v12 = v3;
    v13 = v5;
    v6 = v5;
    v7 = MEMORY[0x186DAE9BC](v11);

    v4 = (id)v7;
  }
  if (softLinkSBSGetScreenLockStatus(0))
  {
    v8 = objc_alloc_init(_LSSpringBoardCall);
    -[_LSSpringBoardCall setBundleIdentifier:](v8, "setBundleIdentifier:", CFSTR("com.apple.springboard"));
    v14[0] = getFBSOpenApplicationOptionKeyPromptUnlockDevice();
    v9 = MEMORY[0x1E0C9AAB0];
    v15[0] = MEMORY[0x1E0C9AAB0];
    v14[1] = getFBSOpenApplicationOptionKeyUnlockDevice();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LSSpringBoardCall setLaunchOptions:](v8, "setLaunchOptions:", v10);

    -[_LSSpringBoardCall setClientXPCConnection:](v8, "setClientXPCConnection:", 0);
    -[_LSSpringBoardCall setCallCompletionHandlerWhenFullyComplete:](v8, "setCallCompletionHandlerWhenFullyComplete:", 1);
    -[_LSSpringBoardCall callWithCompletionHandler:](v8, "callWithCompletionHandler:", v4);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void sub_1829B36D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t initSBSGetScreenLockStatus(unsigned __int8 *a1)
{
  void *v2;

  v2 = (void *)SpringBoardServicesLibrary(void)::frameworkLibrary;
  if (!SpringBoardServicesLibrary(void)::frameworkLibrary)
  {
    v2 = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", 2);
    SpringBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v2;
  }
  softLinkSBSGetScreenLockStatus = (uint64_t (*)(unsigned __int8 *))dlsym(v2, "SBSGetScreenLockStatus");
  return softLinkSBSGetScreenLockStatus(a1);
}

uint64_t initFBSOpenApplicationOptionKeyPromptUnlockDevice(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyPromptUnlockDevice");
  constantFBSOpenApplicationOptionKeyPromptUnlockDevice = result;
  getFBSOpenApplicationOptionKeyPromptUnlockDevice = FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyPromptUnlockDeviceFunction(void)
{
  return constantFBSOpenApplicationOptionKeyPromptUnlockDevice;
}

uint64_t initFBSOpenApplicationOptionKeyUnlockDevice(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)FrontBoardServicesLibrary(void)::frameworkLibrary;
  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "FBSOpenApplicationOptionKeyUnlockDevice");
  constantFBSOpenApplicationOptionKeyUnlockDevice = result;
  getFBSOpenApplicationOptionKeyUnlockDevice = FBSOpenApplicationOptionKeyUnlockDeviceFunction;
  return result;
}

uint64_t FBSOpenApplicationOptionKeyUnlockDeviceFunction(void)
{
  return constantFBSOpenApplicationOptionKeyUnlockDevice;
}

id _LSServer_GetIOQueue()
{
  if (_LSServer_GetIOQueue::once != -1)
    dispatch_once(&_LSServer_GetIOQueue::once, &__block_literal_global_67);
  return (id)_LSServer_GetIOQueue::result;
}

id _LSServer_GetAsyncWorkQueue()
{
  if (_LSServer_GetAsyncWorkQueue::once != -1)
    dispatch_once(&_LSServer_GetAsyncWorkQueue::once, &__block_literal_global_2);
  return (id)_LSServer_GetAsyncWorkQueue::result;
}

uint64_t _LSServer_SetDatabaseIsSeeded(int a1)
{
  uint64_t v2;
  void *v4;

  v4 = 0;
  _LSDatabaseSessionSetSeedingInProgress(a1 == 0);
  if (_LSContextInit(&v4))
  {
    v2 = 0;
  }
  else
  {
    if (v4 && -[_LSDatabase isSeeded]((uint64_t)v4) != a1)
    {
      -[_LSDatabase setSeeded:]((uint64_t)v4, a1 != 0);
      _LSDatabaseCommit((uint64_t)v4);
      v2 = 1;
    }
    else
    {
      v2 = 0;
    }
    _LSContextDestroy(&v4);
  }

  return v2;
}

void sub_1829B3ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _LSServer_RegisterItemInfo(void *a1, void *a2, void *a3, const __CFDictionary *a4, int *a5, uint64_t a6, _BYTE *a7, CFTypeRef *a8)
{
  _DWORD *v15;
  id v16;
  NSString *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSString *v28;
  void *v29;
  NSString *v30;
  void *v32;
  void *v33;
  uint64_t block;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  char v39;
  int v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v16 = a2;
  v41 = 0;
  v40 = 0;
  v39 = 0;
  _LSLogStepStart((uint64_t)v16, 0, 0, v17);
  _LSDatabaseSentinelIncrement();
  if (v15)
  {
    if (v15[2] == 7)
      goto LABEL_6;
    _LSDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      _LSServer_RegisterItemInfo_cold_1((uint64_t)v15, v18);

    if (v15[2] == 7)
    {
LABEL_6:
      v19 = _LSContextInit(&v41);
      if ((_DWORD)v19)
      {
        v27 = 0;
      }
      else
      {
        v19 = _LSServerItemInfoRegistration(&v41, v15, v16, a3, a4, (unsigned int *)&v40, a6, &v39, a7);
        if ((_DWORD)v19)
          goto LABEL_24;
        v20 = (void *)_LSServer_CopyLocalDatabase(0);
        v21 = v20 == v41;

        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "OSStatus _LSServer_RegisterItemInfo(const LSRegistrationInfo *__strong, NSData *__strong, CFDictionaryRef, CFDictionaryRef, CSStoreUnitID *, CSStoreUnitID *, Boolean *, CFStringRef *)");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("LSServerInterface.mm"), 110, CFSTR("server local database differed from context after registration?"));

        }
        _LSDatabaseCommit((uint64_t)v41);
        if (v15[3] != 203 || v40 == 0)
          goto LABEL_24;
        if (v39)
        {
          v23 = (void *)MEMORY[0x186DAE7A0]();
          _LSBundleGetRegistrationNotification(v41, v40, v15[4], (uint64_t)CFSTR("com.apple.LaunchServices.applicationRegistered"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            _LSServer_GetIOQueue();
            v25 = objc_claimAutoreleasedReturnValue();
            block = MEMORY[0x1E0C809B0];
            v35 = 3221225472;
            v36 = ___LSServer_RegisterItemInfo_block_invoke;
            v37 = &unk_1E10418C8;
            v38 = v24;
            dispatch_async(v25, &block);

          }
          objc_autoreleasePoolPop(v23);
        }
        else
        {
          _LSRegistrationLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v43 = v40;
            _os_log_impl(&dword_182882000, v26, OS_LOG_TYPE_DEFAULT, "Registration succeeded, but did not actually register anything new; returning existing bundle 0x%llx and n"
              "ot sending app-registered notification.",
              buf,
              0xCu);
          }

        }
        if (!a8 || !_LSBundleGet(v41, v40))
LABEL_24:
          v27 = 0;
        else
          v27 = (void *)_CSStringCopyCFString();
        _LSContextDestroy(&v41);
        if (a8 && v27)
          *a8 = CFRetain(v27);
        if (a5)
          *a5 = v40;
      }
    }
    else
    {
      v27 = 0;
      v19 = 4294956474;
    }
  }
  else
  {
    v27 = 0;
    v19 = 4294967246;
  }
  v28 = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _LSLogStepFinished((uint64_t)v29, (_DWORD)v19 == 0, v28, v30, v29, block, v35, v36, v37);

  _LSDatabaseSentinelDecrement();
  if (v28)
    CFRelease(v28);

  return v19;
}

void sub_1829B3EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1829B3FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _LSIfCanModifyDefaultHandler(void *a1, void *a2, _DWORD *a3, void *a4, void *a5)
{
  id v9;
  uint64_t (**v10)(_QWORD);
  id v11;
  void *v12;
  int v13;
  id v14;

  v9 = a4;
  v10 = a5;
  v14 = 0;
  LODWORD(a2) = _LSCanModifyDefaultHandler(a1, a2, v9, (uint64_t)&v14);
  v11 = v14;
  v12 = v11;
  if ((_DWORD)a2)
    v13 = v10[2](v10);
  else
    v13 = _LSGetOSStatusFromNSError(v11);
  *a3 = v13;

}

void sub_1829B40D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _LSCanModifyDefaultHandler(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  pid_t pid;
  NSObject *v12;
  pid_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  const __CFString *v19;
  _BYTE v20[32];
  _BYTE v21[24];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7 && !objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("file")))
  {
    if (!a4)
      goto LABEL_20;
    v22 = *MEMORY[0x1E0CB2938];
    v23[0] = CFSTR("inScheme");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSCanModifyDefaultHandler", 193, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    *(_QWORD *)a4 = v16;

    a4 = 0;
    goto LABEL_20;
  }
  if (_LSCheckXPCConnectionEntitlementForChangingDefaultHandler(v9, (uint64_t)v7, (uint64_t)v8))
  {
    _LSArmSaveTimer(3);
    a4 = 1;
    goto LABEL_20;
  }
  if (v7)
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      pid = xpc_connection_get_pid((xpc_connection_t)v9);
      _LSCanModifyDefaultHandler_cold_2((uint64_t)v7, (uint64_t)v21, pid);
    }

  }
  if (v8)
  {
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = xpc_connection_get_pid((xpc_connection_t)v9);
      _LSCanModifyDefaultHandler_cold_1((uint64_t)v8, (uint64_t)v20, v13);
    }

  }
  if (a4)
  {
    v18 = *MEMORY[0x1E0CB2938];
    v14 = CFSTR("com.apple.private.launchservices.changedefaulthandlers");
    if (!CFSTR("com.apple.private.launchservices.changedefaulthandlers"))
      v14 = CFSTR("unknown entitlement");
    v19 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"_LSCanModifyDefaultHandler", 205, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:

  return a4;
}

void sub_1829B4328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t _LSServer_SetContentTypeHandler(LSContext *a1, uint64_t a2, const __CFString *a3, __int128 *a4)
{
  NSString *v7;
  uint64_t v8;
  int v9;
  int StringForCFString;
  __int128 v11;
  int v13;
  LSContext v14;
  __int128 v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.db = 0;
  v13 = 0;
  v7 = (NSString *)_effectivePreferenceRolesMaskForMask(a2);
  v8 = _LSContextInit((id *)&v14.db);
  if (!(_DWORD)v8)
  {
    if (!a1)
      goto LABEL_9;
    if (!LaunchServices::BindingEvaluator::ContentTypeBindingAllowsOverride(&v14, a1, v7))
    {
      v8 = 4294967242;
      goto LABEL_7;
    }
    v9 = LSHandlerPref::CreateTagForContentType(v14.db, (const __CFString *)a1, &v13);
    if (!v9)
    {
      v8 = 4294967246;
      goto LABEL_7;
    }
    StringForCFString = _LSDatabaseCreateStringForCFString(v14.db, a3, 0);
    if (StringForCFString)
    {
      v11 = a4[1];
      v15[0] = *a4;
      v15[1] = v11;
      LSHandlerPref::SetRoleHandlerForTag(v14.db, v9, v13, v7, StringForCFString, v15);
      _LSDatabaseCommit((uint64_t)v14.db);
      v8 = 0;
    }
    else
    {
LABEL_9:
      v8 = 4294956479;
    }
LABEL_7:
    _CSStringRelease();
    _CSStringRelease();
    _LSContextDestroy((void **)&v14.db);
  }

  return v8;
}

void sub_1829B44F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _effectivePreferenceRolesMaskForMask(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v8 = *MEMORY[0x1E0C80C00];
  if ((_DWORD)a1 != -1 && (~(_DWORD)a1 & 0xE) == 0)
  {
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134218240;
      v5 = v1;
      v6 = 2048;
      v7 = 0xFFFFFFFFLL;
      _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "Upgrading requested roles mask for preference write from %lx to %lx", (uint8_t *)&v4, 0x16u);
    }

    return 0xFFFFFFFFLL;
  }
  return v1;
}

uint64_t _LSServer_RemoveContentTypeHandler(const __CFString *a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  int TagForContentType;
  int v7;
  void *v8;

  v8 = 0;
  v7 = 0;
  v3 = _effectivePreferenceRolesMaskForMask(a2);
  v4 = _LSContextInit(&v8);
  if (!(_DWORD)v4)
  {
    if (a1)
    {
      TagForContentType = LSHandlerPref::GetTagForContentType(v8, a1, &v7);
      if (TagForContentType)
      {
        LSHandlerPref::RemoveRoleHandlerForTag(v8, TagForContentType, v7, v3);
        _LSDatabaseCommit((uint64_t)v8);
        v4 = 0;
      }
      else
      {
        v4 = 4294967246;
      }
    }
    else
    {
      v4 = 4294956479;
    }
    _LSContextDestroy(&v8);
  }

  return v4;
}

void sub_1829B4690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _LSServer_SetSchemeHandler(const __CFString *a1, const __CFString *a2, __int128 *a3)
{
  uint64_t v6;
  int StringForCFString;
  int v8;
  __int128 v9;
  void *v11;
  __int128 v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v6 = _LSContextInit(&v11);
  if (!(_DWORD)v6)
  {
    StringForCFString = _LSDatabaseCreateStringForCFString(v11, a1, 1);
    if (StringForCFString && (v8 = _LSDatabaseCreateStringForCFString(v11, a2, 0)) != 0)
    {
      v9 = a3[1];
      v12[0] = *a3;
      v12[1] = v9;
      LSHandlerPref::SetRoleHandlerForTag(v11, StringForCFString, 5, 0xFFFFFFFF, v8, v12);
      _LSDatabaseCommit((uint64_t)v11);
      v6 = 0;
    }
    else
    {
      v6 = 4294956479;
    }
    _CSStringRelease();
    _CSStringRelease();
    _LSContextDestroy(&v11);
  }

  return v6;
}

void sub_1829B47C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _LSServer_RemoveSchemeHandler(const __CFString *a1)
{
  uint64_t v2;
  int StringForCFString;
  void *v5;

  v5 = 0;
  v2 = _LSContextInit(&v5);
  if (!(_DWORD)v2)
  {
    StringForCFString = _LSDatabaseGetStringForCFString(v5, a1, 1);
    if (StringForCFString)
    {
      LSHandlerPref::RemoveHandlersForTag(v5, StringForCFString, 5);
      _LSDatabaseCommit((uint64_t)v5);
      v2 = 0;
    }
    else
    {
      v2 = 4294956479;
    }
    _LSContextDestroy(&v5);
  }

  return v2;
}

void sub_1829B4868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

BOOL _LSServer_RemoveAllHandlers(_QWORD *a1)
{
  _LSDServiceDomain *v2;
  LSHandlerPref **v3;
  _LSDatabase *v4;
  _LSDServiceDomain *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void **v11;
  id v12;
  char v13;
  id v14;

  v14 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v3 = (LSHandlerPref **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v11, v2, 0);

  if (v3)
  {
    LSHandlerPref::RemoveAll(*v3, v4);
    _LSDatabaseCommit((uint64_t)*v3);
    _LSArmSaveTimer(3);
  }
  else if (a1)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v11, v5, 0);

    if (v6)
      v7 = 0;
    else
      v7 = objc_retainAutorelease(v14);
    *a1 = v7;
  }
  if (v11 && v13)
    _LSContextDestroy(v11);
  v8 = v12;
  v11 = 0;
  v12 = 0;

  v13 = 0;
  v9 = v14;
  v14 = 0;

  return v3 != 0;
}

void sub_1829B4990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void _LSLogStep(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v9 = a4;
  if (v9)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v9, a5);
  else
    v10 = 0;
  objc_msgSend((id)getAITransactionLogClass(), "logStep:byParty:phase:success:forBundleID:description:", 4, 5, a1, a2, v11, v10);

}

void sub_1829B4A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_9(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void OUTLINED_FUNCTION_1_7(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

void _LSServerCleanEphemeralMobileContainersForFirstBoot(uint64_t *a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke;
  v16 = &unk_1E10453F8;
  v18 = a1;
  v3 = v2;
  v17 = v3;
  _CSStoreEnumerateUnits();
  if (objc_msgSend(v3, "count"))
  {
    _LSDatabaseSentinelIncrement();
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          _LSContainerRemove(a1, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "unsignedIntegerValue", (_QWORD)v9));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v19, 16);
      }
      while (v6);
    }

    _LSArmSaveTimer(1);
    _LSDatabaseSentinelDecrement();
  }

}

uint64_t _LSServerMain(int a1, uint64_t a2)
{
  int v4;
  NSObject *v5;
  char v6;
  uint64_t v7;
  const char **v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  char *v47;
  const char *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  id v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int SyncInterrupted;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  sem_t *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  __CFNotificationCenter *DarwinNotifyCenter;
  void (*v89)();
  void *context;
  void *v92;
  void *v93;
  const char *v94;
  id v95;
  id v96;
  uint8_t v97[8];
  _BYTE v98[12];
  __int16 v99;
  void *v100;
  _BYTE buf[24];
  unint64_t v102;
  __int128 *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(MEMORY[0x1E0CB35C8], "_setFileNameLocalizationEnabled:", 0);
  if (setiopolicy_np(9, 0, 1) < 0)
  {
    v4 = *__error();
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _LSServerMain_cold_5(v4, v5);

  }
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "setServer:", 1);
  if (a1 < 2)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = a1 - 1;
    v8 = (const char **)(a2 + 8);
    do
    {
      v9 = *v8++;
      v6 |= strcasecmp(v9, "systemSessionDaemon") == 0;
      --v7;
    }
    while (v7);
  }
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "setLightweightSystemServer:", v6 & 1);
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = getprogname();
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "currentSchemaVersion");
    *(_WORD *)&buf[22] = 2048;
    v102 = _CFGetEUID();
    _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s starting with schema version %llu for effective user %llu", buf, 0x20u);
  }

  if (listenForSigterm_onceToken != -1)
    dispatch_once(&listenForSigterm_onceToken, &__block_literal_global_68);
  if (!_LSServerHasDoneFirstBootWork())
  {
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "migrating old preference files on first start after reboot...", buf, 2u);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.MobileCoreServices/com.apple.launchservices.secure.plist"), 0);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.MobileCoreServices/com.apple.LaunchServices.plist"), 0);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fileExistsAtPath:", v15);

    if (v16)
    {
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "securePreferencesFileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      moveItemAtURLToURL(v12, v17);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "fileExistsAtPath:", v19);

    if (v20)
    {
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preferencesFileURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      moveItemAtURLToURL(v13, v21);

    }
    if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInEducationMode") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preSydroFSecurePreferencesFileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "fileExistsAtPath:", v24);

      if (v25)
      {
        objc_msgSend((id)__LSDefaultsGetSharedInstance(), "preSydroFSecurePreferencesFileURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)__LSDefaultsGetSharedInstance(), "securePreferencesFileURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        moveItemAtURLToURL(v26, v27);

        objc_msgSend((id)__LSDefaultsGetSharedInstance(), "securePreferencesFileURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v104 = *MEMORY[0x1E0C99938];
        *(_QWORD *)buf = *MEMORY[0x1E0C99940];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v104, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v98 = 0;
        v30 = objc_msgSend(v28, "setResourceValues:error:", v29, v98);
        v31 = *(id *)v98;

        if ((v30 & 1) == 0)
        {
          _LSDefaultLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            _LSServerMain_cold_4((uint64_t)v31, v32);

        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/private/var/db/lsd/com.apple.lsdschemes.plist"), 0);
    objc_msgSend(v33, "removeItemAtURL:error:", v34, 0);

    _LSDefaultLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v97 = 0;
      _os_log_impl(&dword_182882000, v35, OS_LOG_TYPE_DEFAULT, "Done migrating old preference files.", v97, 2u);
    }

  }
  v36 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "systemContainerURL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "path");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "fileExistsAtPath:", v38);

  if ((v40 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v104 = *MEMORY[0x1E0CB2AA8];
    *(_QWORD *)buf = &unk_1E10757F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v104, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v38, 1, v42, 0);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "databaseContainerDirectoryURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v97 = 0;
  objc_msgSend(v93, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v43, v44, 0, v97);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = *(id *)v97;

  if (v95)
  {
    _LSDefaultLog();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      _LSServerMain_cold_3((uint64_t)v95, v45);
      v46 = v45;
    }
    goto LABEL_56;
  }
  v47 = getenv("LS_NAME_PREFIX");
  v48 = "com.apple.LaunchServices";
  if (v47)
    v48 = v47;
  v94 = v48;
  v49 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "databaseStoreFileURL");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "lastPathComponent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "systemContentDatabaseStoreFileURL");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "lastPathComponent");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setWithObjects:", v51, v53, 0);
  v95 = (id)objc_claimAutoreleasedReturnValue();

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v46 = v92;
  v54 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
  if (v54)
  {
    v55 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v105 != v55)
          objc_enumerationMutation(v46);
        v57 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        objc_msgSend(v57, "pathExtension");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v58, "isEqualToString:", CFSTR("csstore")))
          goto LABEL_53;
        objc_msgSend(v57, "lastPathComponent");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v95, "containsObject:", v59);

        if ((v60 & 1) != 0)
          continue;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SystemDataOnly-%s-"), v94);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-"), v94);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastPathComponent");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v62, "hasPrefix:", v58))
        {

LABEL_48:
          v96 = 0;
          objc_msgSend(v93, "removeItemAtURL:error:", v57, &v96);
          v65 = v96;
          if (v65)
          {
            v66 = v65;
            _LSDefaultLog();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v57, "path");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v98 = 138412546;
              *(_QWORD *)&v98[4] = v68;
              v99 = 2112;
              v100 = v66;
              _os_log_error_impl(&dword_182882000, v67, OS_LOG_TYPE_ERROR, "Error removing stale db file at path: %@ %@", v98, 0x16u);

            }
          }
          goto LABEL_52;
        }
        objc_msgSend(v57, "lastPathComponent");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "hasPrefix:", v61);

        if (v64)
          goto LABEL_48;
LABEL_52:

LABEL_53:
      }
      v54 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
    }
    while (v54);
  }
LABEL_56:

  v69 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "systemContainerURL");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  setBackupAttributesForURL(v70);

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) == 0)
  {
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "userContainerURL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    setBackupAttributesForURL(v71);

  }
  objc_autoreleasePoolPop(v69);
  objc_autoreleasePoolPop((void *)MEMORY[0x186DAE7A0]());
  v72 = (void *)MEMORY[0x186DAE7A0]();
  *(_QWORD *)&v104 = 0;
  *((_QWORD *)&v104 + 1) = &v104;
  *(_QWORD *)&v105 = 0x2020000000;
  BYTE8(v105) = 0;
  SyncInterrupted = _LSDatabaseGetSyncInterrupted();
  _LSDatabaseClearSyncInterrupted();
  if (SyncInterrupted)
  {
    _LSDefaultLog();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      _LSServerMain_cold_2(v74);

    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "dbRecoveryFileURL");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDatabaseDeleteRecoveryFile(v75);

  }
  +[LSDBExecutionContext sharedServerInstance]();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  _LSServer_SetDatabaseExecutionContext(v76);

  _LSServer_DatabaseExecutionContext();
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __seedDatabase_block_invoke;
  v102 = (unint64_t)&unk_1E10408D8;
  v103 = &v104;
  -[LSDBExecutionContext beginServerDBBootstrap:]((uint64_t)v77, buf);

  if (!*(_BYTE *)(*((_QWORD *)&v104 + 1) + 24) && (SyncInterrupted || _LSDatabaseSentinelGet()))
  {
    _LSServer_GetIOQueue();
    v78 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v78, &__block_literal_global_31);

  }
  _Block_object_dispose(&v104, 8);
  objc_autoreleasePoolPop(v72);
  if (!_LSServerHasDoneFirstBootWork())
  {
    _LSDefaultLog();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v79, OS_LOG_TYPE_DEFAULT, "Reboot detected, performing first boot work.", buf, 2u);
    }

    _LSServer_DatabaseExecutionContext();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext syncWrite:]((uint64_t)v80, &__block_literal_global_33_2);

    LSNoteFirstBootForRestrictions();
    _LSDefaultLog();
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182882000, v81, OS_LOG_TYPE_DEFAULT, "First boot work complete!", buf, 2u);
    }

    v82 = sem_open("com.apple.lsd.firstboot", 512, 256, 0);
    if (v82 == (sem_t *)-1)
    {
      _LSDefaultLog();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        _LSServerMain_cold_1(v83);

    }
    else
    {
      sem_close(v82);
    }
  }
  _LSServer_DatabaseExecutionContext();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext syncWrite:]((uint64_t)v84, &__block_literal_global_34);

  v85 = (void *)MEMORY[0x186DAE7A0]();
  _LSDServiceStartAllServices();
  +[LSDatabaseBlockingFetchServer sharedInstance](LSDatabaseBlockingFetchServer, "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "startRunningIfNecessary");

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer") & 1) == 0)
  {
    +[_LSInstallProgressService beginListening](_LSInstallProgressService, "beginListening");
    +[_LSInstallationService beginListening](_LSInstallationService, "beginListening");
    v87 = +[_LSPersonaDatabase sharedInstance]();
    if (ExtensionFoundationLibrary_frameworkLibrary
      || (ExtensionFoundationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/Frameworks/ExtensionFoundation.framework/ExtensionFoundation", 2)) != 0)
    {
      softLink_EXStartService();
    }
    _LSServer_BeginProvidingVisualizationArchives();
  }
  objc_autoreleasePoolPop(v85);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)languagePrefChanged, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  _LSAppsAnalyticsStartListening();
  objc_autoreleasePoolPop(context);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isLightweightSystemServer"))
    v89 = runLightweightServerMainRunLoop;
  else
    v89 = runServerMainRunLoop;
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)v89);
  v89();
  return 0;
}

void sub_1829B5B7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void runLightweightServerMainRunLoop()
{
  CFRunLoopRun();
}

void runServerMainRunLoop()
{
  CFRunLoopRun();
}

void __listenForSigterm_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  dispatch_source_t v3;
  void *v4;

  listenForSigterm_sigtermSet = 0x4000;
  if (sigprocmask(1, (const sigset_t *)&listenForSigterm_sigtermSet, 0))
  {
    _LSDefaultLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __listenForSigterm_block_invoke_cold_1();

  }
  v1 = dispatch_queue_create("com.apple.lsd.sigact", 0);
  v2 = (void *)listenForSigterm_handlerQueue;
  listenForSigterm_handlerQueue = (uint64_t)v1;

  v3 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, (dispatch_queue_t)listenForSigterm_handlerQueue);
  v4 = (void *)listenForSigterm_sigtermSource;
  listenForSigterm_sigtermSource = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)listenForSigterm_sigtermSource, &__block_literal_global_8_0);
  dispatch_resume((dispatch_object_t)listenForSigterm_sigtermSource);
}

void __listenForSigterm_block_invoke_7()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  pid_t v4;
  uint8_t v5[12];
  sigset_t v6;
  uint8_t buf[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Received SIGTERM.", buf, 2u);
  }

  _LSServer_NoteTerminationRequestForMISync();
  v6 = 0;
  if (sigpending(&v6))
  {
    _LSDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __listenForSigterm_block_invoke_7_cold_2();

  }
  if (sigprocmask(2, (const sigset_t *)&listenForSigterm_sigtermSet, 0))
  {
    _LSDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __listenForSigterm_block_invoke_7_cold_1();

  }
  if ((v6 & 0x4000) == 0)
  {
    _LSDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_DEFAULT, "SIGTERM was consumed. Taking it upon ourselves to deliver it.", v5, 2u);
    }

    v4 = getpid();
    kill(v4, 15);
  }
  dispatch_source_cancel((dispatch_source_t)listenForSigterm_sigtermSource);
}

BOOL _LSServerHasDoneFirstBootWork()
{
  sem_t *v0;
  sem_t *v1;

  v0 = sem_open("com.apple.lsd.firstboot", 0);
  v1 = v0;
  if (v0 != (sem_t *)-1)
    sem_close(v0);
  return v1 != (sem_t *)-1;
}

void moveItemAtURLToURL(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3 || !v4)
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v3;
      v26 = 2112;
      v27 = v5;
      v15 = "LaunchServices: failed trying to migrate file %@ to %@";
      v16 = v14;
      v17 = 22;
LABEL_10:
      _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
LABEL_11:
    v18 = 0;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (!v8)
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      v15 = "LaunchServices: No file to migrate at URL %@";
      v16 = v14;
      v17 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) != 0)
  {
    v12 = 0;
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v3, v5, &v23);
    v12 = v23;

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  v21 = objc_msgSend(v20, "removeItemAtURL:error:", v3, &v22);
  v18 = v22;

  if ((!v13 || (v21 & 1) == 0) && objc_msgSend(v18, "code") != 4)
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "LaunchServices: Migration move item step failed with error: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

}

void setBackupAttributesForURL(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = *MEMORY[0x1E0C999D8];
    v9 = 0;
    v4 = objc_msgSend(v1, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v3, &v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      _LSDefaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v5, "code");
        *(_DWORD *)buf = 138478339;
        v11 = v2;
        v12 = 2114;
        v13 = v7;
        v14 = 2048;
        v15 = v8;
        _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Error excluding %{private}@ from backup: %{public}@ %lli", buf, 0x20u);

      }
    }

  }
}

void __seedDatabase_block_invoke(uint64_t a1)
{
  LSDatabaseBuilder *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  LSDatabaseBuilder *v7;

  v2 = [LSDatabaseBuilder alloc];
  _LSServer_GetIOQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[LSDatabaseBuilder initWithIOQueue:](v2, "initWithIOQueue:", v3);

  -[LSDatabaseBuilder createAndSeedLocalDatabase:](v7, "createAndSeedLocalDatabase:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(unsigned __int8 *)(v4 + 24);
  v5 = v4 + 24;
  if (!v6)
    -[LSDatabaseBuilder seedCryptexContentIfNeeded:](v7, "seedCryptexContentIfNeeded:", v5);

}

void __seedDatabase_block_invoke_2()
{
  _LSServer_SyncWithMobileInstallation(0);
}

void __performFirstBootWorkIfNecessary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int inited;
  id v7;
  NSObject *v8;
  id v9;
  id v10;

  v4 = a2;
  v5 = a3;
  v9 = 0;
  v10 = 0;
  inited = _LSContextInitReturningError(&v10, &v9);
  v7 = v9;
  if (inited)
  {
    _LSServerCleanEphemeralMobileContainersForFirstBoot((uint64_t *)&v10);
  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __performFirstBootWorkIfNecessary_block_invoke_cold_1((uint64_t)v7, v8);

  }
}

void sub_1829B630C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t (*init_EXStartService())()
{
  void *v0;
  uint64_t (*result)();

  v0 = (void *)ExtensionFoundationLibrary_frameworkLibrary;
  if (!ExtensionFoundationLibrary_frameworkLibrary)
  {
    v0 = dlopen("/System/Library/Frameworks/ExtensionFoundation.framework/ExtensionFoundation", 2);
    ExtensionFoundationLibrary_frameworkLibrary = (uint64_t)v0;
  }
  result = (uint64_t (*)())dlsym(v0, "_EXStartService");
  softLink_EXStartService = result;
  if (result)
    return (uint64_t (*)())result();
  return result;
}

void languagePrefChanged()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  id v3;

  MEMORY[0x186DAF208]();
  _LSDatabaseGetSeedingGroup();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v0, 0xFFFFFFFFFFFFFFFFLL);

  _LSDatabaseGetInstallingGroup();
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v1, 0xFFFFFFFFFFFFFFFFLL);

  _LSDatabaseGetMobileInstallSyncupGroup();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  _LSServer_DatabaseExecutionContext();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LSDBExecutionContext syncWrite:]((uint64_t)v3, &__block_literal_global_43);

}

void __languagePrefChanged_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a2;
  v5 = a3;
  _LSSaveImmediately(1);
  MEMORY[0x186DAF214]();
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "LaunchServices: received languagePrefChanged notification, exiting.", v7, 2u);
  }

  exit(0);
}

void OUTLINED_FUNCTION_0_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

int *OUTLINED_FUNCTION_4_8()
{
  return __error();
}

void sub_1829B6664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_1829B6800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B68B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829B6990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B6A70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B6F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B7098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829B7104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829B73C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1829B7548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1829B76DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829B77F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1829B7964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B79FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

Class initFBSOpenApplicationOptions(void)
{
  Class result;

  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  result = objc_getClass("FBSOpenApplicationOptions");
  classFBSOpenApplicationOptions = (uint64_t)result;
  getFBSOpenApplicationOptionsClass = (uint64_t (*)(void))FBSOpenApplicationOptionsFunction;
  return result;
}

id FBSOpenApplicationOptionsFunction(void)
{
  return (id)classFBSOpenApplicationOptions;
}

Class initFBSProcessHandle(void)
{
  Class result;

  if (!FrontBoardServicesLibrary(void)::frameworkLibrary)
    FrontBoardServicesLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices", 2);
  result = objc_getClass("FBSProcessHandle");
  classFBSProcessHandle = (uint64_t)result;
  getFBSProcessHandleClass = (uint64_t (*)(void))FBSProcessHandleFunction;
  return result;
}

id FBSProcessHandleFunction(void)
{
  return (id)classFBSProcessHandle;
}

void __serviceQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("LS installation serial queue", v2);
  v1 = (void *)serviceQueue_queue;
  serviceQueue_queue = (uint64_t)v0;

}

void sub_1829B7ED8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829B7FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829B80FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829B81B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B8694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829B883C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829B8984(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829B8BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1829B8E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829B96B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1829B9984(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829B9A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829B9E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void _LSStringLocalizerPrewarmAllLocalizations(_LSStringLocalizer *a1)
{
  _LSStringLocalizer *v1;
  uint64_t stringsContent;
  void *v3;
  __CFBundle *v4;
  void **p_isa;

  v1 = a1;
  stringsContent = (uint64_t)v1->_stringsContent;
  p_isa = (void **)&v1->super.isa;
  -[_LSStringLocalizer bundleProvider](v1, "bundleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFBundle *)LSBundleProvider::bundleRef((LSBundleProvider *)objc_msgSend(v3, "provider"), 1, 0);
  -[_LSStringsFileContent prewarmAllLocalizationsWithBundle:forLocalizations:](stringsContent, v4, p_isa[3]);

}

void sub_1829B9FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829BA1D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BA404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1829BA85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;
  void *v34;

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1829BAB34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BAD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1829BAEE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829BAF34()
{
  JUMPOUT(0x1829BAF28);
}

void sub_1829BB0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1829BB230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BB2D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BB368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1829BB414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BB49C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BB6E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BB9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1829BBAF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829BBD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1829BBFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1829BC1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1829BC360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BC584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v32 = v30;

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1829BC77C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BC87C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829BCA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, CFTypeRef cf)
{
  void *v12;
  const void *v13;
  const void *v14;

  if (v14)
  {
    CFRelease(v14);
    if (!v13)
    {
LABEL_4:
      if (cf)
        CFRelease(cf);

      _Unwind_Resume(a1);
    }
  }
  else if (!v13)
  {
    goto LABEL_4;
  }
  CFRelease(v13);
  goto LABEL_4;
}

void sub_1829BCBCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void ___ZL18_LSSetCrashMessageP8NSString_block_invoke_1(uint64_t a1)
{
  id v1;
  void *v2;
  char *v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  void *v8;

  v1 = *(id *)(a1 + 32);
  v2 = v1;
  if (v1)
  {
    v3 = strdup((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    _LSDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      ___ZL18_LSSetCrashMessageP8NSString_block_invoke_cold_1((uint64_t)v3, v4);

  }
  else
  {
    v3 = 0;
  }
  v5 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
  while (1)
  {
    v6 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr);
    if (v6 != v5)
      break;
    if (!__stxr((unint64_t)v3, (unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr))
    {
      v7 = 1;
      goto LABEL_11;
    }
  }
  v7 = 0;
  __clrex();
LABEL_11:
  if (v7)
    v8 = (void *)v5;
  else
    v8 = v3;
  free(v8);
  qword_1ECD29C28 = _LSSetCrashReporterMessage(NSString *)::messagePtr;

}

void sub_1829BCD08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL15_LSLoggingQueuev_block_invoke_1()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.launchservices.logging", v2);
  v1 = (void *)_LSLoggingQueue(void)::logQueue;
  _LSLoggingQueue(void)::logQueue = (uint64_t)v0;

}

void ___ZL20_LSClearCrashMessagev_block_invoke()
{
  uint64_t v0;
  unint64_t v1;
  int v2;
  void *v3;

  v0 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
  while (1)
  {
    v1 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr);
    if (v1 != v0)
      break;
    if (!__stxr(0, (unint64_t *)&_LSSetCrashReporterMessage(NSString *)::messagePtr))
    {
      v2 = 1;
      goto LABEL_6;
    }
  }
  v2 = 0;
  __clrex();
LABEL_6:
  if (v2)
    v3 = (void *)v0;
  else
    v3 = 0;
  free(v3);
  qword_1ECD29C28 = _LSSetCrashReporterMessage(NSString *)::messagePtr;
}

void LSBundleProvider::LSBundleProvider(LSBundleProvider *this, CFTypeRef cf)
{
  uint64_t Unique;
  const void *v5;
  const void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)this = cf;
    *((_QWORD *)this + 1) = 0;
    *((_DWORD *)this + 5) = 0;
    *((_BYTE *)this + 16) = 1;
    Unique = _CFBundleCreateUnique();
    v5 = (const void *)*((_QWORD *)this + 1);
    v6 = (const void *)Unique;
    if (v5 != (const void *)Unique)
    {
      *((_QWORD *)this + 1) = Unique;
      v6 = v5;
    }
    if (v6)
    {
      CFRelease(v6);
      Unique = *((_QWORD *)this + 1);
    }
    if (!Unique)
    {
      _LSRegistrationLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)this;
        v9 = 138477827;
        v10 = v8;
        _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_ERROR, "Unable to create bundleRef for %{private}@", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  else
  {
    *((_DWORD *)this + 5) = 0;
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
    *((_BYTE *)this + 16) = 0;
  }
}

{
  LSBundleProvider::LSBundleProvider(this, cf);
}

void sub_1829BCEE8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void LSBundleProvider::LSBundleProvider(LSBundleProvider *this, void *cf)
{
  const void *v4;
  CFTypeRef v5;
  CFURLRef v6;
  const __CFURL *v7;

  *((_DWORD *)this + 5) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)*((_QWORD *)this + 1);
    v5 = cf;
    if (v4 == cf || (*((_QWORD *)this + 1) = cf, (v5 = v4) != 0))
      CFRelease(v5);
    v6 = CFBundleCopyBundleURL((CFBundleRef)cf);
    v7 = *(const __CFURL **)this;
    if (*(CFURLRef *)this != v6)
    {
      *(_QWORD *)this = v6;
      v6 = v7;
    }
    if (v6)
      CFRelease(v6);
  }
}

void sub_1829BCFA4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(v1 + 8) = 0;
  if (*(_QWORD *)v1)
    CFRelease(*(CFTypeRef *)v1);
  *(_QWORD *)v1 = 0;
  _Unwind_Resume(exception_object);
}

void LSBundleProvider::~LSBundleProvider(LSBundleProvider *this)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 1);
  if (v2)
    CFRelease(v2);
  *((_QWORD *)this + 1) = 0;
  if (*(_QWORD *)this)
    CFRelease(*(CFTypeRef *)this);
  *(_QWORD *)this = 0;
}

uint64_t LSBundleProvider::bundleRef(LSBundleProvider *this, BOOL a2, const char *a3)
{
  return *((_QWORD *)this + 1);
}

__CFBundle *LSBundleProvider::bundleIdentifier(LSBundleProvider *this)
{
  __CFBundle *Identifier;

  Identifier = (__CFBundle *)*((_QWORD *)this + 1);
  if (Identifier)
    Identifier = (__CFBundle *)CFBundleGetIdentifier(Identifier);
  return Identifier;
}

__CFBundle *LSBundleProvider::infoDictionary(LSBundleProvider *this)
{
  __CFBundle *InfoDictionary;

  InfoDictionary = (__CFBundle *)*((_QWORD *)this + 1);
  if (InfoDictionary)
    InfoDictionary = CFBundleGetInfoDictionary(InfoDictionary);
  return InfoDictionary;
}

__CFBundle *LSBundleProvider::CFBundleCopyExecutableURL(LSBundleProvider *this)
{
  __CFBundle *result;

  result = (__CFBundle *)*((_QWORD *)this + 1);
  if (result)
    return CFBundleCopyExecutableURL(result);
  return result;
}

__CFBundle *LSBundleProvider::CFBundleCopyResourceURL(LSBundleProvider *this, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  __CFBundle *result;

  result = (__CFBundle *)*((_QWORD *)this + 1);
  if (result)
    return CFBundleCopyResourceURL(result, a2, a3, a4);
  return result;
}

CFStringRef LSBundleProvider::CFBundleCopyDevelopmentRegion(LSBundleProvider *this)
{
  __CFBundle *v1;
  CFStringRef DevelopmentRegion;
  CFStringRef v3;

  v1 = (__CFBundle *)*((_QWORD *)this + 1);
  if (!v1)
    return 0;
  DevelopmentRegion = CFBundleGetDevelopmentRegion(v1);
  v3 = DevelopmentRegion;
  if (DevelopmentRegion)
    CFRetain(DevelopmentRegion);
  return v3;
}

__CFBundle *LSBundleProvider::CFBundleCopyBundleLocalizations(LSBundleProvider *this)
{
  __CFBundle *result;

  result = (__CFBundle *)*((_QWORD *)this + 1);
  if (result)
    return CFBundleCopyBundleLocalizations(result);
  return result;
}

__CFBundle *LSBundleProvider::copyIconResourceURL(LSBundleProvider *this, const __CFString *a2, const __CFString *a3)
{
  __CFBundle *result;

  result = (__CFBundle *)*((_QWORD *)this + 1);
  if (result)
  {
    result = CFBundleCopyResourceURLForLocalization(result, a2, a3, 0, 0);
    if (!((unint64_t)a3 | (unint64_t)result))
      return CFBundleCopyResourceURLForLocalization(*((CFBundleRef *)this + 1), a2, CFSTR("icns"), 0, 0);
  }
  return result;
}

__CFBundle *LSBundleProvider::intentURLPaths(LSBundleProvider *this)
{
  __CFBundle *v1;

  v1 = (__CFBundle *)*((_QWORD *)this + 1);
  if (v1)
  {
    if (softLinkINSchemaURLsForIntentNamesWithBundle)
    {
      softLinkINSchemaURLsForIntentNamesWithBundle(v1);
      v1 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }
  }
  return v1;
}

__CFBundle *LSBundleProvider::XCFBundleCopyFolderURL(LSBundleProvider *this, const __CFString *a2)
{
  __CFBundle *result;

  result = (__CFBundle *)*((_QWORD *)this + 1);
  if (result)
    return XCFBundleCopyFolderURL(result, a2);
  return result;
}

void sub_1829BD28C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x186DADEF4](v2, 0x1060C40D21511CDLL);

  _Unwind_Resume(a1);
}

void sub_1829BD354(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x186DADEF4](v4, 0x1060C40D21511CDLL);

  _Unwind_Resume(a1);
}

void sub_1829BD3F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BD57C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829BD708(_Unwind_Exception *a1)
{
  void *v1;
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;

  os_unfair_lock_unlock(v2);
  _Unwind_Resume(a1);
}

void sub_1829BD94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  os_unfair_lock_s *v18;
  void *v19;

  os_unfair_lock_unlock(v18);
  _Unwind_Resume(a1);
}

uint64_t std::optional<NSError * {__strong}>::operator=[abi:nn180100]<NSError * {__strong}&,void>(uint64_t a1, id *a2)
{
  int v3;
  id v4;
  void *v5;

  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = *a2;
  if (v3)
  {
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;

  }
  else
  {
    *(_QWORD *)a1 = v4;
    *(_BYTE *)(a1 + 8) = 1;
  }
  return a1;
}

void sub_1829BDB24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829BDD54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829BE224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,uint64_t a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31)
{
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  _Unwind_Resume(a1);
}

void sub_1829BE974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)(v6 - 160));
  _Unwind_Resume(a1);
}

void sub_1829BEC08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id registrationCleanupQueue(void)
{
  if (registrationCleanupQueue(void)::onceToken != -1)
    dispatch_once(&registrationCleanupQueue(void)::onceToken, &__block_literal_global_72);
  return (id)registrationCleanupQueue(void)::queue;
}

void sub_1829BEE24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829BF028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  void *v34;
  void *v35;
  uint64_t v36;

  _Block_object_dispose(&a23, 8);

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v36 - 128), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__118(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x186DAE9BC](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__119(uint64_t a1)
{

}

void sub_1829BF3B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829BF568(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BF6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829BF7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1829BF80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829BF874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BF8D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BF9CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BFA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829BFB04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1829BFB78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_1829BFC14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829BFD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1829BFEDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1829C007C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C0204(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829C0320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void ___ZL24registrationCleanupQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.lsd.registration.postprocessing", v2);
  v1 = (void *)registrationCleanupQueue(void)::queue;
  registrationCleanupQueue(void)::queue = (uint64_t)v0;

}

BOOL _LSIsSWCAvailable()
{
  void *v0;

  v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  return v0 != 0;
}

uint64_t _LSSWCServiceTypeActivityContinuation()
{
  return get_SWCServiceTypeActivityContinuation();
}

uint64_t _LSSWCServiceTypeAppLinks()
{
  return get_SWCServiceTypeAppLinks();
}

uint64_t _LSSWCErrorDomain()
{
  return get_SWCErrorDomain();
}

uint64_t _LSSWCServiceDetailsClass()
{
  return get_SWCServiceDetailsClass();
}

uint64_t _LSSWCServiceSettingsClass()
{
  return get_SWCServiceSettingsClass();
}

uint64_t _LSSWCServiceSpecifierClass()
{
  return get_SWCServiceSpecifierClass();
}

uint64_t init_SWCServiceTypeActivityContinuation(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "_SWCServiceTypeActivityContinuation");
  constant_SWCServiceTypeActivityContinuation = result;
  get_SWCServiceTypeActivityContinuation = _SWCServiceTypeActivityContinuationFunction;
  return result;
}

uint64_t _SWCServiceTypeActivityContinuationFunction(void)
{
  return constant_SWCServiceTypeActivityContinuation;
}

uint64_t init_SWCServiceTypeAppLinks(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "_SWCServiceTypeAppLinks");
  constant_SWCServiceTypeAppLinks = result;
  get_SWCServiceTypeAppLinks = _SWCServiceTypeAppLinksFunction;
  return result;
}

uint64_t _SWCServiceTypeAppLinksFunction(void)
{
  return constant_SWCServiceTypeAppLinks;
}

uint64_t init_SWCErrorDomain(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharedWebCredentialsLibrary(void)::frameworkLibrary;
  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "_SWCErrorDomain");
  constant_SWCErrorDomain = result;
  get_SWCErrorDomain = _SWCErrorDomainFunction;
  return result;
}

uint64_t _SWCErrorDomainFunction(void)
{
  return constant_SWCErrorDomain;
}

Class init_SWCServiceDetails(void)
{
  Class result;

  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
  result = objc_getClass("_SWCServiceDetails");
  class_SWCServiceDetails = (uint64_t)result;
  get_SWCServiceDetailsClass = (uint64_t (*)(void))_SWCServiceDetailsFunction;
  return result;
}

id _SWCServiceDetailsFunction(void)
{
  return (id)class_SWCServiceDetails;
}

Class init_SWCServiceSettings(void)
{
  Class result;

  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
  result = objc_getClass("_SWCServiceSettings");
  class_SWCServiceSettings = (uint64_t)result;
  get_SWCServiceSettingsClass = (uint64_t (*)(void))_SWCServiceSettingsFunction;
  return result;
}

id _SWCServiceSettingsFunction(void)
{
  return (id)class_SWCServiceSettings;
}

Class init_SWCServiceSpecifier(void)
{
  Class result;

  if (!SharedWebCredentialsLibrary(void)::frameworkLibrary)
    SharedWebCredentialsLibrary(void)::frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/SharedWebCredentials", 2);
  result = objc_getClass("_SWCServiceSpecifier");
  class_SWCServiceSpecifier = (uint64_t)result;
  get_SWCServiceSpecifierClass = (uint64_t (*)(void))_SWCServiceSpecifierFunction;
  return result;
}

id _SWCServiceSpecifierFunction(void)
{
  return (id)class_SWCServiceSpecifier;
}

void sub_1829C0980(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C09E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C0AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

id _LSServer_GetiCloudHostNames()
{
  LaunchServices::URLOverrides *v0;
  NSObject *v1;
  NSURL *v2;
  void *v3;
  LaunchServices::URLOverrides *v4;
  NSObject *v5;
  NSURL *v6;
  LaunchServices::URLOverrides *v7;
  NSObject *v8;

  v0 = (LaunchServices::URLOverrides *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Caches/CloudKit/com.apple.cloudkit.launchservices.hostnames.plist"), 0);
  LaunchServices::URLOverrides::getLog(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    _LSServer_GetiCloudHostNames_cold_2();

  LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(v0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (LaunchServices::URLOverrides *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", CFSTR("/System/Library/CoreServices/com.apple.cloudkit.launchservices.hostnames.plist"), 0);
    LaunchServices::URLOverrides::getLog(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      _LSServer_GetiCloudHostNames_cold_2();

    LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(v4, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      LaunchServices::URLOverrides::getLog(v7);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        _LSServer_GetiCloudHostNames_cold_1();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1075A10);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v3;
}

void sub_1829C0D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(LaunchServices::URLOverrides *this, NSURL *a2)
{
  LaunchServices::URLOverrides *v2;
  void *v3;
  LaunchServices::URLOverrides *v4;
  LaunchServices::URLOverrides *v5;
  uint64_t v6;
  LaunchServices::URLOverrides *v7;
  LaunchServices::URLOverrides *v8;
  NSObject *v9;
  void *v10;
  id v12;

  v2 = this;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v2, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (LaunchServices::URLOverrides *)v12;
  v5 = v4;
  if (!v3)
  {
    LaunchServices::URLOverrides::getLog(v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL((uint64_t)v2);
    goto LABEL_12;
  }
  v6 = objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("host-names"));
  v7 = (LaunchServices::URLOverrides *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 && v7)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_10;
    }
  }
  else if (!v7)
  {
LABEL_10:
    LaunchServices::URLOverrides::getLog(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL();
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  -[LaunchServices::URLOverrides valueForKey:](v8, "valueForKey:", CFSTR("lowercaseString"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v10;
}

void sub_1829C0E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829C10A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1829C1188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

BOOL LaunchServices::URLOverrides::State::pathHasCaseInsensitivePrefix(id *this, NSString *a2)
{
  NSString *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(*this, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "rangeOfString:options:", v3, 9) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 0;

  return v6;
}

void sub_1829C120C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829C1388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1829C1484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C152C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1829C15C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1829C165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1829C16E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1829C1774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_1829C17FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

LaunchServices::URLOverrides::State *LaunchServices::URLOverrides::State::State(LaunchServices::URLOverrides::State *this, NSURL *a2, char a3)
{
  NSURL *v5;
  NSURLComponents *v6;
  id obj;
  int v9;
  __int16 v10;

  v5 = a2;
  *(_QWORD *)this = 0;
  *(_QWORD *)((char *)this + 6) = 0;
  v6 = (NSURLComponents *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 1);
  if (!v6)
    v6 = (NSURLComponents *)objc_alloc_init(MEMORY[0x1E0CB3998]);
  LaunchServices::URLOverrides::State::State((LaunchServices::URLOverrides::State *)&obj, v6, a3);
  objc_storeStrong((id *)this, obj);
  *((_DWORD *)this + 2) = v9;
  *((_WORD *)this + 6) = v10;

  return this;
}

void sub_1829C18D4(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLOverrides::State::isNooverride(id *this)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(*this, "fragment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "hasSuffix:", CFSTR(":nooverride"));
  else
    v3 = 0;

  return v3;
}

void sub_1829C194C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C1A80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829C1B64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C21C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25,void *a26)
{
  void *v26;

  _Unwind_Resume(a1);
}

void sub_1829C27C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829C2A7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829C2BE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829C2DE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829C2EF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke(uint64_t a1, void *a2)
{
  LaunchServices::URLOverrides *v3;
  NSObject *v4;

  v3 = a2;
  LaunchServices::URLOverrides::getLog(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_cold_1(a1);

}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180(uint64_t a1, void *a2, void *a3)
{
  id v6;
  LaunchServices::URLOverrides *v7;
  LaunchServices::URLOverrides *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a2;
  v7 = a3;
  v8 = v7;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    LaunchServices::URLOverrides::getLog(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_2(a1);
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_1(a1, v10, v11, v12, v13, v14, v15, v16);
    }

  }
}

void ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  _LSDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke_cold_1();

  v4 = objc_msgSend(v2, "copy");
  v5 = (void *)LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts;
  LaunchServices::URLOverrides::checkForiCloudHost(NSURLComponents *)::cachedICloudHosts = v4;

}

void sub_1829C3080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _LSReplaceURLPropertyValueForEncoding(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (LaunchServices::URLPropertyProvider::getUTTypeClass((LaunchServices::URLPropertyProvider *)v1)
    && (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v1, "_shouldURLPropertyProviderEncodeTypeRecord"))
  {
    objc_msgSend(v1, "_typeRecord");
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  return v1;
}

void sub_1829C3108(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

LaunchServices::URLPropertyProvider *_LSReplaceURLPropertyValueForDecoding(void *a1)
{
  LaunchServices::URLPropertyProvider *v1;
  id UTTypeClass;
  void *v3;
  uint64_t v4;

  v1 = a1;
  UTTypeClass = LaunchServices::URLPropertyProvider::getUTTypeClass(v1);
  if (UTTypeClass)
  {
    v3 = UTTypeClass;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "_typeForURLPropertyProviderWithTypeRecord:", v1);
      v4 = objc_claimAutoreleasedReturnValue();

      v1 = (LaunchServices::URLPropertyProvider *)v4;
    }
  }
  return v1;
}

void sub_1829C3180(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C31FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1829C3280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1829C3358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::setIsPackageValue(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const __CFBoolean *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  __int16 v11;
  _BYTE v12[8];
  __int16 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a5 || !objc_msgSend(a2, "isDirectory"))
    return 1;
  result = objc_msgSend(a2, "getFinderInfo:error:", v12, a7);
  if ((_DWORD)result)
  {
    v11 = _LSGetBooleanFromCFType(a5) != 0;
    v13 = v13 & 0xDFFF | (v11 << 13);
    return objc_msgSend(a2, "setFinderInfo:error:", v12, a7);
  }
  return result;
}

uint64_t LaunchServices::URLPropertyProvider::prepareAppFlagsMimic(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForBundleLookup(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareDNCMimic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[_LSDisplayNameConstructor prepareMimicWithPopulator:error:](_LSDisplayNameConstructor, "prepareMimicWithPopulator:error:", a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "canIssueIO") & 1) != 0)
  {
    v20 = 0;
    v21 = 0;
    if (objc_msgSend(a2, "getResourceValue:forKey:options:error:", &v21, *MEMORY[0x1E0C99A90], 1, a6)
      && objc_msgSend(a2, "getResourceValue:forKey:options:error:", &v20, *MEMORY[0x1E0C99A70], 1, a6))
    {
      if (objc_msgSend(v21, "isEqual:", v20))
        v9 = 0;
      else
        v9 = v20;
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9AC20], v9);
      a6 = 1;
    }
    else
    {
      a6 = 0;
    }

  }
  else
  {
    _LSDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue(v10, v11, v12, v13, v14, v15, v16, v17);

    if (a6)
    {
      v22 = *MEMORY[0x1E0CB2938];
      v23[0] = CFSTR("can't provide with mimic");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"prepareDistinctLocalizedNameValue", 788, v18);
      *(_QWORD *)a6 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
  }
  return a6;
}

void sub_1829C35E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedNameComponentsValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;
  id v16;
  char v17;

  LaunchServices::URLPropertyProvider::getDisplayNameConstructor(a1, a2, a5, (uint64_t)a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v17 = 0;
      v15 = 0;
      v16 = 0;
      objc_msgSend(v8, "getUnlocalizedBaseName:extension:requiresAdditionalBiDiControlCharacters:", &v16, &v15, &v17);
      v10 = v16;
      v11 = v15;
      if (v10)
        objc_msgSend(v9, "addObject:", v10);
      if (v11)
        objc_msgSend(v9, "addObject:", v11);

      v12 = (void *)objc_msgSend(v9, "copy");
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9AD00], v12);

      v13 = 1;
    }
    else if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"prepareLocalizedNameComponentsValue", 907, 0);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_1829C3768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareTypeMimic(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return LaunchServices::TypeEvaluator::PrepareMimicForTypeEvaluation(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  _LSDServiceDomain *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[22];

  v18[21] = *MEMORY[0x1E0C80C00];
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0);

  if (v11)
  {
    LaunchServices::BindingEvaluator::CreateWithNode(a2, (LaunchServices::BindingEvaluator *)v18);
    LaunchServices::BindingEvaluator::getLocalizedKindString((const LaunchServices::BindingEvaluator *)v18, v11, 0, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9B588], v12);
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v18);
  }
  else if (a6)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v14, 0);

    if (v15)
      v16 = 0;
    else
      v16 = objc_retainAutorelease(a1[3]);
    v13 = 0;
    *a6 = v16;
  }
  else
  {
    return 0;
  }
  return v13;
}

void sub_1829C38FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareBindingMimic(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return LaunchServices::BindingEvaluator::PrepareMimicForBinding(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _LSDServiceDomain *v23;
  uint64_t v24;
  id v25;
  _BYTE v27[168];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "canIssueIO") & 1) == 0)
  {
    _LSDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue(v14, v15, v16, v17, v18, v19, v20, v21);

    if (a6)
    {
      v28 = *MEMORY[0x1E0CB2938];
      v29[0] = CFSTR("can't provide with mimic");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"prepareLocalizedTypeDescriptionDictionaryValue", 1239, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = (void **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0);

  if (v11)
  {
    LaunchServices::BindingEvaluator::CreateWithNode(a2, (LaunchServices::BindingEvaluator *)v27);
    LaunchServices::BindingEvaluator::getLocalizedKindStringDictionary((const LaunchServices::BindingEvaluator *)v27, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9AD18], v12);
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v27);
    return v13;
  }
  if (!a6)
    return 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v23 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v24 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v23, 0);

  if (v24)
    v25 = 0;
  else
    v25 = objc_retainAutorelease(a1[3]);
  v13 = 0;
  *a6 = v25;
  return v13;
}

void sub_1829C3B38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareBundleIdentifierValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v10;
  LSContext *v11;
  int v12;
  void *v13;
  _LSDServiceDomain *v14;
  uint64_t v15;
  id v16;
  uint64_t result;
  id v18;
  LSBundleData *v19;
  unsigned int v20;

  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0);

  if (v11)
  {
    v20 = 0;
    v19 = 0;
    v12 = _LSFindOrFindOrRegisterBundleNode(v11, a2, 0, 0x2000000u, 0, &v20, &v19);
    if (v12 == -10811)
    {
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABF0], 0);
      return 1;
    }
    if (!v12)
    {
      v13 = (void *)_CSStringCopyCFString();
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABF0], v13);

      return 1;
    }
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v12, (uint64_t)"prepareBundleIdentifierValue", 1558, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      v16 = v18;
      goto LABEL_15;
    }
    return 0;
  }
  if (!a6)
    return 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v14, 0);

  if (!v15)
  {
    v18 = objc_retainAutorelease(a1[3]);
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:
  result = 0;
  *a6 = v16;
  return result;
}

void sub_1829C3D24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareMimicForBundleLookup(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _LSPrepareMimicForBundleLookup(a1, a5);
}

uint64_t LaunchServices::URLPropertyProvider::prepareHFSTypeCodeValue(LaunchServices::Database::Context *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v10;
  uint64_t v11;
  CFNumberRef v12;
  CFNumberRef v13;
  uint64_t result;
  id v15;
  uint64_t valuePtr;

  valuePtr = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = LaunchServices::Database::Context::_get(a1, v10, 0);

  if (v11
    && (_LSGetNodeTypeCreatorInfo(v11, a2, 0, (_DWORD *)&valuePtr + 1, &valuePtr),
        (v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, (char *)&valuePtr + 4)) != 0))
  {
    v13 = v12;
    MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9AC78], v12);
    CFRelease(v13);
    return 1;
  }
  else
  {
    MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9AC78], 0);
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -41, (uint64_t)"prepareHFSTypeCodeValue", 1586, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a6 = v15;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_1829C3E84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareArchitecturesValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  int v10;
  _LSDServiceDomain *v11;
  LSContext *v12;
  int v13;
  void *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  uint64_t v17;
  const __CFArray *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _LSDServiceDomain *v30;
  uint64_t v31;
  id v32;
  int v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "canIssueIO") & 1) != 0)
  {
    v34 = 0;
    v10 = objc_msgSend(a2, "getResourceValue:forKey:options:error:", &v34, *MEMORY[0x1E0C999C0], 3, 0);
    if (!v34)
      v10 = 0;
    if (v10 == 1 && objc_msgSend(v34, "BOOLValue"))
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v11, 0);

      if (!v12)
      {
        if (a6)
        {
          +[_LSDServiceDomain defaultServiceDomain]();
          v30 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
          v31 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v30, 0);

          if (v31)
            v32 = 0;
          else
            v32 = objc_retainAutorelease(a1[3]);
          goto LABEL_31;
        }
LABEL_27:
        v28 = 0;
        goto LABEL_19;
      }
      v33 = 0;
      v13 = _LSFindOrRegisterBundleNode(v12, a2, 0, 0x2000000u, 0, (unsigned int *)&v33, 0);
      if (v13 != -10811)
      {
        if (!v13)
        {
          v14 = (void *)_LSBundleCopyArchitecturesAvailable(v12->db, v33);
          v15 = _LSBundleCopyArchitecturesValidOnCurrentSystem(v12->db, v33);
          v16 = v15;
          v17 = *MEMORY[0x1E0C9ABB8];
          if (v14 && v15)
          {
            MEMORY[0x186DAD930](a3, v17, v14);
            v18 = v16;
          }
          else
          {
            v18 = (const __CFArray *)MEMORY[0x1E0C9AA60];
            MEMORY[0x186DAD930](a3, v17, MEMORY[0x1E0C9AA60]);
          }
          MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABE0], v18);

          goto LABEL_18;
        }
        if (a6)
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v13, (uint64_t)"prepareArchitecturesValue", 2030, 0);
          v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
          v28 = 0;
          *a6 = v32;
          goto LABEL_19;
        }
        goto LABEL_27;
      }
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABB8], 0);
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABE0], 0);
    }
    else
    {
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABB8], 0);
      MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABE0], 0);
    }
LABEL_18:
    v28 = 1;
LABEL_19:

    return v28;
  }
  _LSDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    LaunchServices::URLPropertyProvider::prepareArchitecturesValue(v19, v20, v21, v22, v23, v24, v25, v26);

  if (a6)
  {
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = CFSTR("can't provide with mimic");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"prepareArchitecturesValue", 1982, v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

void sub_1829C41D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsHiddenBySystemValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  unsigned __int8 v11;
  uint64_t result;
  _LSDServiceDomain *v13;
  LSContext *v14;
  int v15;
  int bundleFlags_high;
  uint64_t *v17;
  uint64_t v18;
  _BOOL4 v19;
  _LSDServiceDomain *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  LSBundleData *v32;

  if ((v11 & 1) == 0
  {
    __cxa_atexit((void (*)(void *))LaunchServices::notifyd::NotifyToken::~NotifyToken, &LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::preferenceDistributedNotificationToken, &dword_182882000);
  }
  if (LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::onceToken != -1)
    dispatch_once(&LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::onceToken, &__block_literal_global_37);
  if (objc_msgSend(0, "BOOLValue"))
  {
    MEMORY[0x186DAD930](a3, a4, *MEMORY[0x1E0C9AE50]);
    return 1;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v13 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v14 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v13, 0);

  if (v14)
  {
    v32 = 0;
    v31 = 0;
    v15 = _LSFindOrFindOrRegisterBundleNode(v14, a2, 0, 0x2000000u, 0, &v31, &v32);
    if (v15 == -10811)
    {
      MEMORY[0x186DAD930](a3, a4, 0);
      return 1;
    }
    if (!v15)
    {
      bundleFlags_high = HIDWORD(v32->_bundleFlags);
      v17 = (uint64_t *)MEMORY[0x1E0C9AE50];
      if ((bundleFlags_high & 0x2000000) != 0)
      {
        +[LSEligibilityPredicateEvaluator sharedCachingEligibilityPredicateEvaluator](LSEligibilityPredicateEvaluator, "sharedCachingEligibilityPredicateEvaluator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "evaluateBundle:bundleData:database:error:", v31, v32, v14->db, a6);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v25 != 0;
        if (v25)
        {
          v26 = objc_msgSend(v25, "BOOLValue");
          v27 = (uint64_t *)MEMORY[0x1E0C9AE40];
          if (!v26)
            v27 = v17;
          v18 = *v27;
        }
        else
        {
          v18 = 0;
        }

        bundleFlags_high = HIDWORD(v32->_bundleFlags);
      }
      else
      {
        v18 = 0;
        v19 = 1;
      }
      if ((bundleFlags_high & 0x4000000) != 0 && v19 && (v28 = *v17, v18 != *v17))
      {
        +[LSFeatureFlagPredicateEvaluator defaultEvaluator](LSFeatureFlagPredicateEvaluator, "defaultEvaluator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "evaluateBundle:bundleData:database:error:", v31, v32, v14->db, a6);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (objc_msgSend(v30, "BOOLValue"))
            v18 = *MEMORY[0x1E0C9AE40];
          else
            v18 = v28;

          goto LABEL_37;
        }
      }
      else if (v19)
      {
LABEL_37:
        MEMORY[0x186DAD930](a3, a4, v18);
        return 1;
      }
      return 0;
    }
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v15, (uint64_t)"prepareIsHiddenBySystemValue", 2281, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  else if (a6)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v20 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v21 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v20, 0);

    if (v21)
    {
      v22 = 0;
LABEL_24:
      result = 0;
      *a6 = v22;
      return result;
    }
    v23 = objc_retainAutorelease(a1[3]);
LABEL_23:
    v22 = v23;
    goto LABEL_24;
  }
  return 0;
}

void sub_1829C4548(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareIsHiddenBySystemNotificationsValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v11;
  LSContext *v12;
  int v13;
  void *v14;
  _LSDServiceDomain *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t result;
  unsigned int v20;
  LSBundleData *v21;

  +[_LSDServiceDomain defaultServiceDomain]();
  v11 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v12 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v11, 0);

  if (v12)
  {
    v21 = 0;
    v20 = 0;
    v13 = _LSFindOrFindOrRegisterBundleNode(v12, a2, 0, 0x2000000u, 0, &v20, &v21);
    if (v13 == -10811)
    {
      MEMORY[0x186DAD930](a3, a4, 0);
      return 1;
    }
    if (!v13)
    {
      if ((v21->_bundleFlags & 0x200000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", CFSTR("kLSHiddenAppsEligibilityChangedNotification"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C9AA60];
      }
      MEMORY[0x186DAD930](a3, CFSTR("_NSURLIsHiddenBySystemChangedNotificationsKey"), v14);

      return 1;
    }
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v13, (uint64_t)"prepareIsHiddenBySystemNotificationsValue", 2319, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v17 = v18;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a6)
    return 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v15 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v16 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v15, 0);

  if (!v16)
  {
    v18 = objc_retainAutorelease(a1[3]);
    goto LABEL_17;
  }
  v17 = 0;
LABEL_18:
  result = 0;
  *a6 = v17;
  return result;
}

void sub_1829C474C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue(id *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _LSDServiceDomain *v10;
  LSContext *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _LSDServiceDomain *v25;
  uint64_t v26;
  id v27;
  LSBundleData *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "canIssueIO") & 1) == 0)
  {
    _LSDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue(v16, v17, v18, v19, v20, v21, v22, v23);

    if (a6)
    {
      v30 = *MEMORY[0x1E0CB2938];
      v31[0] = CFSTR("can't provide with mimic");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"prepareApplicationDeviceManagementPolicyValue", 2335, v24);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v11 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v10, 0);

  if (!v11)
  {
    if (a6)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v25 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v26 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)a1, v25, 0);

      if (v26)
        v27 = 0;
      else
        v27 = objc_retainAutorelease(a1[3]);
      goto LABEL_19;
    }
    return 0;
  }
  v29 = 0;
  v12 = _LSFindOrFindOrRegisterBundleNode(v11, a2, 0, 0x2000000u, 0, 0, &v29);
  if (v12 == -10811)
  {
    MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABC0], 0);
    return 1;
  }
  if (v12)
  {
    if (a6)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v12, (uint64_t)"prepareApplicationDeviceManagementPolicyValue", 2361, 0);
      v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
      v15 = 0;
      *a6 = v27;
      return v15;
    }
    return 0;
  }
  v13 = (void *)_CSStringCopyCFString();
  _LSGetDMFPolicyNoCache(v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    MEMORY[0x186DAD930](a3, *MEMORY[0x1E0C9ABC0], v14);
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1829C4A00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n128 std::__optional_storage_base<LaunchServices::TypeEvaluator::Result,false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<LaunchServices::TypeEvaluator::Result,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  __n128 result;
  uint64_t v7;

  if (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32))
  {
    if (*(_BYTE *)(a1 + 32))
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      v4 = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a2 + 16) = 0;
      v5 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v4;

      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    }
  }
  else if (*(_BYTE *)(a1 + 32))
  {

    *(_BYTE *)(a1 + 32) = 0;
  }
  else
  {
    result = *(__n128 *)a2;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    *(_BYTE *)(a1 + 32) = 1;
  }
  return result;
}

void ___ZN14LaunchServices19URLPropertyProviderL43beginTranslatingHiddenBySystemNotificationsEv_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  LaunchServices::EligibilityCache *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint8_t buf[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Starting listening to hidden-by-system notifications", buf, 2u);
  }

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("com.apple.launchservices.hiddenPreferenceNotification", v1);
  v3 = (void *)LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::hiddenPreferenceNotificationQueue;
  LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::hiddenPreferenceNotificationQueue = (uint64_t)v2;

  LaunchServices::notifyd::NotifyToken::RegisterDispatch(CFSTR("com.apple.launchservices.setsystemhidden"), (void *)LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::hiddenPreferenceNotificationQueue, &__block_literal_global_42_0, &v8);
  LaunchServices::notifyd::NotifyToken::operator=((LaunchServices::notifyd::NotifyToken *)&LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::preferenceDistributedNotificationToken, (LaunchServices::notifyd::NotifyToken *)&v8);
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&v8);
  v5 = LaunchServices::EligibilityCache::shared(v4);
  LaunchServices::EligibilityCache::addEligibilityChangedListener(v5, &__block_literal_global_46_0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::eligibilityChangeListenerToken;
  LaunchServices::URLPropertyProvider::beginTranslatingHiddenBySystemNotifications(void)::eligibilityChangeListenerToken = v6;

}

void sub_1829C4BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&a11);
  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices19URLPropertyProviderL43beginTranslatingHiddenBySystemNotificationsEv_block_invoke_41()
{
  NSObject *v0;
  __CFNotificationCenter *LocalCenter;
  uint8_t v2[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Received com.apple.launchservices.setsystemhidden, reposting eligibility notification", v2, 2u);
  }

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kLSHiddenAppsEligibilityChangedNotification"), 0, 0, 1u);
}

void ___ZN14LaunchServices19URLPropertyProviderL43beginTranslatingHiddenBySystemNotificationsEv_block_invoke_45()
{
  NSObject *v0;
  __CFNotificationCenter *LocalCenter;
  uint8_t v2[16];

  _LSDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_182882000, v0, OS_LOG_TYPE_DEFAULT, "Eligibility changed, reposting eligibility notification", v2, 2u);
  }

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kLSHiddenAppsEligibilityChangedNotification"), 0, 0, 1u);
}

uint64_t LaunchServices::URLPropertyProvider::setValues(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  void *v13;
  FSNode *v14;
  id *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void ***, FSNode *, uint64_t, uint64_t, uint64_t, _BYTE *, id *);
  int v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  const void *v30;
  _QWORD *v31;
  void *v32;
  FSNode *v33;
  id v36;
  id v37;
  _BYTE v38[16];
  id v39;
  char v40;
  void *v41;
  void **v42;
  id v43;
  char v44;
  id v45;
  id v46;

  v13 = (void *)MEMORY[0x186DAE7A0]();
  v14 = [FSNode alloc];
  if (a8)
    v15 = &v46;
  else
    v15 = 0;
  if (a8)
    v46 = 0;
  v33 = -[FSNode initWithURL:flags:error:](v14, "initWithURL:flags:error:", a1, 64, v15);
  if (a8)
    v16 = v46;
  else
    v16 = 0;
  if (!v33)
  {
    v24 = 1;
    goto LABEL_31;
  }
  v45 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v38[0] = 0;
  v40 = 0;
  v41 = 0;
  if (a6 < 1)
  {
    v25 = 0;
    v18 = 0;
    v24 = 1;
    goto LABEL_24;
  }
  v30 = a1;
  v31 = a8;
  v32 = v13;
  v17 = 0;
  v18 = 1;
  while (1)
  {
    v19 = *(_QWORD *)(a3 + 8 * v17);
    if (v19)
      break;
LABEL_18:
    v18 = ++v17 < a6;
    if (a6 == v17)
    {
      v24 = 1;
      goto LABEL_23;
    }
  }
  v20 = *(_QWORD *)(a4 + 8 * v17);
  v21 = *(uint64_t (**)(void ***, FSNode *, uint64_t, uint64_t, uint64_t, _BYTE *, id *))(*(_QWORD *)(a5 + 8 * v17)
                                                                                               + 32);
  if (!v21)
  {
LABEL_16:
    if (!v20)
      MEMORY[0x186DAD8F4](a2, v19);
    goto LABEL_18;
  }
  v37 = v16;
  v22 = v21(&v42, v33, a2, v19, v20, v38, &v37);
  v23 = v37;

  if (v22)
  {
    v16 = v23;
    goto LABEL_16;
  }
  v24 = 0;
  v16 = v23;
LABEL_23:
  v25 = v41;
  a8 = v31;
  v13 = v32;
  a1 = v30;
LABEL_24:

  if (v40)
  if (v42 && v44)
    _LSContextDestroy(v42);
  v26 = v43;
  v42 = 0;
  v43 = 0;

  v44 = 0;
  v27 = v45;
  v45 = 0;

  if (a8 != 0 && v18)
  {
    v36 = v16;
    LaunchServices::URLPropertyProvider::normalizeError(a1, 1, &v36);
    v28 = v36;

    v16 = v28;
    v24 = 0;
    *a8 = v16;
  }
LABEL_31:

  objc_autoreleasePoolPop(v13);
  return v24;
}

void sub_1829C4F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void ___ZN14LaunchServices19URLPropertyProviderL13prepareValuesEPK7__CFURLP11__FileCachePKPK10__CFStringPPKvlSC_PP9__CFError_block_invoke_4()
{
  JUMPOUT(0x186DAD930);
}

void LaunchServices::URLPropertyProvider::normalizeError(const void *a1, uint64_t a2, id *a3)
{
  id v6;
  void *v7;
  char v8;
  CFAllocatorRef v9;
  void *v10;
  id v11;

  if (a1 && a3)
  {
    v6 = *a3;
    v11 = v6;
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0CB28A8]);

      if ((v8 & 1) == 0)
      {
        v9 = CFGetAllocator(a1);
        objc_msgSend(v11, "domain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)MEMORY[0x186DAD8E8](v9, v10, objc_msgSend(v11, "code"), a2, a1, 0);

      }
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"normalizeError", 222, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
}

void sub_1829C50AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void LaunchServices::URLPropertyProvider::State::~State(id *this)
{

  if (*((_BYTE *)this + 32))
}

void _LSRegistrationWarning(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  if ((id)_LSRegistrationWarning::lastNode != v4)
  {
    objc_storeStrong((id *)&_LSRegistrationWarning::lastNode, a1);
    if (v4)
    {
      objc_msgSend(v4, "pathWithError:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = CFSTR("<unknown>");
      if (v5)
        v7 = (__CFString *)v5;
      v8 = v7;

      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138477827;
        v14 = v8;
        _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "*** Registration warnings for %{private}@:", (uint8_t *)&v13, 0xCu);
      }

    }
  }
  if (a2)
  {
    v10 = (void *)MEMORY[0x186DAE7A0]();
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
      v13 = 136446210;
      v14 = (__CFString *)v12;
      _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "    %{public}s", (uint8_t *)&v13, 0xCu);
    }

    objc_autoreleasePoolPop(v10);
  }

}

void sub_1829C5288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _LSRegistrationWarningPath(uint64_t a1, void *a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138477827;
    v9 = a1;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "*** Registration warnings for %{private}@:", (uint8_t *)&v8, 0xCu);
  }

  if (a2)
  {
    v5 = (void *)MEMORY[0x186DAE7A0]();
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
      v8 = 136446210;
      v9 = v7;
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "    %{public}s", (uint8_t *)&v8, 0xCu);
    }

    objc_autoreleasePoolPop(v5);
  }
}

void sub_1829C53DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFBoolean *_LSGetBooleanFromCFType(const __CFBoolean *result)
{
  const __CFBoolean *v1;
  CFTypeID v2;
  BOOL v3;
  uint64_t valuePtr;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFBooleanGetTypeID())
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    if (v2 != CFStringGetTypeID())
    {
      if (v2 != CFNumberGetTypeID())
        return 0;
      valuePtr = 0;
      CFNumberGetValue(v1, kCFNumberLongType, &valuePtr);
      v3 = valuePtr == 0;
      return (const __CFBoolean *)!v3;
    }
    result = (const __CFBoolean *)CFStringGetLength((CFStringRef)v1);
    if (result)
    {
      result = (const __CFBoolean *)CFStringCompare((CFStringRef)v1, CFSTR("NO"), 1uLL);
      if (result)
      {
        result = (const __CFBoolean *)CFStringCompare((CFStringRef)v1, CFSTR("0"), 0x40uLL);
        if (result)
        {
          v3 = CFStringCompare((CFStringRef)v1, CFSTR("FALSE"), 1uLL) == kCFCompareEqualTo;
          return (const __CFBoolean *)!v3;
        }
      }
    }
  }
  return result;
}

const __CFBoolean *_LSGetBooleanFromDict(const __CFDictionary *a1, const void *a2)
{
  const __CFBoolean *Value;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  return _LSGetBooleanFromCFType(Value);
}

const __CFString *_LSGetRawOSTypeForPossibleString(const __CFString *result)
{
  const __CFString *v1;
  CFTypeID TypeID;
  CFIndex Length;
  CFIndex v4;
  CFIndex Bytes;
  UInt8 buffer[4];
  CFRange v7;

  *(_DWORD *)buffer = 0;
  if (result)
  {
    v1 = result;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      Length = CFStringGetLength(v1);
      if (Length >= 4)
        v4 = 4;
      else
        v4 = Length;
      v7.location = 0;
      v7.length = v4;
      Bytes = CFStringGetBytes(v1, v7, 0, 0, 0, buffer, 4, 0);
      result = 0;
      if (v4 == Bytes)
        return (const __CFString *)bswap32(*(unsigned int *)buffer);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _LSGetBundle()
{
  if (_LSGetBundle::once != -1)
    dispatch_once(&_LSGetBundle::once, &__block_literal_global_75);
  return _LSGetBundle::gBundleRef;
}

uint64_t _LSGetDirectoryClassForNode(void *a1)
{
  FSNode *v1;
  unsigned __int8 v2;

  v1 = a1;
  if (!-[FSNode isOnLocalVolume](v1, "isOnLocalVolume"))
    goto LABEL_21;
  if ((_LSNodeIsInDirectoryPath(v1, "/System/Cryptexes/App/System/Applications") & 1) != 0)
  {
    v2 = 1;
    goto LABEL_22;
  }
  if ((_LSNodeIsInDirectoryPath(v1, "/System/Cryptexes/App/System/Library/CoreServices") & 1) != 0
    || (_LSNodeIsInDirectoryPath(v1, "/System/Library/CoreServices/") & 1) != 0)
  {
    v2 = 4;
    goto LABEL_22;
  }
  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 8) & 1) != 0)
  {
    v2 = 3;
    goto LABEL_22;
  }
  if ((_LSNodeIsInSearchPath(v1, NSApplicationDirectory, 2) & 1) != 0)
  {
    v2 = 0;
    goto LABEL_22;
  }
  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 2) & 1) != 0)
  {
    v2 = 2;
    goto LABEL_22;
  }
  if ((_LSNodeIsInSearchPath(v1, NSApplicationDirectory, 1) & 1) != 0)
  {
    v2 = 5;
    goto LABEL_22;
  }
  if ((_LSNodeIsInSearchPath(v1, NSLibraryDirectory, 1) & 1) != 0)
  {
    v2 = 6;
    goto LABEL_22;
  }
  if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
  {
LABEL_21:
    v2 = -1;
    goto LABEL_22;
  }
  if (_LSNodeIsInDirectoryPath(v1, "/AppleInternal/"))
    v2 = 8;
  else
    v2 = -1;
LABEL_22:

  return v2;
}

void sub_1829C5770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _LSNodeIsInDirectoryPath(FSNode *a1, const char *a2)
{
  FSNode *v3;
  NSURL *v4;
  uint64_t v5;

  v3 = a1;
  v4 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a2, 1, 0);
  v5 = _LSNodeIsInDirectoryURL(v3, v4);

  return v5;
}

void sub_1829C57E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _LSNodeIsInSearchPath(FSNode *a1, NSSearchPathDirectory a2, uint64_t a3)
{
  FSNode *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  uint64_t v9;

  v5 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLsForDirectory:inDomains:", a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (NSURL *)objc_claimAutoreleasedReturnValue();

  v9 = _LSNodeIsInDirectoryURL(v5, v8);
  return v9;
}

void sub_1829C588C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

BOOL _LSIconDictionarySupportsAssetCatalogs(void *a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(a1, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSString() & 1) != 0)
  {
    v4 = 1;
  }
  else if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleIconName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  else
  {
    v4 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_1829C595C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _LSIconDictionaryGetPrimaryIconName(void *a1)
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("CFBundlePrimaryIcon"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("CFBundleIconName"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!_NSIsNSString())
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = v1;
  }
  v3 = v2;
LABEL_7:

  return v3;
}

void sub_1829C59DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829C5AD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829C5B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829C5BE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *_LSGetPlatformNameSuffix()
{
  return CFSTR("-iphoneos");
}

uint64_t _LSGetProductNameSuffix()
{
  if (_LSGetProductNameSuffix::onceToken != -1)
    dispatch_once(&_LSGetProductNameSuffix::onceToken, &__block_literal_global_89_0);
  return _LSGetProductNameSuffix::suffix;
}

BOOL _LSIsCPUTypeSubtypeRunnable(int a1, int a2)
{
  int v4;
  int v5;

  if (a1 == 16777228)
  {
    if (_LSGetCPUType::once != -1)
      dispatch_once(&_LSGetCPUType::once, &__block_literal_global_37_0);
    if (_LSGetCPUType::type == 16777228)
    {
      v4 = a2 & 0xFFFFFF;
      if ((a2 & 0xFFFFFF) == 0 || v4 == 0xFFFFFF || v4 == 2)
        return 1;
    }
    return 0;
  }
  if (a1 != 16777223)
    return a1 == -1 && a2 == -1;
  if (_LSGetCPUType::once != -1)
    dispatch_once(&_LSGetCPUType::once, &__block_literal_global_37_0);
  if (_LSGetCPUType::type != 16777223)
    return 0;
  v5 = a2 & 0xFFFFFF;
  if ((a2 & 0xFFFFFF) == 0xFFFFFF)
    return 1;
  if (v5 != 8)
    return v5 == 3;
  if (_LSPlatformSupportsHaswell::onceToken != -1)
    dispatch_once(&_LSPlatformSupportsHaswell::onceToken, &__block_literal_global_85_0);
  return _LSPlatformSupportsHaswell::canRun != 0;
}

uint64_t _LSSessionKeyCopyDescription(unint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LSSessionKey(system: %d uid: %d)"), HIDWORD(a1) & 1, a1);
  return objc_claimAutoreleasedReturnValue();
}

id _LSGetDataForUserActivity(void *a1, _QWORD *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__49;
  v26 = __Block_byref_object_dispose__49;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__49;
  v20 = __Block_byref_object_dispose__49;
  v21 = 0;
  v3 = a1;
  v4 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___LSGetDataForUserActivity_block_invoke;
  v12[3] = &unk_1E1045918;
  v14 = &v22;
  v15 = &v16;
  v5 = v4;
  v13 = v5;
  v6 = objc_msgSend(v3, "_createUserActivityDataWithOptions:completionHandler:", 0, v12);

  if (v6)
  {
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10817, (uint64_t)"_LSGetDataForUserActivity", 1674, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v17[5];
    v17[5] = v7;

  }
  v9 = (void *)v23[5];
  if (a2 && !v9)
  {
    *a2 = objc_retainAutorelease((id)v17[5]);
    v9 = (void *)v23[5];
  }
  v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void sub_1829C60F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;
  uint64_t v23;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v23 - 80), 8);

  _Unwind_Resume(a1);
}

uint64_t _LSNodeIsInDirectoryURL(FSNode *a1, NSURL *a2)
{
  FSNode *v3;
  NSURL *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v10;

  v3 = a1;
  v4 = a2;
  v10 = 2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSNode URL](v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v10, v4, v6, 0);

    if (v10 < 2)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1829C6288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1829C667C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829C67DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

double _LSVersionNumberGetCurrentSystemVersion@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once != -1)
    dispatch_once(&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once, &__block_literal_global_76);
  result = *(double *)&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedSystemVersion;
  v3 = unk_1ECD29E60;
  *a1 = _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedSystemVersion;
  a1[1] = v3;
  return result;
}

CFStringRef _LSVersionNumberCopyStringRepresentation(_OWORD *a1)
{
  __int128 v1;
  _OWORD v3[2];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  return LaunchServices::VersionNumber::copyStringRepresentation((LaunchServices::VersionNumber *)v3);
}

uint64_t _LSVersionNumberHash(_QWORD *a1)
{
  return a1[1] ^ *a1 ^ a1[2];
}

uint64_t _LSVersionNumberGetMinorComponent(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t _LSVersionNumberGetBugFixComponent(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t _LSMakeVersionNumberFromDYLDVersion@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = WORD1(result);
  a2[1] = BYTE1(result);
  a2[2] = result;
  a2[3] = 0;
  return result;
}

uint64_t _LSMakeDYLDVersionFromVersionNumber(uint64x2_t *a1)
{
  unint64_t v1;
  int64x2_t v2;

  v1 = a1[1].u64[0];
  if (v1 >= 0xFF)
    LODWORD(v1) = 255;
  v2 = (int64x2_t)vshlq_u64((uint64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)xmmword_1829FAD60, *a1), *(int8x16_t *)a1, (int8x16_t)xmmword_1829FAD60), (uint64x2_t)xmmword_1829FAD70);
  return vorrq_s8((int8x16_t)vdupq_laneq_s64(v2, 1), (int8x16_t)v2).u32[0] | v1;
}

double _LSGetCurrentCryptexVersion@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once != -1)
    dispatch_once(&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once, &__block_literal_global_76);
  result = *(double *)&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedCryptexVersion;
  v3 = unk_1EDCCD0C0;
  *a1 = _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedCryptexVersion;
  a1[1] = v3;
  return result;
}

uint64_t _LSGetCurrentCryptexBuildVersionString()
{
  if (_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once != -1)
    dispatch_once(&_LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::once, &__block_literal_global_76);
  return _LSGetCurrentSystemIOSSupportAndBuildVersions(LSVersionNumber *,LSVersionNumber *,__CFString const**,LSVersionNumber *,__CFString const**)::cachedCryptexBuildVersion;
}

double _LSGetVersionForArchitecture@<D0>(const __CFDictionary *a1@<X0>, const void *a2@<X1>, _OWORD *a3@<X8>)
{
  __CFString *Value;
  double result;
  __CFString *v6;
  CFTypeID TypeID;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *a3 = 0u;
  a3[1] = 0u;
  Value = (__CFString *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v6 = Value;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v6))
    {
      _LSGetVersionFromString(v6, v9);
      result = *(double *)v9;
      v8 = v9[1];
      *a3 = v9[0];
      a3[1] = v8;
    }
  }
  return result;
}

void sub_1829C6B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t _LSIsArrayWithValuesOfClass(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v6;

  v3 = a1;
  v6 = a2;
  if (a2)
    a2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v6, 1);
  v4 = _LSIsArrayWithValuesOfClasses(v3, a2);

  return v4;
}

uint64_t _LSIsDictionaryWithKeysAndValuesOfClass(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v5 = a1;
  v8 = a3;
  v9 = a2;
  if (a2)
    a2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v9, 1, v8);
  if (a3)
    a3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v8, 1);
  v6 = _LSIsDictionaryWithKeysAndValuesOfClasses(v5, a2, a3);

  return v6;
}

CFStringRef _UTTypeCreateDynamicIdentifierForTaggedPointerObject(__CFString *a1, int a2)
{
  const __CFString **v2;

  v2 = (const __CFString **)&kUTTypePackage;
  if (!a2)
    v2 = (const __CFString **)&kUTTypeData;
  return _UTTypeCreateDynamicIdentifierForTagCommon(CFSTR("public.filename-extension"), a1, *v2, 1);
}

void _UTDynamicEnumerateTagsFoundInDatabase(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  id TagSpecification;
  _QWORD v4[6];

  v4[1] = 3221225472;
  v4[2] = ___UTDynamicEnumerateTagsFoundInDatabase_block_invoke;
  v4[3] = &unk_1E10459B0;
  v4[4] = a1;
  v4[5] = a3;
  TagSpecification = (id)_UTDynamicGetTagSpecification(a2);
  v4[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(TagSpecification, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void sub_1829C7060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1829C71E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _UTDynamicGetParentIdentifiers(const __CFString *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___UTDynamicGetParentIdentifiers_block_invoke;
    v7[3] = &unk_1E10459D8;
    v4 = v2;
    v8 = v4;
    _UTDynamicEnumerateParentIdentifiers(a1, (uint64_t)v7);
    if (objc_msgSend(v4, "count"))
      v5 = objc_msgSend(v4, "copy");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1829C72C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829C7324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  id v3;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  if (inTagClass && inTag)
  {
    v7 = (void *)MEMORY[0x186DAE7A0]();
    +[UTTypeRecord typeRecordsWithTag:ofClass:conformingToIdentifier:](UTTypeRecord, "typeRecordsWithTag:ofClass:conformingToIdentifier:", inTag, inTagClass, inConformingToUTI);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "identifier", (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13);

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }

    }
    else
    {
      v3 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  return (CFArrayRef)v3;
}

void sub_1829C74B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeHash(const __CFString *a1)
{
  return _XCFStringHashCaseInsensitive(a1);
}

CFStringRef _UTTypeCreateSuggestedFilename(__CFString *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x186DAE7A0]();
  v5 = 0;
  if (a1 && a2)
  {
    objc_msgSend((id)_LSGetUTTypeClass(), "typeWithIdentifier:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[__CFString stringByAppendingPathExtensionForType:](a1, "stringByAppendingPathExtensionForType:", v6);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  objc_autoreleasePoolPop(v4);
  if (!a1 || v5)
    return (CFStringRef)v5;
  else
    return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
}

void sub_1829C75A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _UTTypePrecachePropertiesOfIdentifiers()
{
  NSObject *v0;

  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
  {
    _LSDefaultLog();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      _UTTypePrecachePropertiesOfIdentifiers_cold_1(v0);

  }
}

uint64_t _UTTypeIsWildcard(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isWildcard");
  else
    v5 = 0;

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_1829C7678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t UTTypeCopyChildIdentifiers(const __CFString *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (!a1 || !_UTTypeIdentifierIsDeclarable(a1))
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "childTypeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "allObjects");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

void sub_1829C772C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CFStringRef UTTypeCopyDescription(CFStringRef inUTI)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  if (!inUTI || !_UTTypeIdentifierIsDeclarable(inUTI))
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "localizedDescription");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_1829C77CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

Boolean UTTypeIsDeclared(CFStringRef inUTI)
{
  return _UTTypeGetStatus(inUTI) == 1;
}

uint64_t _UTTypeGetStatus(const __CFString *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (!_UTTypeIdentifierIsValid(a1))
    return -1;
  if (_UTTypeIdentifierIsDynamic(a1))
    return 2;
  v3 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v2 = objc_msgSend(v4, "isDeclared");
  else
    v2 = 0;

  objc_autoreleasePoolPop(v3);
  return v2;
}

void sub_1829C7888(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFURL *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  if (!inUTI || !_UTTypeIdentifierIsDeclarable(inUTI))
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", inUTI);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_resolvedPropertyValueForGetter:", sel_declaringBundleRecord);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "URL");
      v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "_declaringBundleBookmark");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8
        && (v9 = -[FSNode initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:]([FSNode alloc], "initByResolvingBookmarkData:relativeToNode:bookmarkDataIsStale:error:", v8, 0, 0, 0)) != 0)
      {
        objc_msgSend(v4, "_delegatePath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "childNodeWithRelativePath:flags:error:", v10, 8, 0);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v11;
        }

        objc_msgSend(v9, "URL");
        v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v7;
}

void sub_1829C79E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyGlyphName(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "iconDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UTTypeGlyphName"));
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_1829C7AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyIconName(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "iconDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UTTypeIconName"));
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_1829C7B7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CFArrayRef _UTTypeCopyDynamicIdentifiersForTags(__CFString *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  void *values;

  values = a1;
  if (_UTTypeIdentifierIsDynamic(a1))
    return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  v3 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = CFSTR("public.data");
    if ((objc_msgSend(v4, "conformsToTypeIdentifier:", CFSTR("public.data")) & 1) == 0)
    {
      v6 = CFSTR("com.apple.package");
      if ((objc_msgSend(v4, "conformsToTypeIdentifier:", CFSTR("com.apple.package")) & 1) == 0)
      {
        if (objc_msgSend(v4, "conformsToTypeIdentifier:", CFSTR("public.folder")))
          v6 = CFSTR("public.folder");
        else
          v6 = 0;
      }
    }
    objc_msgSend(v4, "tagSpecification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_expensiveDictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___UTTypeCopyDynamicIdentifiersForTags_block_invoke;
    v11[3] = &unk_1E1045A50;
    v13 = v6;
    v9 = v5;
    v12 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "allObjects");
      v2 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return (CFArrayRef)v2;
}

void sub_1829C7D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1829C7E9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyPedigree(const __CFString *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  v3 = (void *)_UTTypeCopyPedigreeSet((uint64_t)a1);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "count") == 1 && _UTTypeIdentifierIsDynamic(a1))
    {

LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!a1)
      goto LABEL_7;
    if (_UTTypeIdentifierIsValid(a1))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
  }
  objc_msgSend(v4, "allObjects");
  v5 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_1829C7F98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyPedigreeSet(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pedigree");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_1829C8018(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *_UTCopyDeclaredTypeIdentifiers()
{
  void *v0;
  _LSDServiceDomain *v1;
  uint64_t *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  void **v12;
  id v13;
  char v14;
  id v15;

  v0 = (void *)MEMORY[0x186DAE7A0]();
  if (_LSCurrentProcessMayMapDatabase())
  {
    v15 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    +[_LSDServiceDomain defaultServiceDomain]();
    v1 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    v2 = (uint64_t *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v12, v1, 0);

    if (v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4 = *v2;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = ___UTCopyDeclaredTypeIdentifiers_block_invoke;
      v9[3] = &unk_1E1045A78;
      v11 = v2;
      v5 = v3;
      v10 = v5;
      _UTEnumerateActiveTypes(v4, v9);
      v2 = (uint64_t *)v5;

    }
    if (v12 && v14)
      _LSContextDestroy(v12);
    v6 = v13;
    v12 = 0;
    v13 = 0;

    v14 = 0;
    v7 = v15;
    v15 = 0;

  }
  else
  {
    v2 = 0;
  }
  objc_autoreleasePoolPop(v0);
  return v2;
}

void sub_1829C8160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_1829C820C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void *_UTTypeCopyDescriptionLocalizationDictionary(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x186DAE7A0]();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allStringValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v6;

  }
  else
  {
    v6 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_1829C82B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyKindStringForNonMaterializedItem(LaunchServices::BindingEvaluator *a1, void *a2, _QWORD *a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v11;
  _BYTE v12[168];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x186DAE7A0]();
  LaunchServices::BindingEvaluator::CreateWithUTI(a1, 0, (LaunchServices::BindingEvaluator *)v12);
  v11 = 0;
  LaunchServices::BindingEvaluator::getLocalizedKindString((const LaunchServices::BindingEvaluator *)v12, 0, a2, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v8;
  if (a3 && !v7)
    *a3 = v8;
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v12);
  objc_autoreleasePoolPop(v6);

  return v7;
}

void sub_1829C83A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeCopyKindStringDictionaryForNonMaterializedItem(LaunchServices::BindingEvaluator *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v9;
  _BYTE v10[168];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x186DAE7A0]();
  LaunchServices::BindingEvaluator::CreateWithUTI(a1, 0, (LaunchServices::BindingEvaluator *)v10);
  v9 = 0;
  LaunchServices::BindingEvaluator::getLocalizedKindStringDictionary((const LaunchServices::BindingEvaluator *)v10, 0, &v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v6;
  if (a2 && !v5)
    *a2 = v6;
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v10);
  objc_autoreleasePoolPop(v4);

  return v5;
}

void sub_1829C8494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

CFTypeRef _LSCreateDeviceTypeIdentifierWithModelCode(uint64_t a1)
{
  return _LSCreateDeviceTypeIdentifierWithModelCodeAndColorComponents(a1, 0);
}

CFTypeRef _LSCreateDeviceTypeIdentifierWithModelCodeAndColorComponents(uint64_t a1, unsigned __int8 *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)_LSGetUTTypeClass();
  if (!v4)
    return CFRetain(CFSTR("public.device"));
  v5 = v4;
  if (a1)
  {
    if (a2)
    {
      v6 = softLink_UTHardwareColorMakeWithRGBComponents
         ? softLink_UTHardwareColorMakeWithRGBComponents(*a2, a2[1], a2[2])
         : 0;
      objc_msgSend(v5, "_typeWithDeviceModelCode:enclosureColor:", a1, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "_typeWithDeviceModelCode:", a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v4, "_typeOfCurrentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "identifier"), v9 = objc_claimAutoreleasedReturnValue(), v8, v9))
    return (CFTypeRef)v9;
  else
    return CFRetain(CFSTR("public.device"));
}

void sub_1829C85A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t (*init_UTHardwareColorMakeWithRGBComponents(uint64_t a1, uint64_t a2, uint64_t a3))(unsigned __int8, unsigned __int8, unsigned __int8)
{
  void *v6;
  uint64_t (*result)(unsigned __int8, unsigned __int8, unsigned __int8);

  v6 = (void *)UniformTypeIdentifiersLibrary(void)::frameworkLibrary;
  if (!UniformTypeIdentifiersLibrary(void)::frameworkLibrary)
  {
    v6 = dlopen("/System/Library/Frameworks/UniformTypeIdentifiers.framework/UniformTypeIdentifiers", 2);
    UniformTypeIdentifiersLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }
  result = (uint64_t (*)(unsigned __int8, unsigned __int8, unsigned __int8))dlsym(v6, "_UTHardwareColorMakeWithRGBComponents");
  softLink_UTHardwareColorMakeWithRGBComponents = result;
  if (result)
    return (uint64_t (*)(unsigned __int8, unsigned __int8, unsigned __int8))result(a1, a2, a3);
  return result;
}

uint64_t _UTTypeAdd(void *a1, uint64_t a2, _DWORD *a3)
{
  _LSDatabase *v5;
  _LSDatabase *v6;
  int v7;
  uint64_t v8;

  v5 = a1;
  v6 = v5;
  if (v5 && v5->store)
  {
    CSBindableKeyMapNextKey();
    v7 = CSStoreAllocUnitWithData();
    if (v7)
    {
      CSMapSetValue();
      -[_LSDatabase setTypeDeclarationsChanged:](v6, 1);
      if (a3)
        *a3 = v7;
      if ((*(_BYTE *)(a2 + 8) & 0x20) != 0)
        _CSStoreGarbageCollect();
      v8 = 0;
    }
    else
    {
      v8 = 4294957803;
    }
  }
  else
  {
    v8 = 4294967246;
  }

  return v8;
}

void sub_1829C8770(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeAddWithDeclarationDictionary()
{
  void *v0;
  _DWORD *v1;
  int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const void *v8;
  const void *v9;
  _LSDatabase *v10;
  uint64_t v11;
  __int128 v12;
  CFTypeID v13;
  CFTypeID TypeID;
  const __CFString *Value;
  const __CFString *v16;
  uint64_t i;
  const __CFString *v18;
  CFIndex Length;
  CFTypeID v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  CFTypeID v26;
  const __CFArray *v27;
  const __CFArray *v28;
  CFIndex Count;
  uint64_t v30;
  uint64_t v31;
  CFTypeID v32;
  const __CFString *ValueAtIndex;
  const __CFString *v34;
  unsigned int StringForCFString;
  unsigned int *v36;
  CFTypeID v37;
  const __CFString *v38;
  const __CFString *v39;
  CFTypeID v40;
  const __CFString *v41;
  const __CFString *v42;
  CFTypeID v43;
  const __CFString *v44;
  const __CFString *v45;
  CFTypeID v46;
  void *v47;
  void *v48;
  void *v49;
  CFTypeID v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  const __CFString *v55;
  const __CFString *v56;
  CFTypeID v57;
  const __CFString *v58;
  const __CFString *v59;
  unsigned int v60;
  CFIndex v61;
  unsigned int v62;
  CFTypeID v63;
  const __CFDictionary *v64;
  const __CFDictionary *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  int v70;
  const void *v71;
  void *v72;
  void *v73;
  CFTypeID v74;
  CFTypeID v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  uint64_t active;
  int v81;
  void *v82;
  void *v83;
  unsigned int bindingClass;
  CFTypeID v85;
  int v86;
  BOOL v87;
  CFTypeID v88;
  id v89;
  uint64_t v90;
  const void *v91;
  uint64_t v92;
  uint64_t k;
  NSObject *v94;
  id v95;
  void *v96;
  CFTypeID v97;
  const __CFString *v98;
  const __CFString *v99;
  _DWORD *v101;
  const __CFDictionary *v102;
  const void *v103;
  _DWORD *v104;
  id v105;
  _OWORD v106[4];
  _OWORD v107[2];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  unsigned int v116[4];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[28];
  unsigned int v121[2048];
  int v122;
  _OWORD v123[2];
  _BYTE v124[128];
  _BYTE v125[128];
  __int128 v126;
  __int128 v127;
  _OWORD v128[2];
  _OWORD valuePtr[2];
  uint64_t v130;
  CFRange v131;
  CFRange v132;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v104 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v130 = *MEMORY[0x1E0C80C00];
  v10 = v0;
  v105 = v7;
  v122 = 0;
  v126 = kLSVersionNumberNull;
  v127 = *(_OWORD *)algn_1829FAD90;
  if ((v5 & 0x2000) != 0)
  {
    v11 = _LSGetPlugin((uint64_t)v10, v3);
    if (!v11)
      goto LABEL_5;
    goto LABEL_3;
  }
  v11 = _LSBundleGet(v10, v3);
  if (v11)
  {
LABEL_3:
    v12 = *(_OWORD *)(v11 + 76);
    v126 = *(_OWORD *)(v11 + 60);
    v127 = v12;
  }
LABEL_5:
  _LSBindingListBufferInit((uint64_t)v10, v121);
  v119 = 0u;
  memset(v120, 0, sizeof(v120));
  v117 = 0u;
  v118 = 0u;
  *(_OWORD *)v116 = 0u;
  if (!v9 || (v13 = CFGetTypeID(v9), v13 != CFDictionaryGetTypeID()))
  {
    active = 0;
    goto LABEL_127;
  }
  v116[2] = v5;
  TypeID = CFStringGetTypeID();
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIdentifier"));
  v16 = Value;
  if (!Value || CFGetTypeID(Value) != TypeID || !_UTTypeIdentifierIsDeclarable(v16))
    goto LABEL_109;
  v116[3] = _LSDatabaseCreateStringForCFString(v10, v16, 1);
  if ((v116[2] & 0x20) != 0)
    _CSStringMakeConst();
  for (i = 0; i != 48; i += 16)
  {
    v18 = *(__CFString **)((char *)&off_1E1046050 + i);
    Length = CFStringGetLength(v18);
    if (CFStringGetLength(v16) > Length)
    {
      v131.location = 0;
      v131.length = Length;
      if (CFStringCompareWithOptions(v16, v18, v131, 1uLL) == kCFCompareEqualTo)
        v116[2] |= *(_DWORD *)((char *)&off_1E1046050 + i + 8);
    }
  }
  v20 = CFNumberGetTypeID();
  v21 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeVersion"));
  v22 = v21;
  if (v21 && CFGetTypeID(v21) == v20)
  {
    LODWORD(valuePtr[0]) = 0;
    CFNumberGetValue(v22, kCFNumberSInt32Type, valuePtr);
    LODWORD(v117) = valuePtr[0];
    v116[2] |= 0x100u;
    if ((v5 & 0x20) == 0)
      goto LABEL_26;
  }
  else
  {
    LODWORD(v117) = 0;
    if ((v5 & 0x20) == 0)
      goto LABEL_26;
  }
  v23 = CFBooleanGetTypeID();
  v24 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIsWildcard"));
  v25 = v24;
  if (v24 && CFGetTypeID(v24) == v23 && CFBooleanGetValue(v25))
    v116[2] |= 0x200u;
LABEL_26:
  v26 = CFArrayGetTypeID();
  v27 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIconFiles"));
  v28 = v27;
  if (v27 && CFGetTypeID(v27) == v26)
  {
    Count = CFArrayGetCount(v28);
    if (Count >= 1)
    {
      v30 = 0;
      v31 = 1;
      do
      {
        v32 = CFStringGetTypeID();
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v28, v31 - 1);
        v34 = ValueAtIndex;
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v32)
        {
          StringForCFString = _LSDatabaseCreateStringForCFString(v10, v34, 0);
          v36 = &v116[v30++];
          v36[7] = StringForCFString;
        }
        if (v31 >= Count)
          break;
        ++v31;
      }
      while (v30 < 8);
    }
  }
  else
  {
    v37 = CFStringGetTypeID();
    v38 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIconFile"));
    v39 = v38;
    if (v38 && CFGetTypeID(v38) == v37)
      HIDWORD(v117) = _LSDatabaseCreateStringForCFString(v10, v39, 0);
  }
  v40 = CFStringGetTypeID();
  v41 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIconName"));
  v42 = v41;
  if (v41 && CFGetTypeID(v41) == v40)
    HIDWORD(v119) = _LSDatabaseCreateStringForCFString(v10, v42, 0);
  v43 = CFStringGetTypeID();
  v44 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeGlyphName"));
  v45 = v44;
  if (v44 && CFGetTypeID(v44) == v43)
    *(_DWORD *)v120 = _LSDatabaseCreateStringForCFString(v10, v45, 0);
  v46 = CFDictionaryGetTypeID();
  v47 = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeIcons"));
  v48 = v47;
  if (v47)
  {
    if (CFGetTypeID(v47) == v46)
      v49 = v48;
    else
      v49 = 0;
  }
  else
  {
    v49 = 0;
  }
  *(_DWORD *)&v120[4] = _LSPlistAdd((uint64_t)v10, v49);
  v50 = CFStringGetTypeID();
  v51 = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeDescription"));
  v52 = v51;
  if (v51 && CFGetTypeID(v51) == v50)
  {
    v53 = v52;
    objc_msgSend(v105, "objectForKeyedSubscript:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    DWORD2(v117) = LaunchServices::LocalizedString::Add(v10, v54, v53);

  }
  DWORD1(v117) = v3;
  v55 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("_LSBundleLibraryDelegate"));
  v56 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTKEXTIdentifier"));
  if (v56)
    v116[2] |= 0x80u;
  *(_DWORD *)&v120[8] = _LSDatabaseCreateStringForCFString(v10, v55, 0);
  *(_DWORD *)&v120[12] = _LSDatabaseCreateStringForCFString(v10, v56, 0);
  if (*(_DWORD *)&v120[8])
  {
    v57 = CFStringGetTypeID();
    v58 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, (const void *)*MEMORY[0x1E0C9AE78]);
    v59 = v58;
    if (v58 && CFGetTypeID(v58) == v57)
    {
      v60 = v116[2];
      v61 = CFStringGetLength(v59);
      if (v61 > CFStringGetLength(CFSTR("com.apple.")))
      {
        v132.length = CFStringGetLength(CFSTR("com.apple."));
        v132.location = 0;
        if (CFStringCompareWithOptions(v59, CFSTR("com.apple."), v132, 1uLL) == kCFCompareEqualTo)
        {
          v62 = v60 | 4;
LABEL_63:
          v116[2] = v62;
          goto LABEL_64;
        }
      }
    }
    else
    {
      v60 = v116[2];
    }
    v62 = v60 & 0xFFFFFFFB;
    goto LABEL_63;
  }
LABEL_64:
  *(_QWORD *)&v120[16] = 0;
  v63 = CFDictionaryGetTypeID();
  v64 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeTagSpecification"));
  v65 = v64;
  if (v64 && CFGetTypeID(v64) == v63)
  {
    v66 = 0;
    v101 = &v120[16];
    v102 = v65;
    v67 = 1;
    v103 = v9;
    do
    {
      v68 = (uint64_t)&v10->schema + 104 * v67;
      v69 = *(_DWORD *)(v68 + 216);
      v70 = *(unsigned __int8 *)(v68 + 220);
      v71 = (const void *)_CSStringCopyCFString();
      if (v71)
      {
        v72 = (void *)CFDictionaryGetValue(v65, v71);
        v73 = v72;
        if (v72)
        {
          v74 = CFGetTypeID(v72);
          if (v74 == CFStringGetTypeID())
          {
            if (!_LSBindingListBufferAppendNSString(v10, v121, v69, v73, v70 != 0))
            {
LABEL_108:
              CFRelease(v71);
              goto LABEL_109;
            }
            if (v67 == 1)
              v66 = 1;
          }
          else
          {
            v75 = CFGetTypeID(v73);
            if (v75 == CFArrayGetTypeID())
            {
              v114 = 0u;
              v115 = 0u;
              v112 = 0u;
              v113 = 0u;
              v76 = v73;
              v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v112, v125, 16, v101);
              if (v77)
              {
                v78 = *(_QWORD *)v113;
                while (2)
                {
                  for (j = 0; j != v77; ++j)
                  {
                    if (*(_QWORD *)v113 != v78)
                      objc_enumerationMutation(v76);
                    if (!_LSBindingListBufferAppendNSString(v10, v121, v69, *(void **)(*((_QWORD *)&v112 + 1) + 8 * j), v70 != 0))
                    {

                      goto LABEL_108;
                    }
                    if (v67 == 1)
                      v66 = 1;
                  }
                  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
                  if (v77)
                    continue;
                  break;
                }
              }

              v9 = v103;
              v65 = v102;
            }
          }
        }
        CFRelease(v71);
      }
      ++v67;
    }
    while (v67 != 5);
    active = _LSBindingListCreate(v10, v121, v101);
    if ((_DWORD)active)
      goto LABEL_127;
    v81 = v66 & 1;
  }
  else
  {
    v81 = 0;
  }
  _LSBindingListBufferReset(v10, (uint64_t)v121);
  v82 = (void *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeConformsTo"));
  v83 = v82;
  if (v82)
  {
    bindingClass = v10->schema.bindingMaps[0].bindingClass;
    v85 = CFGetTypeID(v82);
    if (v85 == CFStringGetTypeID())
    {
      if (!_LSBindingListBufferAppendNSString(v10, v121, bindingClass, v83, 1))
        goto LABEL_109;
      v86 = 1;
    }
    else
    {
      v88 = CFGetTypeID(v83);
      if (v88 == CFArrayGetTypeID())
      {
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v89 = v83;
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
        if (v90)
        {
          v91 = v9;
          v92 = *(_QWORD *)v109;
          while (2)
          {
            for (k = 0; k != v90; ++k)
            {
              if (*(_QWORD *)v109 != v92)
                objc_enumerationMutation(v89);
              if (!_LSBindingListBufferAppendNSString(v10, v121, bindingClass, *(void **)(*((_QWORD *)&v108 + 1) + 8 * k), 1))
              {

                goto LABEL_109;
              }
            }
            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
            if (v90)
              continue;
            break;
          }
          v86 = 1;
          v9 = v91;
        }
        else
        {
          v86 = 0;
        }

      }
      else
      {
        v86 = 0;
      }
    }
    v87 = v86 != 0;
    if (!v81)
      goto LABEL_120;
  }
  else
  {
    v87 = 0;
    if (!v81)
      goto LABEL_120;
  }
  if ((v116[2] & 4) == 0)
  {
    _LSMakeVersionNumber(13, 1, 0, v123);
    valuePtr[0] = v126;
    valuePtr[1] = v127;
    v128[0] = v123[0];
    v128[1] = v123[1];
    if (_LSVersionNumberCompare(valuePtr, v128) == -1 && !v87)
    {
      _LSDefaultLog();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        _LSDatabaseGetNSStringFromString(v10);
        v95 = (id)objc_claimAutoreleasedReturnValue();
        _LSDatabaseGetNSStringFromString(v10);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        _UTTypeAddWithDeclarationDictionary_cold_1(v95, v96, (uint64_t)valuePtr, v94);
      }

      if (_LSBindingListBufferAppendNSString(v10, v121, v10->schema.bindingMaps[0].bindingClass, CFSTR("public.data"), 1))
      {
        v116[2] |= 0x400u;
        goto LABEL_120;
      }
LABEL_109:
      active = 4294956479;
      goto LABEL_127;
    }
  }
LABEL_120:
  active = _LSBindingListCreate(v10, v121, &v120[20]);
  if (!(_DWORD)active)
  {
    v97 = CFStringGetTypeID();
    v98 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("UTTypeReferenceURL"));
    v99 = v98;
    if (v98 && CFGetTypeID(v98) == v97)
      *(_DWORD *)&v120[24] = _LSDatabaseCreateStringForCFString(v10, v99, 0);
    v106[2] = v118;
    v106[3] = v119;
    v107[0] = *(_OWORD *)v120;
    *(_OWORD *)((char *)v107 + 12) = *(_OWORD *)&v120[12];
    v106[0] = *(_OWORD *)v116;
    v106[1] = v117;
    active = _UTTypeAdd(v10, (uint64_t)v106, &v122);
    if (!(_DWORD)active)
    {
      active = _LSBindableActivate(v10, v122);
      if (!(_DWORD)active)
        active = _UTUpdateActiveTypeForIdentifier(v10, v116[3]);
    }
  }
LABEL_127:
  if (v104)
    *v104 = v122;
  _LSBindingListBufferReset(v10, (uint64_t)v121);

  return active;
}

void sub_1829C9300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t _UTUpdateActiveTypeForIdentifier(void *a1, int a2)
{
  id v3;
  int v4;
  int v5;
  id v6;
  _DWORD *Unit;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  _DWORD *v12;
  int v13;
  void *v15;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  void *v33;
  unsigned int v34;

  v3 = a1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = ___UTUpdateActiveTypeForIdentifier_block_invoke;
  v16[3] = &unk_1E1046128;
  v16[4] = &v17;
  v16[5] = &v25;
  v16[6] = &v21;
  v16[7] = &v29;
  _UTEnumerateTypesForIdentifier(v3, a2, v16);
  v4 = *((_DWORD *)v26 + 6);
  if (!v4)
    goto LABEL_22;
  if (*((_DWORD *)v18 + 6))
  {
    v5 = *((_DWORD *)v22 + 6);
    if ((v5 & 0x820) == 0)
    {
      *((_DWORD *)v22 + 6) = v5 | 0x800;
      _CSStoreWriteToUnit();
      v4 = *((_DWORD *)v26 + 6);
    }
  }
  if (v4 == *((_DWORD *)v30 + 6))
  {
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  v6 = v3;
  Unit = (_DWORD *)CSStoreGetUnit();
  if (!Unit)
    goto LABEL_34;
  v8 = Unit[2];
  if ((v8 & 1) != 0)
  {

LABEL_18:
    if (*((_DWORD *)v30 + 6))
    {
      v11 = v6;
      v12 = (_DWORD *)CSStoreGetUnit();
      if (v12)
      {
        v13 = v12[2];
        if ((v13 & 1) == 0)
        {
          v9 = 0;
          goto LABEL_33;
        }
        v34 = v13 & 0xFFFFFFFE;
        if (!v12[20])
          goto LABEL_37;
        v9 = _LSBindingListDeactivate();
        if ((_DWORD)v9)
          goto LABEL_33;
        v12 = (_DWORD *)CSStoreGetUnit();
        if (v12)
        {
LABEL_37:
          if (!v12[21] || (v9 = _LSBindingListDeactivate(), !(_DWORD)v9))
          {
            v15 = (void *)MEMORY[0x186DAE7A0]();
            v33 = 0;
            if (_CSStoreWriteToUnit())
              v9 = 0;
            else
              v9 = _LSGetOSStatusFromNSError(v33);

            objc_autoreleasePoolPop(v15);
          }
          goto LABEL_33;
        }
      }
      goto LABEL_34;
    }
    goto LABEL_22;
  }
  v34 = v8 | 1;
  if (Unit[20])
  {
    v9 = _LSBindingListActivate();
    if ((_DWORD)v9)
    {
LABEL_33:

      goto LABEL_23;
    }
    Unit = (_DWORD *)CSStoreGetUnit();
    if (!Unit)
    {
LABEL_34:
      v9 = 4294956481;
      goto LABEL_33;
    }
  }
  if (Unit[21])
  {
    v9 = _LSBindingListActivate();
    if ((_DWORD)v9)
      goto LABEL_33;
  }
  v10 = (void *)MEMORY[0x186DAE7A0]();
  v33 = 0;
  if (_CSStoreWriteToUnit())
    v9 = 0;
  else
    v9 = _LSGetOSStatusFromNSError(v33);

  objc_autoreleasePoolPop(v10);
  if (!(_DWORD)v9)
    goto LABEL_18;
LABEL_23:
  _LSSchemaCacheWrite((uint64_t)v3 + 16, &__block_literal_global_77);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v9;
}

void sub_1829C97D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v18 = va_arg(va2, _QWORD);
  v20 = va_arg(va2, _QWORD);
  v21 = va_arg(va2, _QWORD);
  v22 = va_arg(va2, _QWORD);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);

  _Unwind_Resume(a1);
}

uint64_t _UTTypeRemove(void *a1, int a2)
{
  _LSDatabase *v3;
  __int128 *Unit;
  __int128 v5;
  uint64_t active;
  uint64_t i;
  __int128 v9;
  _LSDatabase *v10[2];
  __int128 v11;
  __int128 v12;
  _BYTE v13[28];

  v3 = a1;
  Unit = (__int128 *)CSStoreGetUnit();
  if (Unit)
  {
    v5 = Unit[3];
    v11 = Unit[2];
    v12 = v5;
    *(_OWORD *)v13 = Unit[4];
    *(_OWORD *)&v13[12] = *(__int128 *)((char *)Unit + 76);
    v9 = *Unit;
    *(_OWORD *)v10 = Unit[1];
    CSMapRemoveValue();
    if (HIDWORD(v9))
    {
      active = _LSBindableDeactivate(v3, a2);
      if ((BYTE8(v9) & 1) != 0)
        active = _UTUpdateActiveTypeForIdentifier(v3, SHIDWORD(v9));
    }
    else
    {
      active = 0;
    }
    if (*(_DWORD *)&v13[16])
    {
      active = _LSBindingListDeactivate();
      _LSBindingListDestroy();
    }
    if (*(_DWORD *)&v13[20])
    {
      active = _LSBindingListDeactivate();
      _LSBindingListDestroy();
    }
    _CSStringRelease();
    LaunchServices::LocalizedString::Remove((LaunchServices::LocalizedString *)v3, (_LSDatabase *)LODWORD(v10[1]));
    for (i = 0; i != 32 && *(_DWORD *)((char *)&v10[1] + i + 4); i += 4)
      _CSStringRelease();
    _CSStringRelease();
    _CSStringRelease();
    _CSStringRelease();
    if (*(_DWORD *)&v13[4])
      _LSPlistRemove((uint64_t)v3, *(int *)&v13[4]);
    CSStoreFreeUnit();
    -[_LSDatabase setTypeDeclarationsChanged:](v3, 1);
  }
  else
  {
    active = 4294957797;
  }

  return active;
}

void sub_1829C9A5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeSearchConformsToTypes(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  return _UTTypeSearchConformsToTypesCommon(a1, a2, 32, a3, a4, a5);
}

uint64_t _UTTypeComparePriority(void *a1, _DWORD *a2, void *a3, _DWORD *a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  char v11;
  int v12;
  int v13;
  int v14;
  int v15;
  BOOL v16;
  int v17;
  _LSDatabase *v19;
  uint64_t UltimateDeclaringBundle;
  uint64_t v21;
  BOOL v22;
  unsigned int v23;
  unsigned int v24;
  LSContext v25;
  _BYTE v26[168];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  if (a2 == a4)
  {
LABEL_36:
    v11 = 0;
    goto LABEL_37;
  }
  v9 = a2[2];
  v10 = a4[2];
  if ((v9 & 0x1000) != 0 && (v10 & 0x1000) == 0)
    goto LABEL_4;
  if ((v9 & 0x1000) == 0 && (v10 & 0x1000) != 0)
  {
LABEL_7:
    v11 = 1;
    goto LABEL_37;
  }
  if (((v10 ^ v9) & 0x40) != 0)
  {
    v16 = (a2[2] & 0x40) == 0;
    goto LABEL_17;
  }
  v12 = a2[2] & 0x820;
  v13 = v10 & 0x820;
  if (a2[3] != a4[3])
    goto LABEL_23;
  v14 = a2[2] & 0x10;
  v15 = v10 & 0x10;
  if (v14 != v15)
  {
    if (!v12 || v14)
    {
      if (!v13 || v15)
        goto LABEL_11;
      if (v14)
      {
        if (_UTTypeTagsAreSuperset(v7, (uint64_t)a2, (uint64_t)a4))
          goto LABEL_7;
        if (!v12)
          goto LABEL_24;
        goto LABEL_32;
      }
    }
    if (!_UTTypeTagsAreSuperset(v7, (uint64_t)a4, (uint64_t)a2))
      goto LABEL_23;
LABEL_4:
    v11 = -1;
    goto LABEL_37;
  }
LABEL_11:
  if (v14 && !v15)
    goto LABEL_7;
  if (v15 && !v14)
    goto LABEL_4;
LABEL_23:
  if ((v12 != 0) != (v13 != 0))
  {
LABEL_24:
    if (v12)
      v11 = 1;
    else
      v11 = -1;
    goto LABEL_37;
  }
LABEL_32:
  v17 = a4[2] ^ a2[2];
  if ((v17 & 2) != 0)
  {
    v16 = (a2[2] & 2) == 0;
    goto LABEL_17;
  }
  if ((v17 & 4) != 0)
  {
    v16 = (a2[2] & 4) == 0;
LABEL_17:
    if (v16)
      v11 = -1;
    else
      v11 = 1;
    goto LABEL_37;
  }
  if (a2[5] == a4[5] && (v17 & 0x2000) == 0)
    goto LABEL_36;
  LaunchServices::BindingEvaluator::BindingEvaluator((LaunchServices::BindingEvaluator *)v26);
  v19 = (_LSDatabase *)v7;
  v25.db = v19;
  v24 = 0;
  UltimateDeclaringBundle = _UTTypeGetUltimateDeclaringBundle(v19, (uint64_t)a2, (int *)&v24);
  v23 = 0;
  v21 = _UTTypeGetUltimateDeclaringBundle(v8, (uint64_t)a4, (int *)&v23);
  if (UltimateDeclaringBundle && v21)
  {
    v11 = LaunchServices::BindingEvaluator::compareBundles((LaunchServices::BindingEvaluator *)v26, &v25, v24, (LSBundleData *)UltimateDeclaringBundle, v23, (LSBundleData *)v21);

    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v26);
    goto LABEL_37;
  }
  v11 = UltimateDeclaringBundle ? 1 : -1;
  v22 = (UltimateDeclaringBundle | v21) != 0;

  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v26);
  if (!v22)
    goto LABEL_36;
LABEL_37:

  return v11;
}

void sub_1829C9CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a3);

  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)va);
  _Unwind_Resume(a1);
}

BOOL _UTTypeTagsAreSuperset(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  _QWORD v18[10];
  int v19;

  v5 = a1;
  v6 = v5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x5812000000;
  v18[3] = __Block_byref_object_copy__51;
  v18[4] = __Block_byref_object_dispose__51;
  memset(&v18[5], 0, 40);
  v19 = 1065353216;
  v7 = *(unsigned int *)(a2 + 80);
  v8 = MEMORY[0x1E0C809B0];
  if ((_DWORD)v7)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = ___UTTypeTagsAreSuperset_block_invoke;
    v17[3] = &unk_1E1046240;
    v17[4] = v18;
    _LSBindingListEnumerate(v5, v7, v17);
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v9 = 1;
  v16 = 1;
  v10 = *(unsigned int *)(a3 + 80);
  if ((_DWORD)v10)
  {
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = ___UTTypeTagsAreSuperset_block_invoke_2;
    v12[3] = &unk_1E1046268;
    v12[4] = v18;
    v12[5] = &v13;
    _LSBindingListEnumerate(v6, v10, v12);
    v9 = *((_BYTE *)v14 + 24) != 0;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v18, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table((uint64_t)&v18[6]);

  return v9;
}

void sub_1829C9E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>>>::~__hash_table(v8);

  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetUltimateDeclaringBundle(void *a1, uint64_t a2, int *a3)
{
  id v5;
  void *v6;
  int *v7;
  int v8;
  uint64_t v9;

  v5 = a1;
  v6 = v5;
  v7 = (int *)(a2 + 20);
  if ((*(_BYTE *)(a2 + 9) & 0x20) != 0)
    v7 = (int *)(_LSGetPlugin((uint64_t)v5, *v7) + 224);
  v8 = *v7;
  if (!*v7)
  {
    v9 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = _LSBundleGet(v6, *v7);
  if (a3)
LABEL_5:
    *a3 = v8;
LABEL_6:

  return v9;
}

void sub_1829C9F38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL _UTTypeHasIcon(uint64_t a1)
{
  return *(_DWORD *)(a1 + 28) != 0;
}

uint64_t _UTGetActiveTypeWithIconForNSStringIdentifier(void *a1, void *a2, _DWORD *a3)
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t active;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;

  v5 = a1;
  v6 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  active = 0;
  active = _UTGetActiveTypeForCFStringIdentifier(v5, v6, &v22);
  v7 = v16[3];
  if (v7 && !*(_DWORD *)(v7 + 28))
  {
    v8 = _UTTypeSearchConformsToTypesCommon((uint64_t)v5, *((_DWORD *)v20 + 6), 32, (uint64_t)typeHasIconFile, 0, (_DWORD *)v20 + 6);
    v16[3] = v8;
  }
  else if (UTTypeIsDynamic(v6))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___UTGetActiveTypeWithIconForNSStringIdentifier_block_invoke;
    v11[3] = &unk_1E1046100;
    v13 = &v15;
    v12 = v5;
    v14 = &v19;
    _UTDynamicEnumerateParentIdentifiers(v6, (uint64_t)v11);

  }
  v9 = v16[3];
  if (v9 && !*(_DWORD *)(v9 + 28))
  {
    v9 = 0;
    v16[3] = 0;
  }
  else if (a3)
  {
    *a3 = *((_DWORD *)v20 + 6);
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void sub_1829CA0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  uint64_t v11;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);

  _Unwind_Resume(a1);
}

BOOL typeHasIconFile(uint64_t a1)
{
  return *(_DWORD *)(*(_QWORD *)(a1 + 24) + 28) != 0;
}

void sub_1829CA1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t _UTTypeGetTypeApplication(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("com.apple.application"), (unsigned int *)a1->schema._cache + 70);
}

uint64_t _UTTypeGetTypeUnixExecutable(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("public.unix-executable"), (unsigned int *)a1->schema._cache + 71);
}

uint64_t _UTTypeGetTypeResolvable(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("com.apple.resolvable"), (unsigned int *)a1->schema._cache + 78);
}

uint64_t _UTTypeGetTypeAVCHDCollection(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("public.avchd-collection"), (unsigned int *)a1->schema._cache + 80);
}

uint64_t _UTTypeGetTypeVolume(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("public.volume"), (unsigned int *)a1->schema._cache + 82);
}

uint64_t _UTTypeGetTypeSymbolicLink(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("public.symlink"), (unsigned int *)a1->schema._cache + 83);
}

uint64_t _UTTypeGetTypeAliasFile(_LSDatabase *a1)
{
  return _UTTypeGetCachedType(a1, CFSTR("com.apple.alias-file"), (unsigned int *)a1->schema._cache + 84);
}

uint64_t _UTTypeSetGeneration(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = CSStoreGetUnit();
  if (result)
    *(_DWORD *)(result + 4) = a3;
  return result;
}

void _UTEnumerateActiveTypes(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  _CSStoreEnumerateUnits();

}

void sub_1829CA4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t _UTTypeIsDenylistedForBinding(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (_UTTypeIsDenylistedForBinding::once != -1)
  {
    dispatch_once(&_UTTypeIsDenylistedForBinding::once, &__block_literal_global_26_1);
    if (v2)
      goto LABEL_3;
LABEL_15:
    v4 = 0;
    goto LABEL_16;
  }
  if (!v1)
    goto LABEL_15;
LABEL_3:
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)_UTTypeIsDenylistedForBinding::denyListedTypes;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (UTTypeEqual(v2, *(CFStringRef *)(*((_QWORD *)&v8 + 1) + 8 * i)))
        {
          v4 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

LABEL_16:
  return v4;
}

void sub_1829CA618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CA6FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _UTTypeGetVisualizationFunctions(id (**a1)(LaunchServices::UTIs *this, LSContext *a2)@<X8>)
{
  *a1 = LaunchServices::UTIs::getSummary;
  a1[1] = (id (*)(LaunchServices::UTIs *, LSContext *))LaunchServices::UTIs::display;
  a1[2] = (id (*)(LaunchServices::UTIs *, LSContext *))LaunchServices::UTIs::copyBindingForVisualization;
}

id LaunchServices::UTIs::getSummary(LaunchServices::UTIs *this, LSContext *a2)
{
  void *Unit;

  Unit = (void *)CSStoreGetUnit();
  if (Unit)
    Unit = (void *)_CSStringCopyCFString();
  return Unit;
}

BOOL LaunchServices::UTIs::display(LaunchServices::UTIs *this, LSContext *a2, unsigned int a3, CSStore2::AttributedStringWriter *a4, LaunchServices::DumpWriter *a5)
{
  uint64_t Unit;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSNumber *v11;
  __CFString *v12;
  NSURL *v13;
  __CFString *v14;
  NSString *v15;

  Unit = CSStoreGetUnit();
  v8 = Unit;
  if (Unit)
  {
    v9 = *(unsigned int *)(Unit + 20);
    if ((*(_BYTE *)(Unit + 9) & 0x20) != 0)
    {
      CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 1604), v9, 0);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, CFSTR("plugin"), v10);
    }
    else
    {
      CSStore2::AttributedStringWriter::link(a4, *(unsigned int *)(*(_QWORD *)this + 20), v9, 0);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      CSStore2::AttributedStringWriter::string(a4, CFSTR("bundle"), v10);
    }

    CSStore2::AttributedStringWriter::string(a4, CFSTR("uti"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v8 + 16));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number(a4, CFSTR("version"), v11);

    CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("localizedDescription"));
    CSStore2::AttributedStringWriter::beginFlags(a4, CFSTR("flags"));
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::missingFlag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::flag();
    CSStore2::AttributedStringWriter::endFlags(a4);
    CSStore2::AttributedStringWriter::stringArray(a4, CFSTR("iconFiles"), (const unsigned int *)(v8 + 28));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("iconName"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("glyphName"));
    CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("icons"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("delegate"));
    CSStore2::AttributedStringWriter::string(a4, CFSTR("kextName"));
    if (!*(_DWORD *)(v8 + 88))
      goto LABEL_12;
    v12 = (__CFString *)_CSStringCopyCFString();
    if (v12)
    {
      v13 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v12);
      v14 = v12;
      if (v13)
      {
        CSStore2::AttributedStringWriter::link(a4, v13, 0);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::string(a4, CFSTR("reference URL"), v15);

LABEL_11:
LABEL_12:
        CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("conforms to"));
        CSStore2::AttributedStringWriter::childUnit(a4, CFSTR("tags"));
        return v8 != 0;
      }
    }
    else
    {
      v14 = CFSTR("-nil-");
    }
    CSStore2::AttributedStringWriter::string(a4, CFSTR("reference URL"), &v14->isa);
    goto LABEL_11;
  }
  return v8 != 0;
}

void sub_1829CAD98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t LaunchServices::UTIs::copyBindingForVisualization(LaunchServices::UTIs *this, LSContext *a2)
{
  return 0;
}

uint64_t _UTTypeSearchConformsToTypesWithBlock::$_0::__invoke(uint64_t a1)
{
  unsigned __int8 v2;

  v2 = 0;
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, unsigned __int8 *))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), &v2);
  return v2;
}

uint64_t _UTTypeSearchConformingTypesWithBlock::$_0::__invoke(uint64_t a1)
{
  unsigned __int8 v2;

  v2 = 0;
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, unsigned __int8 *))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), &v2);
  return v2;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::unordered_map<unsigned int,BOOL>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table((uint64_t)v2 + 24);
    operator delete(v2);
  }
}

void LaunchServices::TypeEvaluator::setSniffIfNeeded(LaunchServices::TypeEvaluator *this, int a2)
{
  char v2;
  NSObject *v4;

  if (a2)
  {
    v2 = a2;
    if (objc_msgSend(*(id *)this, "canIssueIO"))
    {
      *((_BYTE *)this + 8) = v2;
    }
    else
    {
      _LSDefaultLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        LaunchServices::TypeEvaluator::setSniffIfNeeded(v4);

    }
  }
}

id LaunchServices::TypeEvaluator::getTypeIdentifier(uint64_t a1, void **a2, _QWORD *a3)
{
  _LSDServiceDomain *v5;
  LSContext *v6;
  void *v7;
  _LSDServiceDomain *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v15[4];
  char v16;
  void **v17;
  id v18;
  char v19;
  id v20;

  v17 = a2;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v6 = (LSContext *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v5, 0);

  if (!v6)
  {
    if (a3)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v8 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      v9 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v17, v8, 0);

      if (v9)
        v10 = 0;
      else
        v10 = objc_retainAutorelease(v20);
      v7 = 0;
      *a3 = v10;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  LaunchServices::TypeEvaluation::runEvaluator((void **)&v6->db, a1, a3, (uint64_t)v15);
  if (!v16)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_11;
  }
  LaunchServices::TypeEvaluator::Result::getTypeIdentifier(v15, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)

LABEL_11:
  v11 = v7;
  if (v17 && v19)
    _LSContextDestroy(v17);
  v12 = v18;
  v17 = 0;
  v18 = 0;

  v19 = 0;
  v13 = v20;
  v20 = 0;

  return v11;
}

void sub_1829CB0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)va);
  _Unwind_Resume(a1);
}

uint64_t LaunchServices::TypeEvaluator::PrepareMimicForTypeEvaluation(void *a1, uint64_t a2)
{
  uint64_t result;
  id v5;
  uint64_t v6;
  int v7;
  _QWORD v8[5];

  result = _LSPrepareMimicForBundleClass(a1, a2);
  if ((_DWORD)result)
  {
    v8[0] = sel_isSymbolicLink;
    v8[1] = sel_isAliasFile;
    v8[2] = sel_isRegularFile;
    v8[3] = sel_nameWithError_;
    v8[4] = sel_isExecutable;
    v5 = a1;
    v6 = 0;
    LOBYTE(v7) = 1;
    do
    {
      while (!(_BYTE)v7)
      {
        if (++v6 == 5)
        {

          return 0;
        }
        LOBYTE(v7) = 0;
      }
      v7 = objc_msgSend(v5, "populateSimpleSelector:error:", v8[v6++], a2);
    }
    while (v6 != 5);

    if (v7)
      return objc_msgSend(v5, "populateValueForKey:error:", *MEMORY[0x1E0C99968], a2);
    return 0;
  }
  return result;
}

void sub_1829CB208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN14LaunchServices14TypeEvaluationL15resolveBaseTypeERNS0_5StateEPU15__autoreleasingP7NSError_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C99958];
  v4[0] = *MEMORY[0x1E0C99970];
  v4[1] = v0;
  v5[0] = CFSTR("public.named-pipe");
  v5[1] = CFSTR("public.character-special");
  v1 = *MEMORY[0x1E0C99980];
  v4[2] = *MEMORY[0x1E0C99950];
  v4[3] = v1;
  v5[2] = CFSTR("public.block-special");
  v5[3] = CFSTR("public.socket");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)LaunchServices::TypeEvaluation::resolveBaseType(LaunchServices::TypeEvaluation::State &,NSError * {__autoreleasing}*)::posixUTIs;
  LaunchServices::TypeEvaluation::resolveBaseType(LaunchServices::TypeEvaluation::State &,NSError * {__autoreleasing}*)::posixUTIs = v2;

}

void ___ZN14LaunchServices14TypeEvaluationL14gnitsFileNamesEv_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E1075A28);
  v1 = (void *)LaunchServices::TypeEvaluation::gnitsFileNames(void)::result;
  LaunchServices::TypeEvaluation::gnitsFileNames(void)::result = v0;

}

void sub_1829CB610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,void *a26)
{

  _Unwind_Resume(a1);
}

void sub_1829CB728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CB798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CBAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a17);
  _Block_object_dispose(&a21, 8);

  _Unwind_Resume(a1);
}

void sub_1829CBCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;

  LaunchServices::Database::Context::~Context((LaunchServices::Database::Context *)&a9);
  _Unwind_Resume(a1);
}

void sub_1829CBDCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CBE38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1829CBEEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CBF7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CBFE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CC250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  _Block_object_dispose(&a26, 8);
  *(_QWORD *)(v27 + 120) = v26;
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100]((void ***)(v28 - 96));
  _Block_object_dispose((const void *)(v28 - 144), 8);

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__20_0(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__21_0(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 48);
  std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](&v1);
}

void sub_1829CC3C0(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

id std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::push_back[abi:nn180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  id result;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  int64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  int64x2_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    v13 = 2 * v12;
    if (2 * v12 <= v11 + 1)
      v13 = v11 + 1;
    if (v12 >= 0x555555555555555)
      v14 = 0xAAAAAAAAAAAAAAALL;
    else
      v14 = v13;
    v30 = v4;
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>>(v4, v14);
      v17 = v16;
    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = &v15[24 * v11];
    *(_QWORD *)v18 = *(id *)a2;
    v19 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(v18 + 13) = *(_QWORD *)(a2 + 13);
    *((_QWORD *)v18 + 1) = v19;
    v21 = (_QWORD *)*a1;
    v20 = (_QWORD *)a1[1];
    if (v20 == (_QWORD *)*a1)
    {
      v25 = vdupq_n_s64((unint64_t)v20);
      v22 = v18;
    }
    else
    {
      v22 = v18;
      do
      {
        v23 = *(v20 - 3);
        v20 -= 3;
        *v20 = 0;
        *(v22 - 3) = v23;
        v22 -= 3;
        v24 = v20[1];
        *(_QWORD *)((char *)v22 + 13) = *(_QWORD *)((char *)v20 + 13);
        v22[1] = v24;
      }
      while (v20 != v21);
      v25 = *(int64x2_t *)a1;
    }
    v10 = v18 + 24;
    *a1 = v22;
    a1[1] = v18 + 24;
    v28 = v25;
    v26 = a1[2];
    a1[2] = &v15[24 * v17];
    v29 = v26;
    v27 = v25.i64[0];
    result = (id)std::__split_buffer<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::~__split_buffer((uint64_t)&v27);
  }
  else
  {
    result = *(id *)a2;
    *v7 = result;
    v9 = *(_QWORD *)(a2 + 13);
    v7[1] = *(_QWORD *)(a2 + 8);
    *(_QWORD *)((char *)v7 + 13) = v9;
    v10 = v7 + 3;
  }
  a1[1] = v10;
  return result;
}

void sub_1829CC69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1829CC7C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CC9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CCF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CD240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CD30C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CD7F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CD878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CDB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  void *v33;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table(a9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__239(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::__hash_table(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t __Block_byref_object_dispose__240(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,LSApplicationRecordUpdateAvailability>>>::~__hash_table(a1 + 48);
}

void sub_1829CDD90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CDE94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CDEE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CDFBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CE074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829CE1A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829CE224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 3);
        v4 -= 24;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a2);
}

uint64_t std::__split_buffer<LaunchServices::Types::EnumeratedTypeUnitOrDynamicTypeIdentifier>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1829CE9F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CEC9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CEF2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CF24C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CF304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CF464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CF4F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829CF6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1829CF798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829D054C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1829D0688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  uint64_t v15;

  _Unwind_Resume(a1);
}

void sub_1829D0A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

unint64_t computeEffectiveUnitsForPhase(uint64_t a1, unint64_t a2, void *a3, double a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 > 0.0 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    v14 = v13 / a4 * 100.0;
    if ((unint64_t)v14 <= 1)
      v15 = 1;
    else
      v15 = (unint64_t)v14;
    if (v13 <= 0.0)
      a2 = (unint64_t)v14;
    else
      a2 = v15;
  }

  return a2;
}

void sub_1829D19F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_sync_exit(obj);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

void sub_1829D214C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829D27A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829D2A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;

  objc_sync_exit(v18);
  _Unwind_Resume(a1);
}

void sub_1829D2EA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829D318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_1829D32E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1829D3528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void addPluginDataToNotificationDict(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "setObject:forKey:", v7, *MEMORY[0x1E0C9AE78]);
    objc_msgSend(v3, "effectiveBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("NSExtensionIdentifier"));
    objc_msgSend(v3, "bundleVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x1E0C9AE90]);
    objc_msgSend(v3, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("_LSBundlePath"));
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v12, "setObject:forKey:", v6, v5);
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v11 = 0;
    v6 = 0;
  }

}

void sub_1829D52A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1829D5F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1829D6354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__288(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x186DAE9BC](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__289(uint64_t a1)
{

}

void sub_1829D8148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1829D82FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

uint64_t initMKBDeviceUnlockedSinceBoot()
{
  void *v0;

  v0 = (void *)MobileKeyBagLibrary_frameworkLibrary;
  if (!MobileKeyBagLibrary_frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
    MobileKeyBagLibrary_frameworkLibrary = (uint64_t)v0;
  }
  softLinkMKBDeviceUnlockedSinceBoot[0] = (uint64_t (*)())dlsym(v0, "MKBDeviceUnlockedSinceBoot");
  return softLinkMKBDeviceUnlockedSinceBoot[0]();
}

SEL __recordSelectorsForPluginNotification_block_invoke()
{
  uint64_t v0;
  SEL result;

  v0 = 0;
  recordSelectorsForPluginNotification_registeredSels = (uint64_t)malloc_type_malloc(0x30uLL, 0x80040B8603338uLL);
  *(_QWORD *)(recordSelectorsForPluginNotification_registeredSels + 40) = 0;
  do
  {
    result = sel_registerName(recordSelectorsForPluginNotification_unregisteredSels[v0]);
    *(_QWORD *)(recordSelectorsForPluginNotification_registeredSels + v0 * 8) = result;
    ++v0;
  }
  while (v0 != 5);
  return result;
}

uint64_t LSPersonaTypeForPersonaAttributes(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isSystemPersona") & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isPersonalPersona") & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEnterprisePersona"))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1829D91C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829D9290(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829D9350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829D9654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1829D9A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1829D9BE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1829D9D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1829D9DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1829D9E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1829D9F88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1829DA3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1829DA6D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _AppleIDAuthenticationAddAppleIDWithBlock(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v7 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "AddAppleID: This operation is not supported anymore\n", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___AppleIDAuthenticationAddAppleIDWithBlock_block_invoke;
  block[3] = &unk_1E1046800;
  block[4] = a5;
  dispatch_async(a4, block);
  return 1;
}

uint64_t _AppleIDAuthenticationAddAppleID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  dispatch_object_t object;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v6 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1174405120;
  v12[2] = ___AppleIDAuthenticationAddAppleID_block_invoke;
  v12[3] = &unk_1E1046828;
  v12[4] = &v15;
  v12[5] = a4;
  object = v5;
  v14 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticationAddAppleIDWithBlock(v7, v8, v9, v6, (uint64_t)v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v14)
    dispatch_release(object);
  v10 = *((unsigned __int8 *)v16 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v15, 8);
  return v10;
}

void __copy_helper_block_8_48c14_ZTS9Semaphore(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  v2 = *(NSObject **)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v2;
  *(_BYTE *)(a1 + 56) = 1;
  dispatch_retain(v2);
}

void __destroy_helper_block_8_48c14_ZTS9Semaphore(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

uint64_t _AppleIDAuthenticationForgetAppleIDWithBlock(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v6 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "ForgetAppleID: This operation is not supported anymore\n", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___AppleIDAuthenticationForgetAppleIDWithBlock_block_invoke;
  block[3] = &unk_1E1046860;
  block[4] = a4;
  dispatch_async(a3, block);
  return 1;
}

uint64_t _AppleIDAuthenticationForgetAppleID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  dispatch_object_t object;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v4 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v5 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___AppleIDAuthenticationForgetAppleID_block_invoke;
  v10[3] = &unk_1E103E480;
  v10[4] = &v13;
  v10[5] = a3;
  object = v4;
  v12 = 1;
  dispatch_retain(v4);
  _AppleIDAuthenticationForgetAppleIDWithBlock(v6, v7, v5, (uint64_t)v10);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (v12)
    dispatch_release(object);
  v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v4);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t _AppleIDAuthenticationCopyAppleIDsWithBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[16];

  v5 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "CopyAppleIDs: Deferring to sharingd. \n", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___AppleIDAuthenticationCopyAppleIDsWithBlock_block_invoke;
  v7[3] = &unk_1E1046888;
  v7[4] = a3;
  ((void (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAppleID[0])(a2, (uint64_t)v7);
  return 1;
}

uint64_t _AppleIDAuthenticationCopyAppleIDs(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];
  dispatch_object_t object;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v4 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1174405120;
  v8[2] = ___AppleIDAuthenticationCopyAppleIDs_block_invoke;
  v8[3] = &unk_1E103E3A8;
  v8[4] = &v11;
  v8[5] = a2;
  object = v3;
  v10 = 1;
  dispatch_retain(v3);
  _AppleIDAuthenticationCopyAppleIDsWithBlock(v5, v4, (uint64_t)v8);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  if (v10)
    dispatch_release(object);
  v6 = v12[3];
  dispatch_release(v3);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t _AppleIDAuthenticationCopyCertificateInfoWithBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[16];

  v8 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "CopyCertificateInfo: Deferring to sharingd. \n", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 0x40000000;
  v10[2] = ___AppleIDAuthenticationCopyCertificateInfoWithBlock_block_invoke;
  v10[3] = &unk_1E10468B0;
  v10[4] = a5;
  softLinkSFAppleIDClientCopyCertificateInfo(a1, a4, (uint64_t)v10);
  return 1;
}

uint64_t _AppleIDAuthenticationCopyCertificateInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  dispatch_object_t object;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v6 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v7 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1174405120;
  v12[2] = ___AppleIDAuthenticationCopyCertificateInfo_block_invoke;
  v12[3] = &unk_1E10468D8;
  v12[4] = &v15;
  v12[5] = a4;
  object = v6;
  v14 = 1;
  dispatch_retain(v6);
  _AppleIDAuthenticationCopyCertificateInfoWithBlock(a1, v8, v9, v7, (uint64_t)v12);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (v14)
    dispatch_release(object);
  v10 = v16[3];
  dispatch_release(v6);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t _AppleIDAuthenticationCopyMyInfoWithBlock(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  NSObject *v6;
  uint64_t result;
  _QWORD block[5];
  uint8_t buf[16];

  v6 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "CopyMyInfo: this operation is not supported anymore.\n", buf, 2u);
  }
  result = 0;
  if (a3)
  {
    if (a4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = ___AppleIDAuthenticationCopyMyInfoWithBlock_block_invoke;
      block[3] = &unk_1E1046910;
      block[4] = a4;
      dispatch_async(a3, block);
      return 1;
    }
  }
  return result;
}

uint64_t _AppleIDAuthenticationCopyMyInfo(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  dispatch_object_t object;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v4 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v5 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___AppleIDAuthenticationCopyMyInfo_block_invoke;
  v10[3] = &unk_1E103E3E0;
  v10[4] = &v13;
  v10[5] = a3;
  object = v4;
  v12 = 1;
  dispatch_retain(v4);
  if (_AppleIDAuthenticationCopyMyInfoWithBlock(v6, v7, v5, (uint64_t)v10))
  {
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
  else if (a3)
  {
    *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -99, 0);
  }
  if (v12)
    dispatch_release(object);
  v8 = v14[3];
  dispatch_release(v4);
  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t _AppleIDAuthenticationFindPersonWithBlock(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v7;
  const void *Value;
  CFTypeID TypeID;
  const void *v10;
  CFTypeID v11;
  const void *ValueAtIndex;
  CFTypeID v13;
  CFTypeID v14;
  _QWORD v16[5];
  uint8_t buf[16];

  v7 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "FindPerson: Deferring to sharingd.", buf, 2u);
  }
  if (!a1)
  {
    CFArrayGetTypeID();
    CFArrayGetTypeID();
LABEL_24:
    ValueAtIndex = 0;
    goto LABEL_25;
  }
  Value = CFDictionaryGetValue(a1, CFSTR("email"));
  TypeID = CFArrayGetTypeID();
  if (Value && TypeID && CFGetTypeID(Value) != TypeID)
    Value = 0;
  v10 = CFDictionaryGetValue(a1, CFSTR("phone"));
  v11 = CFArrayGetTypeID();
  if (v10 && v11 && CFGetTypeID(v10) != v11)
    v10 = 0;
  if (!Value
    || !CFArrayGetCount((CFArrayRef)Value)
    || (ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, 0), v13 = CFStringGetTypeID(), !ValueAtIndex)
    || v13 && CFGetTypeID(ValueAtIndex) != v13)
  {
    if (!v10)
      goto LABEL_24;
    if (!CFArrayGetCount((CFArrayRef)v10))
      goto LABEL_24;
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v10, 0);
    v14 = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (v14 && CFGetTypeID(ValueAtIndex) != v14)
        goto LABEL_24;
    }
  }
LABEL_25:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 0x40000000;
  v16[2] = ___AppleIDAuthenticationFindPersonWithBlock_block_invoke;
  v16[3] = &unk_1E103E438;
  v16[4] = a4;
  ((void (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyPersonInfo[0])((uint64_t)ValueAtIndex, a3, (uint64_t)v16);
  return 1;
}

uint64_t _AppleIDAuthenticationFindPerson(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  v5 = operator new();
  *(_QWORD *)v5 = dispatch_semaphore_create(0);
  *(_BYTE *)(v5 + 8) = 1;
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___AppleIDAuthenticationFindPerson_block_invoke;
  v9[3] = &unk_1E1046938;
  v9[4] = &v10;
  v9[5] = a3;
  v9[6] = v5;
  _AppleIDAuthenticationFindPersonWithBlock(a1, v6, getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue, (uint64_t)v9);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)v5, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_BYTE *)(v5 + 8))
    dispatch_release(*(dispatch_object_t *)v5);
  MEMORY[0x186DADEF4](v5, 0x1020C405F07FB98);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t _AppleIDCopySecIdentityForAppleIDAccount(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_global_t global_queue;
  int v8;
  uint64_t v9;
  _QWORD v11[6];
  dispatch_object_t object;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v6 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "CopySecIdentity: Deferring to sharingd. \n", (uint8_t *)v11, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1174405120;
  v11[2] = ___ZL41__AppleIDCopySecIdentityForAppleIDAccountPK10__CFStringPK14__CFDictionaryPP9__CFError_block_invoke;
  v11[3] = &unk_1E1046AD0;
  v11[4] = &v14;
  v11[5] = &v18;
  object = v5;
  v13 = 1;
  dispatch_retain(v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyIdentity[0])(a1, (uint64_t)global_queue, (uint64_t)v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v8 = *((_DWORD *)v19 + 6);
    if (v8)
      *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFC8], v8, 0);
  }
  v9 = v15[3];
  if (v13)
    dispatch_release(object);
  dispatch_release(v5);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

CFStringRef _AppleIDCopyDSIDForCertificate(uint64_t a1, CFErrorRef *a2)
{
  NSObject *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  const __CFString *v9;
  const __CFString *v10;
  CFIndex Length;
  uint64_t v12;
  char v13;
  char v14;
  const __CFString *v15;
  CFErrorRef v16;
  CFStringRef v17;
  CFIndex v19;
  const __CFAllocator *v20;
  CFIndex v21;
  uint8_t v22[16];
  CFRange v23;

  v4 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "AppleIDCopyDSIDForCertificate\n", v22, 2u);
  }
  if (a1)
  {
    v5 = (const __CFArray *)SecCertificateCopyCommonNames();
    v6 = v5;
    if (v5
      && CFArrayGetCount(v5) >= 1
      && (ValueAtIndex = CFArrayGetValueAtIndex(v6, 0), TypeID = CFStringGetTypeID(), ValueAtIndex)
      && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID)
      && (v9 = (const __CFString *)CFRetain(ValueAtIndex)) != 0)
    {
      v10 = v9;
      Length = CFStringGetLength(v9);
      v12 = 0;
      v13 = 1;
      while (1)
      {
        v14 = v13;
        v15 = off_1E1046958[v12];
        if (CFStringHasPrefix(v10, v15))
          break;
        v13 = 0;
        v12 = 1;
        if ((v14 & 1) == 0)
          goto LABEL_35;
      }
      v19 = CFStringGetLength(v15);
      if (v19 < Length)
      {
        v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v21 = v19 + 1;
        v23.length = CFStringGetLength(v10) + ~v19;
        v23.location = v21;
        v17 = CFStringCreateWithSubstring(v20, v10, v23);
        v13 = 0;
        goto LABEL_36;
      }
      v13 = 0;
LABEL_35:
      v17 = 0;
LABEL_36:
      v16 = 0;
      if (!a2)
      {
LABEL_18:
        if (v6)
          CFRelease(v6);
        if ((v13 & 1) == 0)
          CFRelease(v10);
        if (!a2)
          goto LABEL_28;
        goto LABEL_26;
      }
    }
    else
    {
      v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFC8], -1, 0);
      v10 = 0;
      v17 = 0;
      v13 = 1;
      if (!a2)
        goto LABEL_18;
    }
    if (!v17 && !v16)
      v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -10, 0);
    goto LABEL_18;
  }
  if (!a2)
    return 0;
  v16 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -99, 0);
  v17 = 0;
LABEL_26:
  if (!v17)
  {
    *a2 = v16;
    return v17;
  }
LABEL_28:
  if (v16)
    CFRelease(v16);
  return v17;
}

uint64_t _AppleIDAuthenticatePasswordWithBlock(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v7 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "AuthenticatePasswordWithBlock: This operation is not supported anymore\n", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___AppleIDAuthenticatePasswordWithBlock_block_invoke;
  block[3] = &unk_1E1046970;
  block[4] = a5;
  dispatch_async(a4, block);
  return 1;
}

uint64_t _AppleIDAuthenticatePassword(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  dispatch_object_t object;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v6 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1174405120;
  v12[2] = ___AppleIDAuthenticatePassword_block_invoke;
  v12[3] = &unk_1E1046998;
  v12[4] = &v15;
  v12[5] = a4;
  object = v5;
  v14 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticatePasswordWithBlock(v7, v8, v9, v6, (uint64_t)v12);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v14)
    dispatch_release(object);
  v10 = *((unsigned __int8 *)v16 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t _AppleIDAuthenticationCopyStatusWithBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[16];

  v5 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "CopyStatus: Deferring to sharingd. \n", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___AppleIDAuthenticationCopyStatusWithBlock_block_invoke;
  v7[3] = &unk_1E10469D0;
  v7[4] = a3;
  ((void (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAccountInfo[0])(a2, (uint64_t)v7);
  return 1;
}

uint64_t _AppleIDAuthenticationCopyStatus(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  dispatch_object_t object;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v5 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v6 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___AppleIDAuthenticationCopyStatus_block_invoke;
  v10[3] = &unk_1E10469F8;
  v10[4] = &v13;
  v10[5] = a2;
  v10[6] = a3;
  object = v5;
  v12 = 1;
  dispatch_retain(v5);
  _AppleIDAuthenticationCopyStatusWithBlock(v7, v6, (uint64_t)v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v12)
    dispatch_release(object);
  v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __copy_helper_block_8_56c14_ZTS9Semaphore(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  v2 = *(NSObject **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v2;
  *(_BYTE *)(a1 + 64) = 1;
  dispatch_retain(v2);
}

void __destroy_helper_block_8_56c14_ZTS9Semaphore(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64))
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
}

uint64_t _AppleIDUpdateLinkedIdentityProvisioningWithBlock(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  NSObject *v7;
  _QWORD v9[6];
  uint8_t buf[16];

  v7 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "UpdateLinkedIdentityProvisioning: Executing from framework\n", buf, 2u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___AppleIDUpdateLinkedIdentityProvisioningWithBlock_block_invoke;
  v9[3] = &unk_1E1046A30;
  v9[4] = a4;
  v9[5] = a1;
  dispatch_async(a3, v9);
  return 1;
}

uint64_t _AppleIDUpdateLinkedIdentityProvisioning(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];
  dispatch_object_t object;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v5 = dispatch_semaphore_create(0);
  if (getAppleIDAuthDispatchQueue(void)::sOnce != -1)
    dispatch_once(&getAppleIDAuthDispatchQueue(void)::sOnce, &__block_literal_global_83);
  v6 = getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1174405120;
  v10[2] = ___AppleIDUpdateLinkedIdentityProvisioning_block_invoke;
  v10[3] = &unk_1E1046A58;
  v10[4] = &v13;
  v10[5] = a3;
  object = v5;
  v12 = 1;
  dispatch_retain(v5);
  _AppleIDUpdateLinkedIdentityProvisioningWithBlock(a1, v7, v6, (uint64_t)v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v12)
    dispatch_release(object);
  v8 = *((unsigned __int8 *)v14 + 24);
  dispatch_release(v5);
  _Block_object_dispose(&v13, 8);
  return v8;
}

dispatch_queue_t ___ZL27getAppleIDAuthDispatchQueuev_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("AppleIDAuthDispatchQueue", 0);
  getAppleIDAuthDispatchQueue(void)::sAppleIDAuthDispatchQueue = (uint64_t)result;
  return result;
}

uint64_t initSFAppleIDClientCopyMyAppleID(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  softLinkSFAppleIDClientCopyMyAppleID[0] = (uint64_t (*)())dlsym(v4, "SFAppleIDClientCopyMyAppleID");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAppleID[0])(a1, a2);
}

uint64_t initSFAppleIDClientCopyCertificateInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }
  softLinkSFAppleIDClientCopyCertificateInfo = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyCertificateInfo");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyCertificateInfo)(a1, a2, a3);
}

uint64_t initSFAppleIDClientCopyPersonInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }
  softLinkSFAppleIDClientCopyPersonInfo[0] = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyPersonInfo");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyPersonInfo[0])(a1, a2, a3);
}

uint64_t ___ZL41handleSFAppleIDClientCopyPersonInfoResultPK9__CFArrayiU13block_pointerFvS1_hP9__CFErrorE_block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  CFTypeID TypeID;
  const void *v7;
  const void *Value;
  CFTypeID v9;
  const void *v10;
  const void *v11;
  CFTypeID v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v5 = Mutable;
    TypeID = CFDictionaryGetTypeID();
    if (a2 && (!TypeID || CFGetTypeID(a2) == TypeID))
    {
      v7 = (const void *)getkSFAppleIDClientPersonInfoAccountIdentifierCFKey[0]();
      if (v7)
      {
        Value = CFDictionaryGetValue(a2, v7);
        v9 = CFStringGetTypeID();
        if (Value && (!v9 || CFGetTypeID(Value) == v9))
          CFDictionaryAddValue(v5, CFSTR("certCN"), Value);
      }
      else
      {
        CFStringGetTypeID();
      }
      v10 = (const void *)getkSFAppleIDClientPersonInfoMatchedValueCFKey[0]();
      if (v10)
      {
        v11 = CFDictionaryGetValue(a2, v10);
        v12 = CFStringGetTypeID();
        if (v11 && (!v12 || CFGetTypeID(v11) == v12))
          CFDictionaryAddValue(v5, CFSTR("value"), v11);
      }
      else
      {
        CFStringGetTypeID();
      }
    }
    if (CFDictionaryGetCount(v5))
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v5);
    CFRelease(v5);
  }
  return 1;
}

uint64_t initkSFAppleIDClientPersonInfoAccountIdentifierCFKey(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "kSFAppleIDClientPersonInfoAccountIdentifierCFKey");
  constantkSFAppleIDClientPersonInfoAccountIdentifierCFKey = result;
  getkSFAppleIDClientPersonInfoAccountIdentifierCFKey[0] = kSFAppleIDClientPersonInfoAccountIdentifierCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientPersonInfoAccountIdentifierCFKeyFunction(void)
{
  return constantkSFAppleIDClientPersonInfoAccountIdentifierCFKey;
}

uint64_t initkSFAppleIDClientPersonInfoMatchedValueCFKey(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "kSFAppleIDClientPersonInfoMatchedValueCFKey");
  constantkSFAppleIDClientPersonInfoMatchedValueCFKey = result;
  getkSFAppleIDClientPersonInfoMatchedValueCFKey[0] = kSFAppleIDClientPersonInfoMatchedValueCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientPersonInfoMatchedValueCFKeyFunction(void)
{
  return constantkSFAppleIDClientPersonInfoMatchedValueCFKey;
}

intptr_t ___ZL41__AppleIDCopySecIdentityForAppleIDAccountPK10__CFStringPK14__CFDictionaryPP9__CFError_block_invoke(_QWORD *a1, uint64_t a2, int a3)
{
  NSObject *v3;
  uint64_t v4;

  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v4 = a1[5];
  v3 = a1[6];
  *(_DWORD *)(*(_QWORD *)(v4 + 8) + 24) = a3;
  return dispatch_semaphore_signal(v3);
}

uint64_t initSFAppleIDClientCopyIdentity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v6 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v6;
  }
  softLinkSFAppleIDClientCopyIdentity[0] = (uint64_t (*)())dlsym(v6, "SFAppleIDClientCopyIdentity");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkSFAppleIDClientCopyIdentity[0])(a1, a2, a3);
}

uint64_t initSFAppleIDClientCopyMyAccountInfo(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v4 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v4;
  }
  softLinkSFAppleIDClientCopyMyAccountInfo[0] = (uint64_t (*)())dlsym(v4, "SFAppleIDClientCopyMyAccountInfo");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkSFAppleIDClientCopyMyAccountInfo[0])(a1, a2);
}

uint64_t initkSFAppleIDClientAccountInfoAppleIDCFKey(void)
{
  void *v0;
  uint64_t result;

  v0 = (void *)SharingLibrary(void)::frameworkLibrary;
  if (!SharingLibrary(void)::frameworkLibrary)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
    SharingLibrary(void)::frameworkLibrary = (uint64_t)v0;
  }
  result = *(_QWORD *)dlsym(v0, "kSFAppleIDClientAccountInfoAppleIDCFKey");
  constantkSFAppleIDClientAccountInfoAppleIDCFKey = result;
  getkSFAppleIDClientAccountInfoAppleIDCFKey = kSFAppleIDClientAccountInfoAppleIDCFKeyFunction;
  return result;
}

uint64_t kSFAppleIDClientAccountInfoAppleIDCFKeyFunction(void)
{
  return constantkSFAppleIDClientAccountInfoAppleIDCFKey;
}

uint64_t AppleIDGetLogHandle()
{
  if (AppleIDGetLogHandle::sOnce != -1)
    dispatch_once(&AppleIDGetLogHandle::sOnce, &__block_literal_global_84);
  return AppleIDGetLogHandle::sHandle;
}

const __CFArray *CFArrayApplyBlock(const __CFArray *result, uint64_t a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void *ValueAtIndex;
  BOOL v8;

  if (result)
  {
    v3 = result;
    Count = CFArrayGetCount(result);
    v5 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v6 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, v6);
        result = (const __CFArray *)(*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex);
        if ((_DWORD)result)
          v8 = v5 == v6;
        else
          v8 = 1;
        ++v6;
      }
      while (!v8);
    }
  }
  return result;
}

uint64_t CFDictionaryApplyBlock(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v2;
  CFIndex Count;
  CFIndex v6;
  unint64_t v7;
  const __CFDictionary *Copy;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void **values;
  void *v16;
  uint64_t v17;
  void **keys;
  void *v19;
  uint64_t v20;

  v2 = 0;
  if (a1 && a2)
  {
    Count = CFDictionaryGetCount(a1);
    v6 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v7 = Count;
      Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
      keys = 0;
      v19 = 0;
      v20 = 0;
      std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](&keys, v7);
      v9 = (char *)v19;
      bzero(v19, 8 * v7);
      v19 = &v9[8 * v7];
      values = 0;
      v16 = 0;
      v17 = 0;
      std::vector<void({block_pointer} {__strong})(void),std::allocator<void({block_pointer} {__strong})(void)>>::__vallocate[abi:nn180100](&values, v7);
      v10 = (char *)v16;
      bzero(v16, 8 * v7);
      v16 = &v10[8 * v7];
      CFDictionaryGetKeysAndValues(Copy, (const void **)keys, (const void **)values);
      v11 = 0;
      do
      {
        v12 = (*(uint64_t (**)(uint64_t, void *, void *))(a2 + 16))(a2, keys[v11], values[v11]);
        if ((_DWORD)v12)
          v13 = v6 == v11;
        else
          v13 = 1;
        ++v11;
      }
      while (!v13);
      v2 = v12;
      CFRelease(Copy);
      if (values)
      {
        v16 = values;
        operator delete(values);
      }
      if (keys)
      {
        v19 = keys;
        operator delete(keys);
      }
    }
  }
  return v2;
}

CFErrorRef _CFErrorCreateCSIdentityErrorWithInfo(CFIndex a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFDictionary *a5, const char *a6, const char *a7, unsigned int a8)
{
  const __CFAllocator *v15;
  const char *v16;
  CFStringRef v17;
  const char *v18;
  CFStringRef v19;
  CFNumberRef v20;
  __CFDictionary *MutableCopy;
  __CFDictionary *v22;
  const void *v23;
  BOOL v24;
  const void *v26;
  BOOL v27;
  const void *v29;
  BOOL v30;
  CFErrorRef v32;
  uint64_t valuePtr;

  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a6)
    v16 = a6;
  else
    v16 = "-";
  v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16, 0x8000100u);
  if (a7)
    v18 = a7;
  else
    v18 = "-";
  v19 = CFStringCreateWithCString(v15, v18, 0x8000100u);
  valuePtr = a8;
  v20 = CFNumberCreate(v15, kCFNumberLongLongType, &valuePtr);
  if (a5)
    MutableCopy = CFDictionaryCreateMutableCopy(v15, 0, a5);
  else
    MutableCopy = CFDictionaryCreateMutable(v15, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v22 = MutableCopy;
  v23 = (const void *)*MEMORY[0x1E0C9AFE8];
  if (MutableCopy)
    v24 = a2 == 0;
  else
    v24 = 1;
  if (!v24 && v23 != 0)
    CFDictionaryAddValue(MutableCopy, v23, a2);
  v26 = (const void *)*MEMORY[0x1E0C9AFE0];
  if (v22)
    v27 = a3 == 0;
  else
    v27 = 1;
  if (!v27 && v26 != 0)
    CFDictionaryAddValue(v22, v26, a3);
  v29 = (const void *)*MEMORY[0x1E0C9AFF0];
  if (v22)
    v30 = a4 == 0;
  else
    v30 = 1;
  if (!v30 && v29 != 0)
    CFDictionaryAddValue(v22, v29, a4);
  if (v17 && v22)
    CFDictionaryAddValue(v22, CFSTR("function"), v17);
  if (v19 && v22)
    CFDictionaryAddValue(v22, CFSTR("file"), v19);
  if (v20 && v22)
  {
    CFDictionaryAddValue(v22, CFSTR("line"), v20);
    v32 = CFErrorCreate(v15, CFSTR("CSIdentityErrorDomain"), a1, v22);
  }
  else
  {
    v32 = CFErrorCreate(v15, CFSTR("CSIdentityErrorDomain"), a1, v22);
    if (!v22)
      goto LABEL_45;
  }
  CFRelease(v22);
LABEL_45:
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if (v17)
    CFRelease(v17);
  return v32;
}

uint64_t _CSLinkCurrentUserToAppleIDWithVerifiedAccountIdentifier()
{
  return 1;
}

void _CSAddAppleIDAccountUsingCompletionBlock(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  CFErrorRef v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = ___CSAddAppleIDAccountUsingCompletionBlock_block_invoke;
  v6[3] = &unk_1E1046C30;
  v6[4] = a4;
  if (!_AppleIDAuthenticationAddAppleIDWithBlock(a1, a2, 0, a3, (uint64_t)v6))
  {
    v5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("CSIdentityErrorDomain"), -99, 0);
    (*(void (**)(uint64_t, CFErrorRef))(a4 + 16))(a4, v5);
    if (v5)
      CFRelease(v5);
  }
}

uint64_t _CSAddAppleIDAccount(CFTypeRef cf, CFTypeRef a2)
{
  NSObject *global_queue;
  _QWORD v6[6];

  if (cf)
    CFRetain(cf);
  if (a2)
    CFRetain(a2);
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = ___CSAddAppleIDAccount_block_invoke;
  v6[3] = &__block_descriptor_tmp_55;
  v6[4] = cf;
  v6[5] = a2;
  dispatch_async(global_queue, v6);
  return 1;
}

uint64_t _CSUnlinkCurrentUserFromAppleID()
{
  return 1;
}

uint64_t _CSRemoveAppleIDAccount(uint64_t a1, uint64_t a2)
{
  return _AppleIDAuthenticationForgetAppleID(a1, 0, a2);
}

uint64_t _CSCopyAppleIDAccounts()
{
  return _AppleIDAuthenticationCopyAppleIDs(0, 0);
}

const void *_CSCopyAccountStatusForAppleID(const __CFString *a1, CFErrorRef *a2)
{
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  CFMutableStringRef MutableCopy;
  __CFString *v7;
  const __CFLocale *System;
  const void *v9;
  const void *v10;
  CFDictionaryRef theDict;

  theDict = 0;
  if (!_AppleIDAuthenticationCopyStatus(0, (uint64_t)&theDict, (uint64_t)a2))
  {
    v10 = 0;
    if (!a2)
      return v10;
    goto LABEL_13;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("AccountStatuses"));
  if (Value
    && (v5 = Value, (MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a1)) != 0))
  {
    v7 = MutableCopy;
    System = CFLocaleGetSystem();
    CFStringLowercase(v7, System);
    v9 = CFDictionaryGetValue(v5, v7);
    v10 = v9;
    if (v9)
    {
      CFRetain(v9);
    }
    else if (a2)
    {
      *a2 = _CFErrorCreateCSIdentityErrorWithInfo(-115, CFSTR("The requested account does not exist"), 0, 0, 0, "_CSCopyAccountStatusForAppleID", "/Library/Caches/com.apple.xbs/Sources/CoreServices/OSServices.subprj/IdentityServices/CSAuthenticationSupportPriv.cp", 0xD8u);
    }
    CFRelease(v7);
  }
  else
  {
    v10 = 0;
  }
  CFRelease(theDict);
  if (a2)
  {
LABEL_13:
    if (!v10 && !*a2)
      *a2 = _CFErrorCreateCSIdentityErrorWithInfo(-115, CFSTR("The requested account does not exist"), 0, 0, 0, "_CSCopyAccountStatusForAppleID", "/Library/Caches/com.apple.xbs/Sources/CoreServices/OSServices.subprj/IdentityServices/CSAuthenticationSupportPriv.cp", 0xE0u);
  }
  return v10;
}

AppleIDIdentityAuthority *_CSCreateAppleIDIdentityWithNameAndAccountIdentifier(Identity *a1, const __CFString *a2, const __CFString *a3)
{
  unint64_t v6;
  const __CFAllocator *v7;
  AppleIDIdentityAuthority *result;
  AppleIDIdentity *v9;
  AppleIDIdentityAuthority *v10;

  if (!a3)
    return 0;
  v6 = Identity::Class(a1);
  result = (AppleIDIdentityAuthority *)CFObject::Allocate((CFObject *)0x30, v6, a1, v7);
  if (result)
  {
    v9 = result;
    v10 = (AppleIDIdentityAuthority *)AppleIDIdentityAuthority::Authority(result);
    AppleIDIdentity::AppleIDIdentity(v9, a2, a3, v10);
    return (AppleIDIdentity *)((char *)v9 - 16);
  }
  return result;
}

const __CFString *_CSCreateAppleIDIdentityWithCertificate(AppleIDIdentityAuthority *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  const __CFString *result;
  const __CFString *v11;
  AppleIDIdentityAuthority *v12;

  v9 = AppleIDIdentityAuthority::Authority(a1);
  result = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 152))(v9, a2, a5);
  if (result)
  {
    v11 = result;
    v12 = _CSCreateAppleIDIdentityWithNameAndAccountIdentifier(a1, a3, result);
    CFRelease(v11);
    return (const __CFString *)v12;
  }
  return result;
}

uint64_t _CSCopyAccountIdentifierForAppleIDCertificate(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = AppleIDIdentityAuthority::Authority(a1);
  return (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(_QWORD *)v4 + 152))(v4, a1, a2);
}

const __CFString *_CSCreateAppleIDIdentityWithCertificateChain(AppleIDIdentityAuthority *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  const __CFString *result;
  const __CFString *v11;
  AppleIDIdentityAuthority *v12;

  v9 = AppleIDIdentityAuthority::Authority(a1);
  result = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 160))(v9, a2, a5);
  if (result)
  {
    v11 = result;
    v12 = _CSCreateAppleIDIdentityWithNameAndAccountIdentifier(a1, a3, result);
    CFRelease(v11);
    return (const __CFString *)v12;
  }
  return result;
}

uint64_t _CSCopyAccountIdentifierForAppleIDCertificateChain(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = AppleIDIdentityAuthority::Authority(a1);
  return (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(_QWORD *)v4 + 160))(v4, a1, a2);
}

uint64_t _CSCopySecIdentityForAppleID(uint64_t a1, CFErrorRef *a2)
{
  return _AppleIDCopySecIdentityForAppleIDAccount(a1, 0, a2);
}

const void *_CSCopyAppleIDAccountForAppleIDCertificate(AppleIDIdentityAuthority *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  uint64_t v11;
  const void *ValueAtIndex;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFString *Value;
  int v16;
  CFIndex Length;
  CFRange v19;
  CFRange v20;

  v4 = AppleIDIdentityAuthority::Authority(a1);
  v5 = (*(uint64_t (**)(uint64_t, AppleIDIdentityAuthority *, uint64_t))(*(_QWORD *)v4 + 152))(v4, a1, a2);
  if (!v5)
    return 0;
  v6 = (const __CFString *)v5;
  v7 = (const __CFArray *)_AppleIDAuthenticationCopyAppleIDs(0, a2);
  if (v7)
  {
    v8 = v7;
    Count = CFArrayGetCount(v7);
    if (Count < 1)
      goto LABEL_20;
    v10 = Count;
    v11 = 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, v11 - 1);
      v13 = (const __CFDictionary *)_AppleIDAuthenticationCopyCertificateInfo((uint64_t)ValueAtIndex, 0, 0, a2);
      if (v13)
      {
        v14 = v13;
        Value = (const __CFString *)CFDictionaryGetValue(v13, CFSTR("encDsId"));
        if (Value)
        {
          v20.length = CFStringGetLength(v6);
          v20.location = 0;
          v16 = CFStringFindWithOptions(v6, Value, v20, 5uLL, &v19);
          LODWORD(Value) = 0;
          if (v16)
          {
            if (v19.location >= 1)
            {
              if (CFStringGetCharacterAtIndex(v6, v19.location - 1) == 46)
              {
                Length = CFStringGetLength(v6);
                LODWORD(Value) = Length == v19.length + v19.location;
              }
              else
              {
                LODWORD(Value) = 0;
              }
            }
          }
        }
        CFRelease(v14);
      }
      else
      {
        LODWORD(Value) = 0;
      }
      if (v11 >= v10)
        break;
      ++v11;
    }
    while (!(_DWORD)Value);
    if ((_DWORD)Value)
      CFRetain(ValueAtIndex);
    else
LABEL_20:
      ValueAtIndex = 0;
    CFRelease(v8);
  }
  else
  {
    ValueAtIndex = 0;
  }
  CFRelease(v6);
  return ValueAtIndex;
}

CFArrayRef _CSCopyDefaultSharingSecIdentities(const void *a1)
{
  const __CFAllocator *v2;
  __CFArray *Mutable;
  const void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex v7;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  const void *v10;
  const void *v11;
  CFArrayRef Copy;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!a1 || (v4 = (const void *)_CSGetAppleIDIdentityAuthority(), CFEqual(a1, v4)))
  {
    v5 = (const __CFArray *)_AppleIDAuthenticationCopyAppleIDs(0, 0);
    if (v5)
    {
      v6 = v5;
      if (CFArrayGetCount(v5) >= 1)
      {
        v7 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v6, v7);
          TypeID = CFStringGetTypeID();
          if (ValueAtIndex && (!TypeID || CFGetTypeID(ValueAtIndex) == TypeID))
          {
            v10 = (const void *)_AppleIDCopySecIdentityForAppleIDAccount((uint64_t)ValueAtIndex, 0, 0);
            if (v10)
            {
              v11 = v10;
              CFArrayAppendValue(Mutable, v10);
              CFRelease(v11);
            }
          }
          ++v7;
        }
        while (v7 < CFArrayGetCount(v6));
      }
      CFRelease(v6);
    }
  }
  if (!Mutable)
    return 0;
  if (CFArrayGetCount(Mutable) < 1)
    Copy = 0;
  else
    Copy = CFArrayCreateCopy(v2, Mutable);
  CFRelease(Mutable);
  return Copy;
}

void AppleIDIdentity::AppleIDIdentity(AppleIDIdentity *this, const __CFString *a2, const __CFString *a3, AppleIDIdentityAuthority *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  const __CFAllocator *v10;
  const __CFAllocator *v11;

  Identity::Identity(this, 1, 0);
  *v8 = off_1E103DA58;
  v8[3] = a4;
  v9 = v8 - 2;
  v10 = CFGetAllocator(v8 - 2);
  *((_QWORD *)this + 4) = CFStringCreateCopy(v10, a2);
  v11 = CFGetAllocator(v9);
  *((_QWORD *)this + 5) = CFStringCreateCopy(v11, a3);
  CFRetain((CFTypeRef)(*((_QWORD *)this + 3) - 16));
}

void AppleIDIdentity::AppleIDIdentity(AppleIDIdentity *this, const AppleIDIdentity *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  const __CFAllocator *v6;
  const __CFString *v7;
  const __CFAllocator *v8;
  const __CFString *v9;

  Identity::Identity(this, *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2));
  *v4 = off_1E103DA58;
  v4[3] = *((_QWORD *)a2 + 3);
  v5 = v4 - 2;
  v6 = CFGetAllocator(v4 - 2);
  v7 = (const __CFString *)(*(uint64_t (**)(const AppleIDIdentity *))(*(_QWORD *)a2 + 48))(a2);
  *((_QWORD *)this + 4) = CFStringCreateCopy(v6, v7);
  v8 = CFGetAllocator(v5);
  v9 = (const __CFString *)(*(uint64_t (**)(const AppleIDIdentity *))(*(_QWORD *)a2 + 64))(a2);
  *((_QWORD *)this + 5) = CFStringCreateCopy(v8, v9);
  CFRetain((CFTypeRef)(*((_QWORD *)this + 3) - 16));
}

void AppleIDIdentity::~AppleIDIdentity(AppleIDIdentity *this)
{
  *(_QWORD *)this = off_1E103DA58;
  CFRelease((CFTypeRef)(*((_QWORD *)this + 3) - 16));
  CFRelease(*((CFTypeRef *)this + 4));
  CFRelease(*((CFTypeRef *)this + 5));
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(this);
}

{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator *v1;

  AppleIDIdentity::~AppleIDIdentity(this);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(v1);
}

void AppleIDIdentity::createCopy(AppleIDIdentity *this, const __CFAllocator *a2)
{
  unint64_t v4;
  const __CFAllocator *v5;
  AppleIDIdentity *v6;

  v4 = Identity::Class(this);
  v6 = (AppleIDIdentity *)CFObject::Allocate((CFObject *)0x30, v4, a2, v5);
  if (v6)
    AppleIDIdentity::AppleIDIdentity(v6, this);
}

uint64_t AppleIDIdentity::copyPrincipalName(AppleIDIdentity *this)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(AppleIDIdentity *))(*(_QWORD *)this + 72))(this);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 128))(v2, *((_QWORD *)this + 5), *((_QWORD *)this + 4));
}

uint64_t AppleIDIdentity::copyTrustSubjectDistinguishedName(AppleIDIdentity *this)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(AppleIDIdentity *))(*(_QWORD *)this + 72))(this);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v2 + 136))(v2, *((_QWORD *)this + 5), *((_QWORD *)this + 4));
}

uint64_t AppleIDIdentity::authenticateCertificateChain(AppleIDIdentity *this, const __CFArray *a2, __CFError **a3)
{
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t result;
  __CFError *v9;
  CFTypeRef cf;

  cf = 0;
  v5 = (*(uint64_t (**)(_QWORD, const __CFArray *, CFTypeRef *))(**((_QWORD **)this + 3) + 160))(*((_QWORD *)this + 3), a2, &cf);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = (const void *)(*(uint64_t (**)(AppleIDIdentity *))(*(_QWORD *)this + 64))(this);
    if (CFEqual(v7, v6))
    {
      CFRelease(v6);
      return 1;
    }
    syslog(4, "Identity posixName doesn't match accountIdentifier from certificate");
    CFRelease(v6);
  }
  v9 = (__CFError *)cf;
  if (!cf)
  {
    if (!a3)
      return 0;
    v9 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -101);
LABEL_10:
    result = 0;
    *a3 = v9;
    return result;
  }
  if (a3)
    goto LABEL_10;
  CFRelease(cf);
  return 0;
}

BOOL AppleIDIdentity::authenticatePassword(AppleIDIdentity *this, const __CFString *a2, __CFError **a3)
{
  return _AppleIDAuthenticatePassword(*((_QWORD *)this + 4), (uint64_t)a2, 0, (uint64_t)a3) != 0;
}

uint64_t AppleIDIdentity::fullName(AppleIDIdentity *this)
{
  return *((_QWORD *)this + 4);
}

uint64_t AppleIDIdentity::posixName(AppleIDIdentity *this)
{
  return *((_QWORD *)this + 5);
}

uint64_t AppleIDIdentity::authority(AppleIDIdentity *this)
{
  return *((_QWORD *)this + 3);
}

uint64_t Identity::needsCommit(Identity *this)
{
  return 0;
}

uint64_t Identity::uuid(Identity *this)
{
  return 0;
}

uint64_t Identity::posixID(Identity *this)
{
  return 0xFFFFFFFFLL;
}

uint64_t Identity::emailAddress(Identity *this)
{
  return 0;
}

uint64_t Identity::imageURL(Identity *this)
{
  return 0;
}

uint64_t Identity::imageData(Identity *this)
{
  return 0;
}

uint64_t Identity::imageDataType(Identity *this)
{
  return 0;
}

uint64_t Identity::aliases(Identity *this)
{
  return 0;
}

CFArrayRef Identity::copyLinkedIdentityAuthorities(Identity *this)
{
  const __CFAllocator *v1;

  v1 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v1, 0, 0, 0);
}

CFArrayRef Identity::copyLinkedIdentityNamesWithAuthority(uint64_t a1)
{
  const __CFAllocator *v1;

  v1 = CFGetAllocator((CFTypeRef)(a1 - 16));
  return CFArrayCreate(v1, 0, 0, 0);
}

uint64_t Identity::allowsPasswordResetWithAuthority()
{
  return 0;
}

uint64_t Identity::loginShellURL(Identity *this)
{
  return 0;
}

uint64_t Identity::homeDirectoryURL(Identity *this)
{
  return 0;
}

uint64_t Identity::certificate(Identity *this)
{
  return 0;
}

uint64_t Identity::createGroupMembershipQuery(Identity *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t AppleIDIdentity::isMemberOfGroup(AppleIDIdentity *this, Identity *a2)
{
  return 0;
}

uint64_t AppleIDIdentity::commit(AppleIDIdentity *this, void *a2, __CFError **a3)
{
  if (a3)
    *a3 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -2);
  return 0;
}

uint64_t AppleIDIdentity::commitAsync()
{
  return 0;
}

uint64_t Identity::updateLinkedIdentityProvisioning(Identity *this, void *a2, __CFError **a3)
{
  return 1;
}

uint64_t AppleIDIdentityAuthority::InitializeAuthority(AppleIDIdentityAuthority *this)
{
  const CFClass *v1;
  unint64_t v2;
  const __CFAllocator *v3;
  IdentityAuthority *v4;
  IdentityAuthority *v5;
  IdentityAuthority *v6;

  v1 = (const CFClass *)*MEMORY[0x1E0C9AE00];
  v2 = IdentityAuthority::Class(this);
  v4 = (IdentityAuthority *)CFObject::Allocate((CFObject *)0x18, v2, v1, v3);
  IdentityAuthority::IdentityAuthority(v4, CFSTR("appleid.apple.com"), CFSTR("Apple Account"));
  *(_QWORD *)v5 = off_1E103DD48;
  AppleIDIdentityAuthority::authority = (uint64_t)v5;
  return IdentityAuthority::RegisterAuthority(v5, v6);
}

uint64_t AppleIDIdentityAuthority::Authority(AppleIDIdentityAuthority *this)
{
  pthread_once(&AppleIDIdentityAuthority::authorityInitLock, (void (*)(void))AppleIDIdentityAuthority::InitializeAuthority);
  return AppleIDIdentityAuthority::authority;
}

BOOL AppleIDIdentityAuthority::authenticateNameAndPassword(AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3, __CFError **a4)
{
  return _AppleIDAuthenticatePassword((uint64_t)a2, (uint64_t)a3, 0, (uint64_t)a4) == 1;
}

uint64_t AppleIDIdentityAuthority::copyAccountIdentifierForCertificate(AppleIDIdentityAuthority *this, __SecCertificate *a2, __CFError **a3)
{
  CFArrayRef v5;
  uint64_t v6;
  void *values;

  values = a2;
  v5 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  v6 = (*(uint64_t (**)(AppleIDIdentityAuthority *, CFArrayRef, __CFError **))(*(_QWORD *)this + 160))(this, v5, a3);
  CFRelease(v5);
  return v6;
}

const __CFString *AppleIDIdentityAuthority::copyAccountIdentifierForCertificateChain(AppleIDIdentityAuthority *this, const __CFArray *a2, __CFError **a3)
{
  const void *AppleIDAuthorityPolicy;
  OSStatus v6;
  int v7;
  char v8;
  __CFError *v9;
  NSObject *v10;
  const __CFString *v11;
  CFIndex v12;
  const __CFString *v13;
  const __CFArray *v14;
  const void *v15;
  const __CFString *ValueAtIndex;
  const __CFString *v17;
  CFIndex Length;
  CFIndex v19;
  NSObject *v21;
  const char *v22;
  unsigned int v23;
  SecTrustRef trust;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  trust = 0;
  v23 = 0;
  AppleIDAuthorityPolicy = (const void *)SecPolicyCreateAppleIDAuthorityPolicy();
  if (!AppleIDAuthorityPolicy)
  {
    v11 = 0;
    v12 = 14;
    goto LABEL_9;
  }
  v6 = SecTrustCreateWithCertificates(a2, AppleIDAuthorityPolicy, &trust);
  if (v6)
  {
    LODWORD(v12) = v6;
    v21 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v12 = (int)v12;
      *(_DWORD *)buf = 134217984;
      v26 = (int)v12;
      v22 = "### SecTrustCreateWithCertificates failed with error %ld";
LABEL_43:
      _os_log_impl(&dword_182882000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
LABEL_45:
      v11 = (const __CFString *)*MEMORY[0x1E0C9AFC8];
      goto LABEL_9;
    }
LABEL_44:
    v12 = (int)v12;
    goto LABEL_45;
  }
  v7 = MEMORY[0x186DAD7D4](trust, &v23);
  if (v7)
  {
    LODWORD(v12) = v7;
    v21 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v12 = (int)v12;
      *(_DWORD *)buf = 134217984;
      v26 = (int)v12;
      v22 = "### SecTrustEvaluate failed with error %ld";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v8 = 0;
  v9 = 0;
  if (v23 == 1 || v23 == 4)
    goto LABEL_13;
  v10 = AppleIDGetLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v23;
    _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_ERROR, "### Invalid trust result %ld", buf, 0xCu);
  }
  v11 = CFSTR("CSIdentityErrorDomain");
  v12 = 15;
LABEL_9:
  if (v11)
    v13 = v11;
  else
    v13 = CFSTR("CSIdentityErrorDomain");
  v9 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, v12, 0);
  v8 = 1;
LABEL_13:
  if (trust)
    CFRelease(trust);
  if (AppleIDAuthorityPolicy)
    CFRelease(AppleIDAuthorityPolicy);
  if ((v8 & 1) == 0)
  {
    CFArrayGetValueAtIndex(a2, 0);
    v14 = (const __CFArray *)SecCertificateCopyCommonNames();
    if (v14)
    {
      v15 = v14;
      if (CFArrayGetCount(v14) >= 1
        && (ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v15, 0)) != 0)
      {
        v17 = ValueAtIndex;
        CFRetain(ValueAtIndex);
        CFRelease(v15);
        Length = CFStringGetLength(v17);
        if (Length > 69)
        {
          if (CFStringHasPrefix(v17, CFSTR("com.apple.idms.appleid.")))
            goto LABEL_35;
          syslog(3, "Invalid AppleID account identifier prefix");
          v19 = -13;
        }
        else
        {
          syslog(3, "Invalid AppleID account identifier lenth %d", Length);
          v19 = -12;
        }
        v15 = v17;
      }
      else
      {
        v19 = -10;
      }
      CFRelease(v15);
    }
    else
    {
      v19 = -10;
    }
    v9 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), v19);
  }
  if (a3)
  {
    if (!v9)
      v9 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -100);
    v17 = 0;
    *a3 = v9;
    return v17;
  }
  v17 = 0;
LABEL_35:
  if (v9)
    CFRelease(v9);
  return v17;
}

CFArrayRef AppleIDIdentityAuthority::copyCertificateIssuerNames(AppleIDIdentityAuthority *this)
{
  const __CFAllocator *v1;
  void *values;

  values = CFSTR("Apple Application Integration Certification Authority");
  v1 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v1, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
}

CFStringRef AppleIDIdentityAuthority::copyPrincipalForCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v4;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = CFGetAllocator((CFTypeRef)(a1 - 16));
  return CFStringCreateCopy(v4, *(CFStringRef *)(a3 + 16));
}

AppleIDIdentityQuery *AppleIDIdentityAuthority::createQueryWithName(AppleIDIdentityAuthority *this, const __CFAllocator *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  AppleIDIdentityQuery *result;
  unint64_t v9;
  const __CFAllocator *v10;

  result = 0;
  if (a4 == 1 && a5 == 1)
  {
    v9 = IdentityQuery::Class(0);
    result = (AppleIDIdentityQuery *)CFObject::Allocate((CFObject *)0x40, v9, a2, v10);
    if (result)
      return AppleIDIdentityQuery::AppleIDIdentityQuery(result, a3, this);
  }
  return result;
}

AppleIDIdentityQuery *AppleIDIdentityAuthority::createQueryWithProperties(AppleIDIdentityAuthority *this, const __CFAllocator *a2, const void *a3)
{
  unint64_t v6;
  const __CFAllocator *v7;
  AppleIDIdentityQuery *result;

  v6 = IdentityQuery::Class(this);
  result = (AppleIDIdentityQuery *)CFObject::Allocate((CFObject *)0x40, v6, a2, v7);
  if (result)
    return AppleIDIdentityQuery::AppleIDIdentityQuery(result, a3, this);
  return result;
}

CFStringRef AppleIDIdentityAuthority::copyPrincipalForNamePair(AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  const __CFAllocator *v4;

  v4 = CFGetAllocator((char *)this - 16);
  return CFStringCreateCopy(v4, a2);
}

CFStringRef AppleIDIdentityAuthority::copyTrustSubjectDistinguishedNameForNamePair(AppleIDIdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  const __CFAllocator *v4;

  v4 = CFGetAllocator((char *)this - 16);
  return CFStringCreateWithFormat(v4, 0, CFSTR("CN=%@"), a2);
}

CFStringRef AppleIDIdentityAuthority::copyTrustAnchorDistinguishedName(AppleIDIdentityAuthority *this)
{
  const __CFAllocator *v1;

  v1 = CFGetAllocator((char *)this - 16);
  return CFStringCreateCopy(v1, CFSTR("CN=Apple Root CA,OU=Apple Certification Authority,O=Apple Inc.,C=US"));
}

void AppleIDIdentityAuthority::~AppleIDIdentityAuthority(CFTypeRef *this)
{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator *v1;

  IdentityAuthority::~IdentityAuthority(this);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(v1);
}

CFStringRef IdentityAuthority::copyLocalizedName(IdentityAuthority *this)
{
  CFStringRef result;
  const __CFAllocator *v3;

  result = (CFStringRef)*((_QWORD *)this + 2);
  if (result)
  {
    v3 = CFGetAllocator(result);
    return CFStringCreateCopy(v3, *((CFStringRef *)this + 2));
  }
  return result;
}

uint64_t IdentityAuthority::createIdentity(IdentityAuthority *this, const __CFAllocator *a2, uint64_t a3, const __CFString *a4, const __CFString *a5)
{
  return 0;
}

uint64_t IdentityAuthority::createQueryWithClass(IdentityAuthority *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t IdentityAuthority::createQueryWithUUID(IdentityAuthority *this, const __CFAllocator *a2, const __CFUUID *a3)
{
  return 0;
}

uint64_t IdentityAuthority::createQueryWithPosixID(IdentityAuthority *this, const __CFAllocator *a2)
{
  return 0;
}

void AppleIDIdentityQuery::AppleIDIdentityQuery(AppleIDIdentityQuery *this, __CFString *a2, AppleIDIdentityAuthority *a3)
{
  CFIndex location;
  __CFString *v6;
  const __CFAllocator *v7;
  const __CFAllocator *v8;
  CFTypeRef cf;
  void *keys;
  void *values;

  values = a2;
  *(_QWORD *)this = off_1E103DCB0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  CFRetain((char *)a3 - 16);
  location = CFStringFind(a2, CFSTR("@"), 0).location;
  v6 = CFSTR("email");
  if (location == -1)
    v6 = CFSTR("phone");
  keys = v6;
  v7 = CFGetAllocator((char *)this - 16);
  cf = CFArrayCreate(v7, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  v8 = CFGetAllocator((char *)this - 16);
  *((_QWORD *)this + 3) = CFDictionaryCreate(v8, (const void **)&keys, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFRelease(cf);
}

__CFDictionary *createCriteriaWithNames(const __CFAllocator *a1, const __CFArray *a2)
{
  __CFDictionary *Mutable;
  CFIndex Count;
  CFIndex v5;
  __CFArray *v6;
  CFIndex v7;
  __CFArray *v8;
  const __CFAllocator *v9;
  const CFArrayCallBacks *v10;
  const __CFString *ValueAtIndex;
  __CFArray *v12;

  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v7);
      if (CFStringFind(ValueAtIndex, CFSTR("@"), 0).location == -1)
      {
        if (v8)
        {
          v12 = v8;
        }
        else
        {
          v12 = CFArrayCreateMutable(v9, 0, v10);
          v8 = v12;
        }
      }
      else if (v6)
      {
        v12 = v6;
      }
      else
      {
        v12 = CFArrayCreateMutable(v9, 0, v10);
        v6 = v12;
      }
      CFArrayAppendValue(v12, ValueAtIndex);
      ++v7;
    }
    while (v5 != v7);
    if (v8)
    {
      CFDictionaryAddValue(Mutable, CFSTR("phone"), v8);
      CFRelease(v8);
    }
    if (v6)
    {
      CFDictionaryAddValue(Mutable, CFSTR("email"), v6);
      CFRelease(v6);
    }
  }
  return Mutable;
}

void AppleIDIdentityQuery::AppleIDIdentityQuery(AppleIDIdentityQuery *this, const void *a2, AppleIDIdentityAuthority *a3)
{
  CFTypeID v5;
  const void *Value;
  const void *v7;
  CFTypeID v8;
  CFTypeID v9;
  const __CFAllocator *v10;
  const __CFArray *v11;
  const __CFAllocator *v12;
  const void *v13;
  uint64_t valuePtr;

  *(_QWORD *)this = off_1E103DCB0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  CFRetain((char *)a3 - 16);
  v5 = CFGetTypeID(a2);
  if (v5 == CFDictionaryGetTypeID())
  {
    valuePtr = 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("class"));
    v7 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("full name"));
    v13 = v7;
    if (Value)
    {
      v8 = CFGetTypeID(Value);
      if (v8 == CFNumberGetTypeID())
        CFNumberGetValue((CFNumberRef)Value, kCFNumberLongType, &valuePtr);
    }
    if (v7)
    {
      v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID() && valuePtr == 1)
      {
        v10 = CFGetAllocator((char *)this - 16);
        v11 = CFArrayCreate(v10, &v13, 1, MEMORY[0x1E0C9B378]);
        v12 = CFGetAllocator((char *)this - 16);
        *((_QWORD *)this + 3) = createCriteriaWithNames(v12, v11);
        CFRelease(v11);
      }
    }
  }
}

void AppleIDIdentityQuery::~AppleIDIdentityQuery(AppleIDIdentityQuery *this)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  const void *v7;

  *(_QWORD *)this = off_1E103DCB0;
  CFRelease((CFTypeRef)(*((_QWORD *)this + 2) - 16));
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 3) = 0;
  }
  v3 = *((_QWORD *)this + 4);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    v4 = *((_QWORD *)this + 4);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    *((_QWORD *)this + 4) = 0;
  }
  v5 = (const void *)*((_QWORD *)this + 5);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 5) = 0;
  }
  v6 = (const void *)*((_QWORD *)this + 6);
  if (v6)
  {
    CFRelease(v6);
    *((_QWORD *)this + 6) = 0;
  }
  v7 = (const void *)*((_QWORD *)this + 7);
  if (v7)
  {
    CFRelease(v7);
    *((_QWORD *)this + 7) = 0;
  }
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(this);
}

{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator *v1;

  AppleIDIdentityQuery::~AppleIDIdentityQuery(this);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(v1);
}

CFArrayRef AppleIDIdentityQuery::copyResults(AppleIDIdentityQuery *this)
{
  const void *v2;
  const __CFAllocator *v4;

  v2 = (const void *)*((_QWORD *)this + 7);
  if (v2)
    return (CFArrayRef)CFRetain(v2);
  v4 = CFGetAllocator((char *)this - 16);
  return CFArrayCreate(v4, 0, 0, 0);
}

void AppleIDIdentityQuery::processFindPersonResults(AppleIDIdentityQuery *this, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  __CFArray *Mutable;
  char *v8;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v11;
  Identity *v12;
  unint64_t v13;
  const __CFAllocator *v14;
  AppleIDIdentity *v15;
  AppleIDIdentity *v16;
  const __CFAllocator *v17;
  char *v18;
  __CFArray *v19;
  const __CFAllocator *v20;
  AppleIDIdentityQuery *v21;
  CFRange v22;

  Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    Mutable = 0;
    v21 = this;
    v8 = (char *)this - 16;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v6);
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("value"));
      v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("certCN"));
      if (!v11)
        v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("dsId"));
      if (Value && v11)
      {
        v12 = CFGetAllocator(v8);
        v13 = Identity::Class(v12);
        v15 = (AppleIDIdentity *)CFObject::Allocate((CFObject *)0x30, v13, v12, v14);
        v16 = v15;
        if (v15)
          AppleIDIdentity::AppleIDIdentity(v15, Value, v11, *((AppleIDIdentityAuthority **)v21 + 2));
        if (!Mutable)
        {
          v17 = CFGetAllocator(v8);
          Mutable = CFArrayCreateMutable(v17, 0, MEMORY[0x1E0C9B378]);
        }
        v18 = (char *)v16 - 16;
        CFArrayAppendValue(Mutable, v18);
        CFRelease(v18);
      }
      ++v6;
    }
    while (v5 != v6);
    if (Mutable)
    {
      v19 = (__CFArray *)*((_QWORD *)v21 + 7);
      if (!v19)
      {
        v20 = CFGetAllocator(v8);
        v19 = CFArrayCreateMutable(v20, 0, MEMORY[0x1E0C9B378]);
        *((_QWORD *)v21 + 7) = v19;
      }
      v22.length = CFArrayGetCount(Mutable);
      v22.location = 0;
      CFArrayAppendArray(v19, Mutable, v22);
      AppleIDIdentityQuery::sendEvent(v21, 2, Mutable, 0);
      CFRelease(Mutable);
    }
  }
}

void AppleIDIdentityQuery::sendEvent(AppleIDIdentityQuery *this, uint64_t a2, CFTypeRef cf, CFTypeRef a4)
{
  __CFRunLoop *v8;
  const void *v9;
  _QWORD v10[8];

  if (*((_QWORD *)this + 4))
  {
    if (cf)
      CFRetain(cf);
    if (a4)
      CFRetain(a4);
    CFRetain((char *)this - 16);
    v8 = (__CFRunLoop *)*((_QWORD *)this + 5);
    v9 = (const void *)*((_QWORD *)this + 6);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 0x40000000;
    v10[2] = ___ZN20AppleIDIdentityQuery9sendEventElPK9__CFArrayP9__CFError_block_invoke;
    v10[3] = &__block_descriptor_tmp_4;
    v10[4] = this;
    v10[5] = a2;
    v10[6] = cf;
    v10[7] = a4;
    CFRunLoopPerformBlock(v8, v9, v10);
    CFRunLoopWakeUp(*((CFRunLoopRef *)this + 5));
  }
}

void ___ZN20AppleIDIdentityQuery9sendEventElPK9__CFArrayP9__CFError_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  const void *v5;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 32);
  if (v3)
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)v3 + 32))(v3, v2, a1[5], a1[6], a1[7]);
  v4 = (const void *)a1[6];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[7];
  if (v5)
    CFRelease(v5);
  CFRelease((CFTypeRef)(v2 - 16));
}

uint64_t AppleIDIdentityQuery::execute(AppleIDIdentityQuery *this, unint64_t a2, __CFError **a3)
{
  uint64_t v3;
  uint64_t result;
  const void *v6;

  v3 = *((_QWORD *)this + 1);
  if ((v3 & 0x80000000) != 0)
    return 0;
  *((_QWORD *)this + 1) = v3 | 0x80000000;
  result = _AppleIDAuthenticationFindPerson(*((const __CFDictionary **)this + 3), 0, (uint64_t)a3);
  if (result)
  {
    v6 = (const void *)result;
    AppleIDIdentityQuery::processFindPersonResults(this, (CFArrayRef)result);
    CFRelease(v6);
    return 1;
  }
  return result;
}

BOOL AppleIDIdentityQuery::executeAsynchronously(_QWORD *a1, uint64_t a2, uint64_t a3, const void *a4, const void *a5)
{
  uint64_t v5;
  const __CFDictionary *v9;
  dispatch_queue_global_t global_queue;
  _QWORD v12[5];

  v5 = a1[1];
  if ((v5 & 0x80000000) == 0)
  {
    a1[1] = v5 | 0x80000000;
    a1[4] = a3;
    (*(void (**)(uint64_t))(*(_QWORD *)a3 + 16))(a3);
    a1[5] = CFRetain(a4);
    a1[6] = CFRetain(a5);
    CFRetain(a1 - 2);
    v9 = (const __CFDictionary *)a1[3];
    global_queue = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 0x40000000;
    v12[2] = ___ZN20AppleIDIdentityQuery21executeAsynchronouslyEmP19IdentityQueryClientP11__CFRunLoopPK10__CFString_block_invoke;
    v12[3] = &__block_descriptor_tmp_19_0;
    v12[4] = a1;
    _AppleIDAuthenticationFindPersonWithBlock(v9, 0, (uint64_t)global_queue, (uint64_t)v12);
  }
  return (int)v5 >= 0;
}

void ___ZN20AppleIDIdentityQuery21executeAsynchronouslyEmP19IdentityQueryClientP11__CFRunLoopPK10__CFString_block_invoke(uint64_t a1, const __CFArray *a2, int a3, const void *a4)
{
  AppleIDIdentityQuery *v5;

  v5 = *(AppleIDIdentityQuery **)(a1 + 32);
  if ((*((_BYTE *)v5 + 11) & 0x40) != 0)
  {
    if (a3)
LABEL_10:
      CFRelease((char *)v5 - 16);
  }
  else
  {
    if (a2)
    {
      AppleIDIdentityQuery::processFindPersonResults(*(AppleIDIdentityQuery **)(a1 + 32), a2);
    }
    else if (a4)
    {
      AppleIDIdentityQuery::sendEvent(*(AppleIDIdentityQuery **)(a1 + 32), 5, 0, a4);
      (*(void (**)(AppleIDIdentityQuery *))(*(_QWORD *)v5 + 72))(v5);
    }
    if (a3)
    {
      AppleIDIdentityQuery::sendEvent(v5, 1, 0, 0);
      goto LABEL_10;
    }
  }
}

_QWORD *AppleIDIdentityQuery::stop(_QWORD *this)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = this[1];
  if ((v1 & 0x40000000) == 0)
  {
    v2 = this;
    this[1] = v1 | 0x40000000;
    this = (_QWORD *)this[4];
    if (this)
    {
      (*(void (**)(_QWORD *))(*this + 24))(this);
      this = (_QWORD *)v2[4];
      if (this)
        this = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
      v2[4] = 0;
    }
  }
  return this;
}

void Identity::InitClass(Identity *this)
{
  CFClass *v1;
  uint64_t v2;

  v1 = (CFClass *)operator new();
  CFClass::CFClass(v1, "CSIdentity");
  Identity::__cfClass = v2;
}

uint64_t Identity::Class(Identity *this)
{
  pthread_once(&Identity::__cfClassLock, (void (*)(void))Identity::InitClass);
  return Identity::__cfClass;
}

void Identity::Identity(Identity *this, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)this = off_1E103DE00;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = a3;
}

uint64_t Identity::equal(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(_QWORD *);
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;

  if (a1[1] != a2[1])
    return 0;
  v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 88))(a1);
  v5 = *a1;
  if (v4)
  {
    v6 = (uint64_t (**)(_QWORD *))(v5 + 88);
    v7 = 11;
  }
  else
  {
    v9 = (*(uint64_t (**)(_QWORD *))(v5 + 64))(a1);
    v10 = *a1;
    if (v9)
    {
      v6 = (uint64_t (**)(_QWORD *))(v10 + 64);
      v7 = 8;
    }
    else
    {
      result = (*(uint64_t (**)(_QWORD *))(v10 + 48))(a1);
      if (!result)
        return result;
      v6 = (uint64_t (**)(_QWORD *))(*a1 + 48);
      v7 = 6;
    }
  }
  v11 = (const void *)(*v6)(a1);
  v12 = (const void *)(*(uint64_t (**)(_QWORD *))(*a2 + 8 * v7))(a2);
  return CFEqual(v11, v12) != 0;
}

uint64_t Identity::hash(Identity *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (**v5)(Identity *);
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  v2 = *((_QWORD *)this + 1);
  v3 = (*(uint64_t (**)(Identity *))(*(_QWORD *)this + 88))(this);
  v4 = *(_QWORD *)this;
  if (v3)
  {
    v5 = (uint64_t (**)(Identity *))(v4 + 88);
LABEL_7:
    v8 = (const void *)(*v5)(this);
    v2 += CFHash(v8);
    return v2;
  }
  v6 = (*(uint64_t (**)(Identity *))(v4 + 64))(this);
  v7 = *(_QWORD *)this;
  if (v6)
  {
    v5 = (uint64_t (**)(Identity *))(v7 + 64);
    goto LABEL_7;
  }
  if ((*(uint64_t (**)(Identity *))(v7 + 48))(this))
  {
    v5 = (uint64_t (**)(Identity *))(*(_QWORD *)this + 48);
    goto LABEL_7;
  }
  return v2;
}

CFTypeRef Identity::copyFormattingDesc(Identity *this, const __CFDictionary *a2)
{
  const void *v2;

  v2 = (const void *)(*(uint64_t (**)(Identity *, const __CFDictionary *))(*(_QWORD *)this + 48))(this, a2);
  return CFRetain(v2);
}

CFStringRef Identity::copyDebugDesc(Identity *this)
{
  const void *v2;
  void *v3;
  const void *v4;
  const __CFAllocator *v5;
  CFAllocatorRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFStringRef v12;

  if ((*(uint64_t (**)(Identity *))(*(_QWORD *)this + 88))(this))
  {
    v2 = (const void *)(*(uint64_t (**)(Identity *))(*(_QWORD *)this + 88))(this);
    v3 = (void *)CFCopyDescription(v2);
  }
  else
  {
    v3 = (void *)CFRetain(CFSTR("<null>"));
  }
  v4 = v3;
  v5 = CFGetAllocator((char *)this - 16);
  v6 = CFGetAllocator((char *)this - 16);
  v7 = *((_QWORD *)this + 1);
  v8 = (*(uint64_t (**)(Identity *))(*(_QWORD *)this + 48))(this);
  v9 = (*(uint64_t (**)(Identity *))(*(_QWORD *)this + 64))(this);
  v10 = *((_QWORD *)this + 2);
  v11 = (*(uint64_t (**)(Identity *))(*(_QWORD *)this + 96))(this);
  v12 = CFStringCreateWithFormat(v5, 0, CFSTR("<CSIdentity %p [%p]>{class = %ld, full name = \"%@\", posix name = \"%@\", flags = %lx, uuid = %@, posixID = %d}"), (char *)this - 16, v6, v7, v8, v9, v10, v4, v11);
  CFRelease(v4);
  return v12;
}

CFTypeRef Identity::createReferenceData(Identity *this, const __CFAllocator *a2)
{
  uint64_t v4;
  uint64_t v5;
  const __CFAllocator *v6;
  const __CFAllocator *v7;
  const __CFUUID *v8;
  void *v9;
  uint64_t v10;
  CFIndex v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  const __CFAllocator *v15;
  CFDictionaryRef v16;
  unint64_t v17;
  uint64_t v18;
  const void *v19;
  __CFWriteStream *v20;
  __CFWriteStream *v21;
  CFTypeRef v22;
  uint64_t v24;
  void *keys[2];
  const __CFString *v26;
  uint64_t v27;
  void *values[2];
  CFTypeRef v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = 0;
  v26 = 0;
  v27 = 0;
  v4 = *(_QWORD *)this;
  v24 = *((_QWORD *)this + 1);
  keys[0] = CFSTR("authority");
  v5 = (*(uint64_t (**)(Identity *))(v4 + 72))(this);
  values[0] = (void *)CFRetain(*(CFTypeRef *)(v5 + 8));
  keys[1] = CFSTR("class");
  v6 = CFGetAllocator((char *)this - 16);
  values[1] = CFNumberCreate(v6, kCFNumberLongType, &v24);
  if ((*(uint64_t (**)(Identity *))(*(_QWORD *)this + 88))(this))
  {
    v26 = CFSTR("uuid");
    v7 = CFGetAllocator((char *)this - 16);
    v8 = (const __CFUUID *)(*(uint64_t (**)(Identity *))(*(_QWORD *)this + 88))(this);
    v9 = (void *)CFUUIDCreateString(v7, v8);
    v10 = 3;
    v11 = 2;
  }
  else
  {
    if ((*(uint64_t (**)(Identity *))(*(_QWORD *)this + 64))(this))
    {
      v26 = CFSTR("name");
      v12 = (const void *)(*(uint64_t (**)(Identity *))(*(_QWORD *)this + 64))(this);
      v29 = CFRetain(v12);
      v11 = 3;
    }
    else
    {
      v11 = 2;
    }
    if (!(*(uint64_t (**)(Identity *))(*(_QWORD *)this + 48))(this))
      goto LABEL_9;
    keys[v11] = CFSTR("full name");
    v13 = (const void *)(*(uint64_t (**)(Identity *))(*(_QWORD *)this + 48))(this);
    v9 = (void *)CFRetain(v13);
    v10 = v11 + 1;
  }
  values[v11] = v9;
  v11 = v10;
LABEL_9:
  v14 = 0;
  while (values[v14])
  {
    if (v11 == ++v14)
      goto LABEL_14;
  }
  if (v11 == v14)
  {
LABEL_14:
    v15 = CFGetAllocator((char *)this - 16);
    v16 = CFDictionaryCreate(v15, (const void **)keys, (const void **)values, v11, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    goto LABEL_16;
  }
  v16 = 0;
LABEL_16:
  v17 = 0;
  v18 = 8 * v11;
  do
  {
    v19 = values[v17 / 8];
    if (v19)
      CFRelease(v19);
    v17 += 8;
  }
  while (v18 != v17);
  if (!v16)
    return 0;
  v20 = CFWriteStreamCreateWithAllocatedBuffers(a2, a2);
  if (v20)
  {
    v21 = v20;
    if (CFWriteStreamOpen(v20))
    {
      if (CFPropertyListWriteToStream(v16, v21, kCFPropertyListBinaryFormat_v1_0, 0) < 1)
        v22 = 0;
      else
        v22 = CFWriteStreamCopyProperty(v21, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
      CFWriteStreamClose(v21);
    }
    else
    {
      v22 = 0;
    }
    CFRelease(v21);
  }
  else
  {
    v22 = 0;
  }
  CFRelease(v16);
  return v22;
}

uint64_t Identity::copyPrincipalName(Identity *this)
{
  return 0;
}

uint64_t Identity::copyTrustSubjectDistinguishedName(Identity *this)
{
  return 0;
}

uint64_t Identity::authenticateCertificateChain(Identity *this, const __CFArray *a2, __CFError **a3)
{
  if (a3)
    *a3 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -101);
  return 0;
}

uint64_t Identity::authenticatePassword(Identity *this, const __CFString *a2, __CFError **a3)
{
  if (a3)
    *a3 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -2);
  return 0;
}

uint64_t IdentityAuthority::RegisterAuthority(IdentityAuthority *this, IdentityAuthority *a2)
{
  const __CFArray *v3;
  __CFDictionary *Mutable;
  const void *v5;
  char *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  __CFDictionary *v10;
  const void *ValueAtIndex;

  v3 = (const __CFArray *)(*(uint64_t (**)(IdentityAuthority *, IdentityAuthority *))(*(_QWORD *)this + 112))(this, a2);
  _os_nospin_lock_lock();
  Mutable = (__CFDictionary *)IdentityAuthority::sInstances;
  if (!IdentityAuthority::sInstances)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    IdentityAuthority::sInstances = (uint64_t)Mutable;
  }
  if (!IdentityAuthority::sIssuerDict)
  {
    IdentityAuthority::sIssuerDict = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    Mutable = (__CFDictionary *)IdentityAuthority::sInstances;
  }
  v5 = (const void *)*((_QWORD *)this + 1);
  v6 = (char *)this - 16;
  CFDictionarySetValue(Mutable, v5, v6);
  if (v3)
  {
    Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        v10 = (__CFDictionary *)IdentityAuthority::sIssuerDict;
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        CFDictionaryAddValue(v10, ValueAtIndex, v6);
      }
    }
    CFRelease(v3);
  }
  return _os_nospin_lock_unlock();
}

uint64_t IdentityAuthority::IdentityAuthorityWithIdentifier(IdentityAuthority *this, const __CFString *a2)
{
  const void *Value;

  _os_nospin_lock_lock();
  if (IdentityAuthority::sInstances)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)IdentityAuthority::sInstances, this);
    _os_nospin_lock_unlock();
    if (Value)
      return (uint64_t)Value + 16;
    else
      return 0;
  }
  else
  {
    _os_nospin_lock_unlock();
    return 0;
  }
}

void IdentityAuthority::InitClass(IdentityAuthority *this)
{
  CFClass *v1;
  uint64_t v2;

  v1 = (CFClass *)operator new();
  CFClass::CFClass(v1, "CSIdentityAuthority");
  IdentityAuthority::__cfClass = v2;
}

uint64_t IdentityAuthority::Class(IdentityAuthority *this)
{
  pthread_once(&IdentityAuthority::__cfClassLock, (void (*)(void))IdentityAuthority::InitClass);
  return IdentityAuthority::__cfClass;
}

void IdentityAuthority::IdentityAuthority(IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  char *v6;
  const __CFAllocator *v7;
  const __CFAllocator *v8;

  *(_QWORD *)this = off_1E103DC08;
  v6 = (char *)this - 16;
  v7 = CFGetAllocator((char *)this - 16);
  *((_QWORD *)this + 1) = CFStringCreateCopy(v7, a2);
  v8 = CFGetAllocator(v6);
  *((_QWORD *)this + 2) = CFStringCreateCopy(v8, a3);
}

void IdentityAuthority::~IdentityAuthority(CFTypeRef *this)
{
  *this = off_1E103DC08;
  CFRelease(this[1]);
  CFRelease(this[2]);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator((LaunchServices::DomainEvaluators::ServerDomainEvaluator *)this);
}

{
  LaunchServices::DomainEvaluators::ServerDomainEvaluator *v1;

  IdentityAuthority::~IdentityAuthority(this);
  LaunchServices::DomainEvaluators::ServerDomainEvaluator::~ServerDomainEvaluator(v1);
}

BOOL IdentityAuthority::equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t IdentityAuthority::hash(IdentityAuthority *this)
{
  return (uint64_t)this - 16;
}

uint64_t IdentityAuthority::copyFormattingDesc(IdentityAuthority *this, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(IdentityAuthority *))(*(_QWORD *)this + 48))(this);
}

CFStringRef IdentityAuthority::copyDebugDesc(IdentityAuthority *this)
{
  char *v1;
  const void *v2;
  const __CFAllocator *v3;
  CFAllocatorRef v4;
  CFStringRef v5;

  v1 = (char *)this - 16;
  v2 = (const void *)(*(uint64_t (**)(IdentityAuthority *))(*(_QWORD *)this + 48))(this);
  v3 = CFGetAllocator(v1);
  v4 = CFGetAllocator(v1);
  v5 = CFStringCreateWithFormat(v3, 0, CFSTR("<CSIdentityAuthority %p [%p]>{localizedName = \"%@\"}"), v1, v4, v2);
  CFRelease(v2);
  return v5;
}

uint64_t IdentityAuthority::copyIdentityWithName(IdentityAuthority *this, const __CFString *a2, uint64_t a3, Identity **a4, __CFError **a5)
{
  CFAllocatorRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFArray *v14;
  char *ValueAtIndex;

  v10 = CFGetAllocator((char *)this - 16);
  v11 = (*(uint64_t (**)(IdentityAuthority *, CFAllocatorRef, const __CFString *, uint64_t, uint64_t))(*(_QWORD *)this + 72))(this, v10, a2, 1, a3);
  if (v11)
  {
    v12 = v11;
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, __CFError **))(*(_QWORD *)v11 + 56))(v11, 2, a5);
    if ((_DWORD)v13)
    {
      v14 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 48))(v12);
      if (CFArrayGetCount(v14) < 1)
      {
        *a4 = 0;
      }
      else
      {
        ValueAtIndex = (char *)CFArrayGetValueAtIndex(v14, 0);
        *a4 = (Identity *)(ValueAtIndex + 16);
        CFRetain(ValueAtIndex);
      }
      CFRelease(v14);
    }
    CFRelease((CFTypeRef)(v12 - 16));
  }
  else
  {
    v13 = 0;
    if (a5)
      *a5 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -2);
  }
  return v13;
}

uint64_t IdentityAuthority::createQueryWithName(IdentityAuthority *this, const __CFAllocator *a2, const __CFString *a3)
{
  return 0;
}

uint64_t IdentityAuthority::createQueryWithProperties(IdentityAuthority *this, const __CFAllocator *a2, const void *a3)
{
  return 0;
}

uint64_t IdentityAuthority::authenticateNameAndPassword(IdentityAuthority *this, const __CFString *a2, const __CFString *a3, __CFError **a4)
{
  if (a4)
    *a4 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -2);
  return 0;
}

uint64_t IdentityAuthority::copyCertificateIssuerNames(IdentityAuthority *this)
{
  return 0;
}

uint64_t IdentityAuthority::copyPrincipalForCertificate()
{
  return 0;
}

uint64_t IdentityAuthority::copyPrincipalForNamePair(IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  return 0;
}

uint64_t IdentityAuthority::copyTrustSubjectDistinguishedNameForNamePair(IdentityAuthority *this, const __CFString *a2, const __CFString *a3)
{
  return 0;
}

uint64_t IdentityAuthority::copyTrustAnchorDistinguishedName(IdentityAuthority *this)
{
  return 0;
}

uint64_t CFClass::FinalizeObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((_QWORD *)this + 2) + 8))((char *)this + 16);
}

uint64_t CFClass::EqualObj(CFClass *this, char *a2, const void *a3)
{
  return (*(uint64_t (**)(char *, char *, const void *))(*((_QWORD *)this + 2) + 16))((char *)this + 16, a2 + 16, a3);
}

uint64_t CFClass::HashObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((_QWORD *)this + 2) + 24))((char *)this + 16);
}

uint64_t CFClass::CopyFormattingDescObj(CFClass *this, const void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(char *, const void *))(*((_QWORD *)this + 2) + 32))((char *)this + 16, a2);
}

uint64_t CFClass::CopyDebugDescObj(CFClass *this, const void *a2)
{
  return (*(uint64_t (**)(char *))(*((_QWORD *)this + 2) + 40))((char *)this + 16);
}

void CFClass::CFClass(CFClass *this, const char *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 4) = CFClass::FinalizeObj;
  *((_QWORD *)this + 5) = CFClass::EqualObj;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 6) = CFClass::HashObj;
  *((_QWORD *)this + 7) = CFClass::CopyFormattingDescObj;
  *((_QWORD *)this + 8) = CFClass::CopyDebugDescObj;
  *((_QWORD *)this + 12) = _CFRuntimeRegisterClass();
}

uint64_t CFObject::Allocate(CFObject *this, unint64_t a2, const CFClass *a3, const __CFAllocator *a4)
{
  uint64_t Instance;

  Instance = _CFRuntimeCreateInstance();
  if (Instance)
    return Instance + 16;
  else
    return 0;
}

BOOL CFObject::equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t CFObject::hash(CFObject *this)
{
  return (uint64_t)this - 16;
}

void IdentityQuery::InitClass(IdentityQuery *this)
{
  CFClass *v1;
  uint64_t v2;

  v1 = (CFClass *)operator new();
  CFClass::CFClass(v1, "CSIdentityQuery");
  IdentityQuery::__cfClass = v2;
}

uint64_t IdentityQuery::Class(IdentityQuery *this)
{
  pthread_once(&IdentityQuery::__cfClassLock, (void (*)(void))IdentityQuery::InitClass);
  return IdentityQuery::__cfClass;
}

uint64_t IdentityQuery::copyFormattingDesc(IdentityQuery *this, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(IdentityQuery *))(*(_QWORD *)this + 40))(this);
}

CFStringRef IdentityQuery::copyDebugDesc(IdentityQuery *this)
{
  char *v1;
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  v1 = (char *)this - 16;
  v2 = CFGetAllocator((char *)this - 16);
  v3 = CFGetAllocator(v1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<CSIdentityQuery %p [%p]>"), v1, v3);
}

CFTypeID CSIdentityAuthorityGetTypeID(void)
{
  IdentityAuthority *v0;

  return *(_QWORD *)(IdentityAuthority::Class(v0) + 96);
}

CFStringRef CSIdentityAuthorityCopyLocalizedName(CSIdentityAuthorityRef authority)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((_QWORD *)authority + 2) + 48))((char *)authority + 16);
}

uint64_t _CSGetAppleIDIdentityAuthority()
{
  AppleIDIdentityAuthority *v0;

  v0 = (AppleIDIdentityAuthority *)pthread_once(&gCSIdentityInitLock, (void (*)(void))_CSIdentityInitOnce);
  return AppleIDIdentityAuthority::Authority(v0) - 16;
}

char *_CSIdentityAuthorityCopyIdentityWithName(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  Identity *v4;

  v4 = 0;
  IdentityAuthority::copyIdentityWithName((IdentityAuthority *)(a1 + 16), a2, a3, &v4, 0);
  if (v4)
    return (char *)v4 - 16;
  else
    return 0;
}

CFErrorRef CSCreateIdentityError(const void *a1, CFIndex a2)
{
  void *v3;
  int v4;
  CFAllocatorRef *v5;
  CFErrorRef v6;
  CFErrorRef v7;
  __CFString *Value;
  __CFString *v9;
  CFIndex v10;
  CFErrorRef v11;
  void *userInfoValues;
  CFTypeRef cf;
  void *userInfoKeys[3];

  userInfoKeys[2] = *(void **)MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0C9B000];
  userInfoKeys[0] = *(void **)MEMORY[0x1E0C9AFB0];
  userInfoKeys[1] = v3;
  cf = 0;
  v4 = CFEqual(a1, CFSTR("CSIdentityErrorDomain"));
  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v4)
  {
    v6 = 0;
    v7 = 0;
    if (a2)
      goto LABEL_6;
  }
  else
  {
    v6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFErrorDomain)*MEMORY[0x1E0C9AFC8], a2, 0);
    cf = v6;
  }
  a2 = -2;
  v7 = v6;
LABEL_6:
  pthread_once(&errorOnceLock, (void (*)(void))createErrorMaps);
  Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)errorDescMap, (const void *)a2);
  v9 = CFSTR("Unknown error");
  if (Value)
    v9 = Value;
  userInfoValues = v9;
  if (v7)
    v10 = 2;
  else
    v10 = 1;
  v11 = CFErrorCreateWithUserInfoKeysAndValues(*v5, CFSTR("CSIdentityErrorDomain"), a2, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, v10);
  if (cf)
    CFRelease(cf);
  return v11;
}

CFDictionaryRef createErrorMaps(void)
{
  CFDictionaryRef result;

  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&errorKeys, (const void **)&errorDescriptions, 16, 0, 0);
  errorDescMap = (uint64_t)result;
  return result;
}

CFTypeID CSIdentityGetTypeID(void)
{
  Identity *v0;

  return *(_QWORD *)(Identity::Class(v0) + 96);
}

CSIdentityRef CSIdentityCreateCopy(CFAllocatorRef allocator, CSIdentityRef identity)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(char *, CFAllocatorRef))(*((_QWORD *)identity + 2) + 352))((char *)identity + 16, allocator);
  if (v2)
    return (CSIdentityRef)(v2 - 16);
  else
    return 0;
}

CFStringRef CSIdentityGetFullName(CSIdentityRef identity)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((_QWORD *)identity + 2) + 48))((char *)identity + 16);
}

CFStringRef CSIdentityGetPosixName(CSIdentityRef identity)
{
  return (CFStringRef)(*(uint64_t (**)(char *))(*((_QWORD *)identity + 2) + 64))((char *)identity + 16);
}

CSIdentityClass CSIdentityGetClass(CSIdentityRef identity)
{
  return *((_QWORD *)identity + 3);
}

CSIdentityAuthorityRef CSIdentityGetAuthority(CSIdentityRef identity)
{
  return (CSIdentityAuthorityRef)((*(uint64_t (**)(char *))(*((_QWORD *)identity + 2) + 72))((char *)identity + 16)
                                - 16);
}

CFDataRef CSIdentityCreatePersistentReference(CFAllocatorRef allocator, CSIdentityRef identity)
{
  return (CFDataRef)(*(uint64_t (**)(char *, CFAllocatorRef))(*((_QWORD *)identity + 2) + 376))((char *)identity + 16, allocator);
}

uint64_t _CSIdentityAuthenticateUsingCertificateChain(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 16) + 280))(a1 + 16);
}

uint64_t _CSIdentityAuthenticateUsingCertificate(_QWORD *a1, void *a2, uint64_t a3)
{
  const __CFAllocator *v5;
  CFArrayRef v6;
  uint64_t v7;
  void *values;

  values = a2;
  v5 = CFGetAllocator(a1);
  v6 = CFArrayCreate(v5, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  v7 = (*(uint64_t (**)(_QWORD *, CFArrayRef, uint64_t))(a1[2] + 280))(a1 + 2, v6, a3);
  CFRelease(v6);
  return v7;
}

uint64_t _CSIdentityUpdateLinkedIdentityProvisioning(uint64_t a1, CFErrorRef *a2)
{
  if (a2)
    *a2 = CSCreateIdentityError(CFSTR("CSIdentityErrorDomain"), -4);
  return 0;
}

uint64_t _CSDefaultLog()
{
  if (_CSDefaultLog_onceToken != -1)
    dispatch_once(&_CSDefaultLog_onceToken, &__block_literal_global_85);
  return _CSDefaultLog_log;
}

uint64_t CSIdentityQueryClient::retain(uint64_t this)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  v1 = *(uint64_t (**)(_QWORD))(this + 24);
  if (v1)
  {
    v2 = this;
    this = v1(*(_QWORD *)(this + 16));
    *(_QWORD *)(v2 + 16) = this;
  }
  return this;
}

uint64_t CSIdentityQueryClient::release(uint64_t this)
{
  uint64_t (*v1)(_QWORD);

  v1 = *(uint64_t (**)(_QWORD))(this + 32);
  if (v1)
    return v1(*(_QWORD *)(this + 16));
  return this;
}

uint64_t CSIdentityQueryClient::receiveEvent(uint64_t this, IdentityQuery *a2, uint64_t a3, const __CFArray *a4, __CFError *a5)
{
  uint64_t (*v5)(char *, uint64_t, const __CFArray *, __CFError *, _QWORD);

  v5 = *(uint64_t (**)(char *, uint64_t, const __CFArray *, __CFError *, _QWORD))(this + 48);
  if (v5)
    return v5((char *)a2 - 16, a3, a4, a5, *(_QWORD *)(this + 16));
  return this;
}

CFTypeID CSIdentityQueryGetTypeID(void)
{
  IdentityQuery *v0;

  return *(_QWORD *)(IdentityQuery::Class(v0) + 96);
}

CSIdentityQueryRef CSIdentityQueryCreateForName(CFAllocatorRef allocator, CFStringRef name, CSIdentityQueryStringComparisonMethod comparisonMethod, CSIdentityClass identityClass, CSIdentityAuthorityRef authority)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(char *, CFAllocatorRef, CFStringRef, CSIdentityQueryStringComparisonMethod, CSIdentityClass))(*((_QWORD *)authority + 2) + 72))((char *)authority + 16, allocator, name, comparisonMethod, identityClass);
  if (v5)
    return (CSIdentityQueryRef)(v5 - 16);
  else
    return 0;
}

CSIdentityQueryRef CSIdentityQueryCreateForPersistentReference(CFAllocatorRef allocator, CFDataRef referenceData)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  IdentityAuthority *Value;
  IdentityAuthority *v8;
  CFTypeID v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;

  pthread_once(&gCSIdentityInitLock, (void (*)(void))_CSIdentityInitOnce);
  v4 = (const __CFDictionary *)CFPropertyListCreateFromXMLData(allocator, referenceData, 0, 0);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID()
      && (Value = (IdentityAuthority *)CFDictionaryGetValue(v5, CFSTR("authority"))) != 0
      && (v8 = Value, v9 = CFGetTypeID(Value), v9 == CFStringGetTypeID())
      && (v11 = IdentityAuthority::IdentityAuthorityWithIdentifier(v8, v10)) != 0)
    {
      v12 = (*(uint64_t (**)(uint64_t, CFAllocatorRef, const __CFDictionary *))(*(_QWORD *)v11 + 96))(v11, allocator, v5);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  if (v12)
    return (CSIdentityQueryRef)(v12 - 16);
  else
    return 0;
}

CFArrayRef CSIdentityQueryCopyResults(CSIdentityQueryRef query)
{
  return (CFArrayRef)(*(uint64_t (**)(char *))(*((_QWORD *)query + 2) + 48))((char *)query + 16);
}

Boolean CSIdentityQueryExecute(CSIdentityQueryRef query, CSIdentityQueryFlags flags, CFErrorRef *error)
{
  return (*(uint64_t (**)(char *, CSIdentityQueryFlags, CFErrorRef *))(*((_QWORD *)query + 2) + 56))((char *)query + 16, flags, error);
}

Boolean CSIdentityQueryExecuteAsynchronously(CSIdentityQueryRef query, CSIdentityQueryFlags flags, const CSIdentityQueryClientContext *clientContext, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  uint64_t v10;
  __int128 v11;

  v10 = operator new();
  *(_QWORD *)v10 = &off_1E103DD10;
  v11 = *(_OWORD *)&clientContext->retainInfo;
  *(_OWORD *)(v10 + 8) = *(_OWORD *)&clientContext->version;
  *(_OWORD *)(v10 + 24) = v11;
  *(_OWORD *)(v10 + 40) = *(_OWORD *)&clientContext->copyInfoDescription;
  return (*(uint64_t (**)(char *, CSIdentityQueryFlags, uint64_t, CFRunLoopRef, CFStringRef))(*((_QWORD *)query + 2) + 64))((char *)query + 16, flags, v10, runLoop, runLoopMode);
}

void CSIdentityQueryStop(CSIdentityQueryRef query)
{
  (*(void (**)(char *))(*((_QWORD *)query + 2) + 72))((char *)query + 16);
}

void CSIdentityQueryClient::~CSIdentityQueryClient(CSIdentityQueryClient *this)
{
  JUMPOUT(0x186DADEF4);
}

CFStringRef _CSBackToMyMacCopyDomain()
{
  uint64_t v0;
  CFDictionaryRef v1;
  const __CFDictionary *v2;
  CFStringRef NormalizedDomainName;
  const __CFString *Value;
  const __CFString *v5;

  v0 = geteuid();
  v1 = copyBackToMyMacPreferences();
  if (!v1)
    return 0;
  v2 = v1;
  NormalizedDomainName = CFStringCreateWithFormat(0, 0, CFSTR("%d"), v0);
  if (NormalizedDomainName)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v2, NormalizedDomainName);
    if (Value)
    {
      v5 = Value;
      CFRetain(Value);
      CFRelease(NormalizedDomainName);
      CFRelease(v2);
      NormalizedDomainName = createNormalizedDomainName(v5);
      v2 = (const __CFDictionary *)v5;
    }
    else
    {
      CFRelease(NormalizedDomainName);
      NormalizedDomainName = 0;
    }
  }
  CFRelease(v2);
  return NormalizedDomainName;
}

CFMutableStringRef createNormalizedDomainName(const __CFString *a1)
{
  CFMutableStringRef MutableCopy;

  if (!CFStringGetLength(a1))
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
  if (!CFStringHasSuffix(MutableCopy, CFSTR(".")))
    CFStringAppend(MutableCopy, CFSTR("."));
  CFStringLowercase(MutableCopy, 0);
  return MutableCopy;
}

__CFSet *_CSBackToMyMacCopyDomains()
{
  __CFSet *Mutable;
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  CFIndex Count;
  uint64_t v4;
  unint64_t v5;
  const void **v6;
  size_t v7;
  CFMutableStringRef NormalizedDomainName;
  CFMutableStringRef v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9AEC0]);
  v1 = copyBackToMyMacPreferences();
  if (v1)
  {
    v2 = v1;
    Count = CFDictionaryGetCount(v1);
    if (Count)
    {
      v4 = Count;
      MEMORY[0x1E0C80A78](Count);
      v6 = (const void **)((char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
      v7 = v5 >= 0x200 ? 512 : v5;
      bzero((char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      CFDictionaryGetKeysAndValues(v2, 0, v6);
      if (v4 >= 1)
      {
        do
        {
          NormalizedDomainName = createNormalizedDomainName((const __CFString *)*v6);
          if (NormalizedDomainName)
          {
            v9 = NormalizedDomainName;
            CFSetSetValue(Mutable, NormalizedDomainName);
            CFRelease(v9);
          }
          ++v6;
          --v4;
        }
        while (v4);
      }
    }
    CFRelease(v2);
  }
  return Mutable;
}

CFDictionaryRef copyBackToMyMacPreferences()
{
  const __SCPreferences *v0;
  const __SCPreferences *v1;
  CFDictionaryRef Value;
  CFDictionaryRef v3;

  v0 = SCPreferencesCreate(0, CFSTR("com.apple.BackToMyMac"), 0);
  if (!v0)
    return 0;
  v1 = v0;
  Value = SCPreferencesPathGetValue(v0, CFSTR("/System/Network/BackToMyMac"));
  v3 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v1);
  return v3;
}

uint64_t _CSDeviceSupportsAirDrop()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  CFTypeID v3;
  int Value;
  CFTypeID v5;
  int v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  int v11;
  const __CFBoolean **v12;
  CFTypeID v13;
  int v14;

  v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
  if (_CSDeviceSupportsAirDrop_supportsAirDrop)
    return CFBooleanGetValue(v0);
  v1 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("DisableAirDrop"), CFSTR("com.apple.NetworkBrowser"));
  if (!v1)
    goto LABEL_11;
  v2 = v1;
  v3 = CFGetTypeID(v1);
  if (v3 == CFBooleanGetTypeID())
  {
    Value = CFBooleanGetValue(v2);
  }
  else
  {
    v5 = CFGetTypeID(v2);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v2);
LABEL_11:
      _CSDeviceSupportsAirDrop_supportsAirDrop = *MEMORY[0x1E0C9AE40];
      v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
      if (_CSDeviceSupportsAirDrop_supportsAirDrop)
        return CFBooleanGetValue(v0);
      goto LABEL_12;
    }
    Value = CFEqual(v2, CFSTR("1"));
  }
  v6 = Value;
  CFRelease(v2);
  if (v6)
    goto LABEL_11;
  v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
  if (_CSDeviceSupportsAirDrop_supportsAirDrop)
    return CFBooleanGetValue(v0);
LABEL_12:
  v7 = (const __CFBoolean *)browseAllInterfacesEnabled_enabled;
  if (!browseAllInterfacesEnabled_enabled)
  {
    v8 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("BrowseAllInterfaces"), CFSTR("com.apple.NetworkBrowser"));
    if (!v8)
    {
      v12 = (const __CFBoolean **)MEMORY[0x1E0C9AE50];
LABEL_23:
      v7 = *v12;
      browseAllInterfacesEnabled_enabled = (uint64_t)*v12;
      goto LABEL_24;
    }
    v9 = v8;
    v10 = CFGetTypeID(v8);
    if (v10 == CFBooleanGetTypeID())
    {
      v11 = CFBooleanGetValue(v9);
    }
    else
    {
      v13 = CFGetTypeID(v9);
      if (v13 != CFStringGetTypeID())
      {
        v14 = 1;
LABEL_21:
        CFRelease(v9);
        v12 = (const __CFBoolean **)MEMORY[0x1E0C9AE50];
        if (!v14)
          v12 = (const __CFBoolean **)MEMORY[0x1E0C9AE40];
        goto LABEL_23;
      }
      v11 = CFEqual(v9, CFSTR("1"));
    }
    v14 = v11;
    goto LABEL_21;
  }
LABEL_24:
  if (!CFBooleanGetValue(v7))
  {
    v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
    if (_CSDeviceSupportsAirDrop_supportsAirDrop)
      return CFBooleanGetValue(v0);
    goto LABEL_26;
  }
  _CSDeviceSupportsAirDrop_supportsAirDrop = *MEMORY[0x1E0C9AE50];
  v0 = (const __CFBoolean *)_CSDeviceSupportsAirDrop_supportsAirDrop;
  if (!_CSDeviceSupportsAirDrop_supportsAirDrop)
  {
LABEL_26:
    v0 = (const __CFBoolean *)*MEMORY[0x1E0C9AE40];
    _CSDeviceSupportsAirDrop_supportsAirDrop = *MEMORY[0x1E0C9AE40];
  }
  return CFBooleanGetValue(v0);
}

uint64_t _CSIsComputerToComputerEnabled()
{
  return 0;
}

uint64_t _CSIsWirelessAccessPointEnabled()
{
  return 0;
}

uint64_t _CSEnableWirelessP2P()
{
  return 0;
}

uint64_t _CSDisassociateWireless()
{
  return 0;
}

CFStringRef _CSCopyCommentForServerName(const __CFAllocator *a1, CFStringRef theString)
{
  CFStringEncoding v4;
  CFIndex Length;
  CFIndex Bytes;
  CFIndex v8;
  __CFString *MutableCopy;
  CFIndex v10;
  CFRange RangeOfComposedCharactersAtIndex;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  CFRange range;
  CFRange v16;
  CFRange v17;

  if (_CSCopyCommentForServerName_sOnce != -1)
    dispatch_once(&_CSCopyCommentForServerName_sOnce, &__block_literal_global_16);
  v4 = _CSCopyCommentForServerName_dosEncoding;
  Length = CFStringGetLength(theString);
  v16.location = 0;
  v16.length = Length;
  Bytes = CFStringGetBytes(theString, v16, v4, 0, 0, 0, 0, 0);
  range.location = Bytes;
  if (Bytes == Length)
    return CFStringCreateCopy(a1, theString);
  v8 = Bytes;
  MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
  range.length = 0;
  if (v8 < Length)
  {
    v10 = 0;
    do
    {
      while (1)
      {
        RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(theString, v8);
        range.length = RangeOfComposedCharactersAtIndex.location
                     + RangeOfComposedCharactersAtIndex.length
                     - range.location;
        v17.length = Length - (RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length);
        v17.location = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
        v12 = CFStringGetBytes(theString, v17, v4, 0, 0, 0, 0, 0);
        v13 = range.length;
        if (v12 <= 0)
          break;
        v14 = v12;
        range.location += v10;
        CFStringTransform(MutableCopy, &range, CFSTR("Publishing-Any; Any-Latin; NFKD; [:^ASCII:] Remove"), 0);
        v10 = v10 - v13 + range.length;
        v8 = v14 + RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
        range.location = v8;
        range.length = 0;
        if (v8 >= Length)
          goto LABEL_14;
      }
      v8 = range.location + range.length;
    }
    while (range.location + range.length < Length);
    if (range.length >= 1)
      CFStringTransform(MutableCopy, &range, CFSTR("Publishing-Any; Any-Latin; NFKD; [:^ASCII:] Remove"), 0);
  }
LABEL_14:
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
  return MutableCopy;
}

CFStringRef _CSCreatePosixNameFromString(const __CFAllocator *a1, const __CFString *a2)
{
  return createPosixNameFromString(a1, a2, 1);
}

CFStringRef createPosixNameFromString(const __CFAllocator *a1, CFStringRef theString, int a3)
{
  CFIndex Length;
  CFIndex v7;
  const __CFArray *v8;
  const __CFArray *v9;
  const __CFString *ValueAtIndex;
  const __CFLocale *v11;
  CFStringTokenizerRef v12;
  __CFStringTokenizer *v13;
  CFMutableStringRef MutableCopy;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  CFRange v18;
  CFStringRef v19;
  CFRange v21;
  CFRange v22;

  Length = CFStringGetLength(theString);
  if (Length < 1)
    return 0;
  v7 = Length;
  v8 = CFLocaleCopyPreferredLanguages();
  if (v8)
  {
    v9 = v8;
    if (CFArrayGetCount(v8) < 1)
    {
      v11 = 0;
    }
    else
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v9, 0);
      v11 = CFLocaleCreate(a1, ValueAtIndex);
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  v21.location = 0;
  v21.length = v7;
  v22.location = 0;
  v22.length = v7;
  v12 = CFStringTokenizerCreate(a1, theString, v22, 0x10004uLL, v11);
  if (!v12)
  {
    MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
    if (MutableCopy)
      goto LABEL_14;
LABEL_27:
    v19 = 0;
    if (!v11)
      goto LABEL_21;
    goto LABEL_20;
  }
  v13 = v12;
  MutableCopy = CFStringCreateMutable(a1, 0);
  while (CFStringTokenizerAdvanceToNextToken(v13))
  {
    v15 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v13, 0x10000uLL);
    if (v15)
    {
      v16 = v15;
      CFStringAppend(MutableCopy, v15);
      CFRelease(v16);
    }
  }
  CFRelease(v13);
  if (!MutableCopy)
    goto LABEL_27;
LABEL_14:
  v21.location = 0;
  v21.length = CFStringGetLength(MutableCopy);
  CFStringTransform(MutableCopy, &v21, CFSTR("Latin; NFD; [^-_a-zA-Z0-9] Remove"), 0);
  if (a3)
    CFStringLowercase(MutableCopy, v11);
  v17 = CFStringGetLength(MutableCopy);
  if (v17 >= 255)
    v18.length = 255;
  else
    v18.length = v17;
  v21.location = 0;
  v21.length = v18.length;
  v18.location = 0;
  v19 = CFStringCreateWithSubstring(a1, MutableCopy, v18);
  CFRelease(MutableCopy);
  if (v11)
LABEL_20:
    CFRelease(v11);
LABEL_21:
  if (v19 && !CFStringGetLength(v19))
  {
    CFRelease(v19);
    return 0;
  }
  return v19;
}

CFStringRef _CSCopyLocalHostnameForComputerName(const __CFAllocator *a1, CFStringRef theString)
{
  CFMutableStringRef MutableCopy;
  CFStringRef PosixNameFromString;
  CFRange v6;
  CFRange v7;
  CFRange v8;

  MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
  v6.length = CFStringGetLength(MutableCopy);
  v6.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR(" "), CFSTR("-"), v6, 0);
  v7.length = CFStringGetLength(MutableCopy);
  v7.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR("_"), CFSTR("-"), v7, 0);
  do
  {
    v8.length = CFStringGetLength(MutableCopy);
    v8.location = 0;
  }
  while (CFStringFindAndReplace(MutableCopy, CFSTR("--"), CFSTR("-"), v8, 0));
  CFStringTrim(MutableCopy, CFSTR("-"));
  PosixNameFromString = createPosixNameFromString(a1, MutableCopy, 0);
  CFRelease(MutableCopy);
  if (PosixNameFromString)
    return PosixNameFromString;
  else
    return CFStringCreateCopy(a1, CFSTR("Macintosh"));
}

void _XCFStringHashCaseInsensitive_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "LaunchServices: unable to create character buffer for string to be hashed", v1, 2u);
}

void _FSNodeGetNonFictionalDeviceNumber(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "Could not get non-fictional device number: %@", (uint8_t *)&v3);
}

void _LSAliasGet_cold_1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "bad alias at %p, size %ld too big\n", buf, 0x16u);
}

void computeIdentityString(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "could not escape bookmark string: %@", a5, a6, a7, a8, 2u);
}

void evaluateBundleNoIOCommon(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Skipping bundle %llx during enumeration because it is third-party", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void getSharedMCProfileConnection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "LSRestrictionsManager: [MCProfileConnection sharedConnection] returned nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_RefreshContentInFrameworkAtURL_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "couldn't update framework %@: %@");
  OUTLINED_FUNCTION_1();
}

void _LSUnregisterAppWithBundleID_cold_1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23_0();
  v3 = v0;
  OUTLINED_FUNCTION_17_0(&dword_182882000, v1, (uint64_t)v1, "LaunchServices: Failed to unregister app %@ with error %d", v2);
  OUTLINED_FUNCTION_1();
}

void _LSUnregisterAppWithBundleID_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "no bundleID in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void handleSaveObserverBehavior_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "operation succeeded but no save token was provided? That's wrong.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_UpdateDatabaseWithInfo_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Error attempting to update bundle record for %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void _LSServer_UpdateDatabaseWithInfo_cold_2()
{
  int v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 1024;
  v4 = v0;
  OUTLINED_FUNCTION_17_0(&dword_182882000, v1, (uint64_t)v1, "Could not create bundle record updater for %@ (placeholder %d): likely missing in the database", v2);
  OUTLINED_FUNCTION_1();
}

void _LSServer_PerformExternalRebuildRegistration_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "no rebuild is in progress, cannot register items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_PerformExternalRebuildRegistration_cold_2(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_6_0();
  v4 = v3;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "don't know how to register %@ yet", v5, 0xCu);

  OUTLINED_FUNCTION_16();
}

void _LSServer_NoteMigratorRunningInMigration_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "no rebuild is in progress, so why is our migrator running?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_LSEnumerateAndRegisterAllCryptexContentWithContext_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "error enumerating cryptex content! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _getBlockToUpdateBundleRecordFromMIAndNotifyIfChanged_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Couldn't determine if record for %@ needed to be updated, failed to create FSNode for %@");
  OUTLINED_FUNCTION_1();
}

void _LSServer_NoteTerminationRequestForMISync_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "MI sync was running. setting sync interrupted file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void LSApplicationStateChangedCallback_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Received %@ with %@");
  OUTLINED_FUNCTION_1();
}

void __unsubscribeFromLSAWDistributedNotification_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_4_1(&dword_182882000, v0, v1, "Subscriber count negative overflow for %@. Some caller may have over-unsubscribed its LSAW observer, or neglected to add it in the first place.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __pluginQueryFault_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "59638328 Plugin query method called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSSetCrashReporterMessage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___getBlockToUpdatePluginRecordFromMIAndNotifyIfChanged_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to create LSPlugInKitProxy object for newly registered extension %@ (%@), not sending notifications");
  OUTLINED_FUNCTION_1();
}

void _LSWriteBundlePlaceholderToURLInternal(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Creating placeholder for bundle %@ with no iTunesMetadata.plist, this app cannot be recovered!", (uint8_t *)&v2, 0xCu);
}

void LaunchServices::BindingEvaluator::ContentTypeBindingAllowsOverride(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1026;
  v6 = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Override allowed for content type %{public}@, roles 0x%{public}x", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::BindingEvaluation::getKindStringFromState(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "getKindStringFromState result=nil ", v1, 2u);
}

void LaunchServices::BindingEvaluation::getKindStringFromState(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Canonical string not found for kind string %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::BindingEvaluation::getKindStringFromState(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "isBetaApp bundle lookup error %d, node %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void ___ZL18_LSSetCrashMessageP8NSString_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSBundleFindWithNode_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Bundle %{private}@ was not found by name. Doing a linear search for it.", (uint8_t *)&v2, 0xCu);
}

void _LSBundleCopyOrCheckNode(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315651;
  v4 = "_LSBundleCopyOrCheckNode";
  v5 = 2113;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%s: error registering new node %{private}@: %{public}@", (uint8_t *)&v3, 0x20u);
}

void _LSBundleGetLocalizedName_cold_1()
{
  void *v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Bundle %{private}@ (%llx) needs localized name slow path", v4, v5);

  OUTLINED_FUNCTION_3_2();
}

void _LSBundleGetLocalizedName_cold_2()
{
  void *v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Bundle %{private}@ (%llx) used localized name fast path", v4, v5);

  OUTLINED_FUNCTION_3_2();
}

void _LSBundleGetLocalizedNameDictionary_cold_1()
{
  void *v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Bundle %{private}@ (%llx) needs localized name dict slow path", v4, v5);

  OUTLINED_FUNCTION_3_2();
}

void _LSBundleGetLocalizedNameDictionary_cold_2()
{
  void *v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Bundle %{private}@ (%llx) used localized name dict fast path", v4, v5);

  OUTLINED_FUNCTION_3_2();
}

void _LSCreateResolvedURL_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_182882000, v1, OS_LOG_TYPE_DEBUG, "failed to resolve symlinks in %@ <%@>", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSCreateResolvedURL_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LaunchServices: CFURLGetFileSystemRepresentation failed for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSCreateResolvedURL_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "LaunchServices: getattrlist failed for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Adding database record for volume %{private}@ with volume ID %llu");
  OUTLINED_FUNCTION_1();
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Found database record for volume %{private}@ with volume ID %llu");
  OUTLINED_FUNCTION_1();
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Expensively searching for volume %{private}@ in existing records", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

void ___ZL15_LSContainerAddP9LSContextP6FSNodeP6NSDataS2_S4_tyhU13block_pointerFvjP7NSErrorE_block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Cheaply searching for volume %{private}@ in existing records", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

void _LSCopyDataContainerURLFromContainermanager_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_182882000, v0, v1, "ContainerManager error fetching data container for %{private}@: %llu %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void _LSCopyGroupContainerURLSFromContainermanager_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_182882000, v0, v1, "ContainerManager error fetching group containers for %{private}@: %llu %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void _LSCopyEnvironmentVariablesFromContainermanager_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_3(&dword_182882000, v0, v1, "ContainerManager error populating env variables for %{private}@: %llu %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void _LSShouldFetchContainersFromContainermanagerForPersona_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "No concrete persona found for system persona app", v1, 2u);
}

void _LSGetValidApplicationCategoryTypeSet_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = "CFSetRef _LSGetValidApplicationCategoryTypeSet()";
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%{public}s: unable to get categories: %{public}@", buf, 0x16u);

}

void _LSSetLocalDatabaseIfNewer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_10_0(3.8521e-34, a1, a2, a3);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Database with sequence number %llu is newer than database with sequence number %llu, so using it", v3, v4);
}

void _LSSetLocalDatabaseIfNewer_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_10_0(3.8521e-34, a1, a2, a3);
  OUTLINED_FUNCTION_1_1(&dword_182882000, "Database with sequence number %llu is NOT newer than database with sequence number %llu, so NOT using it", v3, v4);
}

void _LSDatabaseSetHeader()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to write database header: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateWithAccessContext_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "CSStoreCreateMutableCopy failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateWithAccessContext_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 176);
  *(_DWORD *)a2 = 134217984;
  *(_QWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "Loaded LS database with sequence number %llu", (uint8_t *)a2);
}

void _LSDatabaseCreateWithAccessContext_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSSchemaConfigureForStore failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateFromPersistentStore_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateFromPersistentStoreIgnoringRecoveryFile failed (forcing empty) with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateFromPersistentStore_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateFromPersistentStoreIgnoringRecoveryFile failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateFromPersistentStore_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "_LSCreateStoreWithFileContents found a recovery file, so creating a new empty store", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSDatabaseCreateRecoveryFile_cold_1(int *a1, uint8_t *buf, int a3, os_log_t log)
{
  int v4;

  v4 = *a1;
  *(_DWORD *)buf = 136446722;
  *(_QWORD *)(buf + 4) = "void _LSDatabaseCreateRecoveryFile(NSURL *__strong)";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = v4;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "%{public}s: ::close(%i) failed with error %i", buf, 0x18u);
}

void _LSDatabaseCreateRecoveryFile_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16_0();
  v3 = 2080;
  v4 = v0;
  v5 = 1024;
  v6 = 2561;
  v7 = 1024;
  v8 = 436;
  _os_log_error_impl(&dword_182882000, v1, OS_LOG_TYPE_ERROR, "%{public}s: warning: ::open_dprotected_np(%s, %x, %x) failed with EEXIST", v2, 0x22u);
}

void _LSDatabaseCreateRecoveryFile_cold_3(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)buf = 136447234;
  *(_QWORD *)(buf + 4) = "void _LSDatabaseCreateRecoveryFile(NSURL *__strong)";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 2561;
  *((_WORD *)buf + 14) = 1024;
  *(_DWORD *)(buf + 30) = 436;
  *((_WORD *)buf + 17) = 1024;
  *((_DWORD *)buf + 9) = v4;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "%{public}s: ::open_dprotected_np(%s, %x, %x) failed with error %i", buf, 0x28u);
}

void _LSDatabaseCreateFromPersistentStoreIgnoringRecoveryFile()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "asked to create an empty store but options disallow it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSCreateEmptyStore failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreate failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSCreateStoreWithFileContents Failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseDeleteRecoveryFile_cold_1(uint64_t a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v4;

  v4 = *a2;
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v4;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "Error: Failed to remove recovery file %{public}s with errno %d", buf, 0x12u);
}

void _LSCreateStoreWithFileContents()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_CSStoreCreateWithURL failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseClean()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16_0();
  v2 = 2082;
  v3 = "/System/Library/CoreServices/MobileCoreTypes.bundle";
  _os_log_error_impl(&dword_182882000, v0, OS_LOG_TYPE_ERROR, "Error %ld registering path %{public}s", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCommit_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "NotifyToken::Post(%{public}@)", v2);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateStringArrayCommon(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_11_0(&dword_182882000, a3, (uint64_t)a3, "Null string in input array while constructing string array, but the caller is OK with that.", a1);
}

void _LSContextInitCommon()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to initialize client context with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "Client database updated - seq#: %llu", v2);
  OUTLINED_FUNCTION_1();
}

void _LSContextInvalidate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11_0(&dword_182882000, v0, v1, "_LSContextInvalidate is not implemented when running as the server.", v2);
  OUTLINED_FUNCTION_33();
}

void _LSContextInvalidate_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "Client database invalidated for session: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_3_2();
}

void _LSDatabaseSentinelIncrement_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "sentinelCount == UINTMAX_MAX, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSDatabaseSentinelDecrement_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "sentinelCount == 0, aborting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSResetServer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Error creating store while resetting server: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSResetServer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Error creating DB while resetting server: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSSetCrashReporterMessage()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "%s", v2);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseCreateSnapshotAgainstAccessContext()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateSnapshotAgainstQueue failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Error saving session: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_2(void *a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 136446722;
  *(_QWORD *)(buf + 4) = "_LSSessionSave";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = a3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%{public}s: error saving prefs for session %@: %i", buf, 0x1Cu);

  OUTLINED_FUNCTION_3_2();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446722;
  *(_QWORD *)(buf + 4) = "_LSSessionSave";
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2114;
  *((_QWORD *)buf + 3) = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%{public}s: error saving database for session %@: %{public}@", buf, 0x20u);

  OUTLINED_FUNCTION_3_2();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_182882000, v1, OS_LOG_TYPE_FAULT, "Failed to save database to %{public}@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void ___ZL26_LSArmSaveTimerWithTimeouthdU13block_pointerFvbP11_LSDatabaseP7NSErrorE_block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Wrote corrupt store file %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateFromPersistentStore() returned error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateByRemappingDatabase() returned error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL16_LSDatabaseRemapP11_LSDatabaseU13block_pointerFvbP7NSErrorP8NSStringE_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "_LSDatabaseCreateByRemappingDatabase failed with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseContextStopAccessing_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Stopping database access (depth %li)", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSDatabaseContextStartAccessingWithDomain_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Starting database access (depth %li, options: %llx)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void getXPCObjectForNodeAndStore(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, v4, "could not create XPC representation of store while making XPC object: %@", (uint8_t *)&v5);

}

void getXPCObjectForNodeAndStore(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "could not get file system representation of store node while making XPC object: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void _LSContextCreateVisualizer_cold_1(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a4, (uint64_t)a3, "No functions for table %{public}@", a2);

}

void ___ZN14LaunchServices21DatabaseVisualizationL14getAllHandlersEP9LSContext_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a2, a3, "Table %{public}@ has no handler functions and will not display well in CSStore Viewer.", (uint8_t *)&v3);
}

void _LSDefaultsBaseSystemContainerURL_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136446722;
  v5 = "NSURL *_LSDefaultsBaseSystemContainerURL(void)";
  v6 = 2048;
  v7 = v3;
  v8 = 2082;
  v9 = a2;
  OUTLINED_FUNCTION_4_5(&dword_182882000, a3, (uint64_t)a3, "%{public}s: error %llu getting container path: %{public}s", (uint8_t *)&v4);
}

void emitSandboxExceptionAndMaybeAbortForSneakyURLUsage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "This process has called into a server-only method of a private class in CoreServices. It must not do this. Break on __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_PRIVATE_SYMBOLS__ to debug.", a5, a6, a7, a8, 0);
}

void LaunchServices::DMFSupport::getPoliciesWithCompletionHandler(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "no DMFApplicationPolicyMonitor available in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices10DMFSupportL17reloadAllPoliciesEP27DMFApplicationPolicyMonitor_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to get DMF policy for all applications: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices10DMFSupportL17reloadAllPoliciesEP27DMFApplicationPolicyMonitor_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Got all DMF policies: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::DMFSupport::addKnownPoliciesToCache()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Skipping DMF notifications because nobody is listening", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "No changes in DMF, so not posting a notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "DMF policy changed, so posting a notification: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices10DMFSupportL32getPoliciesWithCompletionHandlerEP5NSSetIP8NSStringEhU13block_pointerFvP12NSDictionaryIS3_P8NSNumberEP7NSErrorE_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "unable to get policies from DMF: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices10DMFSupportL32getPoliciesWithCompletionHandlerEP5NSSetIP8NSStringEhU13block_pointerFvP12NSDictionaryIS3_P8NSNumberEP7NSErrorE_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Got some DMF policies: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSDServiceGetXPCProxyForServiceClass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "%{public}s: could not create NSXPCConnection to talk to lsd", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _LSCopyServerStore_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "Attempt to map database failed: permission was denied. This attempt will not be retried.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSCopyServerStore_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "LaunchServices: Database mapping failed, process cannot lookup com.apple.lsd.mapdb port by name.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSCopyServerStore_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "LaunchServices: connection invalid while copying server store, will not retry. This is normal iff the session is terminating.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSCopyServerStore_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "Database was not available and LSDatabaseContextAccessOptionIfAvailable was specified. Returning error immediately to caller.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void _LSIsAuditTokenSandboxed_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "sandbox_check_by_audit_token failed in lsd! That's a bad bug! errno=%d", (uint8_t *)v2, 8u);
}

void _LSEnumeratorFireErrorHandler_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_182882000, v0, (uint64_t)v0, "Error during enumeration of %{private}@: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

void _LSDBEnumeratorPrepareIfNeeded_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a4, a3, "Failed to get DB when preparing enumerator %{private}@: %{public}@", (uint8_t *)a3);

}

void _LSDBEnumeratorPrepareIfNeeded_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Prepared enumerator %{private}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSDBEnumeratorPrepareIfNeeded_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_0(&dword_182882000, v0, (uint64_t)v0, "Failed to prepare enumerator %{private}@: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

void _LSGetOSStatusFromNSError_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Launch Services encountered an error, converting to OSStatus %li: %{public}@");
  OUTLINED_FUNCTION_1();
}

void _LSGetOSStatusFromNSError_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "XPC error encountered: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _LSGetOSStatusFromNSError_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "Launch Services, forced to convert an NSError to an OSStatus, came up with kLSUnknownError for %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _LSGetNSErrorFromOSStatusImpl_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Converted OSStatus %li to error %{public}@");
  OUTLINED_FUNCTION_1();
}

void _LSCopyUserActivityDomainNamesForBundleID_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "CFArrayRef _LSCopyUserActivityDomainNamesForBundleID(CFStringRef)";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Error in %{public}s: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void ___ZL22initActivationObserverv_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "Unable to register for activation state changed notification.", a5, a6, a7, a8, 0);
}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_5(&dword_182882000, a2, a3, "Failed to get storage container: error=%llu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_223_cold_1(void *a1, uint64_t a2)
{
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_12_1((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_4_3(&dword_182882000, v3, (uint64_t)v3, "Annotations are stored at [%{public}@]", v4);

}

void ___ZL29pluginKitUserElectionStoreURLv_block_invoke_223_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Failed to create storage directory at [%{public}@] error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void LaunchServices::LocalizedString::localizeUnsafely(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "kLSDefaultLocalizedValueKey encountered in matching localizations set.", buf, 2u);
}

void LaunchServices::EligibilityCache::refreshAnswerForDomain(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "could not find answer for domain %llu: %@", (uint8_t *)&v3, 0x16u);
}

void LaunchServices::EligibilityCache::getEligibilityGatedBrowsersCanBind(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Couldn't get answer for lithium domain: %@", (uint8_t *)&v2, 0xCu);
}

void ___ZL78_LSGetDefaultPreferredLocalizationsWithFallbackForImproperlyLocalizedProcessesv_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "This process does not have access to the user's preferred locales, yet it is requesting localized strings from Launch Services with no specified input locales. This is a problem for correctness and performance. This message will be logged only once in this process.", v1, 2u);
}

void _LSCopierCallback(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Unknown MDTCopierCallbackType %d", (uint8_t *)v2, 8u);
}

void `anonymous namespace'::StagedFileResource::~StagedFileResource(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Unable to remove open staging container %@: %@", (uint8_t *)&v4, 0x16u);
}

void makeStagingDirectoryURLInContainer(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "could not create new mailbox directory: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void makeStagingDirectoryURLInContainer()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "could not set attributes for new staging directory in %@{public}: %@");
  OUTLINED_FUNCTION_1();
}

void makeStagingDirectoryURLInContainer(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_182882000, a2, a3, "Unexpected failure to create %{public}@: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void ___ZL34makeStagingDirectoryURLInContainerP5NSURLPU15__autoreleasingP7NSError_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E0C80C00]);
  v3 = 138543874;
  v4 = v0;
  v5 = 2080;
  v6 = "makeStagingDirectoryURLInContainer_block_invoke";
  v7 = 2114;
  v8 = v1;
  _os_log_error_impl(&dword_182882000, v2, OS_LOG_TYPE_ERROR, "could not remove %{public}@ in %s: %{public}@", (uint8_t *)&v3, 0x20u);
}

void _LSOpenOperationPerform(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138478083;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2113;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Default handler for node %{private}@ is already set to %{private}@", buf, 0x16u);

}

void ___ZL23_LSUpdateDefaultHandlerP18LSApplicationProxyP5NSURL_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to set default handler: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _LSPersistentIdentifierCompare_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Persistent identifiers %p and %p are exactly equal", v2, v3);
}

void _LSPersistentIdentifierCompare_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  const void *v3;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Persistent identifiers %p and %p are from the same database", v2, v3);
}

void _LSPlistDataGetHint_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a2, a3, "Getting plist hint for data %p", (uint8_t *)&v3);
}

void _LSPlistDataGetValuesForKeys_cold_1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "Keys { %{public}@ } were requested and require us to take a slow path.", (uint8_t *)a2);

}

void _LSPlistDataGetValuesForKeys_cold_2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "Got values for keys { %{public}@ } from CF SPI (fast path).", (uint8_t *)a2);

}

void ___ZL24_LSPlistGetCommonStringsv_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Unable to get a list of common plist strings from the Launch Services framework. Plists may encode/decode erratically.", v1, 2u);
}

void _LSPluginIsValid_cold_1(unsigned int a1, unsigned int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Plugin %llx has invalid parent app %llx", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __pluginQueryFault_block_invoke_cold_1_0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "59638328 Plugin query method called", v1, 2u);
}

void getValueForKeyFromPlugin(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "parentApp value for plugin was invalid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_33();
}

void ___ZL16pluginQueryFaultv_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "59638328 Plugin query method called", v1, 2u);
  OUTLINED_FUNCTION_33();
}

void ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a2, a3, "could not dlopen libmis: %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZL39getkMISMinSupportedSignatureVersion_ptrv_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_182882000, a2, a3, "could not find kMISMinSupportedSignatureVersion in libmis: %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void ___ZN13LSHandlerPref12CopyHandlersEv_block_invoke_cold_1(uint8_t *buf, int a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 2048;
  *(_QWORD *)(buf + 10) = a3;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Handler prefs found; uid = %d; count = %ld;\n",
    buf,
    0x12u);
}

void LaunchServices::PrefsStorage::_needsUpdate(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 134218240;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_1_0(&dword_182882000, a2, a3, "Prefs notify token value changed from %llu to %llu: needs update.", (_QWORD)v3, *((_QWORD *)&v3 + 1));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12PrefsStorage7_updateEv_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to read preferences from lsd. They will be unavailable. %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::PrefsStorage::_updateOtherProcesses()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Incremented prefs notify token value. New value is %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::PrefsStorage::_setNeedsUpdate(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Cleared prefs notify token value to a nonsensical state to force an update on next call.", v1, 2u);
}

void LaunchServices::PrefsStorage::_GetBundleIdentifierWithAppNode()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Node %{private}@ has no bundle ID.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::PrefsStorage::_SetValueForNodeInPrefsArray()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Deleting app node %{private}@ from prefs, but not present. Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "Inserting app node %{private}@ with value %{private}@ into prefs.");
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Deleting app node %{private}@ from prefs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::PrefsStorage::setValueForNode()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Adding prefs[%{public}@] for the first time.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void applyStorageACLToURL(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "failed to set ACL on %@: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

void _LSFindOrRegisterBundleNode_cold_1(uint64_t *a1, unsigned int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Skipping check that bundleData (%p) != NULL because we don't expect we'll have a valid pointer (caller didn't ask us (%llx) to reinitialize LS database context, so data is known-stale)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSUnregisterBundle_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138477827;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_debug_impl(&dword_182882000, a3, OS_LOG_TYPE_DEBUG, "Removing %{private}@ from protected apps store", (uint8_t *)a2, 0xCu);

}

void _LSServerItemInfoRegistration_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "LaunchServices: Asked to register a plugin at path %s with no CFBundleIdentifier in their plist.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSRegisterPlugin(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "will not register %@: it is in an app clip and has EPID %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void _LSSchemeApprovalBundleIsAppleInternal(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Error fetching bundle record for scheme approval: %@", (uint8_t *)&v2, 0xCu);
}

void _LSServer_RegisterItemInfo_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 8);
  v3 = 136446722;
  v4 = "OSStatus _LSServer_RegisterItemInfo(const LSRegistrationInfo *__strong, NSData *__strong, CFDictionaryRef, CFDict"
       "ionaryRef, CSStoreUnitID *, CSStoreUnitID *, Boolean *, CFStringRef *)";
  v5 = 2048;
  v6 = 7;
  v7 = 2048;
  v8 = v2;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "%{public}s: registration info version should be %llu but is %llu", (uint8_t *)&v3, 0x20u);
}

void _LSCanModifyDefaultHandler_cold_1(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_9(a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_182882000, "Unentitled request to set default handler for content type %@ by pid %d", v3, v4);
}

void _LSCanModifyDefaultHandler_cold_2(uint64_t a1, uint64_t a2, int a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_0_9(a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_7(&dword_182882000, "Unentitled request to set default handler for URL scheme %@ by pid %d", v3, v4);
}

void _LSServerMain_cold_1(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315394;
  v6 = "com.apple.lsd.firstboot";
  v7 = 2080;
  v8 = v3;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a1, v4, "Failed to create semaphore %s: %s", (uint8_t *)&v5);
}

void _LSServerMain_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Previous sync was interrupted, presumably by a reboot. Removing any extant recovery file.", v1, 2u);
}

void _LSServerMain_cold_3(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "databaseContainerDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_7();
  v7 = a1;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a2, v5, "Error fetching directory contents at path: %@ %@", v6);

}

void _LSServerMain_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_182882000, a2, OS_LOG_TYPE_FAULT, "could not set secure preferences class D: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSServerMain_cold_5(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "setiopolicy_np failed (%d), continuing and hoping for the best", (uint8_t *)v2, 8u);
}

void __listenForSigterm_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_0_10(&dword_182882000, v0, v1, "sigprocmask failed to mask SIGTERM: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __listenForSigterm_block_invoke_7_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_0_10(&dword_182882000, v0, v1, "sigprocmask failed to unmask SIGTERM: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __listenForSigterm_block_invoke_7_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_8();
  OUTLINED_FUNCTION_0_10(&dword_182882000, v0, v1, "could not determine which signals are pending: %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

void __performFirstBootWorkIfNecessary_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Unable to get database: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void _LSServer_GetiCloudHostNames_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "iCloud hostnames were not loaded from a plist; hardcoded list used",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_33();
}

void _LSServer_GetiCloudHostNames_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Fetching iCloud hostnames from %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Error loading iCloud hosts plist from %{public}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLOverrides::getiCloudHostNamesFromPlistAtURL()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_182882000, v0, OS_LOG_TYPE_ERROR, "Error loading iCloud hosts plist from %{public}@: value was missing or not an array", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLOverrides::State::State()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Getting server-side iCloud hostnames list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_182882000, v0, v1, "Getting iCloud hostnames list from lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "XPC error getting URL override for %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_182882000, a2, a3, "Did not get URL override for %{private}@, but had no error. This is normal and indicates there is no override for that URL.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12URLOverridesL20getURLOverrideCommonEP5NSURL_block_invoke_180_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138478083;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v1, v2, "Error getting URL override for %{private}@: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void ___ZN14LaunchServices12URLOverridesL18checkForiCloudHostEP15NSURLComponents_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_1(&dword_182882000, v0, v1, "Got iCloud hostnames list from lsd: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareLocalizedNameValue(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "Not localizing name for %{private}@ because we are in _LSContextInit() and recursion/deadlock would occur.", buf, 0xCu);

}

void LaunchServices::URLPropertyProvider::prepareDistinctLocalizedNameValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareLocalizedNameDictionaryValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareLocalizedTypeDescriptionDictionaryValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareArchitecturesValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareVolumeLocalizedNameValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void LaunchServices::URLPropertyProvider::prepareApplicationDeviceManagementPolicyValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a1, a3, "Can't provide property in %s with mimic", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void _LSIsKindOfClasses_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_182882000, a1, a3, "Caller is checking if an object is a (maybe bundle) record, so allowing the Core Types proxy too.", a5, a6, a7, a8, 0);
}

void _UTTypePrecachePropertiesOfIdentifiers_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "void _UTTypePrecachePropertiesOfIdentifiers(CFArrayRef)";
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "%{public}s is a no-op. Use the UniformTypeIdentifiers framework to get instances of the UTType class instead.", (uint8_t *)&v1, 0xCu);
}

void _UTTypeAddWithDeclarationDictionary_cold_1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  id v7;

  v7 = a2;
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v7;
  _os_log_error_impl(&dword_182882000, a4, OS_LOG_TYPE_ERROR, "Application \"%@\" declares a type \"%@\" without correct conformance to a file system type such as \"public.data\". This is a bug in the application.", (uint8_t *)a3, 0x16u);

}

void LaunchServices::TypeEvaluator::setSniffIfNeeded(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182882000, log, OS_LOG_TYPE_FAULT, "type evaluator can't sniff without doing IO", v1, 2u);
}

uint64_t CCDeriveKey()
{
  return MEMORY[0x1E0C80120]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

uint64_t CCKDFParametersCreateHkdf()
{
  return MEMORY[0x1E0C80228]();
}

uint64_t CCKDFParametersDestroy()
{
  return MEMORY[0x1E0C80230]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C803A8](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1E0C97FF8](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98030](bundleURL);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1E0C98040](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x1E0C98088](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C980C8](bundle);
}

CFStringRef CFBundleGetDevelopmentRegion(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98100](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
  MEMORY[0x1E0C982A0](theSet, theRange.location, theRange.length);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x1E0C982A8](theSet, theString);
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982B8](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982C8](alloc);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
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

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1E0C98658](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFFileDescriptorRef CFFileDescriptorCreate(CFAllocatorRef allocator, CFFileDescriptorNativeDescriptor fd, Boolean closeOnInvalidate, CFFileDescriptorCallBack callout, const CFFileDescriptorContext *context)
{
  return (CFFileDescriptorRef)MEMORY[0x1E0C98688](allocator, *(_QWORD *)&fd, closeOnInvalidate, callout, context);
}

CFRunLoopSourceRef CFFileDescriptorCreateRunLoopSource(CFAllocatorRef allocator, CFFileDescriptorRef f, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98690](allocator, f, order);
}

void CFFileDescriptorDisableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
  MEMORY[0x1E0C98698](f, callBackTypes);
}

void CFFileDescriptorEnableCallBacks(CFFileDescriptorRef f, CFOptionFlags callBackTypes)
{
  MEMORY[0x1E0C986A0](f, callBackTypes);
}

CFFileDescriptorNativeDescriptor CFFileDescriptorGetNativeDescriptor(CFFileDescriptorRef f)
{
  return MEMORY[0x1E0C986A8](f);
}

void CFFileDescriptorInvalidate(CFFileDescriptorRef f)
{
  MEMORY[0x1E0C986B0](f);
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return (CFFileSecurityRef)MEMORY[0x1E0C986D0](allocator);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x1E0C98708](fileSec, mode);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1E0C98790]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1E0C987A0](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
  MEMORY[0x1E0C98850](port, callout);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
  MEMORY[0x1E0C988E8](center, name, object, userInfo, options);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AC8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x1E0C98B00](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F18](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

UInt32 CFStringConvertEncodingToWindowsCodepage(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C98F38](*(_QWORD *)&encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99068](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
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

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x1E0C99160](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x1E0C991D0](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1E0C99218](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
  MEMORY[0x1E0C99250](theString, trimString);
}

void CFURLClearResourcePropertyCacheForKey(CFURLRef url, CFStringRef key)
{
  MEMORY[0x1E0C992C0](url, key);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1E0C99338](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C993D8](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99438](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForDirectoryURL(CFAllocatorRef alloc, CFURLRef directoryURL, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1E0C99450](alloc, directoryURL, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL(CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1E0C99468](enumerator, url, error);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x1E0C994E0](url, key, propertyValue, error);
}

void CFURLSetTemporaryResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue)
{
  MEMORY[0x1E0C994E8](url, key, propertyValue);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995C8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t CSMapAddMapTable()
{
  return MEMORY[0x1E0D18AE8]();
}

uint64_t CSMapGetHeader()
{
  return MEMORY[0x1E0D18AF0]();
}

uint64_t CSMapInit()
{
  return MEMORY[0x1E0D18AF8]();
}

uint64_t CSMapRemoveValue()
{
  return MEMORY[0x1E0D18B00]();
}

uint64_t CSMapSetValue()
{
  return MEMORY[0x1E0D18B08]();
}

uint64_t CSMapWriteToHeader()
{
  return MEMORY[0x1E0D18B10]();
}

uint64_t CSStoreAllocUnit()
{
  return MEMORY[0x1E0D18B18]();
}

uint64_t CSStoreAllocUnitWithData()
{
  return MEMORY[0x1E0D18B20]();
}

uint64_t CSStoreCreateMutable()
{
  return MEMORY[0x1E0D18B28]();
}

uint64_t CSStoreCreateMutableCopy()
{
  return MEMORY[0x1E0D18B30]();
}

uint64_t CSStoreFreeUnit()
{
  return MEMORY[0x1E0D18B38]();
}

uint64_t CSStoreGetGeneration()
{
  return MEMORY[0x1E0D18B40]();
}

uint64_t CSStoreGetHeader()
{
  return MEMORY[0x1E0D18B48]();
}

uint64_t CSStoreGetUnit()
{
  return MEMORY[0x1E0D18B50]();
}

uint64_t CSStringBindingCopyCFStrings()
{
  return MEMORY[0x1E0D18B58]();
}

uint64_t CSStringBindingFindStringAndBindings()
{
  return MEMORY[0x1E0D18B60]();
}

uint64_t CSStringBindingRemoveBindings()
{
  return MEMORY[0x1E0D18B68]();
}

uint64_t CSStringBindingSetBindings()
{
  return MEMORY[0x1E0D18B70]();
}

uint64_t CSStringBindingStoreAddTable()
{
  return MEMORY[0x1E0D18B78]();
}

uint64_t CSStringBindingStoreInit()
{
  return MEMORY[0x1E0D18B80]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89C8](allocator, name, prefsID);
}

CFDictionaryRef SCPreferencesPathGetValue(SCPreferencesRef prefs, CFStringRef path)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE89F0](prefs, path);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x1E0CD5F50]();
}

uint64_t SecPolicyCreateAppleIDAuthorityPolicy()
{
  return MEMORY[0x1E0CD6480]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66A8](trust, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleLocalizationsAddingDevelopmentLocalization()
{
  return MEMORY[0x1E0C99F68]();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCopyExecutableURLInDirectory()
{
  return MEMORY[0x1E0C99F78]();
}

uint64_t _CFBundleCopyFileTypeForFileURL()
{
  return MEMORY[0x1E0C99F80]();
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFCopySystemVersionPlatformDictionary()
{
  return MEMORY[0x1E0C9A0E0]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1E0C9A1A0]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x1E0C9A1A8]();
}

uint64_t _CFPropertyListCopyTopLevelKeys()
{
  return MEMORY[0x1E0C9A3F0]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x1E0C9A4A0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFStringGetUserDefaultEncoding()
{
  return MEMORY[0x1E0C9A538]();
}

uint64_t _CFURLBookmarkCopyDescription()
{
  return MEMORY[0x1E0C9A5B8]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x1E0C9A640]();
}

uint64_t _CFURLCopyPropertiesOfPromiseAtURL()
{
  return MEMORY[0x1E0C9A648]();
}

uint64_t _CFURLCopyResourcePropertyForKeyFromCache()
{
  return MEMORY[0x1E0C9A668]();
}

uint64_t _CFURLCopyResourcePropertyValuesAndFlags()
{
  return MEMORY[0x1E0C9A670]();
}

uint64_t _CFURLCreateStandardError()
{
  return MEMORY[0x1E0C9A6B0]();
}

uint64_t _CFURLFileCacheClearPropertyValueForKey()
{
  return MEMORY[0x1E0C9A6C8]();
}

uint64_t _CFURLFileCacheGetFinderInfo()
{
  return MEMORY[0x1E0C9A6D0]();
}

uint64_t _CFURLFileCacheGetFlags()
{
  return MEMORY[0x1E0C9A6D8]();
}

uint64_t _CFURLFileCacheGetName()
{
  return MEMORY[0x1E0C9A6E0]();
}

uint64_t _CFURLFileCacheGetPropertyValueForKey()
{
  return MEMORY[0x1E0C9A6E8]();
}

uint64_t _CFURLFileCacheSetPropertyValueForKey()
{
  return MEMORY[0x1E0C9A6F0]();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return MEMORY[0x1E0C9A700]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x1E0C9A710]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x1E0C9A718]();
}

uint64_t _CFURLIsPromiseName()
{
  return MEMORY[0x1E0C9A720]();
}

uint64_t _CFURLRegisterFilePropertyProvider()
{
  return MEMORY[0x1E0C9A758]();
}

uint64_t _CFURLRegisterFilePropertyWithOptions()
{
  return MEMORY[0x1E0C9A760]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _CSArrayAppendValue()
{
  return MEMORY[0x1E0D18BA0]();
}

uint64_t _CSArrayCreate()
{
  return MEMORY[0x1E0D18BA8]();
}

uint64_t _CSArrayCreateWithCapacity()
{
  return MEMORY[0x1E0D18BB0]();
}

uint64_t _CSArrayDispose()
{
  return MEMORY[0x1E0D18BB8]();
}

uint64_t _CSArrayEnumerateAllValues()
{
  return MEMORY[0x1E0D18BC0]();
}

uint64_t _CSArrayGetCount()
{
  return MEMORY[0x1E0D18BC8]();
}

uint64_t _CSArrayGetValueAtIndex()
{
  return MEMORY[0x1E0D18BD0]();
}

uint64_t _CSArrayInsertValueAtIndex()
{
  return MEMORY[0x1E0D18BD8]();
}

uint64_t _CSArrayRemoveValueAtIndex()
{
  return MEMORY[0x1E0D18BE0]();
}

uint64_t _CSCopyStringForCharacters()
{
  return MEMORY[0x1E0D18BE8]();
}

uint64_t _CSGetConstStringForCharacters()
{
  return MEMORY[0x1E0D18BF0]();
}

uint64_t _CSGetStringForCFString()
{
  return MEMORY[0x1E0D18BF8]();
}

uint64_t _CSGetStringForCharacters()
{
  return MEMORY[0x1E0D18C00]();
}

uint64_t _CSMapCopyDebugDescription()
{
  return MEMORY[0x1E0D18C08]();
}

uint64_t _CSStoreAccessContextAccessForRead()
{
  return MEMORY[0x1E0D18C10]();
}

uint64_t _CSStoreAccessContextAssertReading()
{
  return MEMORY[0x1E0D18C18]();
}

uint64_t _CSStoreAccessContextAssertWriting()
{
  return MEMORY[0x1E0D18C20]();
}

uint64_t _CSStoreAccessContextCreateSharedReadingContext()
{
  return MEMORY[0x1E0D18C28]();
}

uint64_t _CSStoreAccessContextCreateWithLock()
{
  return MEMORY[0x1E0D18C30]();
}

uint64_t _CSStoreAddTable()
{
  return MEMORY[0x1E0D18C38]();
}

uint64_t _CSStoreCopyDebugDescriptionOfBytesInRange()
{
  return MEMORY[0x1E0D18C40]();
}

uint64_t _CSStoreCopyDebugDescriptionOfUnit()
{
  return MEMORY[0x1E0D18C48]();
}

uint64_t _CSStoreCopyMemoryStatistics()
{
  return MEMORY[0x1E0D18C50]();
}

uint64_t _CSStoreCopyTableName()
{
  return MEMORY[0x1E0D18C58]();
}

uint64_t _CSStoreCreateDataWithUnitNoCopy()
{
  return MEMORY[0x1E0D18C60]();
}

uint64_t _CSStoreCreateWithURL()
{
  return MEMORY[0x1E0D18C68]();
}

uint64_t _CSStoreCreateWithXPCRepresentation()
{
  return MEMORY[0x1E0D18C70]();
}

uint64_t _CSStoreCreateXPCRepresentation()
{
  return MEMORY[0x1E0D18C78]();
}

uint64_t _CSStoreEnumerateTables()
{
  return MEMORY[0x1E0D18C80]();
}

uint64_t _CSStoreEnumerateUnits()
{
  return MEMORY[0x1E0D18C88]();
}

uint64_t _CSStoreGarbageCollect()
{
  return MEMORY[0x1E0D18C90]();
}

uint64_t _CSStoreGetArrayTable()
{
  return MEMORY[0x1E0D18C98]();
}

uint64_t _CSStoreGetCatalogTable()
{
  return MEMORY[0x1E0D18CA0]();
}

uint64_t _CSStoreGetStringTable()
{
  return MEMORY[0x1E0D18CA8]();
}

uint64_t _CSStoreGetTableWithName()
{
  return MEMORY[0x1E0D18CB0]();
}

uint64_t _CSStoreGetXPCClass()
{
  return MEMORY[0x1E0D18CB8]();
}

uint64_t _CSStoreIsMutable()
{
  return MEMORY[0x1E0D18CC0]();
}

uint64_t _CSStoreSetExpectedAccessContext()
{
  return MEMORY[0x1E0D18CC8]();
}

uint64_t _CSStoreSetMutable()
{
  return MEMORY[0x1E0D18CD0]();
}

uint64_t _CSStoreValidate()
{
  return MEMORY[0x1E0D18CD8]();
}

uint64_t _CSStoreWriteToHeader()
{
  return MEMORY[0x1E0D18CE0]();
}

uint64_t _CSStoreWriteToURL()
{
  return MEMORY[0x1E0D18CE8]();
}

uint64_t _CSStoreWriteToUnit()
{
  return MEMORY[0x1E0D18CF0]();
}

uint64_t _CSStringBindingEnumerate()
{
  return MEMORY[0x1E0D18CF8]();
}

uint64_t _CSStringBindingEnumerateAllBindings()
{
  return MEMORY[0x1E0D18D00]();
}

uint64_t _CSStringBindingGetBindings()
{
  return MEMORY[0x1E0D18D08]();
}

uint64_t _CSStringCopyCFString()
{
  return MEMORY[0x1E0D18D10]();
}

uint64_t _CSStringIsValid()
{
  return MEMORY[0x1E0D18D18]();
}

uint64_t _CSStringMakeConst()
{
  return MEMORY[0x1E0D18D20]();
}

uint64_t _CSStringRelease()
{
  return MEMORY[0x1E0D18D28]();
}

uint64_t _CSStringRetain()
{
  return MEMORY[0x1E0D18D30]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1E0C9A878]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1E0C9A8A8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t CSStore2::AttributedStringWriter::beginFlags(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x1E0D18D58](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::missingFlag()
{
  return MEMORY[0x1E0D18D60]();
}

uint64_t CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2, const unsigned int *a3)
{
  return MEMORY[0x1E0D18D68](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::stringArray(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x1E0D18D70](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::setVisualizer()
{
  return MEMORY[0x1E0D18D78]();
}

uint64_t CSStore2::AttributedStringWriter::withTextColor()
{
  return MEMORY[0x1E0D18D80]();
}

uint64_t CSStore2::AttributedStringWriter::attributedString(CSStore2::AttributedStringWriter *this, NSAttributedString *a2)
{
  return MEMORY[0x1E0D18D88](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::withWarningColors()
{
  return MEMORY[0x1E0D18D90]();
}

uint64_t CSStore2::AttributedStringWriter::beginBitfieldFlags(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x1E0D18D98](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::setInsertsNewlines(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x1E0D18DA0](this);
}

uint64_t CSStore2::AttributedStringWriter::withReferenceToUnit()
{
  return MEMORY[0x1E0D18DA8]();
}

uint64_t CSStore2::AttributedStringWriter::setElidesEmptyValues(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x1E0D18DB0](this);
}

uint64_t CSStore2::AttributedStringWriter::withAppliedAttribute()
{
  return MEMORY[0x1E0D18DB8]();
}

uint64_t CSStore2::AttributedStringWriter::withTextAndBackgroundColor()
{
  return MEMORY[0x1E0D18DC0]();
}

uint64_t CSStore2::AttributedStringWriter::flag()
{
  return MEMORY[0x1E0D18DC8]();
}

uint64_t CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, NSURL *a2, NSString *a3)
{
  return MEMORY[0x1E0D18DD0](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::link(CSStore2::AttributedStringWriter *this, uint64_t a2, uint64_t a3, NSString *a4)
{
  return MEMORY[0x1E0D18DD8](this, a2, a3, a4);
}

uint64_t CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSArray *a2)
{
  return MEMORY[0x1E0D18DE0](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::array(CSStore2::AttributedStringWriter *this, NSString *a2, NSArray *a3)
{
  return MEMORY[0x1E0D18DE8](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::format(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3, ...)
{
  return MEMORY[0x1E0D18DF0](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::number(CSStore2::AttributedStringWriter *this, NSString *a2, NSNumber *a3)
{
  return MEMORY[0x1E0D18DF8](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x1E0D18E00](this, a2);
}

{
  return MEMORY[0x1E0D18E10](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::string(CSStore2::AttributedStringWriter *this, NSString *a2, NSString *a3)
{
  return MEMORY[0x1E0D18E08](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::endFlags(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x1E0D18E18](this);
}

uint64_t CSStore2::AttributedStringWriter::Separator(CSStore2::AttributedStringWriter *this, uint64_t a2, NSString *a3)
{
  return MEMORY[0x1E0D18E20](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this, NSString *a2)
{
  return MEMORY[0x1E0D18E28](this, a2);
}

uint64_t CSStore2::AttributedStringWriter::childUnit(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x1E0D18E30](this);
}

uint64_t CSStore2::AttributedStringWriter::separator(CSStore2::AttributedStringWriter *this, uint64_t a2, NSString *a3)
{
  return MEMORY[0x1E0D18E38](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::timestamp(CSStore2::AttributedStringWriter *this, NSString *a2, double a3)
{
  return MEMORY[0x1E0D18E40](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, const __CSStore *a2, NSMutableAttributedString *a3)
{
  return MEMORY[0x1E0D18E48](this, a2, a3);
}

uint64_t CSStore2::AttributedStringWriter::AttributedStringWriter(CSStore2::AttributedStringWriter *this, const CSStore2::AttributedStringWriter *a2)
{
  return MEMORY[0x1E0D18E50](this, a2);
}

void CSStore2::AttributedStringWriter::~AttributedStringWriter(CSStore2::AttributedStringWriter *this)
{
  MEMORY[0x1E0D18E58](this);
}

uint64_t CSStore2::AttributedStringWriter::getVisualizer(CSStore2::AttributedStringWriter *this)
{
  return MEMORY[0x1E0D18E60](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
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
  return MEMORY[0x1E0DE4738]();
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

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

uint64_t std::pmr::get_default_resource(std::pmr *this)
{
  return MEMORY[0x1E0DE4950](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
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

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E103C6E8(__p);
}

uint64_t operator delete()
{
  return off_1E103C6F0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E103C6F8(__sz);
}

uint64_t operator new()
{
  return off_1E103C700();
}

uint64_t __CFURLResourceInfoPtr()
{
  return MEMORY[0x1E0C9AA38]();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1E0C81080]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1E0C81090]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C813E8](permset_d, *(_QWORD *)&perm);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81418](acl_p, entry_p);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C81488](entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1E0C814B8](path_p, *(_QWORD *)&type, acl);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1E0C814D0](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1E0C814E0](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1E0C814E8](entry_d, *(_QWORD *)&tag_type);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1E0C827E8]();
}

uint64_t container_create_or_lookup_app_group_paths_for_platform()
{
  return MEMORY[0x1E0C82808]();
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
}

uint64_t container_create_or_lookup_path_for_platform()
{
  return MEMORY[0x1E0C82820]();
}

uint64_t container_entitlements_copy_container_identifiers()
{
  return MEMORY[0x1E0C82860]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1E0C82890]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1E0C828D0]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1E0C829D8]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C82A98]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C82B70]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1E0C830A8]();
}

uint64_t dyld_get_image_versions()
{
  return MEMORY[0x1E0C830B0]();
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1E0C830B8]();
}

uint64_t dyld_is_simulator_platform()
{
  return MEMORY[0x1E0C83108]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x1E0C832F0](*(_QWORD *)&a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83380](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1E0C83648](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1E0C83A38](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int kqueue(void)
{
  return MEMORY[0x1E0C83A68]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
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

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return MEMORY[0x1E0C84010](*(_QWORD *)&id_type, identifier, identifier_size, uu);
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

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x1E0DE7B40](m, *(_QWORD *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1E0DE7B48](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x1E0DE7B78](m);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C840F0]();
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C840F8](a1, a2);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C84108]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
  MEMORY[0x1E0DE7C88](image, namePrefix, conformingTo, subclassing, block);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

uint64_t object_getMethodImplementation()
{
  return MEMORY[0x1E0DE8020]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1E0C849C0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
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

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C84DB0](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1E0C850F0](path, name, *(_QWORD *)&options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1E0C85188]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80E8](str);
}

int sem_close(sem_t *a1)
{
  return MEMORY[0x1E0C85290](a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x1E0C852A8](a1, *(_QWORD *)&a2);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85340](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int sigpending(sigset_t *a1)
{
  return MEMORY[0x1E0C853F8](a1);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C85400](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1E0C85970](__b1, __b2, __len);
}

uint64_t ubidi_close()
{
  return MEMORY[0x1E0DE5BD8]();
}

uint64_t ubidi_getBaseDirection()
{
  return MEMORY[0x1E0DE5BE8]();
}

uint64_t ubidi_getResultLength()
{
  return MEMORY[0x1E0DE5C28]();
}

uint64_t ubidi_getVisualMap()
{
  return MEMORY[0x1E0DE5C30]();
}

uint64_t ubidi_open()
{
  return MEMORY[0x1E0DE5C38]();
}

uint64_t ubidi_setPara()
{
  return MEMORY[0x1E0DE5C60]();
}

uint64_t ubidi_setReorderingOptions()
{
  return MEMORY[0x1E0DE5C78]();
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C859D0](a1);
}

uint64_t uset_close()
{
  return MEMORY[0x1E0DE6988]();
}

uint64_t uset_getItem()
{
  return MEMORY[0x1E0DE69B0]();
}

uint64_t uset_getItemCount()
{
  return MEMORY[0x1E0DE69B8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

uint64_t xpc_copy_entitlements_data_for_token()
{
  return MEMORY[0x1E0C86128]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

void xpc_transaction_begin(void)
{
  MEMORY[0x1E0C86768]();
}

void xpc_transaction_end(void)
{
  MEMORY[0x1E0C86770]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

uint64_t xpc_user_sessions_get_session_uid()
{
  return MEMORY[0x1E0C867D8]();
}

