@implementation CTServerConnectionGetSIMSubscriptionStatus

void ___CTServerConnectionGetSIMSubscriptionStatus_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  CFTypeRef cf;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
  }
  else
  {
    v4 = xpc_null_create();
    if (!v4)
      goto LABEL_5;
  }
  if (MEMORY[0x186DBAE5C](v4) == v3)
  {
    xpc_retain(v4);
    v5 = v4;
    goto LABEL_7;
  }
LABEL_5:
  v5 = xpc_null_create();
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x186DBAE5C](v5) == v3 && xpc_dictionary_get_value(v5, "kCPSIMSubscriptionStatus"))
  {
    cf = 0;
    xpc_dictionary_get_value(v5, "kCPSIMSubscriptionStatus");
    v7 = _CFXPCCreateCFObjectFromXPCObject();
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&cf, (CFTypeRef *)&v7);
    if (cf)
      v6 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
    else
      v6 = 0;
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6 != 0);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  xpc_release(v5);
}

@end
