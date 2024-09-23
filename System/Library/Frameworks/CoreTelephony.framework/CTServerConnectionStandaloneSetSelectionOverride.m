@implementation CTServerConnectionStandaloneSetSelectionOverride

void ___CTServerConnectionStandaloneSetSelectionOverride_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  _BOOL8 v7;
  char v8;
  _QWORD v9[2];
  xpc_object_t objecta;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    objecta = v4;
  }
  else
  {
    v4 = xpc_null_create();
    objecta = v4;
    if (!v4)
    {
LABEL_5:
      v5 = xpc_null_create();
      objecta = v5;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x186DBAE5C](v4) != v3)
    goto LABEL_5;
  xpc_retain(v4);
  v5 = v4;
LABEL_7:
  xpc_release(v4);
  v6 = *(_QWORD *)(a1 + 32);
  if (MEMORY[0x186DBAE5C](v5) == v3)
  {
    v9[0] = &objecta;
    v9[1] = "kCPStandaloneOverrideSelectionResult";
    v8 = 1;
    v7 = xpc::operator==<BOOL>((uint64_t)v9, (BOOL *)&v8);
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, _BOOL8))(v6 + 16))(v6, v7);
  xpc_release(objecta);
}

@end
