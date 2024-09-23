@implementation NWConcrete

uint64_t __37__NWConcrete_nw_activity_description__block_invoke@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  int v11;
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  size_t v16;
  _QWORD *v17;
  _QWORD *v18;
  const char *v19;
  uint64_t v20;
  _QWORD *v21;
  const char *v22;
  int is_global_parent;
  const char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  int is_equal;
  const char *v29;
  size_t v30;
  int is_selected_for_reporting;
  const char *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  const char *v36;
  size_t v37;
  char *v38;
  size_t v39;
  _QWORD *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  unsigned int v45;
  size_t v46;
  _QWORD *v47;
  unint64_t v48;
  const char *v49;
  char *v50;
  size_t v51;
  _QWORD *v52;
  size_t v53;
  unint64_t v54;
  const void **v55;
  const void *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];
  uint64_t v66;
  unint64_t v67;
  void *__p[2];
  __int128 v69;
  int v70;
  uint64_t v71[19];
  char out[40];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1E0DE4FE0];
  v5 = MEMORY[0x1E0DE4FE0] + 64;
  v6 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v8 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v71[0] = MEMORY[0x1E0DE4FE0] + 64;
  v63 = v7;
  *(uint64_t *)((char *)&v63 + *(_QWORD *)(v7 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v63 + *(_QWORD *)(v63 - 24));
  std::ios_base::init(v9, &v64);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v63 = v4 + 24;
  v71[0] = v5;
  std::streambuf::basic_streambuf();
  v64 = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v69 = 0u;
  v70 = 16;
  memset(out, 0, 37);
  if (!uuid_is_null((const unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8)))
    uuid_unparse((const unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8), out);
  v62 = 0;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v10 + 24))
  {
    asprintf(&v62, " (investigation %llu)", *(_QWORD *)(v10 + 24));
    v10 = *(_QWORD *)(a1 + 32);
  }
  v61 = 0;
  v12 = *(_DWORD *)(v10 + 116);
  v11 = *(_DWORD *)(v10 + 120);
  if (v12 | v11)
    asprintf(&v61, " (underlying error %d:%d)", v12, v11);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v63, (uint64_t)"<nw_activity ", 13);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v13, (uint64_t)":", 1);
  v14 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)" [", 2);
  if (uuid_is_null((const unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8)))
    v15 = "No UUID";
  else
    v15 = out;
  v16 = strlen(v15);
  v17 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v15, v16);
  v18 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v17, (uint64_t)"]", 1);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 2) != 0)
    v19 = " (lightweight)";
  else
    v19 = "";
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 2) != 0)
    v20 = 14;
  else
    v20 = 0;
  v21 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v18, (uint64_t)v19, v20);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 1) != 0)
    v22 = " (retry)";
  else
    v22 = "";
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v21, (uint64_t)v22, 8 * (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 1));
  is_global_parent = nw_activity_is_global_parent(*(void **)(a1 + 32));
  if (is_global_parent)
    v24 = " (global parent)";
  else
    v24 = "";
  if (is_global_parent)
    v25 = 16;
  else
    v25 = 0;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v24, v25);
  v26 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v26)
  {
    v27 = v26;
    is_equal = nw_activity_is_equal(v27, (void *)global_parent);

    if (is_equal)
      v29 = " (parent is global)";
    else
      v29 = "";
  }
  else
  {
    v29 = "";
  }
  v30 = strlen(v29);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v29, v30);
  is_selected_for_reporting = nw_activity_is_selected_for_reporting(*(void **)(a1 + 32));
  if (is_selected_for_reporting)
    v32 = " reported";
  else
    v32 = "";
  if (is_selected_for_reporting)
    v33 = 9;
  else
    v33 = 0;
  v34 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v32, v33);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v34, (uint64_t)" (reporting strategy ", 21);
  v35 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 124);
  if (v35 > 3)
    v36 = "invalid";
  else
    v36 = off_1E14A5580[v35];
  v37 = strlen(v36);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v36, v37);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)")", 1);
  if (v62)
    v38 = v62;
  else
    v38 = "";
  v39 = strlen(v38);
  v40 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v38, v39);
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 8) != 0)
    v41 = " complete (reason ";
  else
    v41 = "";
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 132) & 8) != 0)
    v42 = 18;
  else
    v42 = 0;
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v40, (uint64_t)v41, v42);
  v43 = *(_QWORD *)(a1 + 32);
  v44 = "";
  if ((*(_BYTE *)(v43 + 132) & 8) != 0)
  {
    v45 = *(_DWORD *)(v43 + 128) - 1;
    if (v45 > 3)
      v44 = "invalid";
    else
      v44 = off_1E14A6B58[v45];
  }
  v46 = strlen(v44);
  v47 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v44, v46);
  v48 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 132);
  if ((v48 & 8) != 0)
    v49 = ")";
  else
    v49 = "";
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v47, (uint64_t)v49, (v48 >> 3) & 1);
  if (v61)
    v50 = v61;
  else
    v50 = "";
  v51 = strlen(v50);
  v52 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v14, (uint64_t)v50, v51);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v52, (uint64_t)">", 1);
  if (v26)

  if (v62)
  {
    free(v62);
    v62 = 0;
  }
  if (v61)
  {
    free(v61);
    v61 = 0;
  }
  if ((v70 & 0x10) != 0)
  {
    v54 = *((_QWORD *)&v69 + 1);
    if (*((_QWORD *)&v69 + 1) < v67)
    {
      *((_QWORD *)&v69 + 1) = v67;
      v54 = v67;
    }
    v55 = (const void **)&v66;
  }
  else
  {
    if ((v70 & 8) == 0)
    {
      v53 = 0;
      a2[23] = 0;
      goto LABEL_79;
    }
    v55 = (const void **)v65;
    v54 = v65[2];
  }
  v56 = *v55;
  v53 = v54 - (_QWORD)*v55;
  if (v53 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v53 >= 0x17)
  {
    v57 = (v53 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v53 | 7) != 0x17)
      v57 = v53 | 7;
    v58 = v57 + 1;
    v59 = operator new(v57 + 1);
    *((_QWORD *)a2 + 1) = v53;
    *((_QWORD *)a2 + 2) = v58 | 0x8000000000000000;
    *(_QWORD *)a2 = v59;
    a2 = v59;
    goto LABEL_78;
  }
  a2[23] = v53;
  if (v53)
LABEL_78:
    memmove(a2, v56, v53);
LABEL_79:
  a2[v53] = 0;
  v63 = *v6;
  *(uint64_t *)((char *)&v63 + *(_QWORD *)(v63 - 24)) = v6[3];
  v64 = MEMORY[0x1E0DE4FB8] + 16;
  if (SBYTE7(v69) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186DB3548](v71);
}

void __33__NWConcrete_nw_path_description__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 256));
}

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NWConcrete_nw_protocol_transform *v4;

  v4 = nw_protocol_transform_copy(a3);
  nw_array_append(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 160), v4);

  return 1;
}

uint64_t __74__NWConcrete_nw_parameters_initWithParameters_stripConnected_shallowCopy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NWConcrete_nw_protocol_options *v4;

  v4 = nw_protocol_options_copy(a3);
  nw_array_append(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), v4);

  return 1;
}

void __33__NWConcrete_nw_path_description__block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 256))
    objc_storeStrong((id *)(v1 + 256), *(id *)(a1 + 40));
}

uint64_t __60__NWConcrete_nw_endpoint_resolver_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  nw_endpoint_handler_cancel(a3, *(unsigned __int8 *)(a1 + 32), 0);
  return 1;
}

uint64_t __61__NWConcrete_nw_endpoint_transform_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  nw_endpoint_handler_cancel(a3, *(unsigned __int8 *)(a1 + 32), 0);
  return 1;
}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(v2 + 64) = 0;
  }
  v4 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  if (v6)
  {
    free(v6);
    *(_QWORD *)(v5 + 80) = 0;
  }
  v7 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = 0;

}

void __33__NWConcrete_nw_endpoint_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 216);
  if (v3)
  {
    nw_array_remove_all_objects((uint64_t)v3);
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 216);
  }
  *(_QWORD *)(v2 + 216) = 0;

}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

void __36__NWConcrete_nw_association_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__NWConcrete_nw_association_dealloc__block_invoke_2;
  v8[3] = &unk_1E14AC2A0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  nw_hash_table_apply(v3, (uint64_t)v8);
  v7 = *(os_unfair_lock_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7)
  {
    _nw_hash_table_release(v7, v6);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

CFTypeRef __42__NWConcrete_nw_url_endpoint_copyEndpoint__block_invoke(uint64_t a1)
{
  const char *v2;
  char *v3;
  const char *v4;
  char *v5;
  const char *v6;
  char *v7;
  char *v8;
  char *v9;
  CFTypeRef result;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 300) = 0;
  v2 = *(const char **)(*(_QWORD *)(a1 + 40) + 248);
  if (!v2)
  {
    __nwlog_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    v12 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v12);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v12);
  }
  v3 = strdup(v2);
  if (!v3)
  {
    __nwlog_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    v14 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v14);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v14);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = v3;
  v4 = *(const char **)(*(_QWORD *)(a1 + 40) + 256);
  if (!v4)
  {
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    v16 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v16);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v16);
  }
  v5 = strdup(v4);
  if (!v5)
  {
    __nwlog_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    v18 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v18);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v18);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = v5;
  v6 = *(const char **)(*(_QWORD *)(a1 + 40) + 264);
  if (!v6)
  {
    __nwlog_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    v20 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v20);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v20);
  }
  v7 = strdup(v6);
  if (!v7)
  {
    __nwlog_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    v22 = (void *)_os_log_send_and_compose_impl();

    result = (CFTypeRef)__nwlog_abort((uint64_t)v22);
    if ((_DWORD)result)
      goto LABEL_28;
    free(v22);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = v7;
  v8 = *(char **)(*(_QWORD *)(a1 + 40) + 272);
  if (v8)
  {
    v8 = strdup(v8);
    if (!v8)
    {
      __nwlog_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v24 = (void *)_os_log_send_and_compose_impl();

      result = (CFTypeRef)__nwlog_abort((uint64_t)v24);
      if ((_DWORD)result)
        goto LABEL_28;
      free(v24);
      v8 = 0;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = v8;
  v9 = *(char **)(*(_QWORD *)(a1 + 40) + 280);
  if (!v9)
    goto LABEL_11;
  v9 = strdup(v9);
  if (v9)
    goto LABEL_11;
  __nwlog_obj();
  v25 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
  v26 = (void *)_os_log_send_and_compose_impl();

  result = (CFTypeRef)__nwlog_abort((uint64_t)v26);
  if (!(_DWORD)result)
  {
    free(v26);
    v9 = 0;
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = v9;
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 240) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 240);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 297) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 297) & 0xFE | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 297) & 1;
    result = CFRetain(*(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 232));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = result;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __67__NWConcrete_nw_resolver_initWithEndpoint_parameters_path_log_str___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  int v5;
  uint64_t v6;
  int v7;
  BOOL v8;

  v4 = a2;
  v5 = nw_resolver_config_get_class(v4);
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_DWORD *)(v6 + 24);
    if (v7)
      v8 = v5 < v7;
    else
      v8 = 1;
    if (v8)
    {
      *(_DWORD *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }

  return 1;
}

void __35__NWConcrete_nw_path_copyWithZone___block_invoke(uint64_t a1)
{
  char *v2;
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(*(_QWORD *)(a1 + 40) + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(*(_QWORD *)(a1 + 40) + 64));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(*(_QWORD *)(a1 + 40) + 72));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(*(_QWORD *)(a1 + 40) + 80));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(*(_QWORD *)(a1 + 40) + 88));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(*(_QWORD *)(a1 + 40) + 96));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(*(_QWORD *)(a1 + 40) + 104));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(*(_QWORD *)(a1 + 40) + 112));
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 120) = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 120);
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 136) = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 136);
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 152) = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 152);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(*(_QWORD *)(a1 + 40) + 168));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(*(_QWORD *)(a1 + 40) + 176));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(*(_QWORD *)(a1 + 40) + 184));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(*(_QWORD *)(a1 + 40) + 208));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 216), *(id *)(*(_QWORD *)(a1 + 40) + 216));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 224), *(id *)(*(_QWORD *)(a1 + 40) + 224));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(*(_QWORD *)(a1 + 40) + 232));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 240), *(id *)(*(_QWORD *)(a1 + 40) + 240));
  v2 = *(char **)(*(_QWORD *)(a1 + 40) + 248);
  if (v2)
  {
    v2 = strdup(v2);
    if (!v2)
    {
      __nwlog_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      v26 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v26))
        goto LABEL_22;
      free(v26);
      v2 = 0;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = v2;
  v3 = (_OWORD *)(*(_QWORD *)(a1 + 40) + 264);
  v4 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 264);
  v5 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 344);
  v7 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 296);
  v6 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 312);
  v4[4] = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 328);
  v4[5] = v5;
  v4[2] = v7;
  v4[3] = v6;
  v8 = v3[1];
  *v4 = *v3;
  v4[1] = v8;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(unsigned int *)(v9 + 348);
  if ((_DWORD)v10 && *(_QWORD *)(v9 + 296))
  {
    v11 = malloc_type_malloc(20 * v10, 0xF2B69DE5uLL);
    if (!v11)
    {
      __nwlog_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      v28 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v28))
        goto LABEL_22;
      free(v28);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = v11;
    memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 296), *(const void **)(*(_QWORD *)(a1 + 40) + 296), 20 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 348));
    v9 = *(_QWORD *)(a1 + 40);
  }
  v12 = *(unsigned int *)(v9 + 344);
  if (!(_DWORD)v12 || !*(_QWORD *)(v9 + 304))
    goto LABEL_11;
  v13 = malloc_type_malloc(24 * v12, 0xF2B69DE5uLL);
  if (!v13)
  {
    __nwlog_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    v30 = (void *)_os_log_send_and_compose_impl();

    if (!__nwlog_abort((uint64_t)v30))
    {
      free(v30);
      goto LABEL_10;
    }
LABEL_22:
    __break(1u);
    return;
  }
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = v13;
  memcpy(*(void **)(*(_QWORD *)(a1 + 32) + 304), *(const void **)(*(_QWORD *)(a1 + 40) + 304), 24 * *(unsigned int *)(*(_QWORD *)(a1 + 40) + 344));
  v9 = *(_QWORD *)(a1 + 40);
LABEL_11:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 360) = *(_DWORD *)(v9 + 360);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 364) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 364);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 368) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 368);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 372) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 372);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 376) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 376);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 380) = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 380);
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 384) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 384);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 386) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 386);
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 387) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 387);
  v14 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 392);
  v15 = (_OWORD *)(*(_QWORD *)(a1 + 40) + 392);
  v16 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 456);
  v18 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 408);
  v17 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 424);
  v14[3] = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 440);
  v14[4] = v16;
  v14[1] = v18;
  v14[2] = v17;
  *v14 = *v15;
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(_QWORD *)(v19 + 200);
  if (v20)
  {
    v21 = nw_array_create();
    if (v21 != v20)
    {
      v22 = v21;
      std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v21 + 16, *(void ***)(v20 + 16), *(void ***)(v20 + 24), (uint64_t)(*(_QWORD *)(v20 + 24) - *(_QWORD *)(v20 + 16)) >> 3);
      v20 = v22;
    }
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 200);
    *(_QWORD *)(v23 + 200) = v20;

    v19 = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 472) = *(_BYTE *)(v19 + 472);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xFE | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xFD | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xFB | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xF7 | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xEF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 0x10;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xDF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 0x20;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0xBF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 0x40;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 473) & 0x80 | *(_BYTE *)(*(_QWORD *)(a1 + 32) + 473) & 0x7F;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xFE | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xFD | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xFB | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xF7 | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xEF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 0x10;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xDF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 0x20;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0xBF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 0x40;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 474) & 0x80 | *(_BYTE *)(*(_QWORD *)(a1 + 32) + 474) & 0x7F;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xFE | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xFD | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xFB | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xF7 | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xEF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 0x10;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xDF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 0x20;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0xBF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 0x40;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 475) & 0x80 | *(_BYTE *)(*(_QWORD *)(a1 + 32) + 475) & 0x7F;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xFE | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xFD | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xFB | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xF7 | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 8;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xEF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 0x10;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xDF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 0x20;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 476) & 0xBF | *(_BYTE *)(*(_QWORD *)(a1 + 40) + 476) & 0x40;
}

void __37__NWConcrete_nw_endpoint_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  CFStringRef v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 56))
  {
    v3 = *(const char **)(v2 + 64);
    if (v3
      || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend((id)v2, "createDescription:", 0),
          v2 = *(_QWORD *)(a1 + 32),
          (v3 = *(const char **)(v2 + 64)) != 0))
    {
      v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, 0x8000100u);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = v4;

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 56));
}

void __45__NWConcrete_nw_endpoint_redactedDescription__block_invoke(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  CFStringRef v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 72))
  {
    v3 = *(const char **)(v2 + 80);
    if (v3
      || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_msgSend((id)v2, "createDescription:", 1),
          v2 = *(_QWORD *)(a1 + 32),
          (v3 = *(const char **)(v2 + 80)) != 0))
    {
      v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, 0x8000100u);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v4;

      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(v2 + 72));
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  id *v6;
  id v7;

  v7 = a3;
  v6 = (id *)nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  objc_storeStrong(v6 + 12, a3);
  nw_endpoint_resolver_update(*(void **)(a1 + 32), *(void **)(a1 + 40), a2);

}

uint64_t __49__NWConcrete_nw_listener_canHandleNewConnection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 104) == 0;
  return result;
}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 216));
}

void __41__NWConcrete_nw_listener_getPeerDeviceID__block_invoke(uint64_t a1)
{
  const char *v2;
  char *v3;
  NSObject *v4;
  void *v5;

  v2 = *(const char **)(*(_QWORD *)(a1 + 32) + 232);
  if (v2)
  {
    v3 = strdup(v2);
    if (!v3)
    {
      __nwlog_obj();
      v4 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      v5 = (void *)_os_log_send_and_compose_impl();

      if (__nwlog_abort((uint64_t)v5))
      {
        __break(1u);
        return;
      }
      free(v5);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  }
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t v11;
  const char *id_string;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 104);
  if (v2 != -1)
  {
    if (v2)
    {
      *(_DWORD *)(v1 + 104) = v2 - 1;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if (v11 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v11 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v5 = (id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          goto LABEL_16;
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        v13 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 104);
        v14 = 136446722;
        v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        v16 = 2082;
        v17 = id_string;
        v18 = 1024;
        v19 = v13;
        v7 = "%{public}s [%{public}s] New connection limit is %u";
        v8 = v5;
        v9 = OS_LOG_TYPE_INFO;
        v10 = 28;
        goto LABEL_15;
      }
    }
    else
    {
      v4 = *(_QWORD *)(v1 + 16);
      if (v4 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v4 + 104)))
      {
        if (__nwlog_listener_log::onceToken != -1)
          dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
        v5 = (id)glistenerLogObj;
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v6 = nw_listener_get_id_string(*(void **)(a1 + 32));
        v14 = 136446466;
        v15 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
        v16 = 2082;
        v17 = v6;
        v7 = "%{public}s [%{public}s] Unexpected connection notification";
        v8 = v5;
        v9 = OS_LOG_TYPE_ERROR;
        v10 = 22;
LABEL_15:
        _os_log_impl(&dword_182FBE000, v8, v9, v7, (uint8_t *)&v14, v10);
LABEL_16:

      }
    }
  }
}

void __52__NWConcrete_nw_endpoint_resolver_startWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NWConcrete_nw_endpoint_mode_handler *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int *v11;
  uint64_t v12;
  int minimize_logging;
  unsigned int *v14;
  char v15;
  NSObject *v16;
  unsigned int *v17;
  unsigned int *v18;
  char v19;
  const char *v20;
  nw_endpoint_t v21;
  const char *logging_description;
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  unsigned int *v29;
  char v30;
  unsigned int *v31;
  unsigned int *v32;
  char v33;
  const char *v34;
  const char *v35;
  unsigned int *v36;
  unsigned int *v37;
  uint64_t v38;
  const char *v39;
  void **v40;
  void **v41;
  const char *v42;
  void **v43;
  void **v44;
  const char *v45;
  void **v46;
  id v47;
  id v48;
  void **v49;
  id v50;
  id v51;
  NWConcrete_nw_endpoint_handler *v52;
  int state;
  NWConcrete_nw_endpoint_handler *v54;
  _BOOL4 v55;
  NSObject *v56;
  NWConcrete_nw_endpoint_handler *v57;
  NWConcrete_nw_endpoint_handler *v58;
  _BOOL4 v59;
  const char *v60;
  nw_endpoint_t v61;
  const char *v62;
  NWConcrete_nw_endpoint_handler *v63;
  NWConcrete_nw_endpoint_handler *v64;
  uint64_t v65;
  const char *v66;
  NWConcrete_nw_endpoint_mode_handler *v67;
  NWConcrete_nw_endpoint_mode_handler *v68;
  NWConcrete_nw_endpoint_handler *v69;
  _BOOL4 v70;
  NSObject *v71;
  NWConcrete_nw_endpoint_handler *v72;
  NWConcrete_nw_endpoint_handler *v73;
  _BOOL4 v74;
  const char *v75;
  nw_endpoint_t v76;
  NWConcrete_nw_endpoint_handler *v77;
  NWConcrete_nw_endpoint_handler *v78;
  uint64_t v79;
  const char *v80;
  void *v81;
  nw_endpoint_t v82;
  void *v83;
  void *v84;
  void **v85;
  void **v86;
  unsigned int v87;
  const char *v88;
  void **v89;
  void **v90;
  unsigned int v91;
  const char *v92;
  void **v93;
  id v94;
  nw_endpoint_t v95;
  void **v96;
  id v97;
  const char *v98;
  void *v99;
  char *v100;
  NSObject *v101;
  os_log_type_t v102;
  char *backtrace_string;
  os_log_type_t v104;
  _BOOL4 v105;
  const char *id_string;
  const char *v107;
  nw_endpoint_t v108;
  const char *v109;
  const char *v110;
  const char *v111;
  id v112;
  const char *v113;
  const char *v114;
  nw_endpoint_t v115;
  const char *v116;
  const char *v117;
  const char *v118;
  id v119;
  const char *v120;
  const char *v121;
  nw_endpoint_t v122;
  const char *v123;
  const char *v124;
  const char *v125;
  id v126;
  os_log_type_t v127;
  const char *v128;
  const char *v129;
  nw_endpoint_t v130;
  const char *v131;
  const char *v132;
  const char *v133;
  id v134;
  const char *v135;
  NSObject *log;
  os_log_t loga;
  const char *v138;
  NWConcrete_nw_endpoint_mode_handler *v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  char v144;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  char *id_str;
  __int16 v150;
  const char *v151;
  __int16 v152;
  const char *v153;
  __int16 v154;
  const char *v155;
  __int16 v156;
  const char *v157;
  __int16 v158;
  id v159;
  __int16 v160;
  const char *v161;
  __int16 v162;
  id v163;
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = nw_endpoint_handler_copy_resolver(*(NWConcrete_nw_endpoint_handler **)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v9 = (void *)*((_QWORD *)v7 + 1);
  v10 = v8;
  v141 = v9;
  v142 = v5;
  v143 = v6;
  v139 = v7;
  v140 = v10;
  if (!v10)
  {
    __nwlog_obj();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v147 = "nw_endpoint_resolver_handle_alternative";
    v100 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v144 = 0;
    if (__nwlog_fault(v100, &type, &v144))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v102 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_182FBE000, v101, v102, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if (v144)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v104 = type;
        v105 = os_log_type_enabled(v101, type);
        if (backtrace_string)
        {
          if (v105)
          {
            *(_DWORD *)buf = 136446466;
            v147 = "nw_endpoint_resolver_handle_alternative";
            v148 = 2082;
            id_str = backtrace_string;
            _os_log_impl(&dword_182FBE000, v101, v104, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_133;
        }
        if (v105)
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_182FBE000, v101, v104, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v101 = objc_claimAutoreleasedReturnValue();
        v127 = type;
        if (os_log_type_enabled(v101, type))
        {
          *(_DWORD *)buf = 136446210;
          v147 = "nw_endpoint_resolver_handle_alternative";
          _os_log_impl(&dword_182FBE000, v101, v127, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_133:
    if (v100)
      free(v100);
    goto LABEL_95;
  }
  v11 = (unsigned int *)v10;
  v12 = v11[29];

  if ((_DWORD)v12 != 1)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v27 = (id)gLogObj;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      if (v12 > 5)
        v28 = "unknown-mode";
      else
        v28 = off_1E149FC18[v12];
      *(_DWORD *)buf = 136446722;
      v147 = "nw_endpoint_resolver_handle_alternative";
      v148 = 2082;
      id_str = (char *)v28;
      v150 = 2082;
      v151 = "resolver";
      _os_log_impl(&dword_182FBE000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }

    goto LABEL_95;
  }
  minimize_logging = nw_endpoint_handler_get_minimize_logging(v11);
  if (v143)
  {
    if (!minimize_logging)
    {
      v14 = v11;
      v15 = *((_BYTE *)v14 + 268);

      if ((v15 & 0x20) != 0)
        goto LABEL_49;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        log = v16;
        v17 = v14;

        v18 = v17;
        v19 = *((_BYTE *)v14 + 268);

        if ((v19 & 1) != 0)
          v20 = "dry-run ";
        else
          v20 = "";
        v21 = nw_endpoint_handler_copy_endpoint(v18);
        logging_description = nw_endpoint_get_logging_description(v21);
        v23 = v18;
        v24 = v23;
        v25 = v23[30];
        if (v25 > 5)
          v26 = "unknown-state";
        else
          v26 = off_1E149FC48[v25];

        v40 = v24;
        v41 = v40;
        v42 = "path";
        switch(v11[29])
        {
          case 0u:
            break;
          case 1u:
            v42 = "resolver";
            break;
          case 2u:
            v42 = nw_endpoint_flow_mode_string(v40[31]);
            break;
          case 3u:
            v42 = "proxy";
            break;
          case 4u:
            v42 = "fallback";
            break;
          case 5u:
            v42 = "transform";
            break;
          default:
            v42 = "unknown-mode";
            break;
        }

        v46 = v41;
        os_unfair_lock_lock((os_unfair_lock_t)v46 + 28);
        v47 = v46[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v46 + 28);

        v48 = v47;
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = (char *)(v17 + 42);
        v150 = 2082;
        v151 = v20;
        v152 = 2082;
        v153 = logging_description;
        v154 = 2082;
        v155 = v26;
        v156 = 2082;
        v157 = v42;
        v158 = 2114;
        v159 = v48;
        v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        v162 = 2112;
        v163 = v143;
        v16 = log;
        _os_log_impl(&dword_182FBE000, log, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s using %@", buf, 0x5Cu);

      }
      goto LABEL_48;
    }
    if ((nw_endpoint_handler_get_logging_disabled(v11) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(v11);
        v107 = nw_endpoint_handler_dry_run_string(v11);
        v108 = nw_endpoint_handler_copy_endpoint(v11);
        v109 = nw_endpoint_get_logging_description(v108);
        v110 = nw_endpoint_handler_state_string(v11);
        v111 = nw_endpoint_handler_mode_string(v11);
        v112 = nw_endpoint_handler_copy_current_path(v11);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = (char *)id_string;
        v150 = 2082;
        v151 = v107;
        v152 = 2082;
        v153 = v109;
        v154 = 2082;
        v155 = v110;
        v156 = 2082;
        v157 = v111;
        v158 = 2114;
        v159 = v112;
        v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        v162 = 2112;
        v163 = v143;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s using %@", buf, 0x5Cu);

      }
LABEL_48:

    }
  }
  else
  {
    if (!minimize_logging)
    {
      v29 = v11;
      v30 = *((_BYTE *)v29 + 268);

      if ((v30 & 0x20) != 0)
        goto LABEL_49;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v31 = v29;

        v32 = v31;
        v33 = *((_BYTE *)v29 + 268);

        if ((v33 & 1) != 0)
          v34 = "dry-run ";
        else
          v34 = "";
        loga = nw_endpoint_handler_copy_endpoint(v32);
        v35 = nw_endpoint_get_logging_description(loga);
        v36 = v32;
        v37 = v36;
        v38 = v36[30];
        if (v38 > 5)
          v39 = "unknown-state";
        else
          v39 = off_1E149FC48[v38];

        v43 = v37;
        v44 = v43;
        v45 = "path";
        switch(v11[29])
        {
          case 0u:
            break;
          case 1u:
            v45 = "resolver";
            break;
          case 2u:
            v45 = nw_endpoint_flow_mode_string(v43[31]);
            break;
          case 3u:
            v45 = "proxy";
            break;
          case 4u:
            v45 = "fallback";
            break;
          case 5u:
            v45 = "transform";
            break;
          default:
            v45 = "unknown-mode";
            break;
        }

        v49 = v44;
        os_unfair_lock_lock((os_unfair_lock_t)v49 + 28);
        v50 = v49[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v49 + 28);

        v51 = v50;
        *(_DWORD *)buf = 136448002;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = (char *)(v31 + 42);
        v150 = 2082;
        v151 = v34;
        v152 = 2082;
        v153 = v35;
        v154 = 2082;
        v155 = v39;
        v156 = 2082;
        v157 = v45;
        v158 = 2114;
        v159 = v51;
        v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s", buf, 0x52u);

      }
      goto LABEL_48;
    }
    if ((nw_endpoint_handler_get_logging_disabled(v11) & 1) == 0)
    {
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v16 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v120 = nw_endpoint_handler_get_id_string(v11);
        v121 = nw_endpoint_handler_dry_run_string(v11);
        v122 = nw_endpoint_handler_copy_endpoint(v11);
        v123 = nw_endpoint_get_logging_description(v122);
        v124 = nw_endpoint_handler_state_string(v11);
        v125 = nw_endpoint_handler_mode_string(v11);
        v126 = nw_endpoint_handler_copy_current_path(v11);
        *(_DWORD *)buf = 136448002;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = (char *)v120;
        v150 = 2082;
        v151 = v121;
        v152 = 2082;
        v153 = v123;
        v154 = 2082;
        v155 = v124;
        v156 = 2082;
        v157 = v125;
        v158 = 2114;
        v159 = v126;
        v160 = 2082;
        v161 = nw_endpoint_get_logging_description(v142);
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Discovered alternative %{public}s", buf, 0x52u);

      }
      goto LABEL_48;
    }
  }
LABEL_49:
  v52 = v11;
  state = v52->state;

  if ((state & 0xFFFFFFFE) != 4)
  {
    v67 = nw_endpoint_handler_copy_resolver(v52);
    v68 = v67;
    if (*((id *)v67 + 1) == v141)
    {
      v81 = (void *)*((_QWORD *)v67 + 13);
      if (!v81)
      {
        v82 = nw_endpoint_handler_copy_endpoint(v52);
        v83 = nw_endpoint_copy(v82);
        v84 = (void *)*((_QWORD *)v68 + 13);
        *((_QWORD *)v68 + 13) = v83;

        v81 = (void *)*((_QWORD *)v68 + 13);
      }
      nw_endpoint_add_alternative(v81, v142, v143);
      v52->event = (nw_endpoint_handler_event_s)524290;
      nw_endpoint_handler_report(v52, 0, &v52->event.domain, 0);
      goto LABEL_94;
    }
    if (nw_endpoint_handler_get_minimize_logging(v52))
    {
      if ((nw_endpoint_handler_get_logging_disabled(v52) & 1) != 0)
        goto LABEL_94;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v71 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        v128 = nw_endpoint_handler_get_id_string(v52);
        v129 = nw_endpoint_handler_dry_run_string(v52);
        v130 = nw_endpoint_handler_copy_endpoint(v52);
        v131 = nw_endpoint_get_logging_description(v130);
        v132 = nw_endpoint_handler_state_string(v52);
        v133 = nw_endpoint_handler_mode_string(v52);
        v134 = nw_endpoint_handler_copy_current_path(v52);
        v135 = (const char *)*((_QWORD *)v68 + 1);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = (char *)v128;
        v150 = 2082;
        v151 = v129;
        v152 = 2082;
        v153 = v131;
        v154 = 2082;
        v155 = v132;
        v156 = 2082;
        v157 = v133;
        v158 = 2114;
        v159 = v134;
        v160 = 2048;
        v161 = v135;
        v162 = 2048;
        v163 = v141;
        _os_log_impl(&dword_182FBE000, v71, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ignoring update from old resolver object (%p != %p)", buf, 0x5Cu);

      }
    }
    else
    {
      v69 = v52;
      v70 = (*((_BYTE *)v69 + 268) & 0x20) == 0;

      if (!v70)
      {
LABEL_94:

        goto LABEL_95;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v71 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = v69;

        v73 = v72;
        v74 = (*((_BYTE *)v69 + 268) & 1) == 0;

        if (v74)
          v75 = "";
        else
          v75 = "dry-run ";
        v76 = nw_endpoint_handler_copy_endpoint(v73);
        v138 = nw_endpoint_get_logging_description(v76);
        v77 = v73;
        v78 = v77;
        v79 = v52->state;
        if (v79 > 5)
          v80 = "unknown-state";
        else
          v80 = off_1E149FC48[v79];

        v89 = v78;
        v90 = v89;
        v91 = v11[29];
        v92 = "path";
        switch(v91)
        {
          case 0u:
            break;
          case 1u:
            v92 = "resolver";
            break;
          case 2u:
            v92 = nw_endpoint_flow_mode_string(v89[31]);
            break;
          case 3u:
            v92 = "proxy";
            break;
          case 4u:
            v92 = "fallback";
            break;
          case 5u:
            v92 = "transform";
            break;
          default:
            v92 = "unknown-mode";
            break;
        }

        v95 = v76;
        v96 = v90;
        os_unfair_lock_lock((os_unfair_lock_t)v96 + 28);
        v97 = v96[8];
        os_unfair_lock_unlock((os_unfair_lock_t)v96 + 28);

        v98 = (const char *)*((_QWORD *)v68 + 1);
        *(_DWORD *)buf = 136448258;
        v147 = "nw_endpoint_resolver_handle_alternative";
        v148 = 2082;
        id_str = v72->id_str;
        v150 = 2082;
        v151 = v75;
        v152 = 2082;
        v153 = v138;
        v154 = 2082;
        v155 = v80;
        v156 = 2082;
        v157 = v92;
        v158 = 2114;
        v159 = v97;
        v160 = 2048;
        v161 = v98;
        v162 = 2048;
        v163 = v141;
        _os_log_impl(&dword_182FBE000, v71, OS_LOG_TYPE_DEFAULT, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] ignoring update from old resolver object (%p != %p)", buf, 0x5Cu);

      }
    }

    goto LABEL_94;
  }
  if (nw_endpoint_handler_get_minimize_logging(v52))
  {
    if ((nw_endpoint_handler_get_logging_disabled(v52) & 1) != 0)
      goto LABEL_95;
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v56 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v113 = nw_endpoint_handler_get_id_string(v52);
      v114 = nw_endpoint_handler_dry_run_string(v52);
      v115 = nw_endpoint_handler_copy_endpoint(v52);
      v116 = nw_endpoint_get_logging_description(v115);
      v117 = nw_endpoint_handler_state_string(v52);
      v118 = nw_endpoint_handler_mode_string(v52);
      v119 = nw_endpoint_handler_copy_current_path(v52);
      *(_DWORD *)buf = 136447746;
      v147 = "nw_endpoint_resolver_handle_alternative";
      v148 = 2082;
      id_str = (char *)v113;
      v150 = 2082;
      v151 = v114;
      v152 = 2082;
      v153 = v116;
      v154 = 2082;
      v155 = v117;
      v156 = 2082;
      v157 = v118;
      v158 = 2114;
      v159 = v119;
      _os_log_impl(&dword_182FBE000, v56, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring resolver alternative", buf, 0x48u);

    }
    goto LABEL_86;
  }
  v54 = v52;
  v55 = (*((_BYTE *)v54 + 268) & 0x20) == 0;

  if (v55)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v56 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = v54;

      v58 = v57;
      v59 = (*((_BYTE *)v54 + 268) & 1) == 0;

      if (v59)
        v60 = "";
      else
        v60 = "dry-run ";
      v61 = nw_endpoint_handler_copy_endpoint(v58);
      v62 = nw_endpoint_get_logging_description(v61);
      v63 = v58;
      v64 = v63;
      v65 = v52->state;
      if (v65 > 5)
        v66 = "unknown-state";
      else
        v66 = off_1E149FC48[v65];

      v85 = v64;
      v86 = v85;
      v87 = v11[29];
      v88 = "path";
      switch(v87)
      {
        case 0u:
          break;
        case 1u:
          v88 = "resolver";
          break;
        case 2u:
          v88 = nw_endpoint_flow_mode_string(v85[31]);
          break;
        case 3u:
          v88 = "proxy";
          break;
        case 4u:
          v88 = "fallback";
          break;
        case 5u:
          v88 = "transform";
          break;
        default:
          v88 = "unknown-mode";
          break;
      }

      v93 = v86;
      os_unfair_lock_lock((os_unfair_lock_t)v93 + 28);
      v94 = v93[8];
      os_unfair_lock_unlock((os_unfair_lock_t)v93 + 28);

      *(_DWORD *)buf = 136447746;
      v147 = "nw_endpoint_resolver_handle_alternative";
      v148 = 2082;
      id_str = v57->id_str;
      v150 = 2082;
      v151 = v60;
      v152 = 2082;
      v153 = v62;
      v154 = 2082;
      v155 = v66;
      v156 = 2082;
      v157 = v88;
      v158 = 2114;
      v159 = v94;
      _os_log_impl(&dword_182FBE000, v56, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] Ignoring resolver alternative", buf, 0x48u);

    }
LABEL_86:

  }
LABEL_95:

}

uint64_t __58__NWConcrete_nw_ethernet_channel_updateClientState_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40);
  if (v1)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40), *(unsigned int *)(result + 48), *(_QWORD *)(result + 32));
  return result;
}

void __47__NWConcrete_nw_ethernet_channel_createChannel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  char *v10;
  _BYTE *v11;
  os_unfair_lock_s *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  char *v17;
  uint32_t os_unfair_lock_opaque;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int i;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  _BOOL4 v27;
  char *v28;
  uint32_t v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  unsigned __int16 *v33;
  unsigned int v34;
  const void *v35;
  dispatch_data_t v36;
  uint64_t v37;
  dispatch_data_t v38;
  _BOOL4 v39;
  char *v40;
  uint32_t v41;
  NSObject *v42;
  const char *v43;
  uint32_t v44;
  uint64_t v45;
  NSObject *v46;
  _BOOL4 v47;
  char *v48;
  uint32_t v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  char *v53;
  int is_defunct;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  NSObject *v59;
  os_log_type_t v60;
  char *backtrace_string;
  os_log_type_t v62;
  _BOOL4 v63;
  os_log_type_t v64;
  uint64_t v65;
  NSObject *v66;
  _BOOL4 v67;
  char *v68;
  uint32_t v69;
  const char *v70;
  NSObject *v71;
  uint32_t v72;
  uint64_t v73;
  NSObject *v74;
  _BOOL4 v75;
  char *v76;
  uint32_t v77;
  const char *v78;
  NSObject *v79;
  uint32_t v80;
  uint64_t v81;
  NSObject *v82;
  _BOOL4 v83;
  char *v84;
  uint32_t v85;
  const char *v86;
  NSObject *v87;
  uint32_t v88;
  NSObject *v89;
  _BOOL4 v90;
  char *v91;
  uint32_t v92;
  const char *v93;
  NSObject *v94;
  uint32_t v95;
  _BOOL4 v96;
  char *v97;
  uint32_t v98;
  const char *v99;
  NSObject *v100;
  uint32_t v101;
  uint64_t v102;
  NSObject *v103;
  _BOOL4 v104;
  char *v105;
  uint32_t v106;
  const char *v107;
  NSObject *v108;
  uint32_t v109;
  uint64_t v110;
  NSObject *v111;
  _BOOL4 v112;
  char *v113;
  uint32_t v114;
  const char *v115;
  NSObject *v116;
  uint32_t v117;
  uint64_t v118;
  NSObject *v119;
  _BOOL4 v120;
  char *v121;
  uint32_t v122;
  const char *v123;
  NSObject *v124;
  uint32_t v125;
  uint64_t v126;
  NSObject *v127;
  _BOOL4 v128;
  char *v129;
  uint32_t v130;
  const char *v131;
  NSObject *v132;
  uint32_t v133;
  int data_length;
  unsigned int v135;
  unsigned int log;
  NSObject *loga;
  uint64_t object_address;
  unsigned int v139;
  NSObject *oslog;
  size_t osloga;
  char *v142;
  char v143;
  os_log_type_t type[16];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  uint8_t buf[4];
  const char *v149;
  __int16 v150;
  char *v151;
  __int16 v152;
  __int128 v153;
  __int128 v154;
  __int16 v155;
  _BYTE v156[14];
  __int16 v157;
  int v158;
  __int16 v159;
  unsigned __int16 *v160;
  __int16 v161;
  int v162;
  uint64_t v163;

  v163 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && *(_QWORD *)(v2 + 152))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(char **)(v4 + 24);
    v6 = v4 + 115;
    LODWORD(v4) = *(_DWORD *)(v4 + 168);
    *(_DWORD *)buf = 136447234;
    v149 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    v150 = 2080;
    v151 = v5;
    v152 = 1042;
    LODWORD(v153) = 16;
    WORD2(v153) = 2098;
    *(_QWORD *)((char *)&v153 + 6) = v6;
    HIWORD(v153) = 1024;
    LODWORD(v154) = v4;
    v7 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] INPUT SOURCE: READ EVENT";
    v8 = v3;
    v9 = 44;
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v3 = (id)gLogObj;
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v10 = *(char **)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    v149 = "-[NWConcrete_nw_ethernet_channel createChannel]_block_invoke";
    v150 = 2114;
    v151 = v10;
    v7 = "%{public}s [%{public}@] INPUT SOURCE: READ EVENT";
    v8 = v3;
    v9 = 22;
  }
  _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, v7, buf, v9);
LABEL_8:

  v11 = *(_BYTE **)(a1 + 32);
  if (v11[112])
  {
    v12 = v11;
    goto LABEL_11;
  }
  v11[112] = 1;
  nw_queue_suspend_source(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
  v12 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  if (!v12)
  {
    __nwlog_obj();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v149 = "receiveFramesfromRings";
    v58 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    v143 = 0;
    if (__nwlog_fault(v58, type, &v143))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = type[0];
        if (os_log_type_enabled(v59, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl(&dword_182FBE000, v59, v60, "%{public}s called with null ethernet_channel", buf, 0xCu);
        }
      }
      else if (v143)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v59 = objc_claimAutoreleasedReturnValue();
        v62 = type[0];
        v63 = os_log_type_enabled(v59, type[0]);
        if (backtrace_string)
        {
          if (v63)
          {
            *(_DWORD *)buf = 136446466;
            v149 = "receiveFramesfromRings";
            v150 = 2082;
            v151 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v59, v62, "%{public}s called with null ethernet_channel, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_90;
        }
        if (v63)
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl(&dword_182FBE000, v59, v62, "%{public}s called with null ethernet_channel, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v59 = objc_claimAutoreleasedReturnValue();
        v64 = type[0];
        if (os_log_type_enabled(v59, type[0]))
        {
          *(_DWORD *)buf = 136446210;
          v149 = "receiveFramesfromRings";
          _os_log_impl(&dword_182FBE000, v59, v64, "%{public}s called with null ethernet_channel, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_90:
    if (v58)
      free(v58);
    goto LABEL_66;
  }
LABEL_11:
  os_unfair_lock_lock(v12 + 2);
  if (*(_QWORD *)&v12[14]._os_unfair_lock_opaque)
  {
    if (*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
    {
      if (*(_QWORD *)&v12[44]._os_unfair_lock_opaque)
      {
        v13 = os_channel_available_slot_count();
        if (v13)
        {
          v14 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v15 = (id)gLogObj;
          v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
          if (v14)
          {
            if (v16)
            {
              v17 = *(char **)&v12[6]._os_unfair_lock_opaque;
              os_unfair_lock_opaque = v12[42]._os_unfair_lock_opaque;
              *(_DWORD *)buf = 136447490;
              v149 = "receiveFramesfromRings";
              v150 = 2080;
              v151 = v17;
              v152 = 1042;
              LODWORD(v153) = 16;
              WORD2(v153) = 2098;
              *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
              HIWORD(v153) = 1024;
              LODWORD(v154) = os_unfair_lock_opaque;
              WORD2(v154) = 1024;
              *(_DWORD *)((char *)&v154 + 6) = v13;
              v19 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: avail slots %d";
              v20 = v15;
              v21 = 50;
LABEL_23:
              _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
            }
          }
          else if (v16)
          {
            *(_DWORD *)buf = 136446722;
            v149 = "receiveFramesfromRings";
            v150 = 2114;
            v151 = (char *)v12;
            v152 = 1024;
            LODWORD(v153) = v13;
            v19 = "%{public}s [%{public}@] receiveDatafromRing: avail slots %d";
            v20 = v15;
            v21 = 28;
            goto LABEL_23;
          }

          for (i = 1; i; i = os_channel_available_slot_count())
          {
            v142 = v12;
            v146 = 0u;
            v147 = 0u;
            *(_OWORD *)type = 0u;
            v145 = 0u;
            if (!os_channel_get_next_slot())
            {
              v45 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v46 = (id)gLogObj;
              v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
              if (v45)
              {
                if (v47)
                {
                  v48 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v49 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v48;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v49;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("NULL RX next slot");
                  v50 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v51 = v46;
                  v52 = 54;
                  goto LABEL_59;
                }
              }
              else if (v47)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("NULL RX next slot");
                v50 = "%{public}s [%{public}@]  %@";
                v51 = v46;
                v52 = 32;
LABEL_59:
                _os_log_impl(&dword_182FBE000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
              }

              v53 = v142;
              if (*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_61;
              goto LABEL_64;
            }
            if (!(_QWORD)v145)
            {
              v65 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v66 = objc_claimAutoreleasedReturnValue();
              v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
              if (v65)
              {
                if (v67)
                {
                  v68 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v69 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v68;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v69;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("NULL RX prop buf");
                  v70 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v71 = v66;
                  v72 = 54;
                  goto LABEL_94;
                }
              }
              else if (v67)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("NULL RX prop buf");
                v70 = "%{public}s [%{public}@]  %@";
                v71 = v66;
                v72 = 32;
LABEL_94:
                _os_log_impl(&dword_182FBE000, v71, OS_LOG_TYPE_ERROR, v70, buf, v72);
              }

              v53 = v142;
              if (*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_61;
              goto LABEL_64;
            }
            if (!os_channel_slot_get_packet())
            {
              v73 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v74 = objc_claimAutoreleasedReturnValue();
              v75 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);
              if (v73)
              {
                if (v75)
                {
                  v76 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v77 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v76;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v77;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Bad RX pkt");
                  v78 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v79 = v74;
                  v80 = 54;
                  goto LABEL_102;
                }
              }
              else if (v75)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Bad RX pkt");
                v78 = "%{public}s [%{public}@]  %@";
                v79 = v74;
                v80 = 32;
LABEL_102:
                _os_log_impl(&dword_182FBE000, v79, OS_LOG_TYPE_ERROR, v78, buf, v80);
              }

              v53 = v142;
              if (*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
              {
LABEL_61:
                is_defunct = os_channel_is_defunct();
                goto LABEL_62;
              }
LABEL_64:

              break;
            }
            if (os_channel_slot_detach_packet())
            {
              v81 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v82 = objc_claimAutoreleasedReturnValue();
              v83 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);
              if (v81)
              {
                if (v83)
                {
                  v84 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v85 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v84;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v85;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Bad RX detach");
                  v86 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v87 = v82;
                  v88 = 54;
                  goto LABEL_129;
                }
              }
              else if (v83)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Bad RX detach");
                v86 = "%{public}s [%{public}@]  %@";
                v87 = v82;
                v88 = 32;
LABEL_129:
                _os_log_impl(&dword_182FBE000, v87, OS_LOG_TYPE_ERROR, v86, buf, v88);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            if (!os_packet_get_next_buflet())
            {
              v126 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v127 = objc_claimAutoreleasedReturnValue();
              v128 = os_log_type_enabled(v127, OS_LOG_TYPE_ERROR);
              if (v126)
              {
                if (v128)
                {
                  v129 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v130 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v129;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v130;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Bad RX buflet");
                  v131 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v132 = v127;
                  v133 = 54;
                  goto LABEL_159;
                }
              }
              else if (v128)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Bad RX buflet");
                v131 = "%{public}s [%{public}@]  %@";
                v132 = v127;
                v133 = 32;
LABEL_159:
                _os_log_impl(&dword_182FBE000, v132, OS_LOG_TYPE_ERROR, v131, buf, v133);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            log = os_buflet_get_data_offset();
            object_address = os_buflet_get_object_address();
            if (!object_address)
            {
              v118 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v119 = objc_claimAutoreleasedReturnValue();
              v120 = os_log_type_enabled(v119, OS_LOG_TYPE_ERROR);
              if (v118)
              {
                if (v120)
                {
                  v121 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v122 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v121;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v122;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Bad RX address");
                  v123 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v124 = v119;
                  v125 = 54;
                  goto LABEL_154;
                }
              }
              else if (v120)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Bad RX address");
                v123 = "%{public}s [%{public}@]  %@";
                v124 = v119;
                v125 = 32;
LABEL_154:
                _os_log_impl(&dword_182FBE000, v124, OS_LOG_TYPE_ERROR, v123, buf, v125);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            data_length = (unsigned __int16)os_packet_get_data_length();
            if (!data_length)
            {
              v102 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v103 = objc_claimAutoreleasedReturnValue();
              v104 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);
              if (v102)
              {
                if (v104)
                {
                  v105 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v106 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v105;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v106;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Bad RX frame length");
                  v107 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v108 = v103;
                  v109 = 54;
                  goto LABEL_144;
                }
              }
              else if (v104)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Bad RX frame length");
                v107 = "%{public}s [%{public}@]  %@";
                v108 = v103;
                v109 = 32;
LABEL_144:
                _os_log_impl(&dword_182FBE000, v108, OS_LOG_TYPE_ERROR, v107, buf, v109);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            v23 = os_channel_advance_slot();
            v24 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
            if (v23)
            {
              __nwlog_obj();
              v89 = objc_claimAutoreleasedReturnValue();
              v90 = os_log_type_enabled(v89, OS_LOG_TYPE_ERROR);
              if (v24)
              {
                if (v90)
                {
                  v91 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v92 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v91;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v92;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Failed to advance RX slot");
                  v93 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v94 = v89;
                  v95 = 54;
                  goto LABEL_134;
                }
              }
              else if (v90)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Failed to advance RX slot");
                v93 = "%{public}s [%{public}@]  %@";
                v94 = v89;
                v95 = 32;
LABEL_134:
                _os_log_impl(&dword_182FBE000, v94, OS_LOG_TYPE_ERROR, v93, buf, v95);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            v25 = os_channel_sync();
            v26 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
            __nwlog_obj();
            oslog = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v96 = os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR);
              if (v26)
              {
                if (v96)
                {
                  v97 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v98 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v97;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v98;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("Failed to sync RX");
                  v99 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v100 = oslog;
                  v101 = 54;
                  goto LABEL_139;
                }
              }
              else if (v96)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("Failed to sync RX");
                v99 = "%{public}s [%{public}@]  %@";
                v100 = oslog;
                v101 = 32;
LABEL_139:
                _os_log_impl(&dword_182FBE000, v100, OS_LOG_TYPE_ERROR, v99, buf, v101);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
              goto LABEL_161;
            }
            v27 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG);
            if (v26)
            {
              if (!v27)
                goto LABEL_41;
              v28 = *(char **)&v12[6]._os_unfair_lock_opaque;
              v29 = v12[42]._os_unfair_lock_opaque;
              *(_DWORD *)buf = 136447490;
              v149 = "receiveOneFramefromRing_locked";
              v150 = 2080;
              v151 = v28;
              v152 = 1042;
              LODWORD(v153) = 16;
              WORD2(v153) = 2098;
              *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
              HIWORD(v153) = 1024;
              LODWORD(v154) = v29;
              WORD2(v154) = 1024;
              *(_DWORD *)((char *)&v154 + 6) = data_length;
              v30 = oslog;
              v31 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: frame len %d";
              v32 = 50;
            }
            else
            {
              if (!v27)
                goto LABEL_41;
              *(_DWORD *)buf = 136446722;
              v149 = "receiveOneFramefromRing_locked";
              v150 = 2114;
              v151 = (char *)v12;
              v152 = 1024;
              LODWORD(v153) = data_length;
              v30 = oslog;
              v31 = "%{public}s [%{public}@] receiveDatafromRing: frame len %d";
              v32 = 28;
            }
            _os_log_impl(&dword_182FBE000, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);
LABEL_41:

            if ((data_length - 1519) <= 0xFFFFFA4C)
            {
              v110 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
              __nwlog_obj();
              v111 = objc_claimAutoreleasedReturnValue();
              v112 = os_log_type_enabled(v111, OS_LOG_TYPE_ERROR);
              if (v110)
              {
                if (v112)
                {
                  v113 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v114 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136447490;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v113;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v114;
                  WORD2(v154) = 2112;
                  *(_QWORD *)((char *)&v154 + 6) = CFSTR("frame size len is invalid");
                  v115 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>]  %@";
                  v116 = v111;
                  v117 = 54;
                  goto LABEL_149;
                }
              }
              else if (v112)
              {
                *(_DWORD *)buf = 136446722;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 2112;
                *(_QWORD *)&v153 = CFSTR("frame size len is invalid");
                v115 = "%{public}s [%{public}@]  %@";
                v116 = v111;
                v117 = 32;
LABEL_149:
                _os_log_impl(&dword_182FBE000, v116, OS_LOG_TYPE_ERROR, v115, buf, v117);
              }

              v53 = v142;
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
                goto LABEL_64;
LABEL_161:
              os_channel_packet_free();
              is_defunct = os_channel_is_defunct();
LABEL_62:
              if (is_defunct)
                -[NWConcrete_nw_ethernet_channel closeChannel:]((uint64_t)v53, 0);
              goto LABEL_64;
            }
            v33 = (unsigned __int16 *)(object_address + log);
            osloga = (data_length - 14);
            v34 = v33[6];
            if (v34 == 129)
            {
              v139 = bswap32(v33[7]) >> 16;
              v135 = bswap32(v33[8]) >> 16;
              v35 = v33 + 9;
              osloga -= 4;
            }
            else
            {
              v139 = 0;
              v35 = v33 + 7;
              v135 = __rev16(v34);
            }
            v36 = dispatch_data_create(v35, osloga, 0, 0);
            v37 = *(_QWORD *)&v12[38]._os_unfair_lock_opaque;
            v38 = v36;
            if (v36)
            {
              __nwlog_obj();
              loga = objc_claimAutoreleasedReturnValue();
              v39 = os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG);
              if (v37)
              {
                if (v39)
                {
                  v40 = *(char **)&v12[6]._os_unfair_lock_opaque;
                  v41 = v12[42]._os_unfair_lock_opaque;
                  *(_DWORD *)buf = 136449026;
                  v149 = "receiveOneFramefromRing_locked";
                  v150 = 2080;
                  v151 = v40;
                  v152 = 1042;
                  LODWORD(v153) = 16;
                  WORD2(v153) = 2098;
                  *(_QWORD *)((char *)&v153 + 6) = (char *)v12 + 115;
                  HIWORD(v153) = 1024;
                  LODWORD(v154) = v41;
                  WORD2(v154) = 1024;
                  *(_DWORD *)((char *)&v154 + 6) = v135;
                  WORD5(v154) = 1024;
                  HIDWORD(v154) = v139;
                  v155 = 1042;
                  *(_DWORD *)v156 = 6;
                  *(_WORD *)&v156[4] = 2098;
                  *(_QWORD *)&v156[6] = v33;
                  v157 = 1042;
                  v158 = 6;
                  v159 = 2098;
                  v160 = v33 + 3;
                  v161 = 1024;
                  v162 = osloga;
                  v42 = loga;
                  v43 = "%{public}s [%s: nexus instance %{public,uuid_t}.16P <fd %d>] receiveDatafromRing: ethertype %X v"
                        "lantag %X local %{public,nw_ethernet_address_t}.6P remote %{public,nw_ethernet_address_t}.6P data size %d";
                  v44 = 94;
                  goto LABEL_51;
                }
              }
              else if (v39)
              {
                *(_DWORD *)buf = 136448258;
                v149 = "receiveOneFramefromRing_locked";
                v150 = 2114;
                v151 = (char *)v12;
                v152 = 1024;
                LODWORD(v153) = v135;
                WORD2(v153) = 1024;
                *(_DWORD *)((char *)&v153 + 6) = v139;
                WORD5(v153) = 1042;
                HIDWORD(v153) = 6;
                LOWORD(v154) = 2098;
                *(_QWORD *)((char *)&v154 + 2) = v33;
                WORD5(v154) = 1042;
                HIDWORD(v154) = 6;
                v155 = 2098;
                *(_QWORD *)v156 = v33 + 3;
                *(_WORD *)&v156[8] = 1024;
                *(_DWORD *)&v156[10] = osloga;
                v42 = loga;
                v43 = "%{public}s [%{public}@] receiveDatafromRing: ethertype %X vlantag %X local %{public,nw_ethernet_ad"
                      "dress_t}.6P remote %{public,nw_ethernet_address_t}.6P data size %d";
                v44 = 72;
LABEL_51:
                _os_log_impl(&dword_182FBE000, v42, OS_LOG_TYPE_DEBUG, v43, buf, v44);
              }

              os_unfair_lock_unlock(v12 + 2);
              (*(void (**)(void))(*(_QWORD *)&v12[14]._os_unfair_lock_opaque + 16))();
              os_unfair_lock_lock(v12 + 2);
              if (!*(_QWORD *)&v12[38]._os_unfair_lock_opaque)
              {

                v53 = v142;
                goto LABEL_64;
              }
            }
            os_channel_packet_free();

          }
        }
      }
    }
  }
  os_unfair_lock_unlock(v12 + 2);

LABEL_66:
  v56 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v56 + 112))
  {
    *(_BYTE *)(v56 + 112) = 0;
    nw_queue_resume_source(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), v55);
    v56 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v56 + 114))
    nw_ethernet_channel_cancel((nw_ethernet_channel_t)v56);
}

void __33__NWConcrete_nw_resolver_dealloc__block_invoke(uint64_t a1)
{
  DNSServiceRefDeallocate(*(DNSServiceRef *)(a1 + 32));
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("\t%@ (%llums/%llums RTT)\n"), a2, a3, a4);
  return 1;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("\t%@\n"), a2);
  return 1;
}

uint64_t __49__NWConcrete_nw_establishment_report_description__block_invoke_3(uint64_t a1, uint64_t a2)
{
  __CFString *v3;
  const char *v4;

  v3 = *(__CFString **)(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v4 = ", ";
  else
    v4 = "";
  CFStringAppendFormat(v3, 0, CFSTR("%s%@"), v4, a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

BOOL __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _BOOL8 v4;

  v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_endpoint_get_port(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = nw_endpoint_copy_port_string(v3);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;

  return v4;
}

void __75__NWConcrete_nw_connection_group_initWithDescriptor_connection_parameters___block_invoke_10(uint64_t a1)
{
  nw_connection_group_add_connection_locked(*(NWConcrete_nw_connection_group **)(a1 + 32), *(NWConcrete_nw_connection **)(a1 + 40));
}

uint64_t __42__NWConcrete_nw_protocol_instance_destroy__block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t extra;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  char *backtrace_string;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  extra = nw_hash_node_get_extra(a2);
  if (!*(_QWORD *)(extra + 32))
    goto LABEL_9;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  v5 = *(_QWORD *)(extra + 32);
  v6 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)buf = 136446978;
  v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
  v27 = 2048;
  v28 = extra;
  v29 = 2048;
  v30 = v5;
  v31 = 2048;
  v32 = v6;
  v7 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v23 = 0;
  if (__nwlog_fault(v7, &type, &v23))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v9 = type;
      if (os_log_type_enabled(v8, type))
      {
        v10 = *(_QWORD *)(extra + 32);
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        v27 = 2048;
        v28 = extra;
        v29 = 2048;
        v30 = v10;
        v31 = 2048;
        v32 = v11;
        _os_log_impl(&dword_182FBE000, v8, v9, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated", buf, 0x2Au);
      }
    }
    else if (v23)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v14 = type;
      v15 = os_log_type_enabled(v8, type);
      if (backtrace_string)
      {
        if (v15)
        {
          v16 = *(_QWORD *)(extra + 32);
          v17 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136447234;
          v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
          v27 = 2048;
          v28 = extra;
          v29 = 2048;
          v30 = v16;
          v31 = 2048;
          v32 = v17;
          v33 = 2082;
          v34 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v8, v14, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, dumping backtrace:%{public}s", buf, 0x34u);
        }

        free(backtrace_string);
        if (v7)
          goto LABEL_8;
        goto LABEL_9;
      }
      if (v15)
      {
        v21 = *(_QWORD *)(extra + 32);
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        v27 = 2048;
        v28 = extra;
        v29 = 2048;
        v30 = v21;
        v31 = 2048;
        v32 = v22;
        _os_log_impl(&dword_182FBE000, v8, v14, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, no backtrace", buf, 0x2Au);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v8 = (id)gLogObj;
      v18 = type;
      if (os_log_type_enabled(v8, type))
      {
        v19 = *(_QWORD *)(extra + 32);
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136446978;
        v26 = "-[NWConcrete_nw_protocol_instance destroy]_block_invoke";
        v27 = 2048;
        v28 = extra;
        v29 = 2048;
        v30 = v19;
        v31 = 2048;
        v32 = v20;
        _os_log_impl(&dword_182FBE000, v8, v18, "%{public}s Path state %p has an output handler %p when protocol instance %p is deallocated, backtrace limit exceeded", buf, 0x2Au);
      }
    }

  }
  if (v7)
LABEL_8:
    free(v7);
LABEL_9:
  nw_protocol_path_state_dispose(*(void **)(a1 + 32), extra);
  return 1;
}

uint64_t __44__NWConcrete_nw_protocol_data_array_dealloc__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = a2;
  nw_frame_finalize((uint64_t)v3);
  v4 = v3[4];
  v5 = (_QWORD *)v3[5];
  if (v4)
  {
    *(_QWORD *)(v4 + 40) = v5;
    v5 = (_QWORD *)v3[5];
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = v5;
  }
  *v5 = v4;
  v3[4] = 0;
  v3[5] = 0;

  return 1;
}

void __43__NWConcrete_nw_listener_getIDSInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  v3 = nw_array_create();
  v4 = v3;
  if (v2)
  {
    if (v3 == v2)
      v4 = v2;
    else
      std::vector<nw_object_wrapper_t>::__assign_with_size[abi:nn180100]<nw_object_wrapper_t*,nw_object_wrapper_t*>(v3 + 16, *(void ***)(v2 + 16), *(void ***)(v2 + 24), (uint64_t)(*(_QWORD *)(v2 + 24) - *(_QWORD *)(v2 + 16)) >> 3);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __59__NWConcrete_nw_listener_updateParametersForNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  const char *id_string;
  uint64_t v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nw_protocol_options_is_quic(v3))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v4 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v4 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v5 = (id)glistenerLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v11 = 136446722;
        v12 = "-[NWConcrete_nw_listener updateParametersForNewConnection:]_block_invoke_2";
        v13 = 2082;
        v14 = id_string;
        v15 = 2114;
        v16 = v7;
        _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] Setting trusted_peer_keys: %{public}@ for new connection", (uint8_t *)&v11, 0x20u);
      }

    }
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = nw_parameters_copy_context(*(void **)(*(_QWORD *)(a1 + 32) + 16));
    v10 = nw_context_copy_workloop(v9);
    nw_quic_connection_set_trusted_peer_keys(v3, v8, (void *)v10);

  }
}

void __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = _Block_copy(*(const void **)(a1[4] + 112));
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 64));
}

uint64_t __78__NWConcrete_nw_listener_handleInboundPacket_length_from_to_interface_socket___block_invoke_41(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1[9] + 8)
                                                                                               + 40)
                                                                                   + 16))(*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), a1[4], a1[5], a1[6], a1[7], a1[8]);
}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_38(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  char *v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *id_string;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  int v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v11 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v11 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1)
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
    v12 = (id)glistenerLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id_string = nw_listener_get_id_string(*(void **)(a1 + 32));
      v14 = *(_QWORD *)(a1 + 40);
      v15 = v9 + 104;
      if (!v9)
        v15 = 0;
      v25 = 136447746;
      v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      v16 = v10 + 104;
      v27 = 2082;
      if (!v10)
        v16 = 0;
      v28 = id_string;
      v29 = 2112;
      v30 = v14;
      v31 = 1024;
      v32 = a2;
      v33 = 1024;
      v34 = a3;
      v35 = 2080;
      v36 = v15;
      v37 = 2080;
      v38 = v16;
      _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Connection %@ initial:%{BOOL}d cancelling:%{BOOL}d (%s) -> (%s)", (uint8_t *)&v25, 0x40u);
    }

  }
  if (v9 || (a2 & 1) != 0)
  {
    if (!v10 && (a3 & 1) == 0)
    {
      nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 1);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      if (v22)
      {
        if (!nw_path_parameters_get_logging_disabled(*(_QWORD *)(v22 + 104)))
        {
          if (__nwlog_listener_log::onceToken != -1)
            dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
          v18 = (id)glistenerLogObj;
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            goto LABEL_29;
          v23 = nw_listener_get_id_string(*(void **)(a1 + 32));
          v24 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 240);
          v25 = 136446722;
          v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
          v27 = 2082;
          v28 = v23;
          v29 = 1024;
          LODWORD(v30) = v24;
          v21 = "%{public}s [%{public}s] Connection now needs AWDL, updated AWDL usage count=%u";
          goto LABEL_28;
        }
      }
    }
  }
  else
  {
    nw_listener_adjust_awdl_usage_on_queue(*(NWConcrete_nw_listener **)(a1 + 32), 0);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v17 && !nw_path_parameters_get_logging_disabled(*(_QWORD *)(v17 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1)
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44199);
      v18 = (id)glistenerLogObj;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        goto LABEL_29;
      v19 = nw_listener_get_id_string(*(void **)(a1 + 32));
      v20 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 240);
      v25 = 136446722;
      v26 = "-[NWConcrete_nw_listener handleInbound:addProtocolInbox:]_block_invoke";
      v27 = 2082;
      v28 = v19;
      v29 = 1024;
      LODWORD(v30) = v20;
      v21 = "%{public}s [%{public}s] Connection no longer needs AWDL, updated AWDL usage count=%u";
LABEL_28:
      _os_log_impl(&dword_182FBE000, v18, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v25, 0x1Cu);
LABEL_29:

    }
  }

}

void __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_40(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (*(_BYTE *)(a1[4] + 302) & 4) != 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 64));
  v2 = _Block_copy(*(const void **)(a1[4] + 88));
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = _Block_copy(*(const void **)(a1[4] + 96));
  v6 = *(_QWORD *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __57__NWConcrete_nw_listener_handleInbound_addProtocolInbox___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

uint64_t __40__NWConcrete_nw_custom_endpoint_getHash__block_invoke(uint64_t a1, int a2, int a3, void *data, CC_LONG len)
{
  CC_SHA256_Update((CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), data, len);
  return 1;
}

uint64_t __60__NWConcrete_nw_endpoint_proxy_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__NWConcrete_nw_endpoint_proxy_cancelWithHandler_forced___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  nw_endpoint_handler_cancel(a3, *(unsigned __int8 *)(a1 + 32), 0);
  return 1;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if (nw_proxy_config_has_fallback_proxy_agent(v4) || nw_proxy_config_has_fallback_proxy_config(v4))
  {
    v5 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unsigned int generation;
  id v6;
  unsigned int v7;
  _BYTE *v8;
  char *v9;
  id *v10;
  unsigned __int8 v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  nw_array_append(*(_QWORD *)(a1 + 32), v4);
  generation = nw_proxy_config_get_generation(v4);
  *(_OWORD *)v12 = 0uLL;
  nw_proxy_config_copy_fallback_proxy_agent(v4, v12);
  v6 = nw_proxy_config_copy_fallback_proxy_config(v4);
  v7 = 0;
  while (v6)
  {
    if (v7 >= 8)
      goto LABEL_11;
LABEL_9:
    uuid_clear(v12);
    if (v6)
    {
      v8 = v6;
      v8[171] |= 0x20u;

      nw_array_append(*(_QWORD *)(a1 + 32), v8);
      v9 = v8;
      *(_OWORD *)v12 = *(_OWORD *)(v9 + 72);

      v10 = v9;
      v6 = v10[11];

    }
    ++v7;
  }
  v6 = 0;
  if (!uuid_is_null(v12) && v7 < 8)
  {
    v6 = nw_path_copy_proxy_config_for_agent_uuid(v12, generation, *(void **)(a1 + 40));
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

uint64_t __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_3(id *a1, uint64_t a2, void *a3)
{
  id v4;
  int generation;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  int v11;

  v4 = a3;
  generation = nw_proxy_config_get_generation(v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4;
  v7[3] = &unk_1E149E0B0;
  v11 = generation;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  nw_proxy_config_enumerate_alternate_agents(v4, v7);
  nw_array_append((uint64_t)a1[6], v4);

  return 1;
}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_4(uint64_t a1, _OWORD *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  unsigned __int8 v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v17 = *a2;
  v3 = nw_path_copy_proxy_config_for_agent_uuid(v17, *(_DWORD *)(a1 + 56), *(void **)(a1 + 32));
  if (v3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5;
    v6[3] = &unk_1E149E088;
    v8 = &v9;
    v7 = *(id *)(a1 + 40);
    nw_proxy_config_enumerate_preferred_domains(v3, v6);
    if (*((_BYTE *)v10 + 24))
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v4 = (id)gLogObj;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136446466;
        v14 = "-[NWConcrete_nw_endpoint_proxy startWithHandler:]_block_invoke_4";
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_DEBUG, "%{public}s Endpoint %@ matches preferred domain of alternate proxy", buf, 0x16u);
      }

      nw_array_append(*(_QWORD *)(a1 + 48), v3);
    }

    _Block_object_dispose(&v9, 8);
  }

}

void __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_5(uint64_t a1, const char *a2)
{
  id v4;
  id v5;
  _QWORD v6[6];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = nw_endpoint_proxy_match_pattern_to_endpoint(*(void **)(a1 + 32), a2);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v4 = nw_endpoint_copy_cname_array(*(void **)(a1 + 32));
      if (v4)
      {
        if (*((_QWORD *)v4 + 3) != *((_QWORD *)v4 + 2))
        {
          v6[1] = 3221225472;
          v6[2] = __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6;
          v6[3] = &unk_1E14A8F50;
          v6[4] = *(_QWORD *)(a1 + 40);
          v6[5] = a2;
          v5 = v4;
          v6[0] = MEMORY[0x1E0C809B0];
          nw_array_apply((unsigned __int8 *)v4, (uint64_t)v6);
          v4 = v5;
        }
      }

    }
  }
}

BOOL __49__NWConcrete_nw_endpoint_proxy_startWithHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = nw_endpoint_proxy_match_pattern_to_endpoint(v4, *(const char **)(a1 + 40));
  v5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;

  return v5;
}

uint64_t __47__NWConcrete_nw_masque_connection_pair_dealloc__block_invoke(int a1, int a2, nw_connection_t connection)
{
  nw_connection_cancel(connection);
  return 1;
}

uint64_t __45__NWConcrete_nw_masque_listener_pair_dealloc__block_invoke(int a1, int a2, nw_connection_t connection)
{
  nw_connection_cancel(connection);
  return 1;
}

uint64_t __63__NWConcrete_nw_endpoint_resolver_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

NWConcrete_nw_protocol_definition *__nw_protocol_copy_ethernet_definition_block_invoke()
{
  NWConcrete_nw_protocol_definition *result;

  if (nw_protocol_ethernet_identifier::onceToken != -1)
    dispatch_once(&nw_protocol_ethernet_identifier::onceToken, &__block_literal_global_31564);
  result = nw_protocol_definition_create_with_identifier((__int128 *)&g_ethernet_protocol_identifier);
  nw_protocol_copy_ethernet_definition::ethernet_definition = (uint64_t)result;
  return result;
}

uint64_t __41__NWConcrete_nw_proxy_config_description__block_invoke(uint64_t a1, int a2, nw_protocol_stack_t stack)
{
  __int128 v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__NWConcrete_nw_proxy_config_description__block_invoke_2;
  v5[3] = &unk_1E14A0F88;
  v3 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 32);
  v7 = v3;
  nw_protocol_stack_iterate_application_protocols(stack, v5);
  return 0;
}

void __41__NWConcrete_nw_proxy_config_description__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  nw_protocol_definition_t v4;
  const char *v5;
  id v6;
  const char *v7;
  NSObject *v8;

  v3 = a2;
  v8 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = nw_protocol_options_copy_definition(v3);
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 171) & 0x20) != 0)
      v5 = "Fallback ";
    else
      v5 = "";
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0, CFSTR("%@ %sProxy: "), v4, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    v3 = v8;
  }
  v6 = nw_protocol_options_copy_proxy_endpoint(v3);
  if (v6)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v7 = ", ";
    else
      v7 = "";
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 56), 0, CFSTR("%s%@"), v7, v6);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

uint64_t __29__NWConcrete_nw_storage_init__block_invoke()
{
  uint64_t result;

  result = atexit(nw_storage_flush_all_storages_atexit);
  storages = 0;
  qword_1EDCE2620 = (uint64_t)&storages;
  return result;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke(uint64_t a1, char *__s)
{
  _QWORD *v3;
  size_t v4;

  v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1);
  return 1;
}

uint64_t __44__NWConcrete_nw_resolver_config_description__block_invoke_2(uint64_t a1, char *__s)
{
  _QWORD *v3;
  size_t v4;

  v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  v4 = strlen(__s);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)__s, v4);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v3, (uint64_t)" ", 1);
  return 1;
}

void __48__NWConcrete_nw_nat64_prefixes_resolver_dealloc__block_invoke(uint64_t a1)
{
  DNSServiceRefDeallocate(*(DNSServiceRef *)(a1 + 32));
}

uint64_t __42__NWConcrete_nw_address_endpoint_hostname__block_invoke(uint64_t a1)
{
  uint64_t result;
  char v3;
  unsigned int v4;
  BOOL v5;
  int v6;

  result = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(result + 390);
  if ((v3 & 1) == 0)
  {
    v4 = *(unsigned __int8 *)(result + 233);
    v5 = v4 > 0x1E;
    v6 = (1 << v4) & 0x40040004;
    if (!v5 && v6 != 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = nw_endpoint_copy_address_string((nw_endpoint_t)result);
      result = *(_QWORD *)(a1 + 32);
      v3 = *(_BYTE *)(result + 390);
    }
    *(_BYTE *)(result + 390) = v3 | 1;
  }
  return result;
}

uint64_t __64__NWConcrete_nw_endpoint_transform_applyWithHandler_toChildren___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__NWConcrete_nw_agent_client_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  void *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  char *backtrace_string;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  os_log_type_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  char v28;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 24);
    if (v3)
    {
      v4 = *(void (**)(void))(v3 + 8);
      if (v4)
      {
        v4();
        return;
      }
    }
  }
  __nwlog_obj();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = "invalid";
  if (v6)
  {
    v8 = *(const char **)(v6 + 16);
    if (v8)
      v7 = v8;
  }
  *(_DWORD *)buf = 136446466;
  v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
  v32 = 2082;
  v33 = v7;
  v9 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v28 = 0;
  if (__nwlog_fault(v9, &type, &v28))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = type;
      if (os_log_type_enabled(v10, type))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = "invalid";
        if (v12)
        {
          v14 = *(const char **)(v12 + 16);
          if (v14)
            v13 = v14;
        }
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        v32 = 2082;
        v33 = v13;
        _os_log_impl(&dword_182FBE000, v10, v11, "%{public}s protocol %{public}s has invalid remove_input_handler callback", buf, 0x16u);
      }
    }
    else if (v28)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v16 = type;
      v17 = os_log_type_enabled(v10, type);
      if (backtrace_string)
      {
        if (v17)
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = "invalid";
          if (v18)
          {
            v20 = *(const char **)(v18 + 16);
            if (v20)
              v19 = v20;
          }
          *(_DWORD *)buf = 136446722;
          v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
          v32 = 2082;
          v33 = v19;
          v34 = 2082;
          v35 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v10, v16, "%{public}s protocol %{public}s has invalid remove_input_handler callback, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        goto LABEL_36;
      }
      if (v17)
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = "invalid";
        if (v25)
        {
          v27 = *(const char **)(v25 + 16);
          if (v27)
            v26 = v27;
        }
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        v32 = 2082;
        v33 = v26;
        _os_log_impl(&dword_182FBE000, v10, v16, "%{public}s protocol %{public}s has invalid remove_input_handler callback, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      __nwlog_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      v21 = type;
      if (os_log_type_enabled(v10, type))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = "invalid";
        if (v22)
        {
          v24 = *(const char **)(v22 + 16);
          if (v24)
            v23 = v24;
        }
        *(_DWORD *)buf = 136446466;
        v31 = "-[NWConcrete_nw_agent_client dealloc]_block_invoke";
        v32 = 2082;
        v33 = v23;
        _os_log_impl(&dword_182FBE000, v10, v21, "%{public}s protocol %{public}s has invalid remove_input_handler callback, backtrace limit exceeded", buf, 0x16u);
      }
    }

  }
LABEL_36:
  if (v9)
    free(v9);
}

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  unsigned int *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  char *backtrace_string;
  os_log_type_t v12;
  _BOOL4 v13;
  os_log_type_t v14;
  char v15;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v3 = v1;
    v4 = v3[29];

    if ((_DWORD)v4 == 2)
    {
      nw_endpoint_flow_failed_with_error(*(void **)(a1 + 32), 1, 0);
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v5 = (id)gLogObj;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (v4 > 5)
          v6 = "unknown-mode";
        else
          v6 = off_1E149FC18[v4];
        *(_DWORD *)buf = 136446722;
        v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        v19 = 2082;
        v20 = (void *)v6;
        v21 = 2082;
        v22 = "flow";
        _os_log_impl(&dword_182FBE000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
      }

    }
    return;
  }
  __nwlog_obj();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v15 = 0;
  if (__nwlog_fault(v8, &type, &v15))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s called with null handler", buf, 0xCu);
      }
    }
    else if (v15)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v12 = type;
      v13 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136446466;
          v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          v19 = 2082;
          v20 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_27;
      }
      if (v13)
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_182FBE000, v9, v12, "%{public}s called with null handler, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446210;
        v18 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        _os_log_impl(&dword_182FBE000, v9, v14, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
      }
    }

  }
LABEL_27:
  if (v8)
    free(v8);
}

void __53__NWConcrete_nw_endpoint_flow_updatePathWithHandler___block_invoke_5(uint64_t a1)
{
  void *v1;
  unsigned int *v3;
  uint64_t v4;
  int has_better_path;
  int v6;
  char v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  nw_endpoint_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  const char *v17;
  int minimize_logging;
  char logging_disabled;
  NSObject *v20;
  const char *v21;
  const char *v22;
  nw_endpoint_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  id v27;
  const char *v28;
  const char *v29;
  nw_endpoint_t v30;
  const char *v31;
  const char *v32;
  const char *v33;
  id v34;
  void *v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  char *backtrace_string;
  os_log_type_t v40;
  _BOOL4 v41;
  const char *id_string;
  const char *v43;
  nw_endpoint_t v44;
  const char *logging_description;
  const char *v46;
  const char *v47;
  id v48;
  os_log_type_t v49;
  const char *v50;
  const char *v51;
  nw_endpoint_t v52;
  const char *v53;
  const char *v54;
  const char *v55;
  id v56;
  const char *v57;
  const char *v58;
  nw_endpoint_t v59;
  const char *v60;
  const char *v61;
  const char *v62;
  id v63;
  char v64;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  const char *v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (!v1)
  {
    __nwlog_obj();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
    v36 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v64 = 0;
    if (__nwlog_fault(v36, &type, &v64))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_182FBE000, v37, v38, "%{public}s called with null handler", buf, 0xCu);
        }
      }
      else if (v64)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v40 = type;
        v41 = os_log_type_enabled(v37, type);
        if (backtrace_string)
        {
          if (v41)
          {
            *(_DWORD *)buf = 136446466;
            v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
            v68 = 2082;
            v69 = backtrace_string;
            _os_log_impl(&dword_182FBE000, v37, v40, "%{public}s called with null handler, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_57;
        }
        if (v41)
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_182FBE000, v37, v40, "%{public}s called with null handler, no backtrace", buf, 0xCu);
        }
      }
      else
      {
        __nwlog_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        v49 = type;
        if (os_log_type_enabled(v37, type))
        {
          *(_DWORD *)buf = 136446210;
          v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
          _os_log_impl(&dword_182FBE000, v37, v49, "%{public}s called with null handler, backtrace limit exceeded", buf, 0xCu);
        }
      }

    }
LABEL_57:
    if (v36)
      free(v36);
    return;
  }
  v3 = v1;
  v4 = v3[29];

  if ((_DWORD)v4 != 2)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 5)
        v17 = "unknown-mode";
      else
        v17 = off_1E149FC18[v4];
      *(_DWORD *)buf = 136446722;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      v68 = 2082;
      v69 = (void *)v17;
      v70 = 2082;
      v71 = "flow";
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Handler is in mode %{public}s, expected %{public}s", buf, 0x20u);
    }
    goto LABEL_26;
  }
  if (nw_endpoint_handler_get_state(*(void **)(a1 + 32)) != 2
    || (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 33) & 4) != 0)
  {
    minimize_logging = nw_endpoint_handler_get_minimize_logging(*(void **)(a1 + 32));
    logging_disabled = nw_endpoint_handler_get_logging_disabled(*(void **)(a1 + 32));
    if (minimize_logging)
    {
      if ((logging_disabled & 1) != 0)
        return;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v20 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id_string = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        v43 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        v44 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        logging_description = nw_endpoint_get_logging_description(v44);
        v46 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        v47 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        v48 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        v68 = 2082;
        v69 = (void *)id_string;
        v70 = 2082;
        v71 = v43;
        v72 = 2082;
        v73 = logging_description;
        v74 = 2082;
        v75 = v46;
        v76 = 2082;
        v77 = v47;
        v78 = 2114;
        v79 = v48;
        _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow is no longer in progress, not resetting for better path", buf, 0x48u);

      }
    }
    else
    {
      if ((logging_disabled & 1) != 0)
        return;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v20 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        v22 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        v23 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        v24 = nw_endpoint_get_logging_description(v23);
        v25 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        v26 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        v27 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        v68 = 2082;
        v69 = (void *)v21;
        v70 = 2082;
        v71 = v22;
        v72 = 2082;
        v73 = v24;
        v74 = 2082;
        v75 = v25;
        v76 = 2082;
        v77 = v26;
        v78 = 2114;
        v79 = v27;
        _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] flow is no longer in progress, not resetting for better path", buf, 0x48u);

      }
    }
    goto LABEL_69;
  }
  has_better_path = nw_endpoint_handler_get_has_better_path(*(NWConcrete_nw_endpoint_handler **)(a1 + 32), 1);
  v6 = nw_endpoint_handler_get_minimize_logging(*(void **)(a1 + 32));
  v7 = nw_endpoint_handler_get_logging_disabled(*(void **)(a1 + 32));
  if (has_better_path)
  {
    if (v6)
    {
      if ((v7 & 1) != 0)
        goto LABEL_13;
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v8 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v50 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        v51 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        v52 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        v53 = nw_endpoint_get_logging_description(v52);
        v54 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        v55 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        v56 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        v68 = 2082;
        v69 = (void *)v50;
        v70 = 2082;
        v71 = v51;
        v72 = 2082;
        v73 = v53;
        v74 = 2082;
        v75 = v54;
        v76 = 2082;
        v77 = v55;
        v78 = 2114;
        v79 = v56;
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, resetting", buf, 0x48u);

      }
    }
    else
    {
      if ((v7 & 1) != 0)
      {
LABEL_13:
        nw_endpoint_flow_failed_with_error(*(void **)(a1 + 32), 1, 0);
        return;
      }
      if (__nwlog_connection_log::onceToken != -1)
        dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
      v8 = (id)gconnectionLogObj;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
        v10 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
        v11 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
        v12 = nw_endpoint_get_logging_description(v11);
        v13 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
        v14 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
        v15 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
        *(_DWORD *)buf = 136447746;
        v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
        v68 = 2082;
        v69 = (void *)v9;
        v70 = 2082;
        v71 = v10;
        v72 = 2082;
        v73 = v12;
        v74 = 2082;
        v75 = v13;
        v76 = 2082;
        v77 = v14;
        v78 = 2114;
        v79 = v15;
        _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] better path detected during establishment, resetting", buf, 0x48u);

      }
    }

    goto LABEL_13;
  }
  if (v6)
  {
    if ((v7 & 1) != 0)
      return;
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v20 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v57 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
      v58 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
      v59 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
      v60 = nw_endpoint_get_logging_description(v59);
      v61 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
      v62 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
      v63 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
      *(_DWORD *)buf = 136447746;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      v68 = 2082;
      v69 = (void *)v57;
      v70 = 2082;
      v71 = v58;
      v72 = 2082;
      v73 = v60;
      v74 = 2082;
      v75 = v61;
      v76 = 2082;
      v77 = v62;
      v78 = 2114;
      v79 = v63;
      _os_log_impl(&dword_182FBE000, v20, OS_LOG_TYPE_DEBUG, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] parent does not have better path, not resetting", buf, 0x48u);

    }
LABEL_69:

    return;
  }
  if ((v7 & 1) == 0)
  {
    if (__nwlog_connection_log::onceToken != -1)
      dispatch_once(&__nwlog_connection_log::onceToken, &__block_literal_global_24_44184);
    v16 = (id)gconnectionLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v28 = nw_endpoint_handler_get_id_string(*(void **)(a1 + 32));
      v29 = nw_endpoint_handler_dry_run_string(*(void **)(a1 + 32));
      v30 = nw_endpoint_handler_copy_endpoint(*(void **)(a1 + 32));
      v31 = nw_endpoint_get_logging_description(v30);
      v32 = nw_endpoint_handler_state_string(*(void **)(a1 + 32));
      v33 = nw_endpoint_handler_mode_string(*(void **)(a1 + 32));
      v34 = nw_endpoint_handler_copy_current_path(*(void **)(a1 + 32));
      *(_DWORD *)buf = 136447746;
      v67 = "-[NWConcrete_nw_endpoint_flow updatePathWithHandler:]_block_invoke";
      v68 = 2082;
      v69 = (void *)v28;
      v70 = 2082;
      v71 = v29;
      v72 = 2082;
      v73 = v31;
      v74 = 2082;
      v75 = v32;
      v76 = 2082;
      v77 = v33;
      v78 = 2114;
      v79 = v34;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_INFO, "%{public}s [C%{public}s %{public}s%{public}s %{public}s %{public}s (%{public}@)] parent does not have better path, not resetting", buf, 0x48u);

    }
LABEL_26:

  }
}

uint64_t __36__NWConcrete_nw_association_dealloc__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t *extra;
  uint64_t v6;
  id v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  char *backtrace_string;
  os_log_type_t v13;
  _BOOL4 v14;
  os_log_type_t v15;
  char v16;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  nw_hash_node_get_object(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  extra = (uint64_t *)nw_hash_node_get_extra(a2);
  v6 = extra[5];
  if (v6)
    nw_protocol_definition_deallocate_cache_entry(v4, v6);
  nw_context_remove_cache_entry(*(void **)(a1 + 32), extra);
  if (nw_hash_table_remove_node(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2))
    goto LABEL_11;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v7 = (id)gLogObj;
  *(_DWORD *)buf = 136446466;
  v19 = "-[NWConcrete_nw_association dealloc]_block_invoke_2";
  v20 = 2048;
  v21 = a2;
  v8 = (char *)_os_log_send_and_compose_impl();

  type = OS_LOG_TYPE_ERROR;
  v16 = 0;
  if (__nwlog_fault(v8, &type, &v16))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v10 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        v20 = 2048;
        v21 = a2;
        _os_log_impl(&dword_182FBE000, v9, v10, "%{public}s Association failed to remove cache entry for node %p", buf, 0x16u);
      }
    }
    else if (v16)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v13 = type;
      v14 = os_log_type_enabled(v9, type);
      if (backtrace_string)
      {
        if (v14)
        {
          *(_DWORD *)buf = 136446722;
          v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
          v20 = 2048;
          v21 = a2;
          v22 = 2082;
          v23 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v9, v13, "%{public}s Association failed to remove cache entry for node %p, dumping backtrace:%{public}s", buf, 0x20u);
        }

        free(backtrace_string);
        if (v8)
          goto LABEL_10;
        goto LABEL_11;
      }
      if (v14)
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        v20 = 2048;
        v21 = a2;
        _os_log_impl(&dword_182FBE000, v9, v13, "%{public}s Association failed to remove cache entry for node %p, no backtrace", buf, 0x16u);
      }
    }
    else
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v9 = (id)gLogObj;
      v15 = type;
      if (os_log_type_enabled(v9, type))
      {
        *(_DWORD *)buf = 136446466;
        v19 = "-[NWConcrete_nw_association dealloc]_block_invoke";
        v20 = 2048;
        v21 = a2;
        _os_log_impl(&dword_182FBE000, v9, v15, "%{public}s Association failed to remove cache entry for node %p, backtrace limit exceeded", buf, 0x16u);
      }
    }

  }
  if (v8)
LABEL_10:
    free(v8);
LABEL_11:

  return 1;
}

@end
