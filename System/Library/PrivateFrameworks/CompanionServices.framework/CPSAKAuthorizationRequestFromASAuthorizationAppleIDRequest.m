@implementation CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest

id ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _QWORD *v3;
  void *v4;
  id *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = a2;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v3 = (_QWORD *)getASAuthorizationScopeEmailSymbolLoc_ptr;
  v14 = getASAuthorizationScopeEmailSymbolLoc_ptr;
  if (!getASAuthorizationScopeEmailSymbolLoc_ptr)
  {
    v4 = (void *)AuthenticationServicesLibrary();
    v3 = dlsym(v4, "ASAuthorizationScopeEmail");
    v12[3] = (uint64_t)v3;
    getASAuthorizationScopeEmailSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
  {
    ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
    goto LABEL_15;
  }
  if ((objc_msgSend(v2, "isEqualToString:", *v3, v11) & 1) != 0)
  {
    v5 = (id *)MEMORY[0x24BE0ABF8];
    goto LABEL_11;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getASAuthorizationScopeFullNameSymbolLoc_ptr;
  v14 = getASAuthorizationScopeFullNameSymbolLoc_ptr;
  if (!getASAuthorizationScopeFullNameSymbolLoc_ptr)
  {
    v7 = (void *)AuthenticationServicesLibrary();
    v6 = dlsym(v7, "ASAuthorizationScopeFullName");
    v12[3] = (uint64_t)v6;
    getASAuthorizationScopeFullNameSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
LABEL_15:
    v10 = (_Unwind_Exception *)___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  if (!objc_msgSend(v2, "isEqualToString:", *v6, v11))
  {
    v8 = 0;
    goto LABEL_13;
  }
  v5 = (id *)MEMORY[0x24BE0AC00];
LABEL_11:
  v8 = *v5;
LABEL_13:

  return v8;
}

uint64_t ___CPSAKAuthorizationRequestFromASAuthorizationAppleIDRequest_block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getASAuthorizationPasswordRequestClass_block_invoke_cold_1(v0);
}

@end
