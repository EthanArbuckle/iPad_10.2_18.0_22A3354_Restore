@implementation EspressoPass_quantize_gathers

- (BOOL)runOnNetwork:(void *)a3
{
  char v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 *v8[21];
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v8, (Espresso::zephyr::context_t *)&v9, (const Espresso::net *)a3);
  v10[0] = &off_1E2DAEB68;
  v10[1] = v8;
  v11 = v10;
  v4 = Espresso::zephyr::function_t::foreach_block((uint64_t)v8, (uint64_t)v10);
  v5 = v11;
  if (v11 == v10)
  {
    v6 = 4;
    v5 = v10;
    goto LABEL_5;
  }
  if (v11)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  Espresso::zephyr::es_function_t::lower_to_net(v8, (Espresso::net *)a3);
  *((_BYTE *)a3 + 180) = 0;
  Espresso::shape_network_recursive((Espresso *)a3, (Espresso::net *)((char *)a3 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v8);
  return v4;
}

@end
