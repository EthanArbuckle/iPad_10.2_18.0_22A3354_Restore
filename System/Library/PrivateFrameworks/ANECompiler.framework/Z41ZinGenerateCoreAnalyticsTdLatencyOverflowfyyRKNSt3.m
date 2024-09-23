@implementation Z41ZinGenerateCoreAnalyticsTdLatencyOverflowfyyRKNSt3

void *___Z41ZinGenerateCoreAnalyticsTdLatencyOverflowfyyRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_double(v2, "LatencyThreshold", *(float *)(a1 + 56));
    xpc_dictionary_set_uint64(v3, "MaxLatency", *(_QWORD *)(a1 + 32));
    xpc_dictionary_set_uint64(v3, "TDCount", *(_QWORD *)(a1 + 40));
    v4 = *(const char **)(a1 + 48);
    if (v4[23] < 0)
      v4 = *(const char **)v4;
    xpc_dictionary_set_string(v3, "ModelIdent", v4);
  }
  return v3;
}

@end
