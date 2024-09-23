@implementation CTServerConnectionGetEMBMSSigInfo

void ___CTServerConnectionGetEMBMSSigInfo_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t *v6;
  uint64_t v7;
  const object *v8;
  uint64_t v9;
  xpc_object_t objecta;
  xpc_object_t *v11;
  const char *v12;
  xpc_object_t v13;
  xpc_object_t v14;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v14 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v14 = v4;
    if (!v4)
    {
LABEL_5:
      v5 = xpc_null_create();
      v14 = v5;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x186DBAE5C](v4) != v3)
    goto LABEL_5;
  xpc_retain(v4);
  v5 = v4;
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x186DBAE5C](v5) == v3)
  {
    v11 = &v14;
    v12 = "kEMBMSSigInfo";
    v13 = 0;
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v11, &v13);
    v7 = MEMORY[0x186DBAE5C](v13);
    v9 = MEMORY[0x1E0C81350];
    if (v7 == MEMORY[0x1E0C81350])
    {
      objecta = 0;
      v11 = &v14;
      v12 = "kPosixError";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&v11, &objecta);
      if (MEMORY[0x186DBAE5C](objecta) != v9)
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
      v6 = 0;
    }
    else
    {
      xpc::bridge((xpc *)&v13, v8);
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v11, (CFTypeRef *)&objecta);
      v6 = v11;
      v11 = 0;
      if (objecta)
        CFRelease(objecta);
    }
    xpc_release(v13);
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(v14);
  if (v6)
    CFRelease(v6);
}

@end
