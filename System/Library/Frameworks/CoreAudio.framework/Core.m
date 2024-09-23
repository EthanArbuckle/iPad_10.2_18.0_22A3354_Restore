@implementation Core

uint64_t __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
}

void __66__Core_Audio_Driver_Registrar_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  AMCP::Log::Scope_Registry *v2;
  id *v3;
  id *v4;
  NSObject *v5;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  id v13;
  NSObject *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  _opaque_pthread_t *v25;
  mach_port_t v26;
  unint64_t v27;
  char *v28;
  int v29;
  char *v30;
  BOOL v31;
  const char *v32;
  NSObject **v33;
  NSObject *v34;
  NSObject *v36;
  NSObject *v37;
  id v38;
  _opaque_pthread_t *v39;
  mach_port_t v40;
  unint64_t v41;
  char *v42;
  int v43;
  char *v44;
  uint64_t v45;
  const char *v46;
  id **v47;
  std::__shared_weak_count *v48;
  uint8_t buf[8];
  _BYTE v50[10];
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = (AMCP::Log::Scope_Registry *)objc_msgSend(*(id *)(a1 + 32), "connection_infos");
  v4 = *v47;
  v3 = v47[1];
  if (*v47 == v3)
  {
LABEL_4:
    v5 = 0;
LABEL_5:
    AMCP::Log::Scope_Registry::get(v2);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v6 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v7 = *(std::__shared_weak_count **)v50;
    if (*(_QWORD *)v50)
    {
      v8 = (unint64_t *)(*(_QWORD *)v50 + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v25 = pthread_self();
      v26 = pthread_mach_thread_np(v25);
      v27 = 0;
      v28 = 0;
      v29 = 47;
      do
      {
        v30 = &aLibraryCachesC_4[v27];
        if (v29 == 47)
          v28 = &aLibraryCachesC_4[v27];
        v29 = v30[1];
        if (!v30[1])
          break;
        v31 = v27++ >= 0xFFF;
      }
      while (!v31);
      if (v28)
        v32 = v28 + 1;
      else
        v32 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v26;
      *(_WORD *)v50 = 2080;
      *(_QWORD *)&v50[2] = v32;
      v51 = 1024;
      v52 = 43;
      _os_log_error_impl(&dword_1B57BA000, v6, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Invalidating connection but bundle id is nil!", buf, 0x18u);
    }
    v10 = 0;
    goto LABEL_12;
  }
  while (*(id *)(a1 + 40) != v4[1])
  {
    v4 += 2;
    if (v4 == v3)
      goto LABEL_4;
  }
  v13 = *v4;
  v5 = v4[1];
  v2 = (AMCP::Log::Scope_Registry *)v13;
  if (!v2)
    goto LABEL_5;
  v6 = v2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
  v14 = **(NSObject ***)buf;
  AMCP::Log::Scope::get_os_log_t(**(id **)buf);
  objc_claimAutoreleasedReturnValue();
  v15 = *(std::__shared_weak_count **)v50;
  if (*(_QWORD *)v50)
  {
    v16 = (unint64_t *)(*(_QWORD *)v50 + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v39 = pthread_self();
    v40 = pthread_mach_thread_np(v39);
    v41 = 0;
    v42 = 0;
    v43 = 47;
    do
    {
      v44 = &aLibraryCachesC_4[v41];
      if (v43 == 47)
        v42 = &aLibraryCachesC_4[v41];
      v43 = v44[1];
      if (!v44[1])
        break;
      v31 = v41++ >= 0xFFF;
    }
    while (!v31);
    v45 = -[NSObject UTF8String](objc_retainAutorelease(v6), "UTF8String");
    if (v42)
      v46 = v42 + 1;
    else
      v46 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Registrar.mm";
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v40;
    *(_WORD *)v50 = 2080;
    *(_QWORD *)&v50[2] = v46;
    v51 = 1024;
    v52 = 47;
    v53 = 2080;
    v54 = v45;
    _os_log_error_impl(&dword_1B57BA000, v14, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Calling invalidation handler for bundle id %s", buf, 0x22u);
  }

  std::function<void ()(NSString *)>::operator()(objc_msgSend(*(id *)(a1 + 32), "registrar") + 16, v6);
  v18 = *v47;
  v19 = v47[1];
  if (*v47 == v19)
  {
    v19 = *v47;
  }
  else
  {
    while (v5 != v18[1] || v6 != *v18)
    {
      v18 += 2;
      if (v18 == v19)
        goto LABEL_29;
    }
    if (v18 == v19)
    {
LABEL_29:
      v18 = v47[1];
      goto LABEL_31;
    }
    v33 = (NSObject **)(v18 + 2);
    if (v18 + 2 != v19)
    {
      do
      {
        v34 = *v33;
        if (v5 != v33[1] || v6 != v34)
        {
          *v33 = 0;
          v36 = *v18;
          *v18 = v34;

          v37 = v33[1];
          v33[1] = 0;
          v38 = v18[1];
          v18[1] = v37;

          v18 += 2;
        }
        v33 += 2;
      }
      while (v33 != (NSObject **)v19);
      v19 = v47[1];
    }
  }
LABEL_31:
  v20 = v18 + 2;
  if (v18 + 2 != v19)
  {
    do
    {
      v21 = *v20;
      *v20 = 0;
      v22 = *(v20 - 2);
      *(v20 - 2) = v21;

      v23 = v20[1];
      v20[1] = 0;
      v24 = *(v20 - 1);
      *(v20 - 1) = v23;

      v20 += 2;
    }
    while (v20 != v19);
    v18 = v20 - 2;
  }
  std::vector<Registrar_Connection_Info>::__base_destruct_at_end[abi:ne180100]((uint64_t)v47, (uint64_t)v18);
  v10 = v6;
LABEL_12:

  if (v48)
  {
    p_shared_owners = (unint64_t *)&v48->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)())v48->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v48);
    }
  }
}

void __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_22[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_22[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 240;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error sending request config change message to host: %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1852797029;
  **(_BYTE **)(a1 + 40) = 1;

}

uint64_t __87__Core_Audio_Driver_Host_Proxy_driver_request_config_change_change_action_change_info___block_invoke_33(uint64_t result, int a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  *v3 = a3;
  return result;
}

void __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_22[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_22[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 213;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error delete_from_driver_storage message to host: %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __59__Core_Audio_Driver_Host_Proxy_delete_from_driver_storage___block_invoke_27(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_22[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_22[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 183;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error write_to_driver_storage message to host: %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __70__Core_Audio_Driver_Host_Proxy_write_to_driver_storage_property_list___block_invoke_24(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_22[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_22[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 147;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error copy_from_driver_storage message to host: %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

void __57__Core_Audio_Driver_Host_Proxy_copy_from_driver_storage___block_invoke_20(uint64_t a1, int a2, id obj)
{
  _DWORD *v3;
  id *v4;

  v3 = *(_DWORD **)(a1 + 32);
  v4 = *(id **)(a1 + 40);
  *v3 = a2;
  objc_storeStrong(v4, obj);
}

void __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_22[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_22[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Driver/Core_Audio_Driver_Host_Proxy.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 124;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error sending properties changed message to host: %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;
  **(_BYTE **)(a1 + 40) = 1;

}

uint64_t __74__Core_Audio_Driver_Host_Proxy_driver_properties_changed_properties_data___block_invoke_16(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __63__Core_Audio_Driver_Service_Client_tell_driver_service_to_exit__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "localizedDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v2);

}

void __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMCP::Log::Scope_Registry *v4;
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _opaque_pthread_t *v9;
  mach_port_t v10;
  unint64_t v11;
  char *v12;
  int v13;
  char *v14;
  const char *v16;
  uint64_t v17;
  const char *v18;
  id *v19;
  _BYTE v20[10];
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  AMCP::Log::Scope_Registry::get(v4);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v19, "com.apple.coreaudio", "AMCP");
  v5 = *v19;
  AMCP::Log::Scope::get_os_log_t(*v19);
  objc_claimAutoreleasedReturnValue();
  v6 = *(std::__shared_weak_count **)v20;
  if (*(_QWORD *)v20)
  {
    v7 = (unint64_t *)(*(_QWORD *)v20 + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = pthread_self();
    v10 = pthread_mach_thread_np(v9);
    v11 = 0;
    v12 = 0;
    v13 = 47;
    do
    {
      v14 = &aLibraryCachesC_46[v11];
      if (v13 == 47)
        v12 = &aLibraryCachesC_46[v11];
      v13 = v14[1];
      if (!v14[1])
        break;
    }
    while (v11++ < 0xFFF);
    if (v12)
      v16 = v12 + 1;
    else
      v16 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Service_Client.mm";
    v17 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    if (v4)
    {
      -[AMCP::Log::Scope_Registry localizedDescription](v4, "localizedDescription");
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v2, "UTF8String");
    }
    else
    {
      v18 = "";
    }
    LODWORD(v19) = 67110146;
    HIDWORD(v19) = v10;
    *(_WORD *)v20 = 2080;
    *(_QWORD *)&v20[2] = v16;
    v21 = 1024;
    v22 = 156;
    v23 = 2080;
    v24 = v17;
    v25 = 2080;
    v26 = v18;
    _os_log_error_impl(&dword_1B57BA000, v5, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error loading driver bundle %s %s", (uint8_t *)&v19, 0x2Cu);
    if (v4)

  }
  **(_DWORD **)(a1 + 32) = 2;

}

void __64__Core_Audio_Driver_Service_Client_load_driver_driver_endpoint___block_invoke_25(uint64_t a1, int a2, id obj)
{
  id **v3;

  v3 = *(id ***)(a1 + 40);
  **(_DWORD **)(a1 + 32) = a2;
  objc_storeStrong(*v3, obj);
}

uint64_t __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke(uint64_t result)
{
  **(_BYTE **)(result + 32) = 0;
  return result;
}

uint64_t __67__Core_Audio_Driver_Service_Client_send_endpoint_to_driver_service__block_invoke_10(uint64_t result, char a2)
{
  **(_BYTE **)(result + 32) = a2;
  return result;
}

void __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "localizedDescription");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@"), v2);

}

void __57__Core_Audio_Driver_Service_Client_get_driver_name_list___block_invoke_29(uint64_t a1, void *a2)
{
  objc_storeStrong(*(id **)(a1 + 32), a2);
}

void __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 679;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __94__Core_Audio_Driver_Host_set_property_data_qualifier_data_size_qualifier_data_data_size_data___block_invoke_125(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 624;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d get_property_data error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

void __112__Core_Audio_Driver_Host_get_property_data_qualifier_data_size_qualifier_data_data_size_out_data_size_out_data___block_invoke_118(uint64_t a1, int a2, id obj)
{
  _DWORD *v3;
  id *v4;

  v3 = *(_DWORD **)(a1 + 32);
  v4 = *(id **)(a1 + 40);
  *v3 = a2;
  objc_storeStrong(v4, obj);
}

void __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 586;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __93__Core_Audio_Driver_Host_get_property_data_size_qualifier_data_size_qualifier_data_out_size___block_invoke_115(uint64_t result, int a2, int a3)
{
  _DWORD *v3;

  v3 = *(_DWORD **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  *v3 = a3;
  return result;
}

void __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 558;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d is_property_settable error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __60__Core_Audio_Driver_Host_is_property_settable_out_settable___block_invoke_111(uint64_t result, int a2, char a3)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  *v3 = a3;
  return result;
}

void __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 535;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d has_property error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __56__Core_Audio_Driver_Host_has_property_out_has_property___block_invoke_107(uint64_t result, char a2)
{
  ***(_BYTE ***)(result + 32) = a2;
  return result;
}

void __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 509;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d unregister_buffer error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __44__Core_Audio_Driver_Host_unregister_buffer___block_invoke_104(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __42__Core_Audio_Driver_Host_register_buffer___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 487;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d register_buffer error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 1768911973;

}

uint64_t __42__Core_Audio_Driver_Host_register_buffer___block_invoke_101(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __56__Core_Audio_Driver_Host_retain_reply_for_process_boost__block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 472;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d retain_reply_for_process_boost error %s", (uint8_t *)&v17, 0x22u);

  }
}

void __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 454;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d stop_synchronous_messenger error %s", (uint8_t *)&v17, 0x22u);

  }
}

uint64_t __63__Core_Audio_Driver_Host_stop_synchronous_messenger_client_id___block_invoke_97(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 427;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d start_synchronous_messenger error %s", (uint8_t *)&v17, 0x22u);

  }
}

uint64_t __134__Core_Audio_Driver_Host_start_synchronous_messenger_client_id_nominal_sample_rate_io_buffer_frame_size_work_group_port_io_messenger___block_invoke_95(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 402;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d stop_io error %s", (uint8_t *)&v17, 0x22u);

  }
}

uint64_t __46__Core_Audio_Driver_Host_stop_io_client_info___block_invoke_92(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 381;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d start_io error %s", (uint8_t *)&v17, 0x22u);

  }
}

uint64_t __47__Core_Audio_Driver_Host_start_io_client_info___block_invoke_90(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 358;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d object_was_destroyed error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __47__Core_Audio_Driver_Host_object_was_destroyed___block_invoke_88(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __41__Core_Audio_Driver_Host_destroy_device___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 340;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d destroy_device error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __41__Core_Audio_Driver_Host_destroy_device___block_invoke_85(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 321;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d create_device error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __66__Core_Audio_Driver_Host_create_device_client_info_out_object_id___block_invoke_81(uint64_t result, int a2, int a3)
{
  _DWORD **v3;

  v3 = *(_DWORD ***)(result + 40);
  **(_DWORD **)(result + 32) = a2;
  **v3 = a3;
  return result;
}

void __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 301;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d remove_device_client error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __59__Core_Audio_Driver_Host_remove_device_client_client_info___block_invoke_78(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 282;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d add_device_client error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __56__Core_Audio_Driver_Host_add_device_client_client_info___block_invoke_75(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 263;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d abort_device_configuration_change error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __74__Core_Audio_Driver_Host_abort_device_configuration_change_action_change___block_invoke_72(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  _opaque_pthread_t *v8;
  mach_port_t v9;
  unint64_t v10;
  char *v11;
  int v12;
  char *v13;
  const char *v15;
  id v16;
  uint64_t v17;
  id *v18;
  _BYTE v19[10];
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  AMCP::Log::Scope_Registry::get(v3);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v18, "com.apple.coreaudio", "AMCP");
  v4 = *v18;
  AMCP::Log::Scope::get_os_log_t(*v18);
  objc_claimAutoreleasedReturnValue();
  v5 = *(std::__shared_weak_count **)v19;
  if (*(_QWORD *)v19)
  {
    v6 = (unint64_t *)(*(_QWORD *)v19 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = pthread_self();
    v9 = pthread_mach_thread_np(v8);
    v10 = 0;
    v11 = 0;
    v12 = 47;
    do
    {
      v13 = &aLibraryCachesC_67[v10];
      if (v12 == 47)
        v11 = &aLibraryCachesC_67[v10];
      v12 = v13[1];
      if (!v13[1])
        break;
    }
    while (v10++ < 0xFFF);
    if (v11)
      v15 = v11 + 1;
    else
      v15 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v3, "description");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    LODWORD(v18) = 67109890;
    HIDWORD(v18) = v9;
    *(_WORD *)v19 = 2080;
    *(_QWORD *)&v19[2] = v15;
    v20 = 1024;
    v21 = 244;
    v22 = 2080;
    v23 = v17;
    _os_log_error_impl(&dword_1B57BA000, v4, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d perform_device_configuration_change error %s", (uint8_t *)&v18, 0x22u);

  }
  **(_DWORD **)(a1 + 32) = 2003329396;

}

uint64_t __76__Core_Audio_Driver_Host_perform_device_configuration_change_action_change___block_invoke_69(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

__int128 *__44__Core_Audio_Driver_Host_initialize_driver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 *result;
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "connection_from_driver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  result = *(__int128 **)(a1 + 32);
  if (!result)
    return result;
  objc_msgSend(result, "m_invalidation_handler");
  result = (__int128 *)*((_QWORD *)&v9 + 1);
  if (*((__int128 **)&v9 + 1) == &v8)
  {
    v5 = *(void (**)(void))(v8 + 32);
  }
  else
  {
    if (!*((_QWORD *)&v9 + 1))
      return result;
    v5 = *(void (**)(void))(**((_QWORD **)&v9 + 1) + 40);
  }
  v5();
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    v8 = 0u;
    v9 = 0u;
LABEL_15:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  objc_msgSend(v6, "m_invalidation_handler");
  if (!*((_QWORD *)&v9 + 1))
    goto LABEL_15;
  (*(void (**)(_QWORD))(**((_QWORD **)&v9 + 1) + 48))(*((_QWORD *)&v9 + 1));
  result = (__int128 *)*((_QWORD *)&v9 + 1);
  if (*((__int128 **)&v9 + 1) == &v8)
  {
    v7 = 4;
    result = &v8;
  }
  else
  {
    if (!*((_QWORD *)&v9 + 1))
      return result;
    v7 = 5;
  }
  return (__int128 *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v7))();
}

void __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_2(uint64_t a1, void *a2)
{
  AMCP::Log::Scope_Registry *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _opaque_pthread_t *v7;
  mach_port_t v8;
  unint64_t v9;
  char *v10;
  int v11;
  char *v12;
  const char *v14;
  id v15;
  uint64_t v16;
  id *v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  AMCP::Log::Scope_Registry::get(v2);
  AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)&v17, "com.apple.coreaudio", "AMCP");
  v3 = *v17;
  AMCP::Log::Scope::get_os_log_t(*v17);
  objc_claimAutoreleasedReturnValue();
  v4 = *(std::__shared_weak_count **)v18;
  if (*(_QWORD *)v18)
  {
    v5 = (unint64_t *)(*(_QWORD *)v18 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = pthread_self();
    v8 = pthread_mach_thread_np(v7);
    v9 = 0;
    v10 = 0;
    v11 = 47;
    do
    {
      v12 = &aLibraryCachesC_67[v9];
      if (v11 == 47)
        v10 = &aLibraryCachesC_67[v9];
      v11 = v12[1];
      if (!v12[1])
        break;
    }
    while (v9++ < 0xFFF);
    if (v10)
      v14 = v10 + 1;
    else
      v14 = "/Library/Caches/com.apple.xbs/Sources/AudioHAL/Source/AMCP/ASP/Portal/Server/Core_Audio_Driver_Host.mm";
    -[AMCP::Log::Scope_Registry description](v2, "description");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    LODWORD(v17) = 67109890;
    HIDWORD(v17) = v8;
    *(_WORD *)v18 = 2080;
    *(_QWORD *)&v18[2] = v14;
    v19 = 1024;
    v20 = 216;
    v21 = 2080;
    v22 = v16;
    _os_log_error_impl(&dword_1B57BA000, v3, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d Error initializing driver %s", (uint8_t *)&v17, 0x22u);

  }
}

uint64_t __44__Core_Audio_Driver_Host_initialize_driver___block_invoke_65(uint64_t result, int a2)
{
  **(_DWORD **)(result + 32) = a2;
  return result;
}

void __61__Core_Audio_Driver_Host_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "connection_to_driver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

uint64_t __75__Core_Audio_Driver_abort_device_configuration_change_action_change_reply___block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  os_unfair_lock_s *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *lock;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  objc_msgSend(*(id *)(a1 + 32), "config_change_info_map");
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_lock");
  os_unfair_lock_lock(lock);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v4 = *(_QWORD **)(v20 + 8);
  if (!v4)
    goto LABEL_17;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (uint64_t *)(v20 + 8);
  do
  {
    v7 = v4[4];
    v8 = v7 >= v5;
    if (v7 >= v5)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != (uint64_t *)(v20 + 8) && v5 >= v6[4])
  {
    v13 = v6[5];
    v14 = *(os_unfair_lock_s **)(a1 + 32);
    if (v14)
    {
      -[os_unfair_lock_s config_change_info_map](v14, "config_change_info_map");
      v14 = lock;
    }
    else
    {
      v19 = 0;
    }
    std::__tree<HALS_IOUADriver *>::__remove_node_pointer((uint64_t **)v14, v6);
    operator delete(v6);
    if (v19)
    {
      v15 = (unint64_t *)&v19->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    os_unfair_lock_unlock(lock);
    v17 = objc_msgSend(*(id *)(a1 + 32), "asp_interface");
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v17 + 80))(v17, *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 48), v13);
  }
  else
  {
LABEL_17:
    os_unfair_lock_unlock(lock);
  }
  if (v21)
  {
    v10 = (unint64_t *)&v21->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
}

uint64_t __77__Core_Audio_Driver_perform_device_configuration_change_action_change_reply___block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  BOOL v8;
  _QWORD *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v13;
  os_unfair_lock_s *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  os_unfair_lock_s *lock;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  objc_msgSend(*(id *)(a1 + 32), "config_change_info_map");
  objc_msgSend(*(id *)(a1 + 32), "config_change_info_lock");
  os_unfair_lock_lock(lock);
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)())v19->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v4 = *(_QWORD **)(v20 + 8);
  if (!v4)
    goto LABEL_17;
  v5 = *(_QWORD *)(a1 + 56);
  v6 = (uint64_t *)(v20 + 8);
  do
  {
    v7 = v4[4];
    v8 = v7 >= v5;
    if (v7 >= v5)
      v9 = v4;
    else
      v9 = v4 + 1;
    if (v8)
      v6 = v4;
    v4 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 != (uint64_t *)(v20 + 8) && v5 >= v6[4])
  {
    v13 = v6[5];
    v14 = *(os_unfair_lock_s **)(a1 + 32);
    if (v14)
    {
      -[os_unfair_lock_s config_change_info_map](v14, "config_change_info_map");
      v14 = lock;
    }
    else
    {
      v19 = 0;
    }
    std::__tree<HALS_IOUADriver *>::__remove_node_pointer((uint64_t **)v14, v6);
    operator delete(v6);
    if (v19)
    {
      v15 = (unint64_t *)&v19->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    os_unfair_lock_unlock(lock);
    v17 = objc_msgSend(*(id *)(a1 + 32), "asp_interface");
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)v17 + 72))(v17, *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 48), v13);
  }
  else
  {
LABEL_17:
    os_unfair_lock_unlock(lock);
  }
  if (v21)
  {
    v10 = (unint64_t *)&v21->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
}

_QWORD *__56__Core_Audio_Driver_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  _BYTE v3[24];
  _BYTE *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "m_invalidation_handler");
    result = v4;
    if (v4)
    {
      (*(void (**)(_BYTE *))(*(_QWORD *)v4 + 48))(v4);
      result = v4;
      if (v4 == v3)
      {
        v2 = 4;
        result = v3;
      }
      else
      {
        if (!v4)
          return result;
        v2 = 5;
      }
      return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v2))();
    }
  }
  return result;
}

@end
