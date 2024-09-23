@implementation EspressoPass_remove_squeeze_expanddims_1d_ops

- (BOOL)runOnNetwork:(void *)a3
{
  Espresso::zephyr::function_t *v4;
  char v5;
  __int128 *v7[21];
  uint64_t v8;

  v8 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v7, (Espresso::zephyr::context_t *)&v8, (const Espresso::net *)a3);
  v5 = Espresso::zephyr_passes::remove_squeeze_expanddims_1d_ops((Espresso::zephyr_passes *)v7, v4);
  Espresso::zephyr::es_function_t::lower_to_net(v7, (Espresso::net *)a3);
  *((_BYTE *)a3 + 180) = 0;
  Espresso::shape_network_recursive((Espresso *)a3, (Espresso::net *)((char *)a3 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v7);
  return v5;
}

@end
