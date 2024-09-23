@implementation CFHTTPAuthenticationAskAccountsForCreds

uint64_t ___CFHTTPAuthenticationAskAccountsForCreds_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFTypeRef v7;
  _QWORD *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;

  if (!a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (URLCredential::Class(void)::sOnce_URLCredential != -1)
    dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
  if (*(_DWORD *)(a2 + 48) != 2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 16) + 128))(a2 + 16);
  v6 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 16) + 136))(a2 + 16);
  v7 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 16) + 144))(a2 + 16);
  if (v5)
    v5 = CFRetain(v5);
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1)
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_7917);
  if (v4)
    v8 = (_QWORD *)(v4 + 16);
  else
    v8 = 0;
  v9 = (const void *)v8[24];
  v8[24] = v5;
  if (v9)
    CFRelease(v9);
  if (v6)
    v6 = CFRetain(v6);
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1)
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_7917);
  v10 = (const void *)v8[25];
  v8[25] = v6;
  if (v10)
    CFRelease(v10);
  if (v7)
    v7 = CFRetain(v7);
  if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1)
    dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_7917);
  v11 = (const void *)v8[26];
  v8[26] = v7;
  if (v11)
  {
    CFRelease(v11);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(const void **)(a1 + 56);
    if (HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication != -1)
      dispatch_once(&HTTPAuthentication::Class(void)::sOnce_HTTPAuthentication, &__block_literal_global_7917);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(const void **)(a1 + 56);
  }
  v14 = v12 ? v12 + 16 : 0;
  CFDictionaryGetValue(*(CFDictionaryRef *)(v14 + 152), v13);
  if (!HTTPAuthentication::createNegotiateHeaderForRequest_Mac(v14))
    return _CFHTTPAuthenticationAskAccountsForCreds(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(KerberosAccountBroker **)(a1 + 72), *(__CFData **)(a1 + 80));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
