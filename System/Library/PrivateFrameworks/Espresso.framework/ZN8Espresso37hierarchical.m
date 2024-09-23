@implementation ZN8Espresso37hierarchical

char *___ZN8Espresso37hierarchical_inner_product_kernel_cpu8__launchERKNSt3__110shared_ptrINS_14abstract_batchEEERNS_10layer_dataES8__block_invoke()
{
  char *result;

  if (getenv("ESPRESSO_N_CLUSTERS_KEEP"))
    Espresso::hierarchical_inner_product_kernel_cpu::__launch(std::shared_ptr<Espresso::abstract_batch> const&,Espresso::layer_data &,Espresso::layer_data &)::need_recheck_env = 1;
  result = getenv("ESPRESSO_N_MIN_ROWS_FACTOR");
  if (result)
    Espresso::hierarchical_inner_product_kernel_cpu::__launch(std::shared_ptr<Espresso::abstract_batch> const&,Espresso::layer_data &,Espresso::layer_data &)::need_recheck_env = 1;
  return result;
}

@end
