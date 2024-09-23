@implementation EspressoPass_fuse_add_and_relu

- (BOOL)runOnNetwork:(void *)a3
{
  uint64_t *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char matched;
  __int128 *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 *v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  std::string *v18;
  std::string *v19;
  std::string *v20;
  std::string **v21;
  char v22;
  _QWORD v23[3];
  _QWORD *v24;
  __int128 v25;
  _QWORD v26[3];
  __int128 v27;

  *(_QWORD *)&v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  Espresso::zephyr::es_function_t::es_function_t((Espresso::zephyr::es_function_t *)v14, (Espresso::zephyr::context_t *)&v17, (const Espresso::net *)a3);
  v4 = v16;
  if (v16 != &v15)
  {
    v5 = 0;
    while (1)
    {
      v6 = v4[2];
      v23[0] = &off_1E2DAEBC0;
      v23[1] = v4 + 2;
      v24 = v23;
      std::string::basic_string[abi:ne180100]<0>(&v25, "elementwise");
      std::string::basic_string[abi:ne180100]<0>(v26, "activation");
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = &v18;
      v22 = 0;
      v18 = (std::string *)operator new(0x30uLL);
      v19 = v18;
      v20 = v18 + 2;
      v7 = 0;
      v19 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v20, &v25, &v27, v18);
      do
      {
        if (SHIBYTE(v26[v7 + 2]) < 0)
          operator delete((void *)v26[v7]);
        v7 -= 3;
      }
      while (v7 != -6);
      *(_QWORD *)&v25 = &off_1E2DB3080;
      *((_QWORD *)&v25 + 1) = v23;
      v26[0] = &v25;
      matched = Espresso::zephyr::match_kernel_chain(v6, (uint64_t *)&v18, &v25);
      v9 = (__int128 *)v26[0];
      if ((__int128 *)v26[0] == &v25)
      {
        v9 = &v25;
        v10 = 4;
      }
      else
      {
        if (!v26[0])
          goto LABEL_12;
        v10 = 5;
      }
      (*(void (**)(void))(*(_QWORD *)v9 + 8 * v10))();
LABEL_12:
      v21 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      v11 = v24;
      if (v24 == v23)
      {
        v11 = v23;
        v12 = 4;
        goto LABEL_16;
      }
      if (v24)
      {
        v12 = 5;
LABEL_16:
        (*(void (**)(void))(*v11 + 8 * v12))();
      }
      v5 |= matched;
      v4 = (uint64_t *)v4[1];
      if (v4 == &v15)
        goto LABEL_20;
    }
  }
  v5 = 0;
LABEL_20:
  Espresso::zephyr::es_function_t::lower_to_net(v14, (Espresso::net *)a3);
  *((_BYTE *)a3 + 180) = 0;
  Espresso::shape_network_recursive((Espresso *)a3, (Espresso::net *)((char *)a3 + 184), 0, 0);
  Espresso::zephyr::function_t::~function_t((Espresso::zephyr::function_t *)v14);
  return v5 & 1;
}

@end
