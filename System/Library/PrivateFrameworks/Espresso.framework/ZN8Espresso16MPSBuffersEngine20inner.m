@implementation ZN8Espresso16MPSBuffersEngine20inner

const char *___ZN8Espresso16MPSBuffersEngine20inner_product_kernel15__launch_sparseERKNSt3__110shared_ptrINS_14abstract_batchEEERNS_10layer_dataES9__block_invoke()
{
  const char *result;

  result = getenv("FORCE_BLOCK_SIZE");
  if (result)
    result = (const char *)atoi(result);
  Espresso::MPSBuffersEngine::inner_product_kernel::__launch_sparse(std::shared_ptr<Espresso::abstract_batch> const&,Espresso::layer_data &,Espresso::layer_data &)::force_bs = (int)result;
  return result;
}

@end
