@implementation CTServerConnectionGetVoiceLinkQualityMetric

void ___CTServerConnectionGetVoiceLinkQualityMetric_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];
  xpc_object_t objecta;
  xpc_object_t v10;

  v3 = MEMORY[0x1E0C812F8];
  if (object)
  {
    v4 = object;
    xpc_retain(object);
    v10 = v4;
  }
  else
  {
    v4 = xpc_null_create();
    v10 = v4;
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
  v10 = v5;
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x186DBAE5C](v5) == v3 && xpc_dictionary_get_value(v5, "kRadioVoiceLQM"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8[0] = &v10;
    v8[1] = "kRadioVoiceLQM";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v8, &objecta);
    v7 = xpc::dyn_cast_or_default((xpc *)&objecta, (const object *)0xFFFFFFFFLL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, 1, v7);
    xpc_release(objecta);
    v5 = v10;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  xpc_release(v5);
}

@end
