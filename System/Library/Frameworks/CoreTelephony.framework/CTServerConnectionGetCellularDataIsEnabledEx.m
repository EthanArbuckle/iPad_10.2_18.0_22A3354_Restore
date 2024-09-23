@implementation CTServerConnectionGetCellularDataIsEnabledEx

void ___CTServerConnectionGetCellularDataIsEnabledEx_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  int v6;
  NSObject *v7;
  xpc_object_t objecta;
  xpc_object_t v9;
  uint8_t buf[8];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v9 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v9 = v4;
    if (!v4)
    {
LABEL_5:
      v5 = xpc_null_create();
      v9 = v5;
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
    if (xpc_dictionary_get_value(v5, "kEnableCellularDataEx"))
    {
      *(_QWORD *)buf = &v9;
      v11 = "kEnableCellularDataEx";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &objecta);
      v6 = xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
    }
    else
    {
      objecta = 0;
      *(_QWORD *)buf = &v9;
      v11 = "kPosixError";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &objecta);
      if (MEMORY[0x186DBAE5C](objecta) != MEMORY[0x1E0C81350])
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = CTLogPacket();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_18425C000, v7, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionGetCellularDataIsEnabledEx(): isEnabled = %d", buf, 8u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(v9);
}

@end
