@implementation Z38ZinGenerateCoreAnalyticsNetworkStatsV1R25CoreAnalyticsNetworkStats

void *___Z38ZinGenerateCoreAnalyticsNetworkStatsV1R25CoreAnalyticsNetworkStats_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_double(v2, "PalletizedKernelRatio", *(double *)(*(_QWORD *)(a1 + 32) + 48));
    xpc_dictionary_set_double(v3, "SparseKernelRatio", *(double *)(*(_QWORD *)(a1 + 32) + 56));
    xpc_dictionary_set_double(v3, "QuantKernelRatio", *(double *)(*(_QWORD *)(a1 + 32) + 64));
    xpc_dictionary_set_double(v3, "QuantTensorRatio", *(double *)(*(_QWORD *)(a1 + 32) + 72));
    xpc_dictionary_set_double(v3, "TensorElementSizeLog2", *(double *)(*(_QWORD *)(a1 + 32) + 80));
    xpc_dictionary_set_double(v3, "KernelElementSizeLog2", *(double *)(*(_QWORD *)(a1 + 32) + 88));
  }
  return v3;
}

@end
