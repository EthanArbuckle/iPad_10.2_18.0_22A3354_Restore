@implementation EspressoPass_remove_squeeze

- (BOOL)runOnNetwork:(void *)a3
{
  unint64_t *v4;
  unint64_t *v5;
  const char *v6;
  NSObject *v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  unint64_t v12;
  char v14;
  uint8_t buf[4];
  unint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (unint64_t *)operator new(0x30uLL);
  v4[1] = 0;
  v5 = v4 + 1;
  v4[2] = 0;
  *v4 = (unint64_t)&off_1E2DBBDD8;
  v4[3] = (unint64_t)&off_1E2D85520;
  v4[4] = 0;
  v4[5] = 0;
  Espresso::espresso_os_log_subsystem((Espresso *)v4, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = (unint64_t)"N8Espresso19pass_remove_squeezeE" & 0x7FFFFFFFFFFFFFFFLL;
    _os_log_debug_impl(&dword_190DAF000, v7, OS_LOG_TYPE_DEBUG, "run_pass_on_network %s", buf, 0xCu);
  }

  Espresso::pass_remove_squeeze::run_on_network((Espresso::net *)a3, (uint64_t)buf);
  v14 = 0;
  (*(void (**)(unint64_t *, char *))(v4[3] + 16))(v4 + 3, &v14);
  v8 = buf[0];
  if (v14)
  {
    if (buf[0])
      Espresso::net::set_analysis<Espresso::analysis_result>((uint64_t)a3, (uint64_t *)((char *)&v16 + 4));
    else
      std::__hash_table<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::__unordered_map_hasher<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::hash<std::type_index>,std::equal_to<std::type_index>,true>,std::__unordered_map_equal<std::type_index,std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>,std::equal_to<std::type_index>,std::hash<std::type_index>,true>,std::allocator<std::__hash_value_type<std::type_index,std::shared_ptr<Espresso::analysis_result>>>>::__erase_unique<std::type_index>((uint64_t *)a3 + 140, (uint64_t)"N8Espresso23analysis_remove_squeezeE");
  }
  v9 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  do
    v12 = __ldaxr(v5);
  while (__stlxr(v12 - 1, v5));
  if (!v12)
  {
    (*(void (**)(unint64_t *))(*v4 + 16))(v4);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  return v8 != 0;
}

@end
