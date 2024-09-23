@implementation EspressoPass_concat_fuse_fix

- (BOOL)runOnNetwork:(void *)a3
{
  __int128 *v5[21];
  uint64_t v6;

  v6 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v5, (Espresso::zephyr::context_t *)&v6, (const Espresso::net *)a3);
  Espresso::zephyr::es_function_t::lower_to_net(v5, (Espresso::net *)a3);
  *((_BYTE *)a3 + 180) = 0;
  Espresso::shape_network_recursive((Espresso *)a3, (Espresso::net *)((char *)a3 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v5);
  return 0;
}

@end
