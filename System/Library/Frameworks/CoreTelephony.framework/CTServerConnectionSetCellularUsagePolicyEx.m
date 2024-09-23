@implementation CTServerConnectionSetCellularUsagePolicyEx

void ___CTServerConnectionSetCellularUsagePolicyEx_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  _QWORD v6[2];
  xpc_object_t objecta;
  xpc_object_t v8;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v8 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v8 = v4;
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
  v8 = v5;
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x186DBAE5C](v5) == v3 && xpc_dictionary_get_value(v5, "kPosixError"))
  {
    v6[0] = &v8;
    v6[1] = "kPosixError";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
    xpc::dyn_cast_or_default((xpc *)&objecta, 0);
    xpc_release(objecta);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(v8);
}

@end
