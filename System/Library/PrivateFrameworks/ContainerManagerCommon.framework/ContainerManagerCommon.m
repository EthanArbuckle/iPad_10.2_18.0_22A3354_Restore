void sub_1CF80A754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

id containermanager_copy_global_configuration()
{
  if (!_gGlobalConfiguration)
  {
    _os_crash();
    __break(1u);
  }
  return (id)_gGlobalConfiguration;
}

void sub_1CF80DDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1CF810180(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void ___containermanagerd_listener_handler_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  xpc_object_t reply;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  MCMCommandContext *v22;
  MCMReply *v23;
  MCMContainerFactory *v24;
  uint64_t current_persona;
  MCMCommandContext *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  void *v42;
  MCMResultPromise *v43;
  id v44;
  MCMResultPromise *v45;
  MCMResultBase *v46;
  int v47;
  void *v48;
  void *context;
  id v50;
  MCMResultPromise *oslog;
  void *v52;
  void *v53;
  void *v54;
  MCMContainerFactory *v55;
  MCMError *v56;
  id v57;
  void *v58;
  os_signpost_id_t v59;
  uint64_t uint64;
  id v61;
  id v62;
  id v63;
  _xpc_connection_s *connection;
  id v65;
  id v66;
  id v67;
  _QWORD block[4];
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  id v76;
  _BYTE buf[24];
  void *v78;
  id v79;
  uint64_t *v80;
  os_signpost_id_t v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v7 = (void *)a1[6];
  v6 = (void *)a1[7];
  v65 = v4;
  v8 = v5;
  v9 = v7;
  connection = v6;
  v66 = v3;
  if (_containermanagerd_connection_handler_onceToken != -1)
    dispatch_once(&_containermanagerd_connection_handler_onceToken, &__block_literal_global_181);
  v10 = MEMORY[0x1D17D7838](v66) == MEMORY[0x1E0C81310];
  v11 = v66;
  if (!v10)
  {
    v12 = (void *)_containermanagerd_connection_handler_dispatcher;
    v13 = v66;
    v62 = v65;
    v63 = v8;
    v14 = v9;
    v61 = v12;
    reply = xpc_dictionary_create_reply(v13);
    v58 = v14;
    if (!reply)
    {
      container_log_handle_for_category();
      v23 = (MCMReply *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF807000, &v23->super, OS_LOG_TYPE_ERROR, "Dictionary does not have reply context", buf, 2u);
      }
      goto LABEL_41;
    }
    uint64 = xpc_dictionary_get_uint64(v13, "Command");
    v54 = (void *)MEMORY[0x1D17D7010]();
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__8566;
    v74 = __Block_byref_object_dispose__8567;
    v75 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MCMProcessXPCEvent_block_invoke;
    block[3] = &unk_1E8CB6458;
    v16 = v14;
    v69 = v16;
    if (MCMProcessXPCEvent_onceToken != -1)
      dispatch_once(&MCMProcessXPCEvent_onceToken, block);
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    v59 = os_signpost_id_make_with_pointer(v17, v13);

    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 134349056;
      *(_QWORD *)&buf[4] = uint64;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v59, "XPCEventProcessing", " command=%{public, signpost.description:attribute}llu ", buf, 0xCu);
    }

    if (uint64 >= 0x32)
    {
      container_log_handle_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = uint64;
        _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Invalid command index: %lld", buf, 0xCu);
      }

      v56 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 49, 3);
      v21 = 0;
      v55 = 0;
      v22 = 0;
      v57 = 0;
LABEL_30:
      v40 = 0;
LABEL_37:
      v41 = os_transaction_create();
      v42 = (void *)v71[5];
      v71[5] = v41;

      v43 = [MCMResultPromise alloc];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __MCMProcessXPCEvent_block_invoke_10;
      v78 = &unk_1E8CB5E20;
      v81 = v59;
      v82 = uint64;
      v44 = v21;
      v79 = v44;
      v80 = &v70;
      v45 = -[MCMResultPromise initWithCompletion:](v43, "initWithCompletion:", buf);

      v23 = -[MCMReply initWithXpcReply:slowWorkloop:fastWorkloop:resultPromise:]([MCMReply alloc], "initWithXpcReply:slowWorkloop:fastWorkloop:resultPromise:", reply, v63, v62, v45);
      if (v40)
      {
        objc_msgSend(v61, "dispatchMessage:context:reply:", v13, v22, v23);
      }
      else
      {
        v46 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v56);
        -[MCMResultPromise completeWithResult:](v45, "completeWithResult:", v46);

      }
      _Block_object_dispose(&v70, 8);

      objc_autoreleasePoolPop(v54);
      -[MCMReply send](v23, "send");

LABEL_41:
      v11 = v66;
      if (!reply)
      {
        xpc_connection_cancel(connection);
        v11 = v66;
      }
      goto LABEL_43;
    }
    v57 = -[MCMClientMessageContext initForCurrentThreadContextWithXPCMessage:userIdentityCache:]([MCMClientMessageContext alloc], "initForCurrentThreadContextWithXPCMessage:userIdentityCache:", v13, v16);
    v67 = 0;
    objc_msgSend((id)MCMProcessXPCEvent_clientFactory, "clientIdentityWithClientMessageContext:xpcMessage:error:", v57, v13, &v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (MCMError *)v67;
    if (!v21)
    {
      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_msgSend(v57, "pid");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v56;
        _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Error creating client identity for pid %d; error = %@",
          buf,
          0x12u);
      }

      v21 = 0;
      v55 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    v24 = [MCMContainerFactory alloc];
    v55 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:](v24, "initWithContainerCache:clientIdentity:userIdentityCache:", gContainerCache, v21, v16);
    current_persona = voucher_get_current_persona();
    v26 = [MCMCommandContext alloc];
    v27 = gContainerCache;
    v28 = containermanager_copy_global_configuration();
    v22 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:](v26, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:", v21, v27, v55, v16, current_persona, v28);

    v29 = containermanager_copy_global_configuration();
    LODWORD(v27) = objc_msgSend(v29, "dispositionForContainerClass:", 2) == 1;

    if (!(_DWORD)v27)
    {
LABEL_36:
      v40 = 1;
      goto LABEL_37;
    }
    v22 = v22;
    -[MCMCommandContext clientIdentity](v22, "clientIdentity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "codeSignInfo");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "cached") & 1) != 0 || (objc_msgSend(v53, "cached") & 1) != 0)
    {
LABEL_35:

      goto LABEL_36;
    }
    context = (void *)MEMORY[0x1D17D7010]();
    v31 = (void *)gCodeSigningMapping;
    objc_msgSend(v53, "entitlements");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "identifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    objc_msgSend(v31, "processCallerRegisteredEntitlements:identifier:error:", v32, v33, &v76);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v76;

    if (v52)
    {
      if (!objc_msgSend(v52, "count"))
      {
LABEL_34:

        objc_autoreleasePoolPop(context);
        goto LABEL_35;
      }
      oslog = objc_alloc_init(MCMResultPromise);
      objc_msgSend(v52, "allObjects");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v34, 0, v22, oslog);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "execute");
      -[MCMResultPromise result](oslog, "result");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "error");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        container_log_handle_for_category();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v37;
          _os_log_error_impl(&dword_1CF807000, v38, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) when processing codesign entitlements; error = %@",
            buf,
            0xCu);
        }

      }
    }
    else
    {
      container_log_handle_for_category();
      oslog = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v53, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v50;
        _os_log_error_impl(&dword_1CF807000, &oslog->super, OS_LOG_TYPE_ERROR, "Error processing entitlements for %@ : %@", buf, 0x16u);

      }
    }

    goto LABEL_34;
  }
LABEL_43:

}

void sub_1CF812090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1CF812428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CF8125D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF8126C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF814098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF81A048(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF81B708(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF81E004(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CF81F370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CF820560(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF820D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

id MCMContainerSchemaDefinitionForClass(unint64_t a1)
{
  void *v2;
  id v3;
  id v5;

  if (MCMContainerSchemaDefinitionForClass_onceToken != -1)
    dispatch_once(&MCMContainerSchemaDefinitionForClass_onceToken, &__block_literal_global_7316);
  if (a1 > 0xD)
    goto LABEL_12;
  if (((1 << a1) & 0xE54) == 0)
  {
    if (((1 << a1) & 0x2080) != 0)
    {
      v2 = (void *)MCMContainerSchemaDefinitionForClass_groupSchemaDefinition;
      goto LABEL_10;
    }
    if (a1 == 12)
    {
      v2 = (void *)MCMContainerSchemaDefinitionForClass_systemSchemaDefinition;
      goto LABEL_10;
    }
LABEL_12:
    v3 = (id)MEMORY[0x1E0C9AA60];
    v5 = MEMORY[0x1E0C9AA60];
    return v3;
  }
  v2 = (void *)MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition;
LABEL_10:
  v3 = v2;
  return v3;
}

uint64_t sb_packbuff_get_item_value_type(_QWORD *a1, _WORD *a2)
{
  _WORD *v2;
  unint64_t v3;

  v3 = a1[5];
  v2 = (_WORD *)a1[6];
  if ((unint64_t)v2 < v3 || (unint64_t)(v2 + 4) > v3 + a1[4] || !*v2)
    return 0;
  *a2 = v2[1];
  return 1;
}

id unpackToNSString(_QWORD *a1, uint64_t a2)
{
  unsigned __int16 *v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = 0;
  v3 = sb_packbuff_unpack_string(a1, &v8, &v7);
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v3);
  }
  else
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = a2;
      v11 = 1024;
      v12 = v7;
      _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "failed: to unpack string for %s. error: %d\n", buf, 0x12u);
    }

    v4 = 0;
  }
  return v4;
}

unsigned __int16 *sb_packbuff_unpack_string(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v6;
  unsigned __int16 *v8;
  int v9;

  v9 = 0;
  v8 = 0;
  v5 = sb_packbuff_unpack_item(a1, 2, 0, &v8, &v9);
  if (!v5)
  {
    if (v9 && (v6 = (v9 - 1), !*((_BYTE *)v8 + v6)))
    {
      v5 = 0;
      if (a2)
        *a2 = v6;
    }
    else
    {
      v5 = 22;
    }
  }
  if (a3)
    *a3 = v5;
  return v8;
}

uint64_t sb_packbuff_unpack_item(_QWORD *a1, int a2, _DWORD *a3, unsigned __int16 **a4, _DWORD *a5)
{
  unint64_t v5;
  unint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v5 = a1[5];
  v6 = a1[6];
  if (v6 < v5)
    return 34;
  v7 = (unsigned __int16 *)(v6 + 8);
  if (v6 + 8 > v5 + a1[4])
    return 34;
  if (*(unsigned __int16 *)v6 != a2)
    return 22;
  if ((a2 - 2) >= 2)
  {
    if (a2 == 1 && a3)
    {
      *a3 = *(_DWORD *)(v6 + 4);
      v11 = 8;
      goto LABEL_16;
    }
    return 22;
  }
  v8 = 22;
  if (!a4 || !a5)
    return v8;
  v10 = *(unsigned int *)(v6 + 4);
  LODWORD(v6) = 8 - (*(_DWORD *)(v6 + 4) & 7);
  *a4 = v7;
  *a5 = v10;
  if ((v10 & 7) != 0)
    v6 = v6;
  else
    v6 = 0;
  v11 = v10 + v6 + 8;
  v5 = a1[5];
  v6 = a1[6];
LABEL_16:
  v12 = (char *)(v6 + v11);
  if ((unint64_t)v12 < v5 || (unint64_t)v12 >= v5 + a1[2])
    return 34;
  if ((v11 & 7) != 0)
    sb_packbuff_unpack_item_cold_1();
  v8 = 0;
  a1[6] = v12;
  return v8;
}

uint64_t sb_packbuff_unpack_uint32(_QWORD *a1, int *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  uint64_t result;
  int v7;

  v2 = a1[5];
  v3 = a1[6];
  if (v3 < v2 || (v5 = v3 + 8, v3 + 8 > v2 + a1[4]))
  {
    result = 0;
LABEL_4:
    v7 = 34;
    goto LABEL_5;
  }
  if (*(_WORD *)v3 == 1)
  {
    result = *(unsigned int *)(v3 + 4);
    if (v5 >= v2 + a1[2])
      goto LABEL_4;
    v7 = 0;
    a1[6] = v5;
  }
  else
  {
    result = 0;
    v7 = 22;
  }
LABEL_5:
  if (a2)
    *a2 = v7;
  return result;
}

uint64_t sb_packbuff_pack_item(_QWORD *a1, unsigned int a2, __int16 a3, int a4, void *__src, size_t __n)
{
  unsigned int v6;
  unint64_t v12;
  unsigned int v13;
  uint64_t result;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  _QWORD *v19;

  v6 = __n;
  v12 = 8;
  if ((_DWORD)__n)
  {
    if ((__n & 7) != 0)
      v13 = 8 - (__n & 7);
    else
      v13 = 0;
    result = 34;
    v15 = __n + v13;
    if (__CFADD__((_DWORD)__n, v13) || v15 > 0xFFFFFFF7)
      return result;
    v12 = v15 + 8;
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
  if (a1[3] >= v12 || (result = sb_packbuff_realloc((uint64_t)a1, v12), !(_DWORD)result))
  {
    v16 = a1[6];
    *(_WORD *)v16 = a2;
    *(_WORD *)(v16 + 2) = a3;
    if (a2 - 2 < 2)
    {
      if (!__src)
        sb_packbuff_pack_item_cold_2();
      *(_DWORD *)(v16 + 4) = v6;
      v17 = (char *)(a1[6] + 8);
      memcpy(v17, __src, v6);
      if (v13)
        bzero(&v17[v6], v13);
      goto LABEL_18;
    }
    if (a2 <= 1)
    {
      if (v15)
        sb_packbuff_pack_item_cold_1();
      *(_DWORD *)(v16 + 4) = a4;
LABEL_18:
      result = 0;
      v18 = a1[4] + v12;
      a1[3] -= v12;
      a1[4] = v18;
      v19 = (_QWORD *)(a1[6] + v12);
      a1[6] = v19;
      *v19 = 0;
      return result;
    }
    return 22;
  }
  return result;
}

void sb_packbuff_free(uint64_t *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 2)
    {
      if (MEMORY[0x1D17D767C](*MEMORY[0x1E0C83DA0], a1[5], a1[2])
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        sb_packbuff_free_cold_1(a1 + 5, a1 + 2);
      }
    }
    else if (*(_DWORD *)a1 == 1)
    {
      free((void *)a1[5]);
    }
    free(a1);
  }
}

uint64_t sb_packbuff_pack_uint32(_QWORD *a1, __int16 a2, int a3)
{
  return sb_packbuff_pack_item(a1, 1u, a2, a3, 0, 0);
}

uint64_t sb_packbuff_pack_string(_QWORD *a1, __int16 a2, void *__src, unint64_t a4)
{
  if (a4 > 0xFFFFFFFE || *((_BYTE *)__src + a4))
    return 22;
  else
    return sb_packbuff_pack_item(a1, 2u, a2, 0, __src, (a4 + 1));
}

void *sb_packbuff_new(unint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  v3 = v2;
  if (v2)
  {
    v4 = 256;
    if (a1 >= 8)
      v4 = a1;
    v2[1] = v4;
    *(_DWORD *)v2 = 1;
    if (sb_packbuff_realloc((uint64_t)v2, 0))
    {
      free(v3);
      return 0;
    }
    else
    {
      *((_QWORD *)v3 + 3) -= 8;
      *((_QWORD *)v3 + 4) = 8;
      **((_QWORD **)v3 + 6) = 0;
    }
  }
  return v3;
}

uint64_t sb_packbuff_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v5;
  BOOL v6;
  size_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2 || *(_DWORD *)a1 != 1)
    return 45;
  v5 = 8 - (a2 & 7);
  v6 = (a2 & 7) == 0;
  v7 = *(_QWORD *)(a1 + 16) + v2;
  *(_QWORD *)(a1 + 16) = v7;
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  v9 = v8 + a2;
  if (v9 > v7 - *(_QWORD *)(a1 + 32))
  {
    v7 += v9;
    *(_QWORD *)(a1 + 16) = v7;
  }
  v10 = reallocf(*(void **)(a1 + 40), v7);
  *(_QWORD *)(a1 + 40) = v10;
  if (!v10)
    return 12;
  v11 = (uint64_t)v10;
  result = 0;
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 16) - v13;
  if (v13)
    v11 = v11 + v13 - 8;
  *(_QWORD *)(a1 + 48) = v11;
  return result;
}

_QWORD *sb_packbuff_init_with_buffer(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  _QWORD *result;
  uint64_t v9;

  result = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  if (result)
  {
    *(_DWORD *)result = a4;
    result[1] = 0;
    result[2] = a2;
    v9 = a2;
    result[5] = a1;
    result[6] = a1;
    if (!a3)
    {
      *a1 = 0;
      a2 = result[2];
      v9 = 8;
    }
    result[3] = a2 - v9;
    result[4] = v9;
  }
  return result;
}

uint64_t sb_packbuff_get_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sb_packbuff_get_bytes(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void sub_1CF8255BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___containermanagerd_main_block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getpid();
  v2 = memorystatus_control();
  if (v2)
  {
    v3 = v2;
    container_log_handle_for_category();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136446210;
      v8 = strerror(v3);
      _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "Error de-elevating inactive jetsam priority: %{public}s", (uint8_t *)&v7, 0xCu);
    }

  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void sub_1CF828DA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF828ED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF82AC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  if (a12)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1CF82AC64(uint64_t a1, int a2)
{
  if (!a2)
    JUMPOUT(0x1CF82AC68);
  objc_terminate();
}

void sub_1CF82E7AC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF839720(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1CF83A738(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void _containermanagerd_main(int a1, char *const *a2, uint64_t a3)
{
  MCMRuntimeState *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  MCMGlobalConfiguration *v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  dispatch_source_t v19;
  void *v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD *v23;
  int v24;
  __CFString *v25;
  MCMStaticConfiguration *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  FILE *v37;
  const char *v38;
  uint64_t v39;
  char *v40;
  int v41;
  uint64_t v42;
  FILE *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  __CFString *v48;
  NSObject *v49;
  char v50;
  void *v51;
  int has_home_dir;
  FILE *v53;
  FILE *v54;
  NSObject *v55;
  FILE *v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  id v62;
  int v63;
  void *v64;
  NSObject *v65;
  os_signpost_id_t v66;
  id v67;
  BOOL v68;
  void (*v69)(uint64_t);
  NSObject *v70;
  id v71;
  id v72;
  void (**v73)(_QWORD, _QWORD);
  id v74;
  _BOOL4 v75;
  uint64_t v76;
  void *v77;
  id v78;
  BOOL v79;
  NSObject *v80;
  NSObject *v81;
  void (*v82)(uint64_t);
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  dispatch_block_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  unsigned int v95;
  __CFString *v96;
  __CFString *v97;
  __CFString *v98;
  __CFString *v99;
  __CFString *v100;
  __CFString *v101;
  __CFString *v102;
  __CFString *v103;
  NSObject *v104;
  BOOL v105;
  id v106;
  id v107;
  dispatch_queue_t v108;
  void *context;
  dispatch_block_t contexta;
  id v111;
  _QWORD handler[5];
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  id v120;
  id v121;
  _QWORD *v122;
  _QWORD block[4];
  id v124;
  NSObject *v125;
  _QWORD *v126;
  _QWORD *v127;
  os_signpost_id_t v128;
  _QWORD v129[5];
  id v130;
  _QWORD v131[5];
  id v132;
  __int128 buf;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  NSObject *v137;
  id v138;
  _QWORD *v139;
  uint64_t *v140;
  os_signpost_id_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v113 = 91;
  objc_msgSend(MEMORY[0x1E0CB35C8], "_setFileNameLocalizationEnabled:", 0);
  objc_setExceptionPreprocessor((objc_exception_preprocessor)_containermanagerd_exception_preprocessor);
  _CFPrefsSetDirectModeEnabled();
  v104 = MCMSharedFastWorkloop();
  v106 = MCMSharedSlowWorkloop();
  v108 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.listener", 0, v104);
  context = (void *)MEMORY[0x1D17D7010]();
  v6 = objc_alloc_init(MCMRuntimeState);
  -[MCMRuntimeState restore](v6, "restore");
  -[MCMRuntimeState reset](v6, "reset");
  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = geteuid();
      _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Could not get user details for current uid: %d", (uint8_t *)&buf, 8u);
    }
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 2;
    goto LABEL_115;
  }
  if (!_containermanagerd_posix_user_has_home_dir(v7, (uint64_t)"current", &v113))
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 2;
    goto LABEL_116;
  }
  getpid();
  v9 = memorystatus_control();
  if (v9)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v40 = strerror(v9);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v40;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Error elevating inactive jetsam priority: %{public}s", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__957;
    v136 = __Block_byref_object_dispose__958;
    v137 = 0;
    dispatch_get_global_queue(17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v18);
    v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

    v21 = dispatch_time(0, 240000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)(*((_QWORD *)&buf + 1) + 40), v21, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C800uLL);
    v22 = *(NSObject **)(*((_QWORD *)&buf + 1) + 40);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_main_block_invoke;
    handler[3] = &unk_1E8CB6108;
    handler[4] = &buf;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_activate(*(dispatch_object_t *)(*((_QWORD *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v96 = CFSTR("root");
  v97 = CFSTR("_installd");
  v98 = CFSTR("no");
  v101 = CFSTR("fixed");
  v102 = CFSTR("normal");
  v23 = (_QWORD *)MEMORY[0x1E0C844D0];
  v99 = CFSTR("global");
  v100 = CFSTR("global");
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v24 = getopt_long_only(a1, a2, "r:u:b:B:s:S:c:", (const option *)&_containermanagerd_main_opts, 0);
        if (v24 != 99)
          break;
        if (os_variant_has_internal_content())
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
          v25 = v103;
          v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }
      if (v24 <= 106)
        break;
      if (v24 > 114)
      {
        if (v24 == 115)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
          v25 = v99;
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v24 != 117)
          {
LABEL_47:
            v113 = 148;
            _containermanagerd_usage();
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            goto LABEL_113;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
          v25 = v101;
          v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (v24 == 107)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
        v25 = v98;
        v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v24 != 114)
          goto LABEL_47;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
        v25 = v102;
        v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
LABEL_36:

    }
    if (v24 > 82)
    {
      if (v24 != 83)
      {
        if (v24 != 98)
          goto LABEL_47;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
        v25 = v100;
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v96 = v25;
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("-")) & 1) != 0)
      {
        v96 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      if (v24 == -1)
      {
        v26 = [MCMStaticConfiguration alloc];
        +[MCMStaticConfiguration defaultPlistDirectoryURL](MCMStaticConfiguration, "defaultPlistDirectoryURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MCMStaticConfiguration initFromPlistAtPathOrName:defaultPlistDirectoryURL:](v26, "initFromPlistAtPathOrName:defaultPlistDirectoryURL:", v103, v27);

        container_log_handle_for_category();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_signpost_id_make_with_pointer(v28, v15);

        container_log_handle_for_category();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          LODWORD(buf) = 138477827;
          *(_QWORD *)((char *)&buf + 4) = v103;
          _os_signpost_emit_with_name_impl(&dword_1CF807000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "LoadConfiguration", " path=%{private, signpost.description:attribute}@ ", (uint8_t *)&buf, 0xCu);
        }

        v111 = 0;
        v32 = objc_msgSend(v15, "loadWithError:", &v111);
        v16 = v111;
        container_log_handle_for_category();
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v29 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
        {
          objc_msgSend(v15, "sourceFileURL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "path");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138477827;
          *(_QWORD *)((char *)&buf + 4) = v36;
          _os_signpost_emit_with_name_impl(&dword_1CF807000, v34, OS_SIGNPOST_INTERVAL_END, v29, "LoadConfiguration", " path=%{private, signpost.description:attribute}@ ", (uint8_t *)&buf, 0xCu);

        }
        if ((v32 & 1) == 0)
        {
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v113 = objc_msgSend(v16, "type");
          goto LABEL_113;
        }
        if (-[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("privileged")))
        {
          if (geteuid())
          {
            v37 = (FILE *)*MEMORY[0x1E0C80C10];
            v38 = getprogname();
            fprintf(v37, "ERROR: %s must be run as root when in privileged mode\n", v38);
            goto LABEL_111;
          }
          v39 = 0;
LABEL_61:
          if ((-[__CFString isEqualToString:](v101, "isEqualToString:", CFSTR("none")) & 1) != 0)
          {
            v95 = 0;
            goto LABEL_68;
          }
          if ((-[__CFString isEqualToString:](v101, "isEqualToString:", CFSTR("current")) & 1) != 0)
          {
            v41 = 1;
LABEL_67:
            v95 = v41;
LABEL_68:
            if ((-[__CFString isEqualToString:](v100, "isEqualToString:", CFSTR("none")) & 1) != 0)
            {
              v42 = 0;
              goto LABEL_77;
            }
            if ((-[__CFString isEqualToString:](v100, "isEqualToString:", CFSTR("global")) & 1) != 0)
            {
              v42 = 1;
              goto LABEL_77;
            }
            if ((-[__CFString isEqualToString:](v100, "isEqualToString:", CFSTR("per-user")) & 1) != 0)
            {
              v42 = 2;
              goto LABEL_77;
            }
            if ((-[__CFString isEqualToString:](v100, "isEqualToString:", CFSTR("proxy")) & 1) != 0)
            {
              v42 = 3;
LABEL_77:
              if (v97)
              {
                +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:");
                v44 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v44 = v8;
              }
              v13 = v44;
              if (!v44)
              {
                v13 = v8;
                container_log_handle_for_category();
                v45 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(_QWORD *)((char *)&buf + 4) = v97;
                  _os_log_error_impl(&dword_1CF807000, v45, OS_LOG_TYPE_ERROR, "Cannot find user [%{public}@] specified for bundle container owner, continuing without bundle container support", (uint8_t *)&buf, 0xCu);
                }

                v42 = 0;
              }
              if ((-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("none")) & 1) != 0)
              {
                v46 = 0;
                goto LABEL_92;
              }
              if ((-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("global")) & 1) != 0)
              {
                v46 = 1;
                goto LABEL_92;
              }
              if ((-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("per-user")) & 1) != 0)
              {
                v46 = 2;
                goto LABEL_92;
              }
              if ((-[__CFString isEqualToString:](v99, "isEqualToString:", CFSTR("proxy")) & 1) != 0)
              {
                v46 = 3;
LABEL_92:
                if (v96)
                {
                  +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:");
                  v47 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v47 = v8;
                }
                v12 = v47;
                v48 = v98;
                if (!v12)
                {
                  v12 = v8;
                  container_log_handle_for_category();
                  v49 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138543362;
                    *(_QWORD *)((char *)&buf + 4) = v96;
                    _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Cannot find user [%{public}@] specified for system container owner, continuing without system container support", (uint8_t *)&buf, 0xCu);
                  }

                  v46 = 0;
                  v48 = v98;
                }
                if (v48)
                  v50 = -[__CFString isEqualToString:](v48, "isEqualToString:", CFSTR("yes"));
                else
                  v50 = 0;
                LOBYTE(v94) = v50;
                v14 = -[MCMGlobalConfiguration initWithStaticConfig:runMode:userContainerMode:bundleContainerMode:bundleContainerOwner:systemContainerMode:systemContainerOwner:kernelUpcallEnabled:]([MCMGlobalConfiguration alloc], "initWithStaticConfig:runMode:userContainerMode:bundleContainerMode:bundleContainerOwner:systemContainerMode:systemContainerOwner:kernelUpcallEnabled:", v15, v39, v95, v42, v13, v46, v12, v94);
                objc_storeStrong((id *)&_gGlobalConfiguration, v14);
                objc_msgSend(v15, "defaultUser");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                has_home_dir = _containermanagerd_posix_user_has_home_dir(v51, (uint64_t)"default", &v113);

                if (has_home_dir)
                  v17 = 0;
                else
                  v17 = 2;
LABEL_114:

                v11 = v102;
LABEL_115:

LABEL_116:
                objc_autoreleasePoolPop(context);
                if (v17 != 2)
                {
                  v57 = v104;
                  v58 = v106;
                  v59 = v108;
                  v131[0] = 0;
                  v131[1] = v131;
                  v131[2] = 0x3032000000;
                  v131[3] = __Block_byref_object_copy__957;
                  v131[4] = __Block_byref_object_dispose__958;
                  v132 = 0;
                  v60 = (void *)MEMORY[0x1D17D7010]();
                  if (_os_feature_enabled_impl())
                  {
                    v61 = containermanager_copy_global_configuration();
                    if (objc_msgSend(v61, "runmode"))
                    {

                    }
                    else
                    {
                      v62 = containermanager_copy_global_configuration();
                      v63 = objc_msgSend(v62, "isInternalImage");

                      if (v63 && _containermanagerd_setup_log_replication_onceToken != -1)
                        dispatch_once(&_containermanagerd_setup_log_replication_onceToken, &__block_literal_global_962);
                    }
                  }
                  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  container_log_handle_for_category();
                  v65 = objc_claimAutoreleasedReturnValue();
                  v66 = os_signpost_id_make_with_pointer(v65, &_containermanagerd_start_xpc_userListener);

                  v67 = containermanager_copy_global_configuration();
                  v68 = objc_msgSend(v67, "runmode") == 3;

                  if (!v68)
                  {
                    v114 = 0;
                    v115 = (uint64_t)&v114;
                    v116 = 0x3032000000;
                    v117 = __Block_byref_object_copy__957;
                    v118 = __Block_byref_object_dispose__958;
                    v119 = (id)os_transaction_create();
                    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                    *((_QWORD *)&buf + 1) = 3221225472;
                    v134 = (uint64_t)___containermanagerd_start_xpc_block_invoke;
                    v135 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8CB4C18;
                    v88 = v59;
                    v136 = (void (*)(uint64_t))v88;
                    v137 = v57;
                    v141 = v66;
                    v107 = v64;
                    v138 = v107;
                    v139 = v131;
                    v140 = &v114;
                    contexta = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &buf);
                    dispatch_async(v88, contexta);
                    v89 = containermanager_copy_global_configuration();
                    v105 = objc_msgSend(v89, "runmode") == 4;

                    if (!v105)
                    {
                      v129[0] = 0;
                      v129[1] = v129;
                      v129[2] = 0x3032000000;
                      v129[3] = __Block_byref_object_copy__957;
                      v129[4] = __Block_byref_object_dispose__958;
                      v130 = (id)os_transaction_create();
                      block[0] = MEMORY[0x1E0C809B0];
                      block[1] = 3221225472;
                      block[2] = ___containermanagerd_start_xpc_block_invoke_2;
                      block[3] = &unk_1E8CB4C40;
                      v128 = v66;
                      v124 = v107;
                      v126 = v131;
                      v90 = v88;
                      v125 = v90;
                      v127 = v129;
                      v91 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
                      dispatch_async(v90, v91);

                      _Block_object_dispose(v129, 8);
                    }

                    _Block_object_dispose(&v114, 8);
                  }
                  v114 = MEMORY[0x1E0C809B0];
                  v115 = 3221225472;
                  v116 = (uint64_t)___containermanagerd_start_xpc_block_invoke_3;
                  v117 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8CB4C90;
                  v69 = v59;
                  v118 = v69;
                  v122 = v131;
                  v70 = v57;
                  v119 = v70;
                  v71 = v58;
                  v120 = v71;
                  v72 = v64;
                  v121 = v72;
                  v73 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17D71B4](&v114);
                  v74 = containermanager_copy_global_configuration();
                  v75 = objc_msgSend(v74, "runmode") == 0;

                  if (v75)
                  {
                    ((void (**)(_QWORD, const char *))v73)[2](v73, "com.apple.containermanagerd.system");
                    v76 = objc_claimAutoreleasedReturnValue();
                    v77 = (void *)_containermanagerd_start_xpc_systemListener;
                    _containermanagerd_start_xpc_systemListener = v76;

                  }
                  v78 = containermanager_copy_global_configuration();
                  v79 = objc_msgSend(v78, "runmode") == 0;

                  if (!v79)
                  {
                    ((void (**)(_QWORD, const char *))v73)[2](v73, "com.apple.containermanagerd");
                    v92 = objc_claimAutoreleasedReturnValue();
                    v93 = (void *)_containermanagerd_start_xpc_userListener;
                    _containermanagerd_start_xpc_userListener = v92;

                  }
                  objc_autoreleasePoolPop(v60);
                  CFRunLoopRun();
                  _Block_object_dispose(v131, 8);

                }
                v80 = v113;
                v81 = v108;
                *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                *((_QWORD *)&buf + 1) = 3221225472;
                v134 = (uint64_t)___containermanagerd_start_xpc_with_permanent_error_block_invoke;
                v135 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E8CB4DE8;
                v137 = v80;
                v82 = v81;
                v136 = v82;
                v83 = MEMORY[0x1D17D71B4](&buf);
                (*(void (**)(uint64_t, const char *))(v83 + 16))(v83, "com.apple.containermanagerd.system");
                v84 = objc_claimAutoreleasedReturnValue();
                v85 = (void *)_containermanagerd_start_xpc_with_permanent_error_systemListener;
                _containermanagerd_start_xpc_with_permanent_error_systemListener = v84;

                (*(void (**)(uint64_t, const char *))(v83 + 16))(v83, "com.apple.containermanagerd");
                v86 = objc_claimAutoreleasedReturnValue();
                v87 = (void *)_containermanagerd_start_xpc_with_permanent_error_userListener;
                _containermanagerd_start_xpc_with_permanent_error_userListener = v86;

                _containermanagerd_self_destruct(v82);
                dispatch_main();
              }
              v54 = (FILE *)*MEMORY[0x1E0C80C10];
              v99 = objc_retainAutorelease(v99);
              fprintf(v54, "ERROR: Unrecognized system container mode: [%s]\n", (const char *)-[__CFString UTF8String](v99, "UTF8String"));
              _containermanagerd_usage();
              v12 = 0;
LABEL_112:
              v14 = 0;
LABEL_113:
              v17 = 2;
              goto LABEL_114;
            }
            v53 = (FILE *)*MEMORY[0x1E0C80C10];
            v100 = objc_retainAutorelease(v100);
            fprintf(v53, "ERROR: Unrecognized bundle container mode: [%s]\n", (const char *)-[__CFString UTF8String](v100, "UTF8String"));
            _containermanagerd_usage();
          }
          else
          {
            if ((-[__CFString isEqualToString:](v101, "isEqualToString:", CFSTR("fixed")) & 1) != 0)
            {
              v41 = 2;
              goto LABEL_67;
            }
            v43 = (FILE *)*MEMORY[0x1E0C80C10];
            v101 = objc_retainAutorelease(v101);
            fprintf(v43, "ERROR: Unrecognized user container mode: [%s]\n", (const char *)-[__CFString UTF8String](v101, "UTF8String"));
            _containermanagerd_usage();
          }
LABEL_111:
          v12 = 0;
          v13 = 0;
          goto LABEL_112;
        }
        if (-[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("agent")))
        {
          if (!objc_msgSend(v8, "isRoleUser")
            || (objc_msgSend(v8, "hasUseableHomeDirectory") & 1) != 0
            || (objc_msgSend(v8, "isRoot") & 1) != 0)
          {
            v39 = 2;
            goto LABEL_61;
          }
          container_log_handle_for_category();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v8;
            _os_log_impl(&dword_1CF807000, v55, OS_LOG_TYPE_DEFAULT, "Starting up in PROXY mode because current user %@ does not have a home directory.", (uint8_t *)&buf, 0xCu);
          }

        }
        else if ((-[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("proxy")) & 1) == 0)
        {
          if ((-[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("sync")) & 1) != 0)
          {
            v39 = 4;
            goto LABEL_61;
          }
          if ((-[__CFString isEqualToString:](v102, "isEqualToString:", CFSTR("normal")) & 1) != 0)
          {
            v39 = 1;
            goto LABEL_61;
          }
          v56 = (FILE *)*MEMORY[0x1E0C80C10];
          v102 = objc_retainAutorelease(v102);
          fprintf(v56, "ERROR: Unrecognized run mode: [%s]\n", (const char *)-[__CFString UTF8String](v102, "UTF8String"));
          _containermanagerd_usage();
          goto LABEL_111;
        }
        v39 = 3;
        goto LABEL_61;
      }
      if (v24 != 66)
        goto LABEL_47;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v23);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v97 = v25;
      if ((-[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("-")) & 1) != 0)
      {
        v97 = 0;
        goto LABEL_36;
      }
    }
  }
}

void sub_1CF83D674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t _containermanagerd_exception_preprocessor(void *a1)
{
  id v1;
  id v2;
  uint64_t result;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    objc_msgSend(v1, "reason");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "UTF8String");
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _containermanagerd_posix_user_has_home_dir(void *a1, uint64_t a2, uint64_t *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  id v22;
  __int16 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v23 = 0;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unvalidatedHomeDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v8 = objc_msgSend(v6, "itemAtURL:followSymlinks:exists:isDirectory:error:", v7, 1, (char *)&v23 + 1, &v23, &v22);
  v9 = v22;

  if ((v8 & 1) != 0)
  {
    if (!HIBYTE(v23) || !(_BYTE)v23)
    {
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "unvalidatedHomeDirectoryURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v25 = a2;
        v26 = 2112;
        v27 = v21;
        _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "%s user home directory [%@] not found or not a directory.", buf, 0x16u);

      }
      v13 = 102;
      goto LABEL_11;
    }
    objc_msgSend(v5, "homeDirectoryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = 1;
      goto LABEL_13;
    }
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "unvalidatedHomeDirectoryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v25 = a2;
      v26 = 2112;
      v27 = v16;
      v17 = "Could not realpath %s home directory [%@]";
      v18 = v12;
      v19 = 22;
LABEL_17:
      _os_log_error_impl(&dword_1CF807000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);

    }
  }
  else
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "unvalidatedHomeDirectoryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = a2;
      v26 = 2112;
      v27 = v16;
      v28 = 2114;
      v29 = v9;
      v17 = "Failed to check for existence of %s user home directory [%@]: %{public}@";
      v18 = v12;
      v19 = 32;
      goto LABEL_17;
    }
  }
  v13 = 103;
LABEL_11:

  v11 = 0;
  if (a3)
    *a3 = v13;
LABEL_13:

  return v11;
}

uint64_t __Block_byref_object_copy__957(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__958(uint64_t a1)
{

}

uint64_t _containermanagerd_usage()
{
  const char *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  const char *v4;

  v0 = getprogname();
  printf("usage:\n%s <options>\n", v0);
  puts("\tOptions:\n");
  printf("\t\t[--runmode <%s|%s|%s|%s|%s>]\n", (const char *)objc_msgSend(CFSTR("privileged"), "UTF8String"), (const char *)objc_msgSend(CFSTR("normal"), "UTF8String"), (const char *)objc_msgSend(CFSTR("agent"), "UTF8String"), (const char *)objc_msgSend(CFSTR("proxy"), "UTF8String"), (const char *)objc_msgSend(CFSTR("sync"), "UTF8String"));
  printf("\t\t\tSets the daemon run mode. Default is [%s].\n\n", (const char *)objc_msgSend(CFSTR("normal"), "UTF8String"));
  printf("\t\t[--user-container-mode <%s|%s|%s>]\n", (const char *)objc_msgSend(CFSTR("none"), "UTF8String"), (const char *)objc_msgSend(CFSTR("current"), "UTF8String"), (const char *)objc_msgSend(CFSTR("fixed"), "UTF8String"));
  printf("\t\t\tSets the user container mode. Default is [%s].\n\n", (const char *)objc_msgSend(CFSTR("fixed"), "UTF8String"));
  printf("\t\t[--bundle-container-mode <%s|%s|%s|%s>]\n", (const char *)objc_msgSend(CFSTR("none"), "UTF8String"), (const char *)objc_msgSend(CFSTR("global"), "UTF8String"), (const char *)objc_msgSend(CFSTR("per-user"), "UTF8String"), (const char *)objc_msgSend(CFSTR("proxy"), "UTF8String"));
  printf("\t\t\tSets the bundle container mode. Default is [%s].\n\n", (const char *)objc_msgSend(CFSTR("global"), "UTF8String"));
  puts("\t\t[--bundle-container-owner <username>]");
  v1 = objc_msgSend(CFSTR("_installd"), "UTF8String");
  if (v1)
    v2 = (const char *)v1;
  else
    v2 = "<current user>";
  printf("\t\t\tSets the bundle container owner when mode is global. Default is [%s].\n\n", v2);
  printf("\t\t[--system-container-mode <%s|%s|%s|%s>]\n", (const char *)objc_msgSend(CFSTR("none"), "UTF8String"), (const char *)objc_msgSend(CFSTR("global"), "UTF8String"), (const char *)objc_msgSend(CFSTR("per-user"), "UTF8String"), (const char *)objc_msgSend(CFSTR("proxy"), "UTF8String"));
  printf("\t\t\tSets the system container mode. Default is [%s].\n\n", (const char *)objc_msgSend(CFSTR("global"), "UTF8String"));
  puts("\t\t[--system-container-owner <username>]");
  v3 = objc_msgSend(CFSTR("root"), "UTF8String");
  if (v3)
    v4 = (const char *)v3;
  else
    v4 = "<current user>";
  printf("\t\t\tSets the system container owner when mode is global. Default is [%s].\n\n", v4);
  return printf("\t\t[--kernel-upcall <%s|%s>]\n", (const char *)objc_msgSend(CFSTR("no"), "UTF8String"), (const char *)objc_msgSend(CFSTR("yes"), "UTF8String"));
}

void ___containermanagerd_start_xpc_block_invoke(uint64_t a1)
{
  void *v2;
  os_signpost_id_t v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  id v38;
  int v39;
  void *v40;
  id v41;
  NSObject *v42;
  char v43;
  MCMContainerCache *v44;
  void *v45;
  uint64_t v46;
  MCMContainerCache *v47;
  void *v48;
  MCMSystemChangeMonitor *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  MCMError *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  MCMContainerCache *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id *v71;
  uint64_t v72;
  char v73;
  _BYTE buf[24];
  const char *v75;
  id v76;
  id *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(void **)(a1 + 48);
  v5 = *(id *)(a1 + 32);
  v66 = v2;
  v6 = v4;
  container_log_handle_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StartingUp", "", buf, 2u);
  }

  v9 = (void *)MEMORY[0x1D17D7010]();
  if (setiopolicy_np(9, 0, 1))
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v63 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v63;
      _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "Unable to set low disk space io policy: %{darwin.errno}d", buf, 8u);
    }

  }
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = "MobileContainerManager-683~1628";
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = "Aug  8 2024";
    *(_WORD *)&buf[22] = 2082;
    v75 = "21:45:38";
    _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "containermanagerd (%{public}s) built at %{public}s %{public}s started", buf, 0x20u);
  }

  v12 = (void *)_CFCopySystemVersionDictionary();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ReleaseType"));
      v15 = objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Current build version (%@ / %@)", buf, 0x16u);
      }

    }
    else
    {
      container_log_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Could not get current build string", buf, 2u);
      }
    }

  }
  else
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Could not get current build info", buf, 2u);
    }
  }

  v17 = dispatch_queue_create("com.apple.containermanagerd.lockstate", 0);
  v18 = (void *)gLockStateQueue;
  gLockStateQueue = (uint64_t)v17;

  if (!gLockStateQueue)
  {
    _os_crash();
    __break(1u);
  }
  v19 = containermanager_copy_global_configuration();
  v20 = objc_msgSend(v19, "kernelUpcallEnabled");

  if (v20)
  {
    v21 = v5;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __MCMKernServerStart_block_invoke;
    v75 = (const char *)&unk_1E8CB5D08;
    v76 = v21;
    v77 = &v70;
    v22 = MCMKernServerStart_onceToken;
    v23 = v21;
    v24 = v23;
    if (v22 == -1)
    {
      v25 = v23;
    }
    else
    {
      dispatch_once(&MCMKernServerStart_onceToken, buf);
      v25 = v76;
    }
    v26 = *((unsigned __int8 *)v71 + 24);

    _Block_object_dispose(&v70, 8);
    if (!v26)
    {
      _os_crash();
      __break(1u);
      return;
    }
  }
  v27 = containermanager_copy_global_configuration();
  objc_msgSend(v27, "libraryRepair");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v29 = objc_msgSend(v28, "createPathsIfNecessaryWithError:", &v70);
  v30 = v70;

  if ((v29 & 1) == 0)
  {
    container_log_handle_for_category();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed creating working directories: %{public}@", buf, 0xCu);
    }
    v43 = 0;
    goto LABEL_45;
  }
  v31 = containermanager_copy_global_configuration();
  v32 = objc_msgSend(v31, "dispositionForContainerClass:", 2);

  if (v32 == 1)
  {
    v33 = v5;
    objc_msgSend(v6, "defaultUserIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryRepairForUserIdentity:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v30;
    v36 = objc_msgSend(v35, "createPathsIfNecessaryWithError:", &v69);
    v37 = v69;

    if ((v36 & 1) == 0)
    {
      container_log_handle_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v37;
        _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed creating working directories: %{public}@", buf, 0xCu);
      }
      v43 = 0;
      v30 = v37;
      v5 = v33;
      goto LABEL_45;
    }
    v30 = v37;
    v5 = v33;
  }
  v38 = containermanager_copy_global_configuration();
  v39 = objc_msgSend(v38, "dispositionForContainerClass:", 2);

  if (v39 == 1)
  {
    v68 = v30;
    +[MCMCodeSigningMapping codeSignMappingWithError:](MCMCodeSigningMapping, "codeSignMappingWithError:", &v68);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v68;

    if (!v40)
    {
      container_log_handle_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v41;
        _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed to connect codesign mapping database: %{public}@", buf, 0xCu);
      }
      v43 = 0;
      v30 = v41;
      goto LABEL_45;
    }
    v65 = v5;
    objc_storeStrong((id *)&gCodeSigningMapping, v40);
    v30 = v41;
  }
  else
  {
    v65 = v5;
    v40 = 0;
  }
  v44 = [MCMContainerCache alloc];
  objc_msgSend(v40, "childParentMapCache");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_opt_class();
  v67 = 0;
  v47 = -[MCMContainerCache initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:error:](v44, "initWithUserIdentityCache:childParentMapCache:classCacheClass:cacheEntryClass:error:", v6, v45, v46, objc_opt_class(), &v67);
  v42 = v67;

  if (v47)
  {
    v48 = (void *)gContainerCache;
    gContainerCache = (uint64_t)v47;
    v64 = v47;

    v49 = [MCMSystemChangeMonitor alloc];
    *(_QWORD *)buf = gContainerCache;
    v50 = v6;
    v51 = v9;
    v52 = containermanager_copy_global_configuration();
    objc_msgSend(v52, "classPathCache");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[8] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[MCMSystemChangeMonitor initWithQueue:flushables:](v49, "initWithQueue:flushables:", v66, v54);
    v56 = (void *)gMCMChangeMonitor;
    gMCMChangeMonitor = v55;

    v9 = v51;
    v6 = v50;
    objc_msgSend(v50, "addObserver:", gMCMChangeMonitor);

    v43 = 1;
  }
  else
  {
    container_log_handle_for_category();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v42;
      _os_log_error_impl(&dword_1CF807000, v57, OS_LOG_TYPE_ERROR, "Failed to connect container cache database: %{public}@", buf, 0xCu);
    }

    v43 = 0;
  }
  v5 = v65;
LABEL_45:

  objc_autoreleasePoolPop(v9);
  if ((v43 & 1) == 0)
  {
    v58 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 91);
    v59 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v60 = *(void **)(v59 + 40);
    *(_QWORD *)(v59 + 40) = v58;

    _containermanagerd_self_destruct(*(void **)(a1 + 32));
  }
  v61 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v62 = *(void **)(v61 + 40);
  *(_QWORD *)(v61 + 40) = 0;

}

void ___containermanagerd_start_xpc_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  os_signpost_id_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  int v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  int v36;
  int v37;
  os_signpost_id_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  MCMContainerFactory *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  id v61;
  int v62;
  int v63;
  int v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  uint32_t v69;
  uint32_t v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  os_signpost_id_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id obj;
  MCMContainerFactory *v88;
  id v89;
  _BYTE v90[12];
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  int v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint8_t buf[4];
  id v99;
  __int16 v100;
  id v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  id v105;
  __int128 out_token;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;

  v1 = a1;
  v110 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(id *)(a1 + 32);
  v84 = MEMORY[0x1D17D7010]();
  +[MCMClientConnection sharedClientConnection](MCMClientConnection, "sharedClientConnection");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = containermanager_copy_global_configuration();
  objc_msgSend(v5, "managedPathRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containermanagerLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = containermanager_copy_global_configuration();
  LODWORD(v6) = objc_msgSend(v8, "runmode");

  if ((_DWORD)v6)
  {
    objc_msgSend(v4, "defaultUserIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedUserPathRegistryForUserIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containermanagerUserLibrary");
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v11;
  }
  objc_msgSend(v7, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("boot.txt"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  *(_QWORD *)&out_token = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", container_internal_get_first_boot_uuid(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v90 = 0;
  v86 = v14;
  objc_msgSend(v16, "readDataFromURL:options:error:", v14, 2, v90);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(id *)v90;

  container_log_handle_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v99 = v86;
    v100 = 2112;
    v101 = v15;
    v102 = 2112;
    v103 = v17;
    v104 = 2112;
    v105 = v18;
    _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "First boot check with [%@]; uuid = [%@], marker = [%@], error = %@",
      buf,
      0x2Au);
  }

  if (v17)
    v20 = objc_msgSend(v15, "isEqualToData:", v17) ^ 1;
  else
    v20 = 1;
  v21 = v85;

  v83 = v20;
  if (v20)
  {
    container_log_handle_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "containermanagerd performing first boot initialization", buf, 2u);
    }

    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FirstBootSetup", "", buf, 2u);
    }

    objc_msgSend(v85, "rebootContainerManagerSetup");
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FirstBootSetup", "", buf, 2u);
    }

    v25 = v86;
    *(_QWORD *)&out_token = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", container_internal_get_first_boot_uuid(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "dataWritingOptionsForFileAtURL:", v25);

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v90 = 0;
    v30 = objc_msgSend(v29, "writeData:toURL:options:mode:error:", v26, v25, v28, 384, v90);
    v31 = *(id *)v90;

    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if ((v30 & 1) != 0)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v99 = v25;
        v100 = 2112;
        v101 = v26;
        _os_log_impl(&dword_1CF807000, v33, OS_LOG_TYPE_DEFAULT, "First boot set complete with [%@]; uuid = [%@]",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v99 = v25;
      v100 = 2112;
      v101 = v31;
      _os_log_error_impl(&dword_1CF807000, v33, OS_LOG_TYPE_ERROR, "Could not write boot marker at [%@]; error = %@",
        buf,
        0x16u);
    }

    v21 = v85;
  }
  container_log_handle_for_category();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BootSetup", "", buf, 2u);
  }

  objc_msgSend(v21, "containerManagerSetup");
  v35 = containermanager_copy_global_configuration();
  v36 = objc_msgSend(v35, "dispositionForContainerClass:", 2);

  v37 = v20;
  v38 = v2;
  v39 = (void *)v84;
  if (v36 != 1)
    goto LABEL_41;
  objc_msgSend((id)gContainerCache, "userIdentityCache");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "userIdentityForPersonalPersona");
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    v79 = v40;
    v80 = v4;
    v81 = v38;
    v82 = v1;
    +[MCMClientIdentity privilegedClientIdentityWithUserIdentity:kernel:](MCMClientIdentity, "privilegedClientIdentityWithUserIdentity:kernel:", v41, 1);
    v43 = objc_claimAutoreleasedReturnValue();
    +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = [MCMContainerFactory alloc];
    v78 = (void *)v43;
    v88 = -[MCMContainerFactory initWithContainerCache:clientIdentity:userIdentityCache:](v45, "initWithContainerCache:clientIdentity:userIdentityCache:", gContainerCache, v43, v44);
    v46 = containermanager_copy_global_configuration();
    objc_msgSend(v46, "staticConfig");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "configForContainerClass:", 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = 0u;
    v109 = 0u;
    out_token = 0u;
    v107 = 0u;
    +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v50;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &out_token, buf, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v107 != v53)
            objc_enumerationMutation(obj);
          v55 = *(_QWORD *)(*((_QWORD *)&out_token + 1) + 8 * i);
          v95 = 1;
          +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v42, v55, v48, dyld_get_active_platform(), v44, &v95);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            v89 = 0;
            -[MCMContainerFactory containerForContainerIdentity:createIfNecessary:error:](v88, "containerForContainerIdentity:createIfNecessary:error:", v56, 1, &v89);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v89;
            v59 = v58;
            if (!v57)
              v95 = objc_msgSend(v58, "type");

          }
          if (v95 != 1)
          {
            container_log_handle_for_category();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v90 = 138543618;
              *(_QWORD *)&v90[4] = v55;
              v91 = 2048;
              v92 = v95;
              _os_log_impl(&dword_1CF807000, v60, OS_LOG_TYPE_DEFAULT, "_create_well_known_containers: Failed for bundleID '%{public}@' with error: %llu", v90, 0x16u);
            }

          }
        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &out_token, buf, 16);
      }
      while (v52);
    }

    v38 = v81;
    v1 = v82;
    v4 = v80;
    v39 = (void *)v84;
    v21 = v85;
    v37 = v83;
LABEL_41:
    v61 = containermanager_copy_global_configuration();
    v62 = objc_msgSend(v61, "dispositionForContainerClass:", 13);

    if (v62 == 1)
    {
      v95 = (uint64_t)"systemgroup.com.apple.installcoordinationd";
      v96 = "/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.installcoordinationd";
      v97 = 0;
      v63 = sandbox_set_user_state_item_with_persona();
      if (v63)
      {
        v64 = v63;
        container_log_handle_for_category();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v90 = 136315650;
          *(_QWORD *)&v90[4] = v95;
          v91 = 2080;
          v92 = (uint64_t)v96;
          v93 = 1024;
          v94 = v64;
          _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, "Failed to set systemgroup mapping for identifier %s, path: %s : %d", v90, 0x1Cu);
        }

      }
    }
    goto LABEL_49;
  }
  container_log_handle_for_category();
  v66 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v84;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v66, OS_LOG_TYPE_DEFAULT, "_create_well_known_containers: Unable to find user identity!", buf, 2u);
  }

LABEL_49:
  container_log_handle_for_category();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v67))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v67, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BootSetup", "", buf, 2u);
  }

  LODWORD(out_token) = 0;
  v68 = (void *)*MEMORY[0x1E0D4E600];
  v69 = notify_register_dispatch((const char *)*MEMORY[0x1E0D4E600], (int *)&out_token, MEMORY[0x1E0C80D38], &__block_literal_global_163);
  if (v69)
  {
    v70 = v69;
    container_log_handle_for_category();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v99 = v68;
      v100 = 1024;
      LODWORD(v101) = v70;
      _os_log_error_impl(&dword_1CF807000, v71, OS_LOG_TYPE_ERROR, "notify_register_dispatch for notification \"%s\" failed; returned %d\n",
        buf,
        0x12u);
    }

  }
  _containermanagerd_keybagd_notification_callback();
  if (v37)
  {
    container_log_handle_for_category();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v72, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FirstBootCleanup", "", buf, 2u);
    }

    objc_msgSend(v21, "rebootContainerManagerCleanupWithCompletion:", &__block_literal_global_165);
  }
  container_log_handle_for_category();
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v73))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BootCleanup", "", buf, 2u);
  }

  objc_msgSend(v21, "containerManagerCleanupWithCompletion:", &__block_literal_global_167);
  objc_autoreleasePoolPop(v39);
  container_log_handle_for_category();
  v74 = objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v75, OS_SIGNPOST_INTERVAL_END, v38, "StartingUp", "", buf, 2u);
  }

  v76 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  v77 = *(void **)(v76 + 40);
  *(_QWORD *)(v76 + 40) = 0;

}

_xpc_connection_s *___containermanagerd_start_xpc_block_invoke_3(uint64_t a1, char *name)
{
  xpc_connection_t mach_service;
  _xpc_connection_s *v4;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service(name, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (!mach_service)
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "unable to start xpc service!", buf, 2u);
    }

    exit(100);
  }
  v4 = mach_service;
  __xpc_connection_set_logging();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___containermanagerd_start_xpc_block_invoke_134;
  handler[3] = &unk_1E8CB4C68;
  v12 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume(v4);

  return v4;
}

_xpc_connection_s *___containermanagerd_start_xpc_with_permanent_error_block_invoke(uint64_t a1, const char *a2)
{
  MCMError *v4;
  _xpc_connection_s *mach_service;
  _QWORD handler[4];
  id v8;
  MCMError *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", *(_QWORD *)(a1 + 40));
  mach_service = xpc_connection_create_mach_service(a2, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (mach_service)
  {
    __xpc_connection_set_logging();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2;
    handler[3] = &unk_1E8CB4D58;
    v8 = *(id *)(a1 + 32);
    v9 = v4;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);

  }
  return mach_service;
}

void _containermanagerd_self_destruct(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___containermanagerd_self_destruct_block_invoke;
  block[3] = &unk_1E8CB6458;
  v7 = v1;
  v2 = _containermanagerd_self_destruct_onceToken;
  v3 = v1;
  v5 = v3;
  if (v2 == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&_containermanagerd_self_destruct_onceToken, block);
    v4 = v7;
  }

}

void ___containermanagerd_self_destruct_block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__957;
  v5[4] = __Block_byref_object_dispose__958;
  v6 = (id)os_transaction_create();
  v2 = dispatch_time(0, 2000000000);
  v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___containermanagerd_self_destruct_block_invoke_2;
  v4[3] = &unk_1E8CB6108;
  v4[4] = v5;
  dispatch_after(v2, v3, v4);
  _Block_object_dispose(v5, 8);

}

void ___containermanagerd_self_destruct_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1CF807000, v2, OS_LOG_TYPE_ERROR, "Exiting when clean.", v5, 2u);
  }

  xpc_transaction_exit_clean();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2(uint64_t a1, void *a2)
{
  _containermanagerd_listener_handler_for_permanent_error(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

void _containermanagerd_listener_handler_for_permanent_error(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  _xpc_connection_s *v6;
  id v7;
  _xpc_connection_s *v8;
  _QWORD handler[4];
  _xpc_connection_s *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (MEMORY[0x1D17D7838](v6) == MEMORY[0x1E0C812E0])
  {
    xpc_connection_set_target_queue(v6, v5);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_listener_handler_for_permanent_error_block_invoke;
    handler[3] = &unk_1E8CB4D58;
    v8 = v6;
    v10 = v8;
    v11 = v7;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_resume(v8);

  }
}

void ___containermanagerd_listener_handler_for_permanent_error_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _xpc_connection_s *v5;
  id v6;
  id v7;
  xpc_object_t reply;
  xpc_object_t v9;
  int euid;
  int pid;
  uid_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t uint64;
  _BYTE buf[38];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t error_description;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D17D7838]() != MEMORY[0x1E0C81310])
  {
    v4 = *(void **)(a1 + 40);
    v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      objc_msgSend(v7, "libsystemError");
      container_xpc_encode_error();
      xpc_dictionary_set_value(reply, "ReplyErrorExtended", v9);
      uint64 = xpc_dictionary_get_uint64(v6, "Command");
      v26 = 0u;
      v27 = 0u;
      xpc_dictionary_get_audit_token();
      v15 = container_audit_token_copy_codesign_identifier();
      euid = container_audit_token_get_euid();
      memset(buf, 0, 32);
      pid = container_audit_token_get_pid();
      v12 = geteuid();
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(v7, "type");
        objc_msgSend(v7, "type");
        *(_DWORD *)buf = 67110914;
        *(_DWORD *)&buf[4] = v12;
        *(_WORD *)&buf[8] = 2082;
        *(_QWORD *)&buf[10] = " EXITING AFTER REPLYING TO:";
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = uint64;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v15;
        v18 = 1024;
        v19 = euid;
        v20 = 1024;
        v21 = pid;
        v22 = 2048;
        v23 = v14;
        v24 = 2080;
        error_description = container_get_error_description();
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "[%u]%{public}s command=%llu, client=%s(uid: %d, pid: %d), error=%llu (%s)", buf, 0x46u);
      }

      xpc_connection_send_message(v5, reply);
      xpc_connection_send_barrier(v5, &__block_literal_global_180);

    }
    else
    {
      xpc_connection_cancel(v5);
    }

  }
}

void ___containermanagerd_reply_with_error_block_invoke()
{
  exit(0);
}

void ___containermanagerd_start_xpc_block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  _QWORD handler[4];
  NSObject *v14;
  id v15;
  id v16;
  _xpc_connection_s *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    _containermanagerd_listener_handler_for_permanent_error(v5, v3, v4);
    _containermanagerd_self_destruct(*(void **)(a1 + 40));
  }
  else
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v8 = v5;
    v9 = v6;
    v10 = v7;
    v11 = (_xpc_connection_s *)v3;
    if (MEMORY[0x1D17D7838]() == MEMORY[0x1E0C812E0])
    {
      xpc_connection_set_target_queue(v11, v8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = ___containermanagerd_listener_handler_block_invoke;
      handler[3] = &unk_1E8CB4DA0;
      v14 = v8;
      v15 = v9;
      v16 = v10;
      v12 = v11;
      v17 = v12;
      xpc_connection_set_event_handler(v12, handler);
      xpc_connection_resume(v12);

    }
  }

}

void ___containermanagerd_connection_handler_block_invoke()
{
  MCMCommandDispatcher *v0;
  void *v1;
  int has_internal_content;
  id v3;

  v0 = objc_alloc_init(MCMCommandDispatcher);
  v1 = (void *)_containermanagerd_connection_handler_dispatcher;
  _containermanagerd_connection_handler_dispatcher = (uint64_t)v0;

  v3 = (id)_containermanagerd_connection_handler_dispatcher;
  has_internal_content = os_variant_has_internal_content();
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  if (has_internal_content)
    objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  if (has_internal_content)
    objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());
  objc_msgSend(v3, "registerCommandClass:", objc_opt_class());

}

void _containermanagerd_keybagd_notification_callback()
{
  int v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = MKBGetDeviceLockState();
  container_log_handle_for_category();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = v0;
    _os_log_debug_impl(&dword_1CF807000, v1, OS_LOG_TYPE_DEBUG, "LockState=%d", (uint8_t *)v2, 8u);
  }

  if (v0 == 1)
  {
    if (_containermanagerd_keybagd_notification_callback_previousState != 1)
      dispatch_suspend((dispatch_object_t)gLockStateQueue);
  }
  else
  {
    if (v0)
      return;
    if (_containermanagerd_keybagd_notification_callback_previousState == 1)
      dispatch_resume((dispatch_object_t)gLockStateQueue);
  }
  _containermanagerd_keybagd_notification_callback_previousState = v0;
}

void ___containermanagerd_perform_launch_tasks_block_invoke_166()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd cleanup complete", buf, 2u);
  }

  container_log_handle_for_category();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BootCleanup", "", v2, 2u);
  }

}

void ___containermanagerd_perform_launch_tasks_block_invoke_164()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  container_log_handle_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd first boot cleanup complete", buf, 2u);
  }

  container_log_handle_for_category();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FirstBootCleanup", "", v2, 2u);
  }

}

void ___containermanagerd_perform_launch_tasks_block_invoke()
{
  _containermanagerd_keybagd_notification_callback();
}

void ___containermanagerd_setup_log_replication_block_invoke()
{
  NSObject *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  MCMLogReplicator *v5;
  void *v6;
  MCMVolumeChangeMonitor *v7;
  void *v8;
  dispatch_queue_t v9;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.containermanagerd.volume-notification", v0);

  v1 = MCMSharedFastWorkloop();
  v2 = containermanager_copy_global_configuration();
  objc_msgSend(v2, "defaultUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UID");
  container_log_replication_prune_for_uid();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("/private/var"), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMLogReplicator initWithWorkloop:]([MCMLogReplicator alloc], "initWithWorkloop:", v1);
  v6 = (void *)_containermanagerd_setup_log_replication_logReplicator;
  _containermanagerd_setup_log_replication_logReplicator = (uint64_t)v5;

  v7 = -[MCMVolumeChangeMonitor initWithWorkloop:mountPointURL:]([MCMVolumeChangeMonitor alloc], "initWithWorkloop:mountPointURL:", v9, v4);
  v8 = (void *)gMCMVolumeMonitor;
  gMCMVolumeMonitor = (uint64_t)v7;

  objc_msgSend((id)gMCMVolumeMonitor, "addObserver:", _containermanagerd_setup_log_replication_logReplicator);
  objc_msgSend((id)gMCMVolumeMonitor, "start");

}

void sub_1CF842FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CF8486DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF84886C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1030(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1031(uint64_t a1)
{

}

uint64_t _fix_permissions_on_path(const char *a1, const char *a2, char *a3, int *a4)
{
  size_t v8;
  NSObject *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  int *v17;
  char *v18;
  const char *v19;
  int v20;
  int *v21;
  char *v22;
  int v23;
  int *v24;
  char *v25;
  NSObject *v26;
  int v27;
  int v29;
  int v30;
  int v31;
  int v32;
  int *v33;
  char *v34;
  char v35;
  int v37;
  int *v38;
  char *v39;
  int v40;
  int *v41;
  char *v42;
  char *v43;
  int v44;
  char v45;
  uint8_t buf[4];
  _BYTE v47[10];
  _QWORD v48[2];
  stat v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  memset(&v49, 0, sizeof(v49));
  v44 = 0;
  v43 = 0;
  if (a2)
  {
    v8 = strlen(a2);
    if (strncmp(a1, a2, v8))
    {
      v44 = 62;
      container_log_handle_for_category();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v47 = a1;
        *(_WORD *)&v47[8] = 2080;
        v48[0] = a2;
        _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Path [%s] does not have accepted path prefix [%s] when trying to fix permissions", buf, 0x16u);
      }

      v10 = 0;
      goto LABEL_44;
    }
  }
  if (lstat(a1, &v49))
  {
    v44 = *__error();
    v11 = strdup(a1);
    v43 = v11;
    v12 = rindex(v11, 47);
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!v12 || v11 == v12)
    {
      if (v14)
      {
        v23 = *__error();
        v24 = __error();
        v25 = strerror(*v24);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v23;
        WORD2(v48[0]) = 2080;
        *(_QWORD *)((char *)v48 + 6) = v25;
        v19 = "Failed to stat [%s] when trying to fix permissions, could not recover: (%d) %s";
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    if (v14)
    {
      v37 = *__error();
      v38 = __error();
      v39 = strerror(*v38);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v47 = a1;
      *(_WORD *)&v47[8] = 1024;
      LODWORD(v48[0]) = v37;
      WORD2(v48[0]) = 2080;
      *(_QWORD *)((char *)v48 + 6) = v39;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to stat [%s] when trying to fix permissions, attempting to recover: (%d) %s", buf, 0x1Cu);
    }

    *v12 = 0;
    if (!_fix_permissions_on_path(v11, a2, &v45, &v44))
    {
      v10 = 0;
      goto LABEL_42;
    }
    if (lstat(a1, &v49))
    {
      v15 = *__error();
      v44 = v15;
      if (v15 != 13 && v15 != 1)
      {
        container_log_handle_for_category();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v40 = *__error();
          v41 = __error();
          v42 = strerror(*v41);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v47 = a1;
          *(_WORD *)&v47[8] = 1024;
          LODWORD(v48[0]) = v40;
          WORD2(v48[0]) = 2080;
          *(_QWORD *)((char *)v48 + 6) = v42;
          _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to stat [%s] when trying to fix permissions, but no longer a permission error: (%d) %s", buf, 0x1Cu);
        }
        v10 = 1;
        goto LABEL_41;
      }
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v16 = *__error();
        v17 = __error();
        v18 = strerror(*v17);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v16;
        WORD2(v48[0]) = 2080;
        *(_QWORD *)((char *)v48 + 6) = v18;
        v19 = "Failed to stat [%s] when trying to fix permissions, gave up: (%d) %s";
LABEL_39:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v19, buf, 0x1Cu);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
  }
  else
  {
    v11 = 0;
  }
  if ((v49.st_flags & 6) == 0)
  {
LABEL_28:
    v27 = v49.st_mode & 0xF000;
    if (v27 == 40960 || v27 == 0x4000)
      v29 = 448;
    else
      v29 = 384;
    if ((v49.st_mode & 0x1C0) == v29)
    {
      v10 = 1;
      goto LABEL_42;
    }
    v30 = v49.st_mode & 0xFE3F;
    v31 = v29 | v30;
    if (!lchmod(a1, v29 | v30))
    {
      v10 = 1;
      v45 = 1;
      container_log_handle_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v47 = v49.st_mode;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v31;
        LOWORD(v48[0]) = 2080;
        *(_QWORD *)((char *)v48 + 2) = a1;
        _os_log_impl(&dword_1CF807000, v13, OS_LOG_TYPE_DEFAULT, "lchmod u+rw(x) (0%o → 0%o) on [%s]", buf, 0x18u);
      }
      goto LABEL_41;
    }
    v44 = *__error();
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_40;
    v32 = *__error();
    v33 = __error();
    v34 = strerror(*v33);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v32;
    WORD2(v48[0]) = 2080;
    *(_QWORD *)((char *)v48 + 6) = v34;
    v19 = "lchmod() for [%s] failed during permissions repair: (%d) %s";
    goto LABEL_39;
  }
  if (!lchflags(a1, v49.st_flags & 0xFFFFFFF9))
  {
    v45 = 1;
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v47 = a1;
      _os_log_impl(&dword_1CF807000, v26, OS_LOG_TYPE_DEFAULT, "Unset UF_IMMUTABLE | UF_APPEND on [%s]", buf, 0xCu);
    }

    goto LABEL_28;
  }
  v44 = *__error();
  container_log_handle_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v20;
    WORD2(v48[0]) = 2080;
    *(_QWORD *)((char *)v48 + 6) = v22;
    v19 = "Failed to lchflags [%s]: (%d) %s";
    goto LABEL_39;
  }
LABEL_40:
  v10 = 0;
LABEL_41:

LABEL_42:
  if (v11)
  {
    free(v11);
    memset_s(&v43, 8uLL, 0, 8uLL);
  }
LABEL_44:
  if (a4 && (v10 & 1) == 0)
    *a4 = v44;
  v35 = v10 ^ 1;
  if (!a3)
    v35 = 1;
  if ((v35 & 1) == 0)
    *a3 = v45;
  return v10;
}

uint64_t _removefile_error_callback(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  NSObject *v5;
  uint64_t result;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int *v10;
  char *v11;
  const char *v12;
  int v13;
  char *v14;
  int v15;
  int *v16;
  char *v17;
  char v18;
  int dst;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  stat v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dst = 0;
  if (!removefile_state_get(a1, 5u, &dst))
  {
    if (dst == 2)
      goto LABEL_15;
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = dst;
      v14 = strerror(dst);
      v26.st_dev = 136315650;
      *(_QWORD *)&v26.st_mode = a2;
      WORD2(v26.st_ino) = 1024;
      *(_DWORD *)((char *)&v26.st_ino + 6) = v13;
      HIWORD(v26.st_uid) = 2080;
      *(_QWORD *)&v26.st_gid = v14;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "removefile hit error for [%s]: (%d) %s", (uint8_t *)&v26, 0x1Cu);
    }
    if ((v7, dst != 13) && dst != 1 || (v18 = 0, _fix_permissions_on_path(a2, 0, &v18, 0), !v18))
    {
LABEL_15:
      result = 0;
      if (!a3)
        return result;
      goto LABEL_16;
    }
    memset(&v26, 0, sizeof(v26));
    if (lstat(a2, &v26))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_15;
      }
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 136315650;
      v21 = a2;
      v22 = 1024;
      v23 = v15;
      v24 = 2080;
      v25 = v17;
      v12 = "lstat of [%s] failed when trying to figure out why unlink failed: (%d) %s";
    }
    else
    {
      if ((v26.st_mode & 0xF000) == 0x4000)
      {
        dst = 35;
        result = 2;
        if (!a3)
          return result;
        goto LABEL_16;
      }
      result = unlink(a2);
      if (!(_DWORD)result)
        return result;
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 136315650;
      v21 = a2;
      v22 = 1024;
      v23 = v9;
      v24 = 2080;
      v25 = v11;
      v12 = "unlink of [%s] failed: (%d) %s";
    }
    _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, v12, buf, 0x1Cu);
    goto LABEL_14;
  }
  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v26.st_dev = 136315138;
    *(_QWORD *)&v26.st_mode = a2;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "removefile hit error for [%s] but we failed to get the error number", (uint8_t *)&v26, 0xCu);
  }

  result = 0;
  dst = 2;
  if (a3)
  {
LABEL_16:
    if (!*a3)
      *a3 = dst;
  }
  return result;
}

void __containermanager_copy_default_file_manager_block_invoke()
{
  MCMFileManager *v0;
  void *v1;

  v0 = objc_alloc_init(MCMFileManager);
  v1 = (void *)gMCMDefaultFileManager;
  gMCMDefaultFileManager = (uint64_t)v0;

}

void sub_1CF857808(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void containermanager_set_global_configuration(id obj)
{
  objc_storeStrong((id *)&_gGlobalConfiguration, obj);
}

void sub_1CF85BABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2215(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2216(uint64_t a1)
{

}

void sub_1CF85F264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8618B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2879(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2880(uint64_t a1)
{

}

void sub_1CF86452C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF864C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CF868DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CF869028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__3499(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3500(uint64_t a1)
{

}

void sub_1CF86AD7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF86AE4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF86B740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CF86C6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF86D6C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1CF86F29C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1CF86F2A8);
}

void sub_1CF86F9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF86FAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF870150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1CF8702B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8708E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_1CF870A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CF870C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF870DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF870EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF871090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF871800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8718FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF871A94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF871CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CF871FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF872150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3876(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3877(uint64_t a1)
{

}

void sub_1CF875868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF875EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _moveSystemContainerIntoPlace(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  __objc2_class_ro **p_info;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  char v34;
  id v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  char v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  MCMResultPromise *v56;
  void *v57;
  void *v58;
  MCMCommandProcessRestoredContainer *v59;
  void *v60;
  MCMCommandProcessRestoredContainer *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  os_log_t log;
  void *v77;
  NSObject *v78;
  void *v79;
  id obj;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  id v95;
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  _BYTE v104[128];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "lastPathComponent");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "URLByAppendingPathExtension:", CFSTR("failed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v10, 1);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v93 = 1;
  v12 = containermanager_copy_global_configuration();
  objc_msgSend(v12, "staticConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configForContainerClass:", a2);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)v14;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = (void *)v10;
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v9, v10, v14, 0, v16, &v93);
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v17;
  if (v17)
  {
    objc_msgSend(v8, "containerFactory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0;
    objc_msgSend(v19, "containerForContainerIdentity:createIfNecessary:error:", v18, 1, &v92);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v92;

    v78 = v20;
    if (v20)
    {
      -[NSObject metadataMinimal](v20, "metadataMinimal");
      v22 = objc_claimAutoreleasedReturnValue();
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      log = v22;
      -[NSObject containerPath](v22, "containerPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "containerRootURL");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "path");
        v65 = v18;
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "path");
        v67 = v15;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v97 = (uint64_t)v79;
        v98 = 2112;
        v99 = (uint64_t)v66;
        v100 = 2112;
        v101 = v68;
        _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Restoring container for %@ at %@ to %@", buf, 0x20u);

        v15 = v67;
        v18 = v65;
      }

      v91 = 0;
      objc_msgSend(v23, "urlsForItemsInDirectoryAtURL:error:", v7, &v91);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v91;
      v75 = v26;
      if (v26 && !v21)
      {
        v72 = v9;
        v73 = v8;
        v74 = v7;
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        obj = v26;
        v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
        v70 = v18;
        v71 = v15;
        if (!v85)
        {
          v28 = v27;
          goto LABEL_39;
        }
        v83 = *(_QWORD *)v106;
        v81 = v23;
        v28 = v27;
        p_info = MCMCommandDeleteContainerContent.info;
        while (1)
        {
          for (i = 0; i != v85; ++i)
          {
            if (*(_QWORD *)v106 != v83)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            objc_msgSend(v31, "lastPathComponent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "URLByAppendingPathComponent:isDirectory:", v32, 0);
            v33 = objc_claimAutoreleasedReturnValue();
            v90 = v28;
            v34 = objc_msgSend(v23, "removeItemAtURL:error:", v33, &v90);
            v35 = v90;

            v86 = (void *)v33;
            if ((v34 & 1) != 0)
            {
              objc_msgSend(p_info + 296, "defaultManager");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = v35;
              v37 = objc_msgSend(v36, "moveItemAtURL:toURL:error:", v31, v33, &v89);
              v28 = v89;

              if ((v37 & 1) != 0)
                goto LABEL_28;
              container_log_handle_for_category();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v31, "path");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "path");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v97 = (uint64_t)v79;
                v98 = 2112;
                v99 = (uint64_t)v39;
                v100 = 2112;
                v101 = v40;
                v102 = 2112;
                v103 = v28;
                _os_log_error_impl(&dword_1CF807000, v38, OS_LOG_TYPE_ERROR, "Failed to move file in restored system container %@:%@ to destination %@: %@", buf, 0x2Au);

              }
            }
            else
            {
              container_log_handle_for_category();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v97 = (uint64_t)v79;
                v98 = 2112;
                v99 = (uint64_t)v86;
                v100 = 2112;
                v101 = v35;
                _os_log_error_impl(&dword_1CF807000, v38, OS_LOG_TYPE_ERROR, "Failed to remove destination %@:%@: %@", buf, 0x20u);
              }
              v28 = v35;
            }

            v87 = v31;
            v41 = v82;
            v42 = v32;
            objc_msgSend(p_info + 296, "defaultManager");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = 0;
            v44 = objc_msgSend(v43, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v41, 1, 511, &v95);
            v45 = v95;

            if ((v44 & 1) == 0)
            {
              container_log_handle_for_category();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v97 = (uint64_t)v82;
                v98 = 2112;
                v99 = (uint64_t)v45;
                _os_log_error_impl(&dword_1CF807000, v46, OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);
              }

            }
            v47 = v32;
            v48 = v28;
            objc_msgSend(v41, "URLByAppendingPathComponent:isDirectory:", v42, 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(p_info + 296, "defaultManager");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v45;
            v51 = objc_msgSend(v50, "moveItemAtURL:toURL:error:", v87, v49, &v94);
            v52 = v94;

            if ((v51 & 1) == 0)
            {
              container_log_handle_for_category();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v97 = (uint64_t)v87;
                v98 = 2112;
                v99 = (uint64_t)v49;
                v100 = 2112;
                v101 = v52;
                _os_log_error_impl(&dword_1CF807000, v53, OS_LOG_TYPE_ERROR, "Failed to move %@ to %@: %@", buf, 0x20u);
              }

            }
            v23 = v81;
            v21 = 0;
            v28 = v48;
            p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
            v32 = v47;
LABEL_28:

          }
          v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
          if (!v85)
          {
LABEL_39:
            v27 = v28;

            v56 = objc_alloc_init(MCMResultPromise);
            v59 = [MCMCommandProcessRestoredContainer alloc];
            -[NSObject containerIdentity](log, "containerIdentity");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v73;
            v61 = -[MCMCommandProcessRestoredContainer initWithConcreteContainerIdentity:context:resultPromise:](v59, "initWithConcreteContainerIdentity:context:resultPromise:", v60, v73, v56);

            -[MCMCommandProcessRestoredContainer execute](v61, "execute");
            -[MCMResultPromise result](v56, "result");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "error");
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v74;
            v9 = v72;
            if (v63)
            {
              container_log_handle_for_category();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                -[MCMResultPromise result](v56, "result");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "error");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v97 = (uint64_t)v79;
                v98 = 2112;
                v99 = (uint64_t)v69;
                _os_log_error_impl(&dword_1CF807000, v64, OS_LOG_TYPE_ERROR, "Error processing restored system container %@: %@", buf, 0x16u);

              }
            }

            v18 = v70;
            v15 = v71;
            goto LABEL_44;
          }
        }
      }
      container_log_handle_for_category();
      v56 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v56->super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "path");
        v57 = v18;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v97 = (uint64_t)v79;
        v98 = 2112;
        v99 = (uint64_t)v58;
        v100 = 2112;
        v101 = v27;
        _os_log_error_impl(&dword_1CF807000, &v56->super, OS_LOG_TYPE_ERROR, "Failed to enumerate contents of restored system container %@ at %@: %@", buf, 0x20u);

        v18 = v57;
      }
LABEL_44:

    }
    else
    {
      container_log_handle_for_category();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v97 = (uint64_t)v79;
        v98 = 2112;
        v99 = (uint64_t)v21;
        _os_log_error_impl(&dword_1CF807000, log, OS_LOG_TYPE_ERROR, "Failed to create system container %@: %@", buf, 0x16u);
      }
    }
    v55 = v77;

  }
  else
  {
    container_log_handle_for_category();
    v54 = objc_claimAutoreleasedReturnValue();
    v78 = v54;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v97 = v10;
      v98 = 2048;
      v99 = v93;
      _os_log_error_impl(&dword_1CF807000, v54, OS_LOG_TYPE_ERROR, "Failed to create container identity %@: %llu", buf, 0x16u);
    }
    v21 = 0;
    v55 = v77;
  }

}

void sub_1CF878BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF879208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4518(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4519(uint64_t a1)
{

}

void sub_1CF87BA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4736(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4737(uint64_t a1)
{

}

void sub_1CF87CD64(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF87CE18(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF87D3C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF87D5F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *_MCMVolumeChangeMonitorCallback(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
    return (void *)objc_msgSend(a1, "_callbackWithVolume:notificationType:margs:", a2, a3, a4);
  return a1;
}

uint64_t server_get_process_containers(_QWORD *a1, unsigned int a2, vm_offset_t *a3, mach_msg_type_number_t *a4, _DWORD *a5, _OWORD *a6)
{
  __int128 v12;
  uint64_t v13;
  unsigned int active_platform;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  id v21;
  void *v22;
  uint64_t *v23;
  uint64_t *v24;
  vm_address_t bytes;
  uint64_t size;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint64_t *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  unsigned int v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  NSObject *v46;
  const char *v47;
  uint64_t *v48;
  host_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _BOOL4 v57;
  unint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  NSObject *v68;
  const char *v69;
  uint8_t *v70;
  mach_msg_type_number_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  int v76;
  id v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  const __CFString *v92;
  NSObject *v93;
  uint64_t *v94;
  __CFString *v95;
  vm_address_t v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  mach_msg_type_number_t v103;
  void *v104;
  void *v105;
  void *v106;
  NSObject *v107;
  void *v108;
  uint64_t *v109;
  _DWORD *v110;
  vm_offset_t *data;
  unsigned int v112;
  void *v113;
  void *v114;
  void *v115;
  unsigned int v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  id v123;
  uint64_t v124;
  int v125;
  unsigned __int16 v126;
  pid_t pidp[4];
  _BYTE atoken[36];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    v12 = a6[1];
    *(_OWORD *)atoken = *a6;
    *(_OWORD *)&atoken[16] = v12;
    pidp[0] = 0;
    audit_token_to_au32((audit_token_t *)atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
    if (pidp[0])
      return 5;
    v22 = (void *)MEMORY[0x1D17D7010]();
    v23 = (uint64_t *)sb_packbuff_new(0x1000uLL);
    if (v23)
    {
      v24 = v23;
      sb_packbuff_pack_uint32(v23, 0, 1);
      bytes = sb_packbuff_get_bytes((uint64_t)v24);
      size = sb_packbuff_get_size((uint64_t)v24);
      v13 = vm_read(*MEMORY[0x1E0C83DA0], bytes, size, a3, a4);
      if ((_DWORD)v13)
      {
        container_log_handle_for_category();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)atoken = 134218496;
          *(_QWORD *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(_QWORD *)&atoken[14] = size;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v13;
          _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "vm_read(%p, %lu) fails: %d", atoken, 0x1Cu);
        }

        *a5 = 0;
        *a4 = 0;
      }
      else
      {
        *a5 = 1;
        container_log_handle_for_category();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          v71 = *a4;
          *(_DWORD *)atoken = 134218496;
          *(_QWORD *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(_QWORD *)&atoken[14] = a3;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v71;
          _os_log_debug_impl(&dword_1CF807000, v53, OS_LOG_TYPE_DEBUG, "packbuff bytes: %p, reply bytes: %p, reply size: %u", atoken, 0x1Cu);
        }

      }
      sb_packbuff_free(v24);
    }
    else
    {
      v13 = 9;
    }
    objc_autoreleasePoolPop(v22);
    return v13;
  }
  active_platform = dyld_get_active_platform();
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_signpost_id_make_with_pointer(v15, a1);

  container_log_handle_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)atoken = 0;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "KernelUpcall", "", atoken, 2u);
  }

  container_log_handle_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)atoken = 134217984;
    *(_QWORD *)&atoken[4] = v16;
    _os_log_impl(&dword_1CF807000, v19, OS_LOG_TYPE_DEFAULT, "<%llx> upcall start ~~~~~~~~~~~~~~~~", atoken, 0xCu);
  }

  v20 = a6[1];
  *(_OWORD *)atoken = *a6;
  *(_OWORD *)&atoken[16] = v20;
  pidp[0] = 0;
  audit_token_to_au32((audit_token_t *)atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
  if (pidp[0])
  {
    v21 = 0;
    v13 = 5;
    goto LABEL_170;
  }
  v112 = active_platform;
  v28 = (void *)MEMORY[0x1D17D7010]();
  v126 = 0;
  v125 = 0;
  container_log_handle_for_category();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)atoken = 67109376;
    *(_DWORD *)&atoken[4] = a2;
    *(_WORD *)&atoken[8] = 2048;
    *(_QWORD *)&atoken[10] = a1;
    _os_log_debug_impl(&dword_1CF807000, v29, OS_LOG_TYPE_DEBUG, "request size: %u (%p)", atoken, 0x12u);
  }

  v30 = sb_packbuff_init_with_buffer(a1, a2, 1, 0);
  container_log_handle_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v55 = sb_packbuff_get_bytes((uint64_t)v30);
    *(_DWORD *)atoken = 134217984;
    *(_QWORD *)&atoken[4] = v55;
    _os_log_debug_impl(&dword_1CF807000, v31, OS_LOG_TYPE_DEBUG, "request packbuff byte address:%p", atoken, 0xCu);
  }

  if (!v30)
  {
    container_log_handle_for_category();
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)atoken = 0;
      _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, "sb_packbuff_init() of request data fails", atoken, 2u);
    }
    v64 = 0;
    v63 = 0;
    v32 = 0;
    v21 = 0;
    v13 = 9;
    goto LABEL_168;
  }
  v110 = a5;
  data = a3;
  v115 = v28;
  v119 = 0;
  v120 = 0;
  v116 = 0;
  v121 = 0;
  v32 = 0;
  while (2)
  {
    if (sb_packbuff_get_item_value_type(v30, &v126))
    {
      switch(v126)
      {
        case 0u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CODE_SIGNATURE_ID");
          v33 = objc_claimAutoreleasedReturnValue();

          container_log_handle_for_category();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(_QWORD *)&atoken[14] = v33;
            _os_log_impl(&dword_1CF807000, v34, OS_LOG_TYPE_DEFAULT, "<%llx> code signature: [%@]", atoken, 0x16u);
          }

          v32 = v33;
          if (v33)
            continue;
          goto LABEL_73;
        case 1u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");
          v35 = objc_claimAutoreleasedReturnValue();

          container_log_handle_for_category();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(_QWORD *)&atoken[14] = v35;
            _os_log_impl(&dword_1CF807000, v36, OS_LOG_TYPE_DEFAULT, "<%llx> container id: [%@]", atoken, 0x16u);
          }

          v121 = v35;
          if (v35)
            continue;
          v63 = 0;
          v21 = 0;
          v13 = 5;
          v64 = v120;
          goto LABEL_169;
        case 2u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APPLICATION_ID");
          v37 = objc_claimAutoreleasedReturnValue();

          container_log_handle_for_category();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(_QWORD *)&atoken[14] = v37;
            _os_log_impl(&dword_1CF807000, v38, OS_LOG_TYPE_DEFAULT, "<%llx> application id: [%@]", atoken, 0x16u);
          }

          v120 = (void *)v37;
          if (v37)
            continue;
          v64 = 0;
          v21 = 0;
          v13 = 5;
          v63 = (void *)v121;
          goto LABEL_169;
        case 3u:
          v39 = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v39;
            _os_log_impl(&dword_1CF807000, v40, OS_LOG_TYPE_DEFAULT, "<%llx> uid: [%u]", atoken, 0x12u);
          }
          v116 = v39;

          if (!v125)
            continue;
          container_log_handle_for_category();
          v65 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            goto LABEL_98;
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_UID. error: %d\n";
          goto LABEL_176;
        case 4u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APP_GROUP_ID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            goto LABEL_51;
          *(_DWORD *)atoken = 134218242;
          *(_QWORD *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(_QWORD *)&atoken[14] = v41;
          v43 = v42;
          v44 = "<%llx> app group id: [%@]";
          goto LABEL_50;
        case 5u:
          LODWORD(v119) = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v119;
            _os_log_impl(&dword_1CF807000, v45, OS_LOG_TYPE_DEFAULT, "<%llx> container type: [%u]", atoken, 0x12u);
          }

          if (!v125)
            continue;
          container_log_handle_for_category();
          v65 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            goto LABEL_98;
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_CONTAINER_TYPE. error: %d\n";
          goto LABEL_176;
        case 6u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            goto LABEL_51;
          *(_DWORD *)atoken = 134218242;
          *(_QWORD *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(_QWORD *)&atoken[14] = v41;
          v43 = v42;
          v44 = "<%llx> system container id: [%@]";
          goto LABEL_50;
        case 7u:
          unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_SYSTEM_GROUP_CONTAINER_ID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          container_log_handle_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            goto LABEL_51;
          *(_DWORD *)atoken = 134218242;
          *(_QWORD *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(_QWORD *)&atoken[14] = v41;
          v43 = v42;
          v44 = "<%llx> system group id: [%@]";
LABEL_50:
          _os_log_impl(&dword_1CF807000, v43, OS_LOG_TYPE_DEFAULT, v44, atoken, 0x16u);
LABEL_51:

          if (v41)
            continue;
LABEL_73:
          v21 = 0;
          v13 = 5;
          break;
        case 8u:
          HIDWORD(v119) = sb_packbuff_unpack_uint32(v30, &v125);
          container_log_handle_for_category();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(_QWORD *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = HIDWORD(v119);
            _os_log_impl(&dword_1CF807000, v46, OS_LOG_TYPE_DEFAULT, "<%llx> persona id: [%u]", atoken, 0x12u);
          }

          if (!v125)
            continue;
          container_log_handle_for_category();
          v65 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            goto LABEL_98;
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v125;
          v47 = "failed: to unpack uint32 for CM_KERN_REQUEST_PERSONA_ID. error: %d\n";
LABEL_176:
          _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, v47, atoken, 8u);
LABEL_98:
          v21 = 0;
          v13 = 5;
          v64 = v120;
          v63 = (void *)v121;
          goto LABEL_168;
        default:
          container_log_handle_for_category();
          v65 = objc_claimAutoreleasedReturnValue();
          v63 = (void *)v121;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)atoken = 67109120;
            *(_DWORD *)&atoken[4] = v126;
            _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, "unexpected value: %u\n", atoken, 8u);
          }
          v21 = 0;
          v13 = 4;
          goto LABEL_111;
      }
      goto LABEL_75;
    }
    break;
  }
  sb_packbuff_free(v30);
  v48 = (uint64_t *)sb_packbuff_new(0x1000uLL);
  if (v48)
  {
    v109 = v48;
    v32 = (uint64_t)(id)v32;
    v21 = (id)v32;
    v63 = (void *)v121;
    if (v121)
    {
      v21 = (id)v121;

    }
    v124 = 1;
    objc_msgSend((id)gContainerCache, "userIdentityCache");
    v65 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)atoken = 0;
    v49 = MEMORY[0x1D17D6F20]();
    if (host_get_multiuser_config_flags(v49, (uint32_t *)atoken) || (*(_DWORD *)atoken & 0x80000000) == 0)
    {
      v148 = 0;
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v143 = 0u;
      v142 = 0u;
      v141 = 0u;
      v140 = 0u;
      v139 = 0u;
      v138 = 0u;
      v137 = 0u;
      v136 = 0u;
      v135 = 0u;
      v134 = 0u;
      v133 = 0u;
      v132 = 0u;
      v131 = 0u;
      v130 = 0u;
      v129 = 0u;
      memset(&atoken[4], 0, 32);
      *(_DWORD *)atoken = 1;
      if (HIDWORD(v119) != -1)
      {
        if ((kpersona_info() & 0x80000000) != 0)
        {
          container_log_handle_for_category();
          v68 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            goto LABEL_110;
          pidp[0] = 67109120;
          pidp[1] = HIDWORD(v119);
          v69 = "Could not look up info for persona id %u";
          v70 = (uint8_t *)pidp;
          goto LABEL_109;
        }
        if (*(_DWORD *)&atoken[8] == 5 || *(_DWORD *)&atoken[8] == 2)
        {
          -[NSObject userIdentityWithPersonaID:](v65, "userIdentityWithPersonaID:", HIDWORD(v119));
          v54 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[NSObject userIdentityForPersonalPersona](v65, "userIdentityForPersonalPersona");
          v54 = objc_claimAutoreleasedReturnValue();
        }
        v52 = v54;
        if (v54)
        {
LABEL_83:
          v56 = (id)(v121 | v32);
          v57 = 1;
          v108 = (void *)v52;
          +[MCMClientConnection privilegedClientConnectionWithUserIdentity:kernel:](MCMClientConnection, "privilegedClientConnectionWithUserIdentity:kernel:", v52, 1);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v65;
          if (!(v121 | v32))
          {
            v104 = 0;
            v62 = 0;
LABEL_136:
            container_log_handle_for_category();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v62, "path");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)atoken = 134218498;
              *(_QWORD *)&atoken[4] = v16;
              *(_WORD *)&atoken[12] = 1024;
              *(_DWORD *)&atoken[14] = v57;
              *(_WORD *)&atoken[18] = 2112;
              *(_QWORD *)&atoken[20] = v88;
              _os_log_impl(&dword_1CF807000, v87, OS_LOG_TYPE_DEFAULT, "<%llx> upcall result %d; data container [%@]",
                atoken,
                0x1Cu);

            }
            v122 = v62;
            v114 = v56;

            v89 = (void *)objc_opt_new();
            v90 = v89;
            if (v120)
              objc_msgSend(v89, "appendFormat:", CFSTR("appID[%@]"), v120);
            v118 = v90;
            if (v121)
            {
              if (objc_msgSend(v90, "length"))
                v91 = CFSTR(", ");
              else
                v91 = &stru_1E8CB6A50;
              objc_msgSend(v90, "appendFormat:", CFSTR("%@conID[%@]"), v91, v121, v104);
            }
            if (v32)
            {
              if (objc_msgSend(v90, "length"))
                v92 = CFSTR(", ");
              else
                v92 = &stru_1E8CB6A50;
              objc_msgSend(v90, "appendFormat:", CFSTR("%@codID[%@]"), v92, v32);
            }
            container_log_handle_for_category();
            v93 = objc_claimAutoreleasedReturnValue();
            v28 = v115;
            v94 = v109;
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              if (v62)
              {
                objc_msgSend(v62, "path");
                v95 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v95 = &stru_1E8CB6A50;
              }
              *(_DWORD *)atoken = 67110402;
              *(_DWORD *)&atoken[4] = v119;
              *(_WORD *)&atoken[8] = 1024;
              *(_DWORD *)&atoken[10] = v116;
              *(_WORD *)&atoken[14] = 1024;
              *(_DWORD *)&atoken[16] = HIDWORD(v119);
              *(_WORD *)&atoken[20] = 2114;
              *(_QWORD *)&atoken[22] = v118;
              *(_WORD *)&atoken[30] = 1024;
              *(_DWORD *)&atoken[32] = v57;
              LOWORD(v129) = 2114;
              *(_QWORD *)((char *)&v129 + 2) = v95;
              _os_log_impl(&dword_1CF807000, v93, OS_LOG_TYPE_DEFAULT, "kernel_upcall {%d; %u.%u; %{public}@} -> {%d; [%{public}@]}",
                atoken,
                0x2Eu);
              if (v122)

              v62 = v122;
            }

            if (v57 && v62)
              v57 = __server_get_process_containers_block_invoke(v109, v62) == 0;
            __server_get_process_containers_block_invoke_11(v109, v57);
            v96 = sb_packbuff_get_bytes((uint64_t)v109);
            v97 = sb_packbuff_get_size((uint64_t)v109);
            v13 = vm_read(*MEMORY[0x1E0C83DA0], v96, v97, data, a4);
            if ((_DWORD)v13)
            {
              container_log_handle_for_category();
              v98 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)atoken = 134218496;
                *(_QWORD *)&atoken[4] = v96;
                *(_WORD *)&atoken[12] = 2048;
                *(_QWORD *)&atoken[14] = v97;
                *(_WORD *)&atoken[22] = 1024;
                *(_DWORD *)&atoken[24] = v13;
                _os_log_error_impl(&dword_1CF807000, v98, OS_LOG_TYPE_ERROR, "vm_read(%p, %lu) fails: %d", atoken, 0x1Cu);
              }

              v94 = v109;
              *v110 = 0;
              *a4 = 0;
            }
            else
            {
              *v110 = 1;
              container_log_handle_for_category();
              v99 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
              {
                v103 = *a4;
                *(_DWORD *)atoken = 134218496;
                *(_QWORD *)&atoken[4] = v96;
                *(_WORD *)&atoken[12] = 2048;
                *(_QWORD *)&atoken[14] = data;
                *(_WORD *)&atoken[22] = 1024;
                *(_DWORD *)&atoken[24] = v103;
                _os_log_debug_impl(&dword_1CF807000, v99, OS_LOG_TYPE_DEBUG, "packbuff bytes: %p, reply bytes: %p, reply size: %u", atoken, 0x1Cu);
              }

            }
            sb_packbuff_free(v94);

            v64 = v120;
            v63 = (void *)v121;
            v65 = v107;
            goto LABEL_168;
          }
          v58 = objc_msgSend((id)gCodeSigningMapping, "dataContainerTypeForIdentifier:", v21);
          v59 = v58;
          if (v58 <= 0xB && ((1 << v58) & 0xED4) != 0)
          {
            if ((_DWORD)v119 != 1 || v58 == 4)
            {
              v61 = v112;
              if ((_DWORD)v119 || v58 == 2)
              {
LABEL_121:
                objc_msgSend(v108, "posixUser");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                +[MCMContainerClassPath posixOwnerForContainerClass:user:](MCMContainerClassPath, "posixOwnerForContainerClass:user:", v59, v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();

                v117 = v74;
                if (v116 != objc_msgSend(v74, "UID"))
                {
                  container_log_handle_for_category();
                  v75 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                  {
                    v76 = objc_msgSend(v117, "UID");
                    *(_DWORD *)atoken = 67109376;
                    *(_DWORD *)&atoken[4] = v116;
                    *(_WORD *)&atoken[8] = 1024;
                    *(_DWORD *)&atoken[10] = v76;
                    _os_log_impl(&dword_1CF807000, v75, OS_LOG_TYPE_DEFAULT, "Invalid UID from kernel: %u, expected: %u", atoken, 0xEu);
                  }

                }
                v77 = containermanager_copy_global_configuration();
                objc_msgSend(v77, "staticConfig");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "configForContainerClass:", v59);
                v79 = objc_claimAutoreleasedReturnValue();

                v113 = (void *)v79;
                +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v108, v21, v79, v61, v107, &v124);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                if (v80)
                {
                  objc_msgSend(v106, "context");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v81, "containerFactory");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  v123 = 0;
                  v57 = 1;
                  v105 = v80;
                  objc_msgSend(v82, "containerForContainerIdentity:createIfNecessary:error:", v80, 1, &v123);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = v123;

                  objc_msgSend(v83, "metadataMinimal");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v84)
                  {
                    v80 = v105;
LABEL_133:

                    v62 = 0;
                    v104 = v84;
                    if (v84 && v57)
                    {
                      objc_msgSend(v84, "containerPath");
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "containerDataURL");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();

                      v57 = 1;
                    }
                    goto LABEL_136;
                  }
                  v80 = v105;
                }
                else
                {
                  v56 = 0;
                }
                container_log_handle_for_category();
                v85 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)atoken = 134218242;
                  *(_QWORD *)&atoken[4] = v124;
                  *(_WORD *)&atoken[12] = 2112;
                  *(_QWORD *)&atoken[14] = v56;
                  _os_log_impl(&dword_1CF807000, v85, OS_LOG_TYPE_DEFAULT, "createOrLookupContainerForUser: Failed with error: (%llu) %@", atoken, 0x16u);
                }

                v84 = 0;
                v57 = 0;
                goto LABEL_133;
              }
              container_log_handle_for_category();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)atoken = 134217984;
                *(_QWORD *)&atoken[4] = v59;
                _os_log_impl(&dword_1CF807000, v60, OS_LOG_TYPE_DEFAULT, "SB type is app, but MI type is %llu", atoken, 0xCu);
              }
            }
            else
            {
              container_log_handle_for_category();
              v60 = objc_claimAutoreleasedReturnValue();
              v61 = v112;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)atoken = 67109376;
                *(_DWORD *)&atoken[4] = 1;
                *(_WORD *)&atoken[8] = 2048;
                *(_QWORD *)&atoken[10] = v59;
                _os_log_impl(&dword_1CF807000, v60, OS_LOG_TYPE_DEFAULT, "SB Type: %u, MI Type: %llu.  Declaring this a plugin", atoken, 0x12u);
              }
              v59 = 4;
            }
          }
          else
          {
            container_log_handle_for_category();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)atoken = 138412546;
              *(_QWORD *)&atoken[4] = v21;
              *(_WORD *)&atoken[12] = 2048;
              *(_QWORD *)&atoken[14] = v59;
              _os_log_impl(&dword_1CF807000, v72, OS_LOG_TYPE_DEFAULT, "Invalid data container class for %@: %llu", atoken, 0x16u);
            }

            if ((_DWORD)v119 == 1)
              v59 = 4;
            else
              v59 = 2;
            container_log_handle_for_category();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)atoken = 67109376;
              *(_DWORD *)&atoken[4] = v119;
              *(_WORD *)&atoken[8] = 2048;
              *(_QWORD *)&atoken[10] = v59;
              _os_log_impl(&dword_1CF807000, v60, OS_LOG_TYPE_DEFAULT, "SB Type: %u, falling back to class: %llu", atoken, 0x12u);
            }
            v61 = v112;
          }

          goto LABEL_121;
        }
LABEL_107:
        container_log_handle_for_category();
        v68 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          goto LABEL_110;
        *(_DWORD *)atoken = 67109120;
        *(_DWORD *)&atoken[4] = HIDWORD(v119);
        v69 = "Unable to find user identity for persona id %u";
        v70 = atoken;
LABEL_109:
        _os_log_impl(&dword_1CF807000, v68, OS_LOG_TYPE_DEFAULT, v69, v70, 8u);
LABEL_110:

        v13 = 4;
LABEL_111:
        v64 = v120;
LABEL_168:

        goto LABEL_169;
      }
      -[NSObject userIdentityForPersonalPersona](v65, "userIdentityForPersonalPersona");
      v52 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", v116);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject userIdentityForPersonalPersonaWithPOSIXUser:](v65, "userIdentityForPersonalPersonaWithPOSIXUser:", v50);
      v51 = objc_claimAutoreleasedReturnValue();

      v52 = v51;
    }
    v28 = v115;
    if (v52)
      goto LABEL_83;
    goto LABEL_107;
  }
  v21 = 0;
  v13 = 9;
LABEL_75:
  v64 = v120;
  v63 = (void *)v121;
LABEL_169:

  objc_autoreleasePoolPop(v28);
LABEL_170:
  container_log_handle_for_category();
  v100 = objc_claimAutoreleasedReturnValue();
  v101 = v100;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
  {
    *(_DWORD *)atoken = 138477827;
    *(_QWORD *)&atoken[4] = v21;
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v101, OS_SIGNPOST_INTERVAL_END, v16, "KernelUpcall", " identifier=%{private, signpost.description:attribute}@ ", atoken, 0xCu);
  }

  return v13;
}

uint64_t __server_get_process_containers_block_invoke(_QWORD *a1, id a2)
{
  char *v3;
  size_t v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation");
  v4 = strlen(v3);
  v5 = sb_packbuff_pack_string(a1, 1, v3, v4);
  if ((_DWORD)v5)
  {
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109634;
      v8[1] = v5;
      v9 = 1024;
      v10 = 1;
      v11 = 2080;
      v12 = v3;
      _os_log_impl(&dword_1CF807000, v6, OS_LOG_TYPE_DEFAULT, "sb_packbuff_pack_string() fails: %d; type: %u, path: %s\n",
        (uint8_t *)v8,
        0x18u);
    }

  }
  return v5;
}

void __server_get_process_containers_block_invoke_11(_QWORD *a1, int a2)
{
  int v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = sb_packbuff_pack_uint32(a1, 0, a2);
  if (v3)
  {
    v4 = v3;
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109632;
      v6[1] = v4;
      v7 = 1024;
      v8 = 0;
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_1CF807000, v5, OS_LOG_TYPE_DEFAULT, "sb_packbuff_pack_uint32() fails: %d; type: %u, value: %u\n",
        (uint8_t *)v6,
        0x14u);
    }

  }
}

void sub_1CF886030(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1CF88A498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6405(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6406(uint64_t a1)
{

}

void sub_1CF88EB30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__6844(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6845(uint64_t a1)
{

}

id MCMSharedBackgroundQueue()
{
  if (MCMSharedBackgroundQueue_onceToken != -1)
    dispatch_once(&MCMSharedBackgroundQueue_onceToken, &__block_literal_global_7559);
  return (id)MCMSharedBackgroundQueue_queue;
}

id MCMSharedDeathrowQueue()
{
  if (MCMSharedDeathrowQueue_onceToken != -1)
    dispatch_once(&MCMSharedDeathrowQueue_onceToken, &__block_literal_global_2);
  return (id)MCMSharedDeathrowQueue_queue;
}

id MCMSharedFastWorkloop()
{
  if (MCMSharedFastWorkloop_onceToken != -1)
    dispatch_once(&MCMSharedFastWorkloop_onceToken, &__block_literal_global_4);
  return (id)MCMSharedFastWorkloop_fastWorkloop;
}

id MCMSharedSlowWorkloop()
{
  if (MCMSharedSlowWorkloop_onceToken != -1)
    dispatch_once(&MCMSharedSlowWorkloop_onceToken, &__block_literal_global_6);
  return (id)MCMSharedSlowWorkloop_slowWorkloop;
}

id MCMDataProtectionQueue()
{
  if (MCMDataProtectionQueue_onceToken != -1)
    dispatch_once(&MCMDataProtectionQueue_onceToken, &__block_literal_global_8);
  return (id)MCMDataProtectionQueue_dataProtQueue;
}

void sub_1CF894B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7872(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7873(uint64_t a1)
{

}

void sub_1CF895778(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF895A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF895D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF8964BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8027(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8028(uint64_t a1)
{

}

void sub_1CF898E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,char a24)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_1CF899A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8133(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8134(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__8566(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8567(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__8761(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8762(uint64_t a1)
{

}

void sub_1CF89D29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1CF89F600(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF8A3FD4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF8A4088(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CF8A5DAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10310(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10311(uint64_t a1)
{

}

void sub_1CF8A9364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8ACBB0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;

  if (a2)
  {
    if (a2 == 2)
    {
      v14 = objc_begin_catch(a1);
      -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 40);

      container_log_handle_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "callStackSymbols");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412546;
        *(_QWORD *)((char *)&buf + 4) = v14;
        WORD6(buf) = 2112;
        *(_QWORD *)((char *)&buf + 14) = v18;
        _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Got exception: %@ : %@", (uint8_t *)&buf, 0x16u);

      }
      v16 = containermanager_copy_global_configuration();
      v17 = objc_msgSend(v16, "isInternalImage");

      if (v17)
        MCMCrashOnException(v14);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x1CF8ACA74);
  }
  _Unwind_Resume(a1);
}

void sub_1CF8ACD0C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1CF8ACD30);
  }
  JUMPOUT(0x1CF8ACD48);
}

void sub_1CF8AE2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10912(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10913(uint64_t a1)
{

}

void sub_1CF8AE9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRBSProcessPredicateClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSProcessPredicate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    abort_report_np();
  getRBSProcessPredicateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSTerminateContextClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSTerminateContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    abort_report_np();
  getRBSTerminateContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSTerminationAssertionClass_block_invoke(uint64_t a1)
{
  Class result;

  RunningBoardServicesLibrary();
  result = objc_getClass("RBSTerminationAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    abort_report_np();
  getRBSTerminationAssertionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  void *v0;

  if (!RunningBoardServicesLibraryCore_frameworkLibrary)
  {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

void sub_1CF8B084C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id (*a24)(uint64_t a1),void *a25,void *a26)
{
  void *v26;
  id v27;
  id v28;
  id v29;
  int v30;

  if (a2)
  {
    if (a2 == 2)
    {
      v27 = objc_begin_catch(exception_object);
      a22 = MEMORY[0x1E0C809B0];
      a23 = 3221225472;
      a24 = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126;
      a25 = &unk_1E8CB67B8;
      v28 = v27;
      a26 = v28;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126((uint64_t)&a22);
      objc_claimAutoreleasedReturnValue();

      v29 = containermanager_copy_global_configuration();
      v30 = objc_msgSend(v29, "isInternalImage");

      if (v30)
        MCMCrashOnException(v28);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x1CF8B074CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CF8B10B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id (*a20)(uint64_t a1),void *a21,id a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id (*a32)(uint64_t a1),void *a33,void *a34)
{
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  int v41;
  char v42;
  id v43;

  if (a2)
  {
    v36 = v35;
    if (a2 == 2)
    {
      v37 = objc_begin_catch(exception_object);
      a30 = MEMORY[0x1E0C809B0];
      a31 = 3221225472;
      a32 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158;
      a33 = &unk_1E8CB67B8;
      v38 = v37;
      a34 = v38;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158((uint64_t)&a30);
      v39 = objc_claimAutoreleasedReturnValue();

      v40 = containermanager_copy_global_configuration();
      v41 = objc_msgSend(v40, "isInternalImage");

      if (v41)
        MCMCrashOnException(v38);

      objc_end_catch();
      v36 = (void *)v39;
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    a23 = v36;
    v42 = objc_msgSend(v34, "_sqliteExec:error:", CFSTR("ROLLBACK;"), &a23);
    v43 = a23;

    if ((v42 & 1) == 0)
    {
      a18 = MEMORY[0x1E0C809B0];
      a19 = 3221225472;
      a20 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162;
      a21 = &unk_1E8CB67B8;
      a22 = v43;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162((uint64_t)&a18);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x1CF8B1018);
    }
    JUMPOUT(0x1CF8B1024);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CF8BB550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11270(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11271(uint64_t a1)
{

}

void sub_1CF8BEB8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF8C07A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_1CF8C0A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8C0CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CF8C19B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11801(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11802(uint64_t a1)
{

}

void MCMCrashOnException(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("** INTERNAL ERROR: Uncaught Exception **\n"));
  objc_msgSend(v4, "appendString:", CFSTR("Exception: "));
  if (v3)
  {
    objc_msgSend(v4, "appendString:", CFSTR("<"));
    objc_msgSend(v4, "appendString:", v3);
    objc_msgSend(v4, "appendString:", CFSTR("> "));
  }
  objc_msgSend(v1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v1, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v6);

    objc_msgSend(v4, "appendString:", CFSTR(": "));
  }
  objc_msgSend(v1, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v1, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v8);

  }
  objc_msgSend(v4, "appendString:", CFSTR("\nStack:\n"));
  objc_msgSend(v1, "callStackSymbols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v10);

  if (MCMCrashOnException_onceToken != -1)
    dispatch_once(&MCMCrashOnException_onceToken, &__block_literal_global_12046);
  pthread_mutex_lock(&MCMCrashOnException_crashLock);
  if (v4)
    qword_1EFBBA370 = (uint64_t)strdup((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  abort();
}

void sub_1CF8C4330(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CF8C9064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12541(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12542(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__13086(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13087(uint64_t a1)
{

}

void (*container_manager_kern_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 322514900)
    return _Xget_process_containers;
  else
    return 0;
}

void _Xget_process_containers(uint64_t a1, uint64_t a2)
{
  int v4;
  mach_msg_type_number_t *v5;
  vm_offset_t *v6;
  _QWORD *v7;
  unsigned int v8;
  __int128 v9;
  int process_containers;
  int v11;
  _OWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    v4 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    v4 = -300;
    goto LABEL_10;
  }
  v11 = 0;
  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  v5 = (mach_msg_type_number_t *)(a2 + 52);
  v6 = (vm_offset_t *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  v7 = *(_QWORD **)(a1 + 28);
  v8 = *(_DWORD *)(a1 + 40);
  v9 = *(_OWORD *)(a1 + 92);
  v12[0] = *(_OWORD *)(a1 + 76);
  v12[1] = v9;
  process_containers = server_get_process_containers(v7, v8, v6, v5, &v11, v12);
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!process_containers)
  {
    *(_BYTE *)(a2 + 36) = v11;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = process_containers;
LABEL_11:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
}

void sb_packbuff_free_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = *a2;
  v4 = 134218240;
  v5 = v2;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_1CF807000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failed: vm_deallocate(%p, %zu)", (uint8_t *)&v4, 0x16u);
}

void sb_packbuff_unpack_item_cold_1()
{
  __assert_rtn("sb_packbuff_unpack_item", "packbuff.c", 369, "(bytes_to_advance % BYTE_ALIGNMENT) == 0");
}

void sb_packbuff_pack_item_cold_1()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 267, "extra_bytes_needed == 0");
}

void sb_packbuff_pack_item_cold_2()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 273, "additional_bytes != NULL");
}

uint64_t APFSContainerGetBootDevice()
{
  return MEMORY[0x1E0CF18A0]();
}

uint64_t APFSVolumeRoleFind()
{
  return MEMORY[0x1E0CF18D0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBAD28](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return MEMORY[0x1E0C9A3C8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _NSDefaultFileSystemEncoding()
{
  return MEMORY[0x1E0CB3BC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __xpc_connection_set_logging()
{
  return MEMORY[0x1E0C80CB0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _sqlite3_db_copy_compact()
{
  return MEMORY[0x1E0DE8528]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C813C0]();
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1E0C813E0](flagset_d, *(_QWORD *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C813E8](permset_d, *(_QWORD *)&perm);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81418](acl_p, entry_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1E0C81428](permset_d, *(_QWORD *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1E0C81438](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1E0C81448](acl, *(_QWORD *)&entry_id, entry_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1E0C81460](path_p, *(_QWORD *)&type);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1E0C81470](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1E0C81488](entry_d, permset_p);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1E0C81498](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1E0C814A0](*(_QWORD *)&count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1E0C814B8](path_p, *(_QWORD *)&type, acl);
}

int acl_set_flagset_np(void *obj_p, acl_flagset_t flagset_d)
{
  return MEMORY[0x1E0C814C0](obj_p, flagset_d);
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

uint64_t amfi_launch_constraint_matches_process()
{
  return MEMORY[0x1E0C81568]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1E0C81678](a1);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40C0](atoken);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40D0](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t container_audit_token_copy_codesign_hash()
{
  return MEMORY[0x1E0C826E8]();
}

uint64_t container_audit_token_copy_codesign_identifier()
{
  return MEMORY[0x1E0C826F0]();
}

uint64_t container_audit_token_copy_entitlement()
{
  return MEMORY[0x1E0C826F8]();
}

uint64_t container_audit_token_get_codesign_status()
{
  return MEMORY[0x1E0C82700]();
}

uint64_t container_audit_token_get_euid()
{
  return MEMORY[0x1E0C82708]();
}

uint64_t container_audit_token_get_pid()
{
  return MEMORY[0x1E0C82710]();
}

uint64_t container_audit_token_get_platform()
{
  return MEMORY[0x1E0C82718]();
}

uint64_t container_class_for_each_normalized_class()
{
  return MEMORY[0x1E0C82720]();
}

uint64_t container_class_normalized()
{
  return MEMORY[0x1E0C82728]();
}

uint64_t container_class_supports_data_subdirectory()
{
  return MEMORY[0x1E0C82730]();
}

uint64_t container_class_supports_randomized_path()
{
  return MEMORY[0x1E0C82738]();
}

uint64_t container_client_copy_decoded_from_xpc_object()
{
  return MEMORY[0x1E0C82740]();
}

uint64_t container_client_copy_encoded_xpc_object()
{
  return MEMORY[0x1E0C82748]();
}

uint64_t container_client_copy_entitlement()
{
  return MEMORY[0x1E0C82750]();
}

uint64_t container_client_create_from_audit_token()
{
  return MEMORY[0x1E0C82758]();
}

uint64_t container_client_get_audit_token()
{
  return MEMORY[0x1E0C82760]();
}

uint64_t container_client_get_codesign_identifier()
{
  return MEMORY[0x1E0C82768]();
}

uint64_t container_client_get_codesign_team_identifier()
{
  return MEMORY[0x1E0C82770]();
}

uint64_t container_client_get_euid()
{
  return MEMORY[0x1E0C82778]();
}

uint64_t container_client_get_persona_unique_string()
{
  return MEMORY[0x1E0C82780]();
}

uint64_t container_client_get_pid()
{
  return MEMORY[0x1E0C82788]();
}

uint64_t container_client_get_platform()
{
  return MEMORY[0x1E0C82790]();
}

uint64_t container_client_initializer()
{
  return MEMORY[0x1E0C82798]();
}

uint64_t container_client_is_alive()
{
  return MEMORY[0x1E0C827A0]();
}

uint64_t container_client_is_sandboxed()
{
  return MEMORY[0x1E0C827A8]();
}

uint64_t container_client_is_signed()
{
  return MEMORY[0x1E0C827B0]();
}

uint64_t container_client_is_test_client()
{
  return MEMORY[0x1E0C827B8]();
}

uint64_t container_codesign_copy_current_identifier()
{
  return MEMORY[0x1E0C827C0]();
}

uint64_t container_codesign_get_self_audit_token()
{
  return MEMORY[0x1E0C827C8]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_error_create()
{
  return MEMORY[0x1E0C82870]();
}

uint64_t container_error_free()
{
  return MEMORY[0x1E0C82878]();
}

uint64_t container_error_get_category()
{
  return MEMORY[0x1E0C82880]();
}

uint64_t container_error_get_path()
{
  return MEMORY[0x1E0C82888]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1E0C82890]();
}

uint64_t container_error_get_type()
{
  return MEMORY[0x1E0C82898]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1E0C828A0]();
}

uint64_t container_free_client()
{
  return MEMORY[0x1E0C828A8]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1E0C828B0]();
}

uint64_t container_frozenset_create()
{
  return MEMORY[0x1E0C828B8]();
}

uint64_t container_frozenset_destroy()
{
  return MEMORY[0x1E0C828C0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1E0C828C8]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1E0C828D0]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1E0C828D8]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1E0C828F0]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x1E0C828F8]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x1E0C82900]();
}

uint64_t container_internal_get_first_boot_uuid()
{
  return MEMORY[0x1E0C82910]();
}

uint64_t container_is_new()
{
  return MEMORY[0x1E0C82928]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1E0C82930]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x1E0C82938]();
}

uint64_t container_log_replication_disable()
{
  return MEMORY[0x1E0C82940]();
}

uint64_t container_log_replication_enable_to_uid_relative_path()
{
  return MEMORY[0x1E0C82948]();
}

uint64_t container_log_replication_prune_for_uid()
{
  return MEMORY[0x1E0C82950]();
}

uint64_t container_object_create()
{
  return MEMORY[0x1E0C82958]();
}

uint64_t container_object_get_info()
{
  return MEMORY[0x1E0C82960]();
}

uint64_t container_object_get_path()
{
  return MEMORY[0x1E0C82968]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x1E0C82970]();
}

uint64_t container_object_set_creator_codesign_identifier()
{
  return MEMORY[0x1E0C82978]();
}

uint64_t container_object_set_path()
{
  return MEMORY[0x1E0C82980]();
}

uint64_t container_object_set_user_managed_assets_relative_path()
{
  return MEMORY[0x1E0C82988]();
}

uint64_t container_paths_copy_container_from_path()
{
  return MEMORY[0x1E0C829A0]();
}

uint64_t container_perform_with_client_context()
{
  return MEMORY[0x1E0C829A8]();
}

uint64_t container_query_count_results()
{
  return MEMORY[0x1E0C829B0]();
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

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1E0C829E0]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1E0C82A08]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1E0C82A10]();
}

uint64_t container_realpath()
{
  return MEMORY[0x1E0C82A30]();
}

uint64_t container_sandbox_issue_custom_extension()
{
  return MEMORY[0x1E0C82A50]();
}

uint64_t container_seam_fs_ensure_lazy_loaded()
{
  return MEMORY[0x1E0C82A58]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1E0C82A80]();
}

uint64_t container_traverse_directory()
{
  return MEMORY[0x1E0C82AA0]();
}

uint64_t container_traverse_node_get_name()
{
  return MEMORY[0x1E0C82AA8]();
}

uint64_t container_traverse_node_get_optional_dp_class()
{
  return MEMORY[0x1E0C82AB0]();
}

uint64_t container_traverse_node_get_optional_parent_fd()
{
  return MEMORY[0x1E0C82AB8]();
}

uint64_t container_traverse_node_get_path()
{
  return MEMORY[0x1E0C82AC0]();
}

uint64_t container_traverse_node_is_directory()
{
  return MEMORY[0x1E0C82AC8]();
}

uint64_t container_xpc_decode_container_object()
{
  return MEMORY[0x1E0C82AD8]();
}

uint64_t container_xpc_decode_create_container_object_array()
{
  return MEMORY[0x1E0C82AE0]();
}

uint64_t container_xpc_encode_container_as_object()
{
  return MEMORY[0x1E0C82AE8]();
}

uint64_t container_xpc_encode_container_metadata_as_object()
{
  return MEMORY[0x1E0C82AF0]();
}

uint64_t container_xpc_encode_container_object()
{
  return MEMORY[0x1E0C82AF8]();
}

uint64_t container_xpc_encode_error()
{
  return MEMORY[0x1E0C82B00]();
}

uint64_t container_xpc_send_sync_message()
{
  return MEMORY[0x1E0C82B08]();
}

uint64_t container_xpc_set_use_shared_connection()
{
  return MEMORY[0x1E0C82B10]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1E0C82BA0](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C30](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1E0C82DC8]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1E0C82DD8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

void dispatch_main(void)
{
  MEMORY[0x1E0C82DF0]();
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

char *__cdecl fflagstostr(unint64_t a1)
{
  return (char *)MEMORY[0x1E0C83368](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1E0C835A0](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1E0C835A8](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1E0C835B0](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C83658]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1E0C83738](*(_QWORD *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1E0C838B0](*(_QWORD *)&host, multiuser_flags);
}

uint64_t kpersona_info()
{
  return MEMORY[0x1E0C83A60]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1E0C83B28](a1, *(_QWORD *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C83B30](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C83B38](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C83DC0](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return MEMORY[0x1E0C84010](*(_QWORD *)&id_type, identifier, identifier_size, uu);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C840F8](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

objc_exception_preprocessor objc_setExceptionPreprocessor(objc_exception_preprocessor fn)
{
  return (objc_exception_preprocessor)MEMORY[0x1E0DE7F58](fn);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1E0C84A18]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8068](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1E0DE8098](proto, outCount, isRequiredProperty, isInstanceProperty);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1E0C850C0](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1E0C850C8]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1E0C850D0](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1E0C850D8](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1E0C850E0](state, *(_QWORD *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1E0C85188]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

uint64_t sandbox_set_container_path_for_audit_token()
{
  return MEMORY[0x1E0C85228]();
}

uint64_t sandbox_set_user_state_item_with_persona()
{
  return MEMORY[0x1E0DE8498]();
}

uint64_t sandbox_user_state_iterate_items()
{
  return MEMORY[0x1E0DE84A0]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85340](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
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

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
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

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85718](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1E0C85AF0](*(_QWORD *)&target_task, address, size, data, dataCnt);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1E0C85B30]();
}

uint64_t voucher_get_current_persona_originator_info()
{
  return MEMORY[0x1E0C85B38]();
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return MEMORY[0x1E0C85B40]();
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1E0C85B90]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1E0C86258]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1E0C862F0]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1E0C86588]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

void xpc_transaction_begin(void)
{
  MEMORY[0x1E0C86768]();
}

void xpc_transaction_end(void)
{
  MEMORY[0x1E0C86770]();
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

