@implementation EspressoPass_find_shared_weights

- (BOOL)runOnNetwork:(void *)a3
{
  unint64_t *v4;
  unint64_t *v5;
  Espresso::pass_find_shared_weights *v6;
  const char *v7;
  NSObject *v8;
  int v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  unint64_t v13;
  char v15;
  uint8_t buf[4];
  unint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t *)operator new(0x30uLL);
  v4[1] = 0;
  v5 = v4 + 1;
  v4[2] = 0;
  *v4 = (unint64_t)&off_1E2DBD310;
  v4[3] = (unint64_t)&off_1E2D91FE0;
  v6 = (Espresso::pass_find_shared_weights *)(v4 + 3);
  v4[4] = 0;
  v4[5] = 0;
  Espresso::espresso_os_log_subsystem((Espresso *)v4, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = (unint64_t)"N8Espresso24pass_find_shared_weightsE" & 0x7FFFFFFFFFFFFFFFLL;
    _os_log_debug_impl(&dword_190DAF000, v8, OS_LOG_TYPE_DEBUG, "run_pass_on_network %s", buf, 0xCu);
  }

  Espresso::pass_find_shared_weights::run_on_network(v6, (Espresso::net *)a3, (uint64_t)buf);
  v15 = 0;
  (*(void (**)(Espresso::pass_find_shared_weights *, char *))(*(_QWORD *)v6 + 16))(v6, &v15);
  v9 = buf[0];
  if (v15)
  {
    if (buf[0])
      Espresso::net::set_analysis<Espresso::analysis_result>((uint64_t)a3, (uint64_t *)((char *)&v17 + 4));
    else
      std::__hash_table<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>>>::__erase_unique<std::type_index>((uint64_t *)a3 + 140, (uint64_t)"N8Espresso28analysis_find_shared_weightsE");
  }
  v10 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  do
    v13 = __ldaxr(v5);
  while (__stlxr(v13 - 1, v5));
  if (!v13)
  {
    (*(void (**)(unint64_t *))(*v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  return v9 != 0;
}

@end
