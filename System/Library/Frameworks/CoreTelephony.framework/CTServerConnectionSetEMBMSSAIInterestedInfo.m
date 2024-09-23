@implementation CTServerConnectionSetEMBMSSAIInterestedInfo

void ___CTServerConnectionSetEMBMSSAIInterestedInfo_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t objecta;
  xpc_object_t *v9;
  const char *v10;
  xpc_object_t v11;
  xpc_object_t v12;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v12 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v12 = v4;
    if (!v4)
    {
LABEL_5:
      v5 = xpc_null_create();
      v12 = v5;
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
    v9 = &v12;
    v10 = "kDidSucceed";
    v11 = 0;
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v9, &v11);
    v6 = MEMORY[0x186DBAE5C](v11);
    v7 = MEMORY[0x1E0C81350];
    if (v6 == MEMORY[0x1E0C81350])
    {
      objecta = 0;
      v9 = &v12;
      v10 = "kPosixError";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&v9, &objecta);
      if (MEMORY[0x186DBAE5C](objecta) != v7)
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
    }
    xpc_release(v11);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(v12);
}

@end
