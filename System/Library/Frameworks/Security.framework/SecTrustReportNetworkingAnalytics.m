@implementation SecTrustReportNetworkingAnalytics

uint64_t __SecTrustReportNetworkingAnalytics_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_BOOL(xdict, "status");
  return 1;
}

BOOL __SecTrustReportNetworkingAnalytics_block_invoke(uint64_t a1, void *a2, __CFString **a3)
{
  _BOOL8 v5;

  v5 = SecXPCDictionarySetString((uint64_t)a2, (uint64_t)"eventName", *(const __CFString **)(a1 + 32), a3);
  if (v5)
    xpc_dictionary_set_value(a2, "eventAttributes", *(xpc_object_t *)(a1 + 40));
  return v5;
}

@end
