void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A2BCEBC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BCEFC4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BCEFD8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BCF3B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BCF44C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BCF79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BCFB24(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BCFB38(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BCFC7C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BCFC90(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1A2BCFE68(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BCFE7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD0534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a25, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id _ACLogSystem()
{
  if (_ACLogSystem_onceToken != -1)
    dispatch_once(&_ACLogSystem_onceToken, &__block_literal_global_0);
  return (id)_ACLogSystem_log;
}

void sub_1A2BD07F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BD0DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BD115C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1A2BD12D4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD12E8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD1418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD14C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD1588(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD1B04(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 176));
  _Unwind_Resume(a1);
}

void sub_1A2BD22B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BD2500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v15 - 96));
  _Unwind_Resume(a1);
}

void sub_1A2BD25A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD2BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id _ACSignpostLogSystem()
{
  if (_ACSignpostLogSystem_onceToken != -1)
    dispatch_once(&_ACSignpostLogSystem_onceToken, &__block_literal_global_7);
  return (id)_ACSignpostLogSystem_log;
}

os_signpost_id_t _ACSignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_absolute_time();
  return v1;
}

unint64_t _ACSignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_ACSignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_ACSignpostGetNanoseconds_onceToken, &__block_literal_global_9);
  v3 = mach_absolute_time();
  LODWORD(v4) = _ACSignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1ECD86664;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

id ac_unfair_lock_perform_with_result(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_1A2BD2EDC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD2EF0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id ac_unfair_lock_perform_with_result_0(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_1A2BD2F5C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD2F70(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id ac_unfair_lock_perform_with_result_1(os_unfair_lock_s *a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;

  v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_1A2BD2FDC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD2FF0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD31D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD3294(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD32A8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ACIsAccountsd()
{
  if (ACIsAccountsd_onceToken != -1)
    dispatch_once(&ACIsAccountsd_onceToken, &__block_literal_global_74);
  return ACIsAccountsd_isAccountsD;
}

void sub_1A2BD3640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD3AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BD3B7C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD3B90(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void ac_dispatch_remote(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a1;
  v5 = a2;
  v6 = a3;
  if (v13)
  {
    if (v5)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ac_dispatch_remote(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ACRemoteDispatch.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (v6)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ac_dispatch_remote(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("ACRemoteDispatch.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ac_dispatch_remote(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("ACRemoteDispatch.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxyProvider"));

  if (!v5)
    goto LABEL_6;
LABEL_3:
  if (!v6)
    goto LABEL_7;
LABEL_4:
  _ac_dispatch_remote_try(v13, v5, v6, 3);

}

void _ac_dispatch_remote_try(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong, NSUInteger)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("ACRemoteDispatch.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (v9)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong, NSUInteger)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("ACRemoteDispatch.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nonnull __strong, NSUInteger)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("ACRemoteDispatch.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxyProvider"));

  if (!v8)
    goto LABEL_6;
LABEL_3:
  if (!v9)
    goto LABEL_7;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___ac_dispatch_remote_try_block_invoke;
  v20[3] = &unk_1E4892A00;
  v21 = v7;
  v22 = v9;
  v23 = v8;
  v24 = a4;
  v10 = (void (**)(id, void *))v8;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v13);

}

void ac_dispatch_remote_sync(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a1;
  v5 = a2;
  v6 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ac_dispatch_remote_sync(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nullable __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("ACRemoteDispatch.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxyProvider"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ac_dispatch_remote_sync(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nullable __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("ACRemoteDispatch.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  _ac_dispatch_remote_sync_try(v11, v5, v6, 3);

}

void _ac_dispatch_remote_sync_try(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(id, void *);
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_sync_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nullable __strong, NSUInteger)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("ACRemoteDispatch.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (a4)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_sync_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nullable __strong, NSUInteger)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("ACRemoteDispatch.m"), 74, CFSTR("Unexpected 0 count of remaining attempts!"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ac_dispatch_remote_sync_try(id<NSXPCProxyCreating>  _Nonnull __strong, ac_remote_dispatch_block_t  _Nonnull __strong, ac_remote_error_block_t  _Nullable __strong, NSUInteger)");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("ACRemoteDispatch.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxyProvider"));

  if (!v8)
    goto LABEL_6;
LABEL_3:
  if (!a4)
    goto LABEL_7;
LABEL_4:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = ___ac_dispatch_remote_sync_try_block_invoke;
  v20[3] = &unk_1E4892A00;
  v21 = v7;
  v22 = v9;
  v23 = v8;
  v24 = a4;
  v10 = (void (**)(id, void *))v8;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, v13);

}

void sub_1A2BD461C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD4630(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD480C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BD4DE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD5284(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BD5298(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD5D44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 buf)
{
  id v11;
  void *v12;
  int v13;
  NSObject *v14;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(exception_object);
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FA8]);

    if (v13)
    {
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        buf = 0;
        _os_log_impl(&dword_1A2BCD000, v14, OS_LOG_TYPE_DEFAULT, "\"NSObjectInaccessibleException caught inside -[ACAccount initWithManagedAccount:]\"", (uint8_t *)&buf, 2u);
      }

      objc_end_catch();
      JUMPOUT(0x1A2BD5C68);
    }
    objc_exception_throw(objc_retainAutorelease(v11));
  }
  _Unwind_Resume(exception_object);
}

void sub_1A2BD663C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD68F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD6D6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD6F50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD8E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BD9224(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(&gOpenConnectionLock);
  objc_exception_rethrow();
}

void sub_1A2BD923C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BD9684(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD9A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BD9DD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BD9FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2BDA080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDA324(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDA728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDA918(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDAA6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ACDeallocateMemoryPages(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  id v5;

  result = MEMORY[0x1A858A248](*MEMORY[0x1E0C83DA0], a1, a2);
  if ((_DWORD)result)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deallocate memory pages (ptr=%p, bytes=%lu)"), a1, a2);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return result;
}

vm_address_t ACAllocateMemoryPages(vm_size_t size)
{
  id v3;
  vm_address_t address;

  address = 0;
  if (vm_allocate(*MEMORY[0x1E0C83DA0], &address, size, 1644167169))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate memory pages (bytes=%lu)"), size);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  return address;
}

void sub_1A2BDBE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BDBFC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDC6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak((id *)(v20 - 80));
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDD960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, char a18)
{
  _Block_object_dispose(&a18, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDE2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2BDE35C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDE6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDEA2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDEC24(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BDEC38(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ACIsInternal()
{
  if (ACIsInternal_onceToken != -1)
    dispatch_once(&ACIsInternal_onceToken, &__block_literal_global_78);
  return ACIsInternal_isInternal;
}

id ACDGetProcNameForPID(uint64_t a1)
{
  void *v2;
  char *v3;
  int v4;
  void *v5;
  size_t v7;
  _OWORD v8[40];
  int v9[2];
  int v10;
  int v11;
  _BYTE buffer[256];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (proc_name(a1, buffer, 0x100u) >= 1)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    v3 = buffer;
LABEL_6:
    objc_msgSend(v2, "stringWithUTF8String:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = 648;
  *(_QWORD *)v9 = 0xE00000001;
  memset(v8, 0, 512);
  v10 = 1;
  v11 = a1;
  v4 = sysctl(v9, 4u, v8, &v7, 0, 0);
  v5 = 0;
  if (!v4 && BYTE3(v8[15]))
  {
    v3 = (char *)&v8[15] + 3;
    v2 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_6;
  }
LABEL_7:
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<pid:%d>"), a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void sub_1A2BDF110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BDF1B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDF304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDF380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDFCB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BDFEA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BE009C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BE0294(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t ACProtobufVariableValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  ACProtobufUUID *v38;
  uint64_t v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_40;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_61:
        v40 = 16;
        goto LABEL_66;
      case 3u:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 96) |= 4u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v23 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v23 = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_65:
        v40 = 24;
LABEL_66:
        *(_QWORD *)(a1 + v40) = v23;
        goto LABEL_69;
      case 4u:
        *(_BYTE *)(a1 + 96) |= 1u;
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v36 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
          *(_QWORD *)(a2 + v34) = v35 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v36 = 0;
        }
        *(_QWORD *)(a1 + 8) = v36;
        goto LABEL_69;
      case 5u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
LABEL_40:
        v37 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_69;
      case 6u:
        v38 = objc_alloc_init(ACProtobufUUID);
        objc_storeStrong((id *)(a1 + 88), v38);
        if (!PBReaderPlaceMark() || (ACProtobufUUIDReadFrom((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_57;
      case 7u:
        v38 = objc_alloc_init(ACProtobufDate);
        objc_storeStrong((id *)(a1 + 48), v38);
        if (!PBReaderPlaceMark() || (ACProtobufDateReadFrom((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_57;
      case 8u:
        v38 = objc_alloc_init(ACProtobufURL);
        objc_storeStrong((id *)(a1 + 80), v38);
        if (!PBReaderPlaceMark() || (ACProtobufURLReadFrom((uint64_t)v38, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_57;
      case 9u:
        v38 = objc_alloc_init(ACProtobufVariableValueList);
        v39 = 32;
        goto LABEL_52;
      case 0xAu:
        v38 = objc_alloc_init(ACProtobufVariableValueList);
        v39 = 64;
LABEL_52:
        objc_storeStrong((id *)(a1 + v39), v38);
        if (!PBReaderPlaceMark() || (ACProtobufVariableValueListReadFrom(v38, a2) & 1) == 0)
          goto LABEL_71;
        goto LABEL_57;
      case 0xBu:
        v38 = objc_alloc_init(ACProtobufVariableValueDictionary);
        objc_storeStrong((id *)(a1 + 56), v38);
        if (PBReaderPlaceMark() && (ACProtobufVariableValueDictionaryReadFrom(v38, a2) & 1) != 0)
        {
LABEL_57:
          PBReaderRecallMark();

LABEL_69:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_71:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_69;
    }
  }
}

void ___ac_dispatch_remote_sync_try_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "code") == 4097
    && (objc_msgSend(v3, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v4,
        (v5 & 1) != 0))
  {
    v6 = a1[7] - 1;
    _ACLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = v3;
        v12 = 2048;
        v13 = v6;
        _os_log_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEFAULT, "\"Remote account store returned error: %{public}@, attemptsRemaining: %lu\"", (uint8_t *)&v10, 0x16u);
      }

      _ac_dispatch_remote_sync_try(a1[4], a1[6], a1[5], v6);
      goto LABEL_11;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___ac_dispatch_remote_sync_try_block_invoke_cold_1();
  }
  else
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ___ac_dispatch_remote_sync_try_block_invoke_cold_2();
  }

  v9 = a1[5];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
LABEL_11:

}

void ___ac_dispatch_remote_try_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "code") != 4097
    || (objc_msgSend(v3, "domain"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
        v4,
        (v5 & 1) == 0))
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ___ac_dispatch_remote_sync_try_block_invoke_cold_2();
    goto LABEL_9;
  }
  v6 = a1[7] - 1;
  _ACLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___ac_dispatch_remote_sync_try_block_invoke_cold_1();
LABEL_9:

    (*(void (**)(void))(a1[5] + 16))();
    goto LABEL_10;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v3;
    v11 = 2048;
    v12 = v6;
    _os_log_impl(&dword_1A2BCD000, v8, OS_LOG_TYPE_DEFAULT, "\"Remote account store returned error: %{public}@, attemptsRemaining: %lu\"", (uint8_t *)&v9, 0x16u);
  }

  _ac_dispatch_remote_try(a1[4], a1[6], a1[5], v6);
LABEL_10:

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _ACLogCache()
{
  if (_ACLogCache_onceToken != -1)
    dispatch_once(&_ACLogCache_onceToken, &__block_literal_global_3);
  return (id)_ACLogCache_log;
}

id _ACPLogSystem()
{
  if (_ACPLogSystem_onceToken != -1)
    dispatch_once(&_ACPLogSystem_onceToken, &__block_literal_global_5);
  return (id)_ACPLogSystem_log;
}

void sub_1A2BE2658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2BE27D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2BE2888(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2BE289C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2BE2BE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BE3240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE3578(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BE3B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a23, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE4028(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BE4EB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 176));
  _Unwind_Resume(a1);
}

void sub_1A2BE58A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BE6058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE6550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a23, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE6970(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_1A2BE7150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  _Block_object_dispose(&a20, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE745C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BE7B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  _Block_object_dispose(&a20, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BE7ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1A2BE8208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1A2BE84E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BE8B84(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BE92BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BE9930(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BE9F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1A2BEA47C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 176));
  _Unwind_Resume(a1);
}

void sub_1A2BEAE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose(&a25, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEB5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEBA88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEBEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEC2F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  _Block_object_dispose(&a20, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEC74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BECB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BED194(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 176));
  _Unwind_Resume(a1);
}

void sub_1A2BEDBD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 192));
  _Unwind_Resume(a1);
}

void sub_1A2BEE50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEE990(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_1A2BEF074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
  uint64_t v33;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEF660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  uint64_t v27;

  _Block_object_dispose((const void *)(v27 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEFAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BEFF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Block_object_dispose(&a24, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF0440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF0ACC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BF10FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BF185C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 192));
  _Unwind_Resume(a1);
}

void sub_1A2BF1EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF24B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF29A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF2E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Block_object_dispose(&a22, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF327C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Block_object_dispose(&a24, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF3588(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_1A2BF3E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF43EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF4980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  uint64_t v27;

  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose(&a23, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF4E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  _Block_object_dispose(&a15, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF51FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BF5894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF5DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF6274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF6940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF7010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF75F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF7D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BF8560(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BF8C08(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BF9314(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BF9B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v29 - 160));
  _Unwind_Resume(a1);
}

void sub_1A2BF9FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BFC3AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BFC83C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_1A2BFCEB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1A2BFD3C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_1A2BFDC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A2BFE124(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_1A2BFE810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(float *)a4 = a2;
  *(_QWORD *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2112;
  *(_QWORD *)(a4 + 14) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_20(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1A2BFF910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFF980(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFFC28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFFCBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFFD24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFFD8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2BFFE60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2C00090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00110(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C001B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00260(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00478(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C0057C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C005FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C006B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C008BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00A00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2C00B4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2C00C90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C00DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2C00EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A2C01080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C0122C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C0165C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01860(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C018FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01A00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C01E3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C02114(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C0224C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C022BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C02980(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C031A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C03AB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C03B04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C03EF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C04590(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ACIsEqualOrNil(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (!v3 || !v4)
  {
    if (v3 | v4)
      goto LABEL_4;
LABEL_6:
    v6 = 1;
    goto LABEL_7;
  }
  if ((objc_msgSend((id)v3, "isEqual:", v4) & 1) != 0)
    goto LABEL_6;
LABEL_4:
  v6 = 0;
LABEL_7:

  return v6;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userPersonaType");
}

void sub_1A2C05B9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C05C74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C05DD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2C060E4(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C060F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A2C07250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C07434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ACProtobufVariableKeyValuePairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  ACProtobufVariableValue *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(ACProtobufVariableValue **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(ACProtobufVariableValue);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || (ACProtobufVariableValueReadFrom(v18, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A2C09E28(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C09E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C09F6C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C09F80(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ACProtobufDataclassActionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_42;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_44;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_44:
          *(_DWORD *)(a1 + 16) = v19;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          break;
        case 3u:
          PBReaderReadString();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend((id)a1, "addAffectedContainers:", v30);

          continue;
        case 4u:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = 32;
          goto LABEL_40;
        case 5u:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = 24;
LABEL_40:
          v33 = *(void **)(a1 + v32);
          *(_QWORD *)(a1 + v32) = v31;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          break;
        v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v28 + 1;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if ((v29 & 0x80) == 0)
          goto LABEL_46;
        v24 += 7;
        v14 = v25++ >= 9;
        if (v14)
        {
          v26 = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_48:
      *(_BYTE *)(a1 + 40) = v26 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_1A2C0AFEC(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C0B000(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2C0B0B0(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C0B0C4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2C0B18C(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C0B1A0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2C0BBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C0C0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C0C1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ACProtobufVariableValueListReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACProtobufVariableValue *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACProtobufVariableValue);
        objc_msgSend(a1, "addValue:", v17);
        if (!PBReaderPlaceMark() || (ACProtobufVariableValueReadFrom(v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACProtobufAccountReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  ACProtobufAccountType *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  void *v52;
  BOOL v53;
  uint64_t v54;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(ACProtobufAccountType);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (PBReaderPlaceMark() && (ACProtobufAccountTypeReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_79;
        goto LABEL_120;
      case 2u:
        v17 = objc_alloc_init(ACProtobufAccountCredential);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (!PBReaderPlaceMark() || (ACProtobufAccountCredentialReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_120;
        goto LABEL_79;
      case 3u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 96;
        goto LABEL_96;
      case 4u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 8;
        goto LABEL_96;
      case 5u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 160;
        goto LABEL_96;
      case 6u:
        v17 = objc_alloc_init(ACProtobufVariableKeyValuePair);
        objc_msgSend((id)a1, "addProperties:", v17);
        goto LABEL_61;
      case 7u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_100;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_100:
        v53 = v23 != 0;
        v54 = 169;
        goto LABEL_117;
      case 8u:
        v17 = objc_alloc_init(ACProtobufDate);
        v27 = 104;
        goto LABEL_77;
      case 9u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                v30 = 0;
                goto LABEL_104;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_104:
        v53 = v30 != 0;
        v54 = 168;
        goto LABEL_117;
      case 0xAu:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v38 + 1;
            v36 |= (unint64_t)(v39 & 0x7F) << v34;
            if (v39 < 0)
            {
              v34 += 7;
              v14 = v35++ >= 9;
              if (v14)
              {
                v36 = 0;
                goto LABEL_108;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_108:
        v53 = v36 != 0;
        v54 = 171;
        goto LABEL_117;
      case 0xBu:
        v40 = 0;
        v41 = 0;
        v42 = 0;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v44 + 1;
            v42 |= (unint64_t)(v45 & 0x7F) << v40;
            if (v45 < 0)
            {
              v40 += 7;
              v14 = v41++ >= 9;
              if (v14)
              {
                v42 = 0;
                goto LABEL_112;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v42 = 0;
LABEL_112:
        v53 = v42 != 0;
        v54 = 170;
        goto LABEL_117;
      case 0xCu:
        v17 = objc_alloc_init(ACProtobufVariableKeyValuePair);
        objc_msgSend((id)a1, "addDataclassProperties:", v17);
LABEL_61:
        if (!PBReaderPlaceMark() || !ACProtobufVariableKeyValuePairReadFrom((uint64_t)v17, a2))
          goto LABEL_120;
        goto LABEL_79;
      case 0xDu:
        v17 = objc_alloc_init(ACProtobufURL);
        objc_storeStrong((id *)(a1 + 120), v17);
        if (!PBReaderPlaceMark() || (ACProtobufURLReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_120;
        goto LABEL_79;
      case 0xEu:
        v17 = objc_alloc_init(ACProtobufAccount);
        objc_storeStrong((id *)(a1 + 136), v17);
        if (!PBReaderPlaceMark() || (ACProtobufAccountReadFrom(v17, a2) & 1) == 0)
          goto LABEL_120;
        goto LABEL_79;
      case 0xFu:
        PBReaderReadString();
        v17 = (ACProtobufAccountType *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addEnabledDataclasses:", v17);
        goto LABEL_80;
      case 0x10u:
        PBReaderReadString();
        v17 = (ACProtobufAccountType *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addProvisionedDataclasses:", v17);
        goto LABEL_80;
      case 0x11u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 24;
        goto LABEL_96;
      case 0x12u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 40;
        goto LABEL_96;
      case 0x13u:
        v17 = objc_alloc_init(ACProtobufDate);
        v27 = 56;
LABEL_77:
        objc_storeStrong((id *)(a1 + v27), v17);
        if (PBReaderPlaceMark() && (ACProtobufDateReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_79:
          PBReaderRecallMark();
LABEL_80:

LABEL_118:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_120:

        return 0;
      case 0x14u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 128;
        goto LABEL_96;
      case 0x15u:
        PBReaderReadString();
        v17 = (ACProtobufAccountType *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addDirtyProperties:", v17);
        goto LABEL_80;
      case 0x16u:
        PBReaderReadString();
        v17 = (ACProtobufAccountType *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addDirtyAccountProperties:", v17);
        goto LABEL_80;
      case 0x17u:
        PBReaderReadString();
        v17 = (ACProtobufAccountType *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend((id)a1, "addDirtyDataclassProperties:", v17);
        goto LABEL_80;
      case 0x18u:
        v46 = 0;
        v47 = 0;
        v48 = 0;
        *(_BYTE *)(a1 + 176) |= 1u;
        while (2)
        {
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 1;
            v48 |= (unint64_t)(v51 & 0x7F) << v46;
            if (v51 < 0)
            {
              v46 += 7;
              v14 = v47++ >= 9;
              if (v14)
              {
                v48 = 0;
                goto LABEL_116;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v48 = 0;
LABEL_116:
        v53 = v48 != 0;
        v54 = 172;
LABEL_117:
        *(_BYTE *)(a1 + v54) = v53;
        goto LABEL_118;
      case 0x19u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 112;
LABEL_96:
        v52 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_118;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_118;
    }
  }
}

void __ACSystemConfigManagerPreferencesCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = (void *)MEMORY[0x1A8589E88]();
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  if ((void *)__sharedACSystemConfigManager == a3)
    v6 = a3;
  else
    v6 = 0;
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  objc_msgSend(v6, "_handleSCPreferencesSessionNotification:", a2);

  objc_autoreleasePoolPop(v5);
}

id ACDGetAdamOrDisplayIDForPID(uint64_t a1)
{
  void *v2;

  ACDGetStoreOrBundleIDForPID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    ACDGetProcNameForPID(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id ACDGetStoreOrBundleIDForPID()
{
  int v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE buffer[4096];
  uint64_t v10;

  v0 = MEMORY[0x1E0C80A78]();
  v10 = *MEMORY[0x1E0C80C00];
  v1 = proc_pidpath(v0, buffer, 0x1000u);
  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v1, 4);
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t ACDGetTeamIDForBundleURL()
{
  return 0;
}

id serializeSecCertificates(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ac_mapValues:", &__block_literal_global_12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __serializeSecCertificates_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "ac_map:", &__block_literal_global_57);
}

CFDataRef __serializeSecCertificates_block_invoke_2(int a1, SecCertificateRef certificate)
{
  return SecCertificateCopyData(certificate);
}

id unserializeSecCertificates(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = a1;
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ac_mapValues:", &__block_literal_global_64);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __unserializeSecCertificates_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "ac_map:", &__block_literal_global_66);
}

SecCertificateRef __unserializeSecCertificates_block_invoke_2(uint64_t a1, const __CFData *a2)
{
  return SecCertificateCreateWithData(0, a2);
}

id serializeSecTrust(__SecTrust *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  CFIndex CertificateCount;
  CFIndex v11;
  CFIndex i;
  __SecCertificate *CertificateAtIndex;
  CFDataRef v14;
  id v15;
  CFIndex v16;
  __SecPolicy *ValueAtIndex;
  CFDictionaryRef v18;
  void *v19;
  void *v20;
  NSObject *v21;
  CFArrayRef policies;
  CFErrorRef error;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    error = 0;
    if (!SecTrustEvaluateWithError(a1, &error))
    {
      _ACLogSystem();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        serializeSecTrust_cold_2((uint64_t)&error, v2, v3, v4, v5, v6, v7, v8);

      if (error)
        CFRelease(error);
    }
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    CertificateCount = SecTrustGetCertificateCount(a1);
    if (CertificateCount >= 1)
    {
      v11 = CertificateCount;
      for (i = 0; i != v11; ++i)
      {
        CertificateAtIndex = SecTrustGetCertificateAtIndex(a1, i);
        v14 = SecCertificateCopyData(CertificateAtIndex);
        objc_msgSend(v9, "addObject:", v14);

      }
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    policies = 0;
    SecTrustCopyPolicies(a1, &policies);
    if (CFArrayGetCount(policies) >= 1)
    {
      v16 = 0;
      do
      {
        ValueAtIndex = (__SecPolicy *)CFArrayGetValueAtIndex(policies, v16);
        v18 = SecPolicyCopyProperties(ValueAtIndex);
        objc_msgSend(v15, "addObject:", v18);

        ++v16;
      }
      while (v16 < CFArrayGetCount(policies));
    }
    v25[0] = CFSTR("certificatesData");
    v25[1] = CFSTR("policiesProperties");
    v26[0] = v9;
    v26[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v19, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _ACLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      serializeSecTrust_cold_1(v21);

    v20 = 0;
  }
  return v20;
}

SecTrustRef unserializeSecTrust(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  __CFArray *Mutable;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  SecCertificateRef v18;
  SecCertificateRef v19;
  __CFArray *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  SecPolicyRef v29;
  SecPolicyRef v30;
  SecTrustRef v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  SecTrustRef trust;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v7, v1, &v53);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v53;
  v10 = v9;
  if (v8)
  {
    v41 = v9;
    v42 = v7;
    v43 = v1;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("certificatesData"));
    v11 = objc_claimAutoreleasedReturnValue();
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    if (v11)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v13 = v11;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(v13);
            v18 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v49 + 1) + 8 * i));
            if (v18)
            {
              v19 = v18;
              CFArrayAppendValue(Mutable, v18);
              CFRelease(v19);
            }
          }
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v15);
      }

    }
    v40 = v11;
    v20 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("policiesProperties"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      v25 = *MEMORY[0x1E0CD6FB0];
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v27, "objectForKeyedSubscript:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v29 = SecPolicyCreateWithProperties(v28, (CFDictionaryRef)v27);
            if (v29)
            {
              v30 = v29;
              CFArrayAppendValue(v20, v29);
              CFRelease(v30);
            }
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v23);
    }
    trust = 0;
    SecTrustCreateWithCertificates(Mutable, v20, &trust);
    CFRelease(Mutable);
    CFRelease(v20);
    v31 = trust;

    v7 = v42;
    v1 = v43;
    v32 = v40;
    v10 = v41;
  }
  else
  {
    _ACLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      unserializeSecTrust_cold_1((uint64_t)v10, v32, v33, v34, v35, v36, v37, v38);
    v31 = 0;
  }

  return v31;
}

id ACAccountTypeIdentifierForASSAccountType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ACAccountTypeIdentifierForASSAccountType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACAccountTypeIdentifierForASSAccountType_onceToken, &__block_literal_global_13);
  objc_msgSend((id)ACAccountTypeIdentifierForASSAccountType_accountTypeDictionary, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ACDataclassForASSDataclass(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = ACDataclassForASSDataclass_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&ACDataclassForASSDataclass_onceToken, &__block_literal_global_1);
  objc_msgSend((id)ACDataclassForASSDataclass_dataclassDictionary, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id createACAccountWithASAccountProperties(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ACAccountTypeIdentifierForASSAccountType(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    createACAccountWithASAccountPropertiesAndACAccountType(v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
    v9 = objc_claimAutoreleasedReturnValue();

    NSLog((NSString *)CFSTR("Failed to find an account type for %@"), v9);
    v8 = 0;
    v4 = (id)v9;
  }

  return v8;
}

ACAccount *createACAccountWithASAccountPropertiesAndACAccountType(void *a1, void *a2)
{
  id v3;
  id v4;
  ACAccount *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  ACAccount *v30;
  id v32;
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
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = -[ACAccount initWithAccountType:]([ACAccount alloc], "initWithAccountType:", v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("Type"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("ChildAccounts"));
    objc_msgSend(v6, "objectForKey:", CFSTR("Identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("Identifier"));
    objc_msgSend(v6, "objectForKey:", CFSTR("Username"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setUsername:](v5, "setUsername:", v8);

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("Username"));
    objc_msgSend(v6, "objectForKey:", CFSTR("DisplayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setAccountDescription:](v5, "setAccountDescription:", v9);

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("DisplayName"));
    objc_msgSend(v6, "objectForKey:", CFSTR("Enabled Dataclasses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Mail")), CFSTR("com.apple.Dataclass.Mail"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Contacts")), CFSTR("com.apple.Dataclass.Contacts"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Calendars")), CFSTR("com.apple.Dataclass.Calendars"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Reminders")), CFSTR("com.apple.Dataclass.Reminders"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Notes")), CFSTR("com.apple.Dataclass.Notes"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.ContactsSearch")), CFSTR("com.apple.Dataclass.ContactsSearch"));
    -[ACAccount setEnabled:forDataclass:](v5, "setEnabled:forDataclass:", objc_msgSend(v10, "containsObject:", CFSTR("com.apple.Dataclass.Bookmarks")), CFSTR("com.apple.Dataclass.Bookmarks"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("Enabled Dataclasses"));
    objc_msgSend(v6, "objectForKey:", CFSTR("Provisioned Dataclasses"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v32 = v3;
    if (v12)
    {
      v39 = 0uLL;
      v40 = 0uLL;
      v37 = 0uLL;
      v38 = 0uLL;
      objc_msgSend(v6, "objectForKey:", CFSTR("Provisioned Dataclasses"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v38 != v16)
              objc_enumerationMutation(v13);
            ACDataclassForASSDataclass(*(void **)(*((_QWORD *)&v37 + 1) + 8 * i));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[ACAccount setProvisioned:forDataclass:](v5, "setProvisioned:forDataclass:", 1, v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v15);
      }
    }
    else
    {
      v43 = 0uLL;
      v44 = 0uLL;
      v41 = 0uLL;
      v42 = 0uLL;
      objc_msgSend(v4, "supportedDataclasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(v13);
            -[ACAccount setProvisioned:forDataclass:](v5, "setProvisioned:forDataclass:", 1, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j));
          }
          v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v20);
      }
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v6, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k);
          objc_msgSend(v6, "objectForKey:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACAccount setAccountProperty:forKey:](v5, "setAccountProperty:forKey:", v29, v28);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v25);
    }

    -[ACAccount setAuthenticated:](v5, "setAuthenticated:", 1);
    v30 = v5;

    v3 = v32;
  }
  else
  {
    NSLog((NSString *)CFSTR("Failed to create an account of type %@"), v4);
  }

  return v5;
}

uint64_t ACProtobufCredentialItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  ACProtobufDate *v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_26;
      case 2u:
        v20 = objc_alloc_init(ACProtobufDate);
        objc_storeStrong((id *)(a1 + 24), v20);
        if (!PBReaderPlaceMark() || (ACProtobufDateReadFrom((uint64_t)v20, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_36;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
LABEL_26:
        v21 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_44;
      case 4u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                v24 = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_43:
        *(_BYTE *)(a1 + 48) = v24 != 0;
        goto LABEL_44;
      case 5u:
        v20 = objc_alloc_init(ACProtobufURL);
        objc_storeStrong((id *)(a1 + 32), v20);
        if (PBReaderPlaceMark() && (ACProtobufURLReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();
LABEL_39:

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      case 6u:
        PBReaderReadString();
        v20 = (ACProtobufDate *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend((id)a1, "addDirtyProperties:", v20);
        goto LABEL_39;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

BOOL ACProtobufKeyValuePairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACProtobufVariableValueDictionaryReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  ACProtobufVariableKeyValuePair *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(ACProtobufVariableKeyValuePair);
        objc_msgSend(a1, "addPair:", v17);
        if (!PBReaderPlaceMark() || !ACProtobufVariableKeyValuePairReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACProtobufAccountTypeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int *v22;
  ACProtobufURL *v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t result;
  void *v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___ACDataclassAction__undoAlertMessage;
  v8 = &OBJC_IVAR___ACDataclassAction__undoAlertMessage;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v17 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v7[16];
        goto LABEL_50;
      case 2u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v8[17];
        goto LABEL_50;
      case 3u:
        v21 = v8;
        v22 = v7;
        v23 = objc_alloc_init(ACProtobufURL);
        objc_storeStrong((id *)(a1 + 40), v23);
        if (PBReaderPlaceMark() && (ACProtobufURLReadFrom((uint64_t)v23, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v7 = v22;
          v8 = v21;
LABEL_76:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 68) |= 2u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              v16 = v25++ >= 9;
              if (v16)
              {
                LODWORD(v26) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_61:
        v49 = 60;
        goto LABEL_66;
      case 5u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 24;
        goto LABEL_50;
      case 6u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 16;
        goto LABEL_50;
      case 7u:
        v30 = 0;
        v31 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 68) |= 1u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v26 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              v16 = v31++ >= 9;
              if (v16)
              {
                LODWORD(v26) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_65:
        v49 = 56;
LABEL_66:
        *(_DWORD *)(a1 + v49) = v26;
        goto LABEL_76;
      case 8u:
        v35 = 0;
        v36 = 0;
        v37 = 0;
        *(_BYTE *)(a1 + 68) |= 8u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v16 = v36++ >= 9;
              if (v16)
              {
                v37 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v37 = 0;
LABEL_70:
        v50 = v37 != 0;
        v51 = 65;
        goto LABEL_75;
      case 0xAu:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 48;
LABEL_50:
        v42 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_76;
      case 0xBu:
        v43 = 0;
        v44 = 0;
        v45 = 0;
        *(_BYTE *)(a1 + 68) |= 4u;
        while (2)
        {
          v46 = *v3;
          v47 = *(_QWORD *)(a2 + v46);
          if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v47);
            *(_QWORD *)(a2 + v46) = v47 + 1;
            v45 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              v43 += 7;
              v16 = v44++ >= 9;
              if (v16)
              {
                v45 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v45 = 0;
LABEL_74:
        v50 = v45 != 0;
        v51 = 64;
LABEL_75:
        *(_BYTE *)(a1 + v51) = v50;
        goto LABEL_76;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_76;
    }
  }
}

uint64_t ACProtobufDateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      if (v17 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFF7 && v20 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + v16) = 1;
          v21 = 0;
        }
        *(_QWORD *)(a1 + 8) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACProtobufURLReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A2C18818(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C1882C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2C18984(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C18998(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A2C18C60(void *a1)
{
  os_unfair_lock_s *v1;

  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A2C18C70()
{
  __break(1u);
}

void sub_1A2C18C98()
{
  objc_end_catch();
  JUMPOUT(0x1A2C18CA0);
}

uint64_t ACProtobufAccountCredentialReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  ACProtobufKeyValuePair *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(ACProtobufKeyValuePair);
          objc_msgSend((id)a1, "addCredentialItems:", v17);
          if (PBReaderPlaceMark() && ACProtobufKeyValuePairReadFrom((uint64_t)v17, a2))
          {
            PBReaderRecallMark();
            goto LABEL_27;
          }

          return 0;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v19;

          continue;
        case 3u:
          PBReaderReadString();
          v17 = (ACProtobufKeyValuePair *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend((id)a1, "addDirtyProperties:", v17);
LABEL_27:

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_36;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          v23 = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        v23 = 0;
LABEL_38:
      *(_BYTE *)(a1 + 32) = v23 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t ACProtobufUUIDReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void ___ac_dispatch_remote_sync_try_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Remote account store depleted error attempts: %{public}@\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___ac_dispatch_remote_sync_try_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, v0, v1, "\"Remote account store returned fatal error: %{public}@\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void serializeSecTrust_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_ERROR, "\"trustRef was NULL\"", v1, 2u);
}

void serializeSecTrust_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, a2, a3, "\"trustRef evaluated unsuccessfully: %@\"", a5, a6, a7, a8, 2u);
}

void unserializeSecTrust_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, a2, a3, "\"Failed to deserialize, error: %@\"", a5, a6, a7, a8, 2u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1E0C98F48](encoding);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1E0C991C0](*(_QWORD *)&encoding);
}

void NSCopyMemoryPages(const void *source, void *dest, NSUInteger bytes)
{
  MEMORY[0x1E0CB28D0](source, dest, bytes);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1E0CB3168](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1E0CE89E8](prefs, wait);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE89F8](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1E0CE8A00](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x1E0CE8A28](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE8A38](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8A40](prefs, runLoop, runLoopMode);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

CFDictionaryRef SecPolicyCopyProperties(SecPolicyRef policyRef)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6458](policyRef);
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6540](policyIdentifier, properties);
}

OSStatus SecTrustCopyPolicies(SecTrustRef trust, CFArrayRef *policies)
{
  return MEMORY[0x1E0CD6678](trust, policies);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1E0CD66A0]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1E0CD66D8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFPreferencesManagementStatusChangedForDomains()
{
  return MEMORY[0x1E0C9A350]();
}

uint64_t _CFPreferencesPostValuesChangedInDomains()
{
  return MEMORY[0x1E0C9A358]();
}

uint64_t _CFPreferencesWriteManagedDomainForUser()
{
  return MEMORY[0x1E0C9A3B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

