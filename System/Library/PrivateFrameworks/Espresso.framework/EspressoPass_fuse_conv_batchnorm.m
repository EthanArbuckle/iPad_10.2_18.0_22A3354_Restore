@implementation EspressoPass_fuse_conv_batchnorm

- (BOOL)runOnNetwork:(void *)a3
{
  Espresso::zephyr::function_t *v4;
  __int128 *v6[21];
  uint64_t v7;

  v7 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v6, (Espresso::zephyr::context_t *)&v7, (const Espresso::net *)a3);
  Espresso::zephyr_passes::fuse_conv_batchnorm(v6, v4);
  Espresso::zephyr::es_function_t::lower_to_net(v6, (Espresso::net *)a3);
  *((_BYTE *)a3 + 180) = 0;
  Espresso::shape_network_recursive((Espresso *)a3, (Espresso::net *)((char *)a3 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v6);
  return 0;
}

@end
