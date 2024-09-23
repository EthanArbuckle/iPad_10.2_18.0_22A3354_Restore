DIR *reap_orphaned_log_files(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  char v6;
  _BYTE *v7;
  _BYTE v9[1024];
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDB0D28];
  reap_orphaned_log_files_in_hierarchy((uint64_t)"/tmp/", 0, a1, a2);
  get_raw_log_dirs(a1, v9, v10);
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = &v9[1024 * v4];
    if (*v7 && _platform_strcmp())
      reap_orphaned_log_files_in_hierarchy((uint64_t)v7, 0, a1, a2);
    v5 = 0;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return reap_orphaned_log_files_in_hierarchy((uint64_t)"/private/var/mobile/Containers/Data/Application", "<application-UUID>/tmp", a1, a2);
}

DIR *reap_orphaned_log_files_in_hierarchy(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  DIR *result;
  DIR *v8;
  DIR *v9;
  size_t i;
  int v11;
  size_t v12;
  const char *v13;
  const char *v14;
  dirent *v15;
  dirent *v16;
  const char *d_name;
  int v18;
  pid_t v19;
  size_t v20;
  dirent *v21;
  dirent *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  char v27[1024];
  int v28[2];
  int v29;
  int v30;
  char v31[648];
  uint64_t v32;

  v32 = *MEMORY[0x24BDB0D28];
  _platform_strlcpy();
  result = (DIR *)_platform_strlen();
  if ((unint64_t)&result[-8].__dd_lock.__sig + 1 >= 0xFFFFFFFFFFFFFC02)
  {
    v8 = result;
    result = opendir(v27);
    if (result)
    {
      v9 = result;
      if (v27[(_QWORD)v8 - 1] != 47)
        v27[(_QWORD)v8] = 47;
      if (a2)
      {
        for (i = 0; ; ++i)
        {
          v11 = a2[i];
          if (!a2[i] || v11 == 47)
            break;
        }
        if (*a2 == 60)
          v12 = 0;
        else
          v12 = i;
        v13 = &a2[i];
        if (v11)
          v14 = v13 + 1;
        else
          v14 = 0;
        v15 = readdir(result);
        if (v15)
        {
          v16 = v15;
          do
          {
            if (v16->d_type == 4)
            {
              v18 = v16->d_name[0];
              d_name = v16->d_name;
              if (v18 != 46 && (!v12 || !strncmp(d_name, a2, v12)))
              {
                _platform_strlcpy();
                reap_orphaned_log_files_in_hierarchy(v27, v14, a3, a4);
              }
            }
            v16 = readdir(v9);
          }
          while (v16);
        }
      }
      else
      {
        if (__stack_log_file_path__)
          v25 = strrchr((char *)__stack_log_file_path__, 47) + 1;
        else
          v25 = 0;
        v19 = getpid();
        v20 = _platform_strlen();
        v21 = readdir(v9);
        if (v21)
        {
          v22 = v21;
          do
          {
            if ((v22->d_type | 2) == 0xA && !strncmp(v22->d_name, "stack-logs.", v20))
            {
              v23 = strtol(&v22->d_name[v20], 0, 10);
              v24 = v23;
              if (a4 && v23 == (int)a3)
              {
                _platform_strlcpy();
                open_log_file_at_path(v27, a4);
              }
              else
              {
                v26 = 648;
                *(_QWORD *)v28 = 0xE00000001;
                v29 = 1;
                v30 = v23;
                sysctl(v28, 4u, v31, &v26, 0, 0);
                if (v26 != 648 || v24 == v19 && v25 && _platform_strcmp())
                {
                  _platform_strlcpy();
                  if (!delete_logging_file((uint64_t)v27))
                    msl_printf(5);
                }
              }
            }
            v22 = readdir(v9);
          }
          while (v22);
        }
      }
      return (DIR *)closedir(v9);
    }
  }
  return result;
}

uint64_t get_remote_env_var(int a1, const char *a2, _BYTE *a3)
{
  uint64_t result;
  _QWORD *v6;
  _DWORD *v7;
  int64_t v8;
  unint64_t v9;
  int v10;
  const char *v11;
  int v12;
  int64_t v13;
  uint64_t v14;
  const char *v15;
  size_t v16;
  const char *v17;
  int64_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  int v22[2];
  int v23[2];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDB0D28];
  *a3 = 0;
  *(_QWORD *)v22 = 0x800000001;
  v19 = 8;
  v20 = 0;
  result = sysctl(v22, 2u, &v20, &v19, 0, 0);
  if (!(_DWORD)result)
  {
    v6 = (_QWORD *)MEMORY[0x24BDB1100];
    result = sld_allocate_pages((v20 + *MEMORY[0x24BDB1100] - 1) & -*MEMORY[0x24BDB1100]);
    if (result)
    {
      v7 = (_DWORD *)result;
      v21 = v20;
      *(_QWORD *)v23 = 0x3100000001;
      v24 = a1;
      if (!sysctl(v23, 3u, (void *)result, &v21, 0, 0))
      {
        v8 = v21;
        v9 = (unint64_t)v7 + v21;
        *((_BYTE *)v7 + v21 - 1) = 0;
        v11 = (const char *)(v7 + 1);
        v10 = *v7;
        if (v8 >= 5 && (v10 & 0x80000000) == 0)
        {
          v12 = 0;
          do
          {
            do
            {
              if (!*v11)
                break;
              ++v11;
            }
            while ((unint64_t)v11 < v9);
            if ((unint64_t)v11 < v9)
            {
              v13 = (char *)v7 + v8 - v11;
              while (!*v11)
              {
                ++v11;
                if (!--v13)
                {
                  v11 = (char *)v7 + v8;
                  break;
                }
              }
            }
            if (v12 >= v10)
              break;
            ++v12;
          }
          while ((unint64_t)v11 < v9);
        }
        v14 = _platform_strlen();
        v15 = &v11[v14];
        if ((unint64_t)&v11[v14 + 1] < v9)
        {
          v16 = v14;
          v17 = (char *)v7 + v8;
          while (*v11)
          {
            if (!strncmp(v11, a2, v16) && *v15 == 61)
            {
              _platform_strlcpy();
              return sld_deallocate_pages((mach_vm_address_t)v7, (v20 + *v6 - 1) & -*v6);
            }
            if ((unint64_t)v11 < v9)
            {
              v18 = v17 - v11;
              while (*v11)
              {
                ++v11;
                if (!--v18)
                {
                  v11 = v17;
                  break;
                }
              }
            }
            v15 = &(++v11)[v16];
            if ((unint64_t)&v11[v16 + 1] >= v9)
              return sld_deallocate_pages((mach_vm_address_t)v7, (v20 + *v6 - 1) & -*v6);
          }
        }
      }
      return sld_deallocate_pages((mach_vm_address_t)v7, (v20 + *v6 - 1) & -*v6);
    }
  }
  return result;
}

uint64_t sld_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size)
{
  return mach_vm_deallocate(*MEMORY[0x24BDB1040], address, size);
}

uint64_t sld_allocate_pages(mach_vm_size_t size)
{
  vm_map_t *v2;
  mach_error_t memory_entry_64;
  vm_size_t v4;
  unsigned __int8 v5;
  uint64_t result;
  mach_error_t v7;
  mach_error_t v8;
  unsigned __int8 v9;
  mach_error_t v10;
  unsigned __int8 v11;
  memory_object_size_t sizea;
  mach_port_t object_handle;
  mach_vm_address_t address;

  v2 = (vm_map_t *)MEMORY[0x24BDB1040];
  if (!stack_logging_enable_logging || (address = 0, object_handle = 0, (enabled_no_footprint & 1) == 0))
  {
LABEL_13:
    address = 0;
    v7 = mach_vm_allocate(*v2, &address, size, 167772161);
    if (!v7)
      return address;
    mach_error_string(v7);
    msl_printf(3);
    return 0;
  }
  sizea = size;
  memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x24BDB1040], &sizea, 0, 139267, &object_handle, 0);
  if (memory_entry_64 || (v4 = sizea, sizea < size) || object_handle + 1 <= 1)
  {
    do
      v5 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce));
    if ((v5 & 1) != 0)
      goto LABEL_10;
    mach_error_string(memory_entry_64);
    goto LABEL_9;
  }
  v8 = mach_memory_entry_ownership(object_handle, *v2, 1, 2);
  if (v8)
  {
    do
      v9 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_5);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_5));
    if ((v9 & 1) != 0)
      goto LABEL_10;
    mach_error_string(v8);
LABEL_9:
    msl_printf(3);
    goto LABEL_10;
  }
  v10 = vm_map(*v2, &address, v4, 0, 167772161, object_handle, 0, 0, 3, 3, 1u);
  if (v10)
  {
    do
      v11 = __ldaxr((unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_7);
    while (__stlxr(1u, (unsigned __int8 *)&_sld_allocate_pages_no_footprint_alreadyLoggedOnce_7));
    if ((v11 & 1) == 0)
    {
      mach_error_string(v10);
      msl_printf(3);
    }
    address = 0;
  }
LABEL_10:
  if (object_handle)
    mach_port_deallocate(*v2, object_handle);
  result = address;
  if (!address)
    goto LABEL_13;
  return result;
}

void *retain_file_streams_for_task_with_error(mach_port_name_t a1, mach_vm_address_t a2, int *a3)
{
  kern_return_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  size_t v20;
  char *v21;
  mach_vm_address_t v22;
  int v23;
  int v24;
  BOOL v25;
  int v26;
  int v27;
  unsigned int v28;
  size_t v30;
  mach_vm_size_t outsize;
  int x;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  int v64[2];
  int v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDB0D28];
  if (!a1)
  {
    v8 = 0;
    v7 = 5;
    if (!a3)
      return v8;
LABEL_58:
    *a3 = v7;
    return v8;
  }
  x = 0;
  v6 = pid_for_task(a1, &x);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    if (!a3)
      return v8;
    goto LABEL_58;
  }
  os_unfair_lock_lock_with_options();
  v9 = remote_fds_count;
  if (remote_fds_count)
  {
    v10 = (void **)remote_fds;
    v11 = remote_fds_count;
    do
    {
      v8 = *v10;
      if (*v10 && *(_DWORD *)v8 == a1)
      {
        v7 = 0;
        ++*((_DWORD *)v8 + 3);
        goto LABEL_54;
      }
      ++v10;
      --v11;
    }
    while (v11);
    v12 = (void **)remote_fds;
    v13 = remote_fds_count;
    do
    {
      v8 = *v12;
      if (*v12 && !*((_DWORD *)v8 + 3))
      {
        free_file_streams(*v12);
        goto LABEL_30;
      }
      ++v12;
      --v13;
    }
    while (v13);
    v14 = remote_fds_count;
    v15 = (char *)remote_fds;
    while (*(_QWORD *)v15)
    {
      v15 += 8;
      if (!--v14)
        goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
    if (remote_fds_count)
      v16 = (2 * remote_fds_count);
    else
      v16 = 1;
    v17 = (char *)malloc_type_realloc((void *)remote_fds, 8 * v16, 0x61171CC2uLL);
    if (!v17)
    {
      v8 = 0;
LABEL_28:
      v7 = 5;
      goto LABEL_54;
    }
    remote_fds = (uint64_t)v17;
    remote_fds_count = v16;
    v15 = &v17[8 * v9];
    bzero(v15, 8 * (v16 - v9));
  }
  v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x1020040EE5BEA7CuLL);
  *(_QWORD *)v15 = v8;
  if (!v8)
    goto LABEL_28;
LABEL_30:
  v18 = x;
  *(_DWORD *)v8 = a1;
  *((_DWORD *)v8 + 1) = v18;
  if (a2)
  {
    v7 = map_shared_memory((uint64_t)v8, a2);
    if (v7 == 257)
      goto LABEL_42;
  }
  else
  {
    v7 = 0;
  }
  v19 = *((_QWORD *)v8 + 5);
  if (v19)
  {
    if (!*(_QWORD *)(v19 + 40))
      goto LABEL_46;
    v20 = (*(_DWORD *)(v19 + 48) + 1);
    v21 = (char *)malloc_type_malloc(v20, 0xA6146A08uLL);
    outsize = 0;
    mach_vm_read_overwrite(*(_DWORD *)v8, *(_QWORD *)(*((_QWORD *)v8 + 5) + 40), v20, (mach_vm_address_t)v21, &outsize);
    if (outsize == v20)
      open_log_file_at_path(v21, (uint64_t)v8);
    free(v21);
    if (*((_QWORD *)v8 + 5))
      goto LABEL_46;
  }
  if (!*((_QWORD *)v8 + 2))
  {
    open_log_file((void *)x, (uint64_t)v8);
    if (*((_QWORD *)v8 + 5))
      goto LABEL_46;
  }
  v22 = *((_QWORD *)v8 + 3);
  if (!v22)
    goto LABEL_52;
  v23 = map_shared_memory((uint64_t)v8, v22);
  if (v23 == 257)
  {
LABEL_42:
    free_file_streams(v8);
    v8 = 0;
    v7 = 257;
    goto LABEL_54;
  }
  v7 = v23;
  if (*((_QWORD *)v8 + 5))
  {
LABEL_46:
    *(_QWORD *)v64 = 0xE00000001;
    v65 = 1;
    v66 = x;
    memset(v33, 0, sizeof(v33));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v30 = 648;
    v24 = sysctl(v64, 4u, v33, &v30, 0, 0);
    if (v30)
      v25 = v24 == 0;
    else
      v25 = 0;
    v26 = v34 & 4;
    if (!v25)
      v26 = 0;
    *((_DWORD *)v8 + 2) = v26;
    *((_DWORD *)v8 + 3) = 1;
  }
  else
  {
LABEL_52:
    free_file_streams(v8);
    v8 = 0;
    if (!v7)
      v7 = 5;
  }
LABEL_54:
  v27 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v28 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v28 != v27)
      break;
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque))
    {
      if (!a3)
        return v8;
      goto LABEL_58;
    }
  }
  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
  if (a3)
    goto LABEL_58;
  return v8;
}

void *open_log_file(void *result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  char v5;
  char v6;
  char *v7;
  _BYTE v8[1024];
  _BYTE v9[1024];
  uint64_t v10;

  v3 = (int)result;
  v10 = *MEMORY[0x24BDB0D28];
  if ((open_log_file_already_reaped & 1) == 0)
  {
    result = reap_orphaned_log_files((uint64_t)result, a2);
    open_log_file_already_reaped = 1;
  }
  if (!*(_QWORD *)(a2 + 16))
  {
    result = open_log_file_from_directory(v3, "/tmp/", a2);
    if (!result)
    {
      result = get_raw_log_dirs(v3, v8, v9);
      v4 = 0;
      v5 = 1;
      do
      {
        v6 = v5;
        v7 = &v8[1024 * v4];
        if (*v7)
          result = open_log_file_from_directory(v3, v7, a2);
        v5 = 0;
        v4 = 1;
      }
      while ((v6 & 1) != 0);
    }
  }
  return result;
}

uint64_t msl_start_reading(mach_port_name_t a1, mach_vm_address_t a2, _DWORD *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t updated;
  uint64_t v8;
  uint64_t v9;
  int v11;

  v11 = 0;
  v5 = retain_file_streams_for_task_with_error(a1, a2, &v11);
  if (!v5)
    return 5;
  v6 = v5;
  updated = update_cache_for_file_streams();
  if ((_DWORD)updated)
  {
    v8 = updated;
    release_file_streams_for_task(a1);
  }
  else
  {
    v9 = v6[5];
    if (v9)
      LODWORD(v9) = *(_BYTE *)(v9 + 56) & 1;
    v8 = 0;
    *a3 = v9;
  }
  return v8;
}

char *get_raw_log_dirs(int a1, _BYTE *a2, _BYTE *a3)
{
  char *result;

  if (getpid() == a1)
  {
    if (msl_get_tmp_dir())
      _platform_strlcpy();
    else
      *a2 = 0;
    result = msl_get_log_dir();
    if (result)
      return (char *)_platform_strlcpy();
    else
      *a3 = 0;
  }
  else
  {
    get_remote_env_var(a1, "TMPDIR", a2);
    return (char *)get_remote_env_var(a1, "MallocStackLoggingDirectory", a3);
  }
  return result;
}

uint64_t radix_tree_lookup(uint64_t a1, unint64_t a2)
{
  _QWORD v3[4];

  radix_tree_lookup_interval(a1, a2, 1uLL, (uint64_t)v3);
  return v3[2];
}

uint64_t radix_tree_lookup_interval@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  result = radix_tree_lookup_recursive(a1, a2, a3, 0, 0xFFFFFFFFFFFFFFFFLL, (unsigned int *)(a1 + 20), 0, (unint64_t *)a4);
  if (*(_QWORD *)(a4 + 16) != -1)
  {
    if (!a3)
      goto LABEL_15;
    v8 = *(_QWORD *)(a4 + 8);
    if (!v8)
      goto LABEL_15;
    v9 = *(_QWORD *)a4;
    if (a2 < *(_QWORD *)a4 || a2 - *(_QWORD *)a4 >= v8)
    {
      v10 = a3 + a2 - 1;
      v11 = v10 >= v9;
      v12 = v10 - v9;
      if ((!v11 || v12 >= v8) && (v9 < a2 || v9 - a2 >= a3))
      {
        v13 = v9 + v8 - 1;
        v11 = v13 >= a2;
        v14 = v13 - a2;
        if (!v11 || v14 >= a3)
LABEL_15:
          radix_tree_lookup_interval_cold_1();
      }
    }
  }
  return result;
}

uint64_t radix_tree_insert(uint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char *v9;

  if (__CFADD__(a2, a3))
  {
    radix_tree_panic("MallocStackLogging INTERNAL ERROR: interval wraps around the end of the address space: %llx, size=%llx\n", a2, a3);
    goto LABEL_8;
  }
  v4 = a4;
  if ((unint64_t)(a3 >> *(_DWORD *)(*a1 + 8)) << *(_DWORD *)(*a1 + 8) != a3)
  {
LABEL_8:
    radix_tree_panic("MallocStackLogging INTERNAL ERROR: cannot represent value:%llx or size:%llx (key is %llx)\n", v4, a3, a2);
    goto LABEL_9;
  }
  if ((a2 & 0xFFF) != 0)
  {
LABEL_9:
    v9 = (char *)radix_tree_panic("MallocStackLogging INTERNAL ERROR: cannot represent key: %llx\n", a2);
    return radix_tree_panic(v9);
  }
  result = radix_tree_delete(a1, a2, a3);
  if ((_DWORD)result)
    return radix_tree_insert_recursive((mach_vm_address_t *)a1, a2, a3, v4, 0, 0);
  return result;
}

uint64_t radix_tree_panic(char *__format, ...)
{
  uint64_t v1;
  char __str[256];
  va_list v4;
  va_list va;

  va_start(va, __format);
  va_copy(v4, va);
  vsnprintf(__str, 0x100uLL, __format, va);
  v1 = abort_with_reason();
  return radix_tree_delete(v1);
}

uint64_t radix_tree_delete(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;

  if (a3)
  {
    v5 = a3 + a2;
    if (__CFADD__(a3, a2))
      return 0;
    while (1)
    {
      v10 = 0u;
      v11 = 0u;
      radix_tree_lookup_interval(*a1, a2, a3, (uint64_t)&v10);
      v8 = v11;
      if ((_QWORD)v11 == -1)
        break;
      v9 = v10;
      if ((radix_tree_delete_recursive(*a1, v10, *a1 + 20, 0) & 1) == 0)
        radix_tree_delete_cold_1();
      if (a2 > v9)
      {
        result = radix_tree_insert(a1, v9, a2 - v9, v8);
        if (!(_DWORD)result)
          return result;
      }
      if (*((_QWORD *)&v10 + 1) + v9 > v5 && (radix_tree_insert(a1, v5, *((_QWORD *)&v10 + 1) + v9 - v5, v8) & 1) == 0)
        return 0;
    }
  }
  return 1;
}

uint64_t radix_tree_insert_recursive(mach_vm_address_t *a1, unint64_t a2, unint64_t a3, uint64_t a4, unsigned __int16 a5, int a6)
{
  mach_vm_address_t *v8;
  unsigned int v9;
  mach_vm_address_t *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int node;
  char v24;
  unsigned int *v25;
  char *v26;
  int v27;
  void *v28;
  uint64_t result;
  unsigned int v30;
  uint64_t v31;
  unsigned int *v32;
  char *v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int *v38;
  char *v39;
  uint64_t v40;
  mach_vm_address_t v41;
  unint64_t v42;
  int v46;
  int v47;

  v8 = a1;
LABEL_2:
  while (2)
  {
    if (a6 >= 52)
      radix_tree_insert_recursive_cold_1();
    v9 = a5;
    if (*(unsigned __int16 *)(*v8 + 12) < a5)
      radix_tree_insert_recursive_cold_2();
    v10 = v8;
    v11 = 0;
    v12 = *v8 + 12 * a5 + 20;
    v13 = 1;
    while (1)
    {
      v14 = v13;
      v15 = *(unsigned int *)(v12 + 6 * v11);
      v16 = v15 & 0x7C000000;
      if ((v15 & 0x7C000000) == 0)
        break;
      v17 = 0;
      v18 = v15 & 0x3FFFFFF;
      v19 = (v15 >> 26) & 0x1F;
      v20 = -a6;
      while (v18 != ((a2 >> (v20 - v19)) & ~(-1 << (v19 + v17))))
      {
        v21 = v19 + v17;
        v18 >>= 1;
        --v17;
        v16 -= 0x4000000;
        LOBYTE(v20) = v20 + 1;
        if (v21 == 1)
          goto LABEL_11;
      }
      if ((_DWORD)v19 + v17)
      {
        if (v17)
        {
          v46 = a6;
          result = radix_tree_allocate_node(v10);
          if (!(_DWORD)result)
            return result;
          a5 = result;
          v47 = v46 + ((v15 >> 26) & 0x1F) + v17;
          v30 = *(unsigned __int16 *)(*a1 + 12);
          v31 = *a1 + 20;
          if (v30 >= v9)
            v32 = (unsigned int *)(v31 + 12 * v9);
          else
            v32 = 0;
          v33 = (char *)v32 + 6 * v11;
          v34 = v31 + 12 * a5;
          if (v30 < a5)
            v34 = 0;
          v35 = (*(_DWORD *)v33 - v16) & 0x7C000000;
          v36 = *(_DWORD *)v34 & 0x83FFFFFF | v35;
          *(_DWORD *)v34 = v36;
          v37 = *(_DWORD *)v33 & 0x80000000;
          *(_DWORD *)v34 = v37 | v36 & 0x7FFFFFFF;
          *(_WORD *)(v34 + 4) = *((_WORD *)v33 + 2);
          *(_DWORD *)v34 = v35 & 0xFC000000 | *(_DWORD *)v33 & ~(-1 << (((*(_DWORD *)v33 >> 26) & 0x1F)
                                                                      - ((v15 >> 26) & 0x1F)
                                                                      - v17)) & 0x3FFFFFF | v37;
          *(_DWORD *)v33 = ((*(_DWORD *)v33 & 0x3FFFFFFu) >> (((*(_DWORD *)v33 >> 26) & 0x1F)
                                                            - ((v15 >> 26) & 0x1F)
                                                            - v17))
                         + v16;
          *((_WORD *)v33 + 2) = a5;
          fixnode(v32);
          v8 = a1;
          a6 = v47;
        }
        else
        {
          if ((v15 & 0x80000000) != 0)
            radix_tree_insert_recursive_cold_4();
          a5 = *(_WORD *)(v12 + 6 * v11 + 4);
          a6 += v19;
          v8 = v10;
        }
        goto LABEL_2;
      }
LABEL_11:
      v13 = 0;
      v11 = 1;
      if ((v14 & 1) == 0)
      {
        radix_tree_panic("MallocStackLogging INTERNAL ERROR: at least one edge must prefix-match or be unused\n");
        goto LABEL_44;
      }
    }
    v8 = v10;
    v22 = a6;
    node = radix_tree_allocate_node(v10);
    v24 = v22;
    a5 = node;
    if (v22 < 26)
    {
      if (!node)
        return 0;
      if (*(unsigned __int16 *)(*v8 + 12) >= v9)
        v25 = (unsigned int *)(*v8 + 12 * v9 + 20);
      else
        v25 = 0;
      v26 = (char *)v25 + 6 * v11;
      *((_WORD *)v26 + 2) = node;
      v27 = v22 + 26;
      *(_DWORD *)v26 = (a2 >> (38 - v24)) & 0x3FFFFFF | 0x68000000;
      if (*(unsigned __int16 *)(*v8 + 12) >= (unsigned __int16)node)
        v28 = (void *)(*v8 + 12 * (unsigned __int16)node + 20);
      else
        v28 = 0;
      bzero(v28, 0xCuLL);
      fixnode(v25);
      a6 = v27;
      continue;
    }
    break;
  }
  if (node)
  {
    if (*(unsigned __int16 *)(*v8 + 12) >= v9)
      v38 = (unsigned int *)(*v8 + 12 * v9 + 20);
    else
      v38 = 0;
    v39 = (char *)v38 + 6 * v11;
    *((_WORD *)v39 + 2) = a5;
    *(_DWORD *)v39 = (a2 >> 12) & ~(-1 << (52 - v22)) & 0x3FFFFFF | ((52 - v22) << 26) | 0x80000000;
    v40 = *v8 + 12 * a5 + 20;
    if (*(unsigned __int16 *)(*v8 + 12) < a5)
      v40 = 0;
    *(_QWORD *)v40 = a4;
    v41 = *v8;
    v42 = a3 >> *(_DWORD *)(*v8 + 8);
    *(_DWORD *)(v40 + 8) = v42;
    if ((unint64_t)v42 << *(_DWORD *)(v41 + 8) == a3)
    {
      fixnode(v38);
      return 1;
    }
LABEL_44:
    radix_tree_insert_recursive_cold_3();
  }
  return 0;
}

uint64_t radix_tree_delete_recursive(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  char v9;
  int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned __int16 *v14;
  unsigned int v15;
  unsigned int v16;
  _DWORD *v17;

  if (a4 >= 52)
    radix_tree_delete_recursive_cold_1();
  if (!a3)
    radix_tree_delete_recursive_cold_2();
  v5 = a1;
  v6 = 0;
  v7 = 1;
  while (1)
  {
    v8 = *(_DWORD *)(a3 + 6 * v6);
    v9 = v7;
    if ((v8 & 0x7C000000) != 0
      && ((a2 >> (-(char)a4 - ((v8 >> 26) & 0x1F))) & ~(-1 << (v8 >> 26))) == (v8 & 0x3FFFFFF))
    {
      break;
    }
    v7 = 0;
    v11 = 0;
    v6 = 1;
    if ((v9 & 1) == 0)
      return v11 & v8;
  }
  v12 = a3 + 6 * v6;
  v15 = *(unsigned __int16 *)(v12 + 4);
  v14 = (unsigned __int16 *)(v12 + 4);
  v13 = v15;
  if ((v8 & 0x80000000) != 0)
  {
    v16 = v13;
    goto LABEL_17;
  }
  if (!radix_tree_delete_recursive(a1))
  {
    v8 = 0;
    v11 = 1;
    return v11 & v8;
  }
  v16 = *v14;
  if (*(unsigned __int16 *)(v5 + 12) < v16)
    radix_tree_delete_recursive_cold_3();
  if ((*(_BYTE *)(v5 + 12 * *v14 + 23) & 0x7C) == 0 && (*(_BYTE *)(v5 + 12 * *v14 + 29) & 0x7C) == 0)
  {
    a1 = v5;
LABEL_17:
    radix_tree_free_node(a1, v16);
    v17 = (_DWORD *)(a3 + 6);
    if (!(_DWORD)v6)
    {
      *(_DWORD *)a3 = *v17;
      *(_WORD *)(a3 + 4) = *(_WORD *)(a3 + 10);
    }
    *v17 &= 0x83FFFFFF;
  }
  v11 = 1;
  v8 = 1;
  return v11 & v8;
}

uint64_t radix_tree_init(uint64_t a1, uint64_t a2)
{
  void *v3;

  strcpy((char *)a1, "radixv3");
  v3 = (void *)(a1 + 20);
  if (a1 + 20 >= (unint64_t)(a1 + a2))
    radix_tree_init_cold_2();
  *(_WORD *)(a1 + 12) = ((int)a2 - 20) / 0xCu;
  if ((unsigned __int16)(((int)a2 - 20) / 0xCu) <= 2u)
    radix_tree_init_cold_1();
  *(_DWORD *)(a1 + 16) = 1;
  bzero(v3, 0xCuLL);
  bzero((void *)(a1 + 32), 0xCuLL);
  *(_WORD *)(a1 + 32) = 2;
  *(_DWORD *)(a1 + 8) = 12;
  return a1;
}

uint64_t radix_tree_create()
{
  uint64_t result;

  result = sld_allocate_pages(0x4000uLL);
  if (result)
    return radix_tree_init(result, 0x4000);
  return result;
}

uint64_t radix_tree_destroy(mach_vm_address_t a1)
{
  mach_vm_size_t v2;
  uint64_t result;

  v2 = radix_tree_size(a1);
  result = mach_vm_deallocate(*MEMORY[0x24BDB1040], a1, v2);
  if ((_DWORD)result)
    radix_tree_destroy_cold_1();
  return result;
}

uint64_t radix_tree_size(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = 3 * *(unsigned __int16 *)(a1 + 12);
  result = (12 * *(unsigned __int16 *)(a1 + 12) + 16403) & 0x1FC000;
  if ((unint64_t)(result - 4 * v1 - 32) <= 0xFFFFFFFFFFFFFFF3)
    radix_tree_size_cold_1();
  return result;
}

uint64_t radix_tree_count(uint64_t a1)
{
  return radix_tree_count_recursive(a1, a1 + 20);
}

uint64_t radix_tree_count_recursive(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;

  v4 = 0;
  v5 = 0;
  v6 = 1;
  do
  {
    v7 = v6;
    v8 = *(_DWORD *)(a2 + 6 * v4);
    if ((v8 & 0x7C000000) != 0)
    {
      v9 = *(unsigned __int16 *)(a2 + 6 * v4 + 4);
      if (*(unsigned __int16 *)(a1 + 12) >= v9)
        v10 = a1 + 12 * v9 + 20;
      else
        v10 = 0;
      if (v8 < 0)
        v11 = (unint64_t)*(unsigned int *)(v10 + 8) << *(_DWORD *)(a1 + 8);
      else
        v11 = radix_tree_count_recursive(a1, v10);
      v5 += v11;
    }
    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
  return v5;
}

uint64_t radix_tree_lookup_recursive@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unsigned int *a6@<X5>, int a7@<W6>, unint64_t *a8@<X8>)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v13;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t result;
  BOOL v22;
  BOOL v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  BOOL v35;
  BOOL v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;

  if (!a6)
    radix_tree_lookup_recursive_cold_1();
  v8 = a5;
  if (!a5)
    goto LABEL_89;
  v9 = a3;
  if (!a3)
    goto LABEL_89;
  v13 = a2;
  v16 = a4 - a2;
  if (a4 < a2 || a3 <= v16)
  {
    v17 = a5 + a4 - 1;
    v34 = v17 >= a2;
    v18 = v17 - a2;
    if ((!v34 || v18 >= a3) && (a2 < a4 || a2 - a4 >= a5))
    {
      v19 = a3 + a2 - 1;
      v34 = v19 >= a4;
      v20 = v19 - a4;
      if (!v34 || v20 >= a5)
LABEL_89:
        radix_tree_lookup_recursive_cold_2();
    }
  }
  if (a7 >= 52)
    radix_tree_lookup_recursive_cold_3();
  result = fixnode(a6);
  if ((_DWORD)result)
    radix_tree_lookup_recursive_cold_4();
  if (v13 < a4)
  {
    v22 = v9 == v16;
    v23 = v9 > v16;
    v9 -= v16;
    if (!v23)
    {
      *a8 = 0;
      a8[1] = 0;
      a8[2] = -1;
      a8[3] = a4;
      return result;
    }
    if (v22)
LABEL_92:
      radix_tree_lookup_recursive_cold_5();
    v13 = a4;
  }
  if (a4 < v13 || a4 - v13 >= v9)
  {
    v24 = v8 + a4 - 1;
    v34 = v24 >= v13;
    v25 = v24 - v13;
    if ((!v34 || v25 >= v9) && (v13 < a4 || v13 - a4 >= v8))
    {
      v26 = v9 + v13 - 1;
      v34 = v26 >= a4;
      v27 = v26 - a4;
      if (!v34 || v27 >= v8)
        goto LABEL_92;
    }
  }
  v28 = 0;
  v45 = v9 + v13 - 1;
  while (1)
  {
    v29 = *(unsigned int *)((char *)a6 + v28 + 6);
    if ((v29 & 0x7C000000) == 0)
      goto LABEL_78;
    if (((-1 << (v29 >> 26)) & v29 & 0x3FFFFFF) != 0)
      radix_tree_lookup_recursive_cold_11();
    v30 = ((v29 >> 26) & 0x1F) + a7;
    if ((((unint64_t)~(-1 << (v29 >> 26)) << -(char)(((v29 >> 26) & 0x1F) + a7)) & a4) != 0)
      radix_tree_lookup_recursive_cold_10();
    v31 = ((unint64_t)(v29 & 0x3FFFFFF) << (64 - v30)) | a4;
    if (v31 - a4 >= v8 || ((v32 = a4 - v31 + v8, v33 = a4 + v8 - 1, v33 >= a4) ? (v34 = v8 - 1 >= v8) : (v34 = 1), v34))
      radix_tree_lookup_recursive_cold_9();
    if (!v32)
      goto LABEL_78;
    v35 = v31 < v13 || v31 - v13 >= v9;
    v36 = !v35;
    if (v35)
    {
      v34 = v33 >= v13;
      v37 = v33 - v13;
      v38 = !v34 || v37 >= v9;
      if (v38 && (v13 < v31 || v13 - v31 >= v32) && (v45 < v31 || v45 - v31 >= v32))
        goto LABEL_78;
    }
    if ((v29 & 0x80000000) == 0)
    {
      *(_OWORD *)a8 = 0u;
      *((_OWORD *)a8 + 1) = 0u;
      result = radix_tree_lookup_recursive(a1, v13, v9);
      if (a8[2] != -1)
        return result;
      v39 = a8[3];
      v34 = v39 >= a4;
      v40 = v39 - a4;
      if (v34)
        v8 = v40;
      else
        v8 = 0;
      goto LABEL_78;
    }
    if (*(unsigned __int16 *)(a1 + 12) < *(unsigned __int16 *)((char *)a6 + v28 + 10))
      radix_tree_lookup_recursive_cold_6();
    if (v30 != 52)
      radix_tree_lookup_recursive_cold_8();
    v41 = (unint64_t *)(a1 + 12 * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 20);
    v42 = (unint64_t)*(unsigned int *)(a1 + 12 * *(unsigned __int16 *)((char *)a6 + v28 + 10) + 28) << *(_DWORD *)(a1 + 8);
    if (v42 > v32)
      radix_tree_lookup_recursive_cold_7();
    if (v42)
    {
      if (v36)
        break;
      v43 = v31 - 1 + v42;
      v34 = v43 >= v13;
      v44 = v43 - v13;
      if (v34 && v44 < v9)
        break;
      if (v13 >= v31 && v13 - v31 < v42 || v45 >= v31 && v45 - v31 < v42)
        break;
    }
    if (v31 >= a4)
      v8 = v31 - a4;
    else
      v8 = 0;
LABEL_78:
    v28 -= 6;
    if (v28 == -12)
    {
      *a8 = 0;
      a8[1] = 0;
      a8[2] = -1;
      a8[3] = v8 + a4;
      return result;
    }
  }
  *a8 = v31;
  a8[1] = v42;
  a8[2] = *v41;
  a8[3] = 0;
  return result;
}

uint64_t fixnode(unsigned int *a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;
  int v4;
  __int16 v6;
  unsigned int v7;

  v1 = *a1;
  v2 = (*a1 >> 26) & 0x1F;
  if (!v2 || (v3 = *(unsigned int *)((char *)a1 + 6), (v4 = (v3 >> 26) & 0x1F) == 0))
  {
    if ((v1 & 0x7C000000) == 0 && (*((_BYTE *)a1 + 9) & 0x7C) != 0)
      goto LABEL_8;
    return 0;
  }
  if ((v3 & 0x3FFFFFF) << (26 - v4) >= (v1 & 0x3FFFFFF) << (26 - v2))
    return 0;
LABEL_8:
  v6 = *((_WORD *)a1 + 2);
  v7 = *a1;
  *a1 = *(unsigned int *)((char *)a1 + 6);
  *((_WORD *)a1 + 2) = *((_WORD *)a1 + 5);
  *(unsigned int *)((char *)a1 + 6) = v7;
  *((_WORD *)a1 + 5) = v6;
  return 1;
}

uint64_t radix_tree_allocate_node(mach_vm_address_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  mach_vm_size_t v4;
  mach_vm_size_t v5;
  mach_vm_address_t pages;
  mach_vm_address_t v7;
  vm_map_t *v8;
  uint64_t v9;
  mach_vm_address_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned __int16 *v13;
  unsigned int v14;
  mach_vm_address_t v15;
  __int16 v16;
  uint64_t v18;
  int v19;

  v2 = *a1;
  if (!*(_DWORD *)(v2 + 16))
  {
    v3 = radix_tree_size(v2);
    v4 = v3 <= 0x60000 ? 2 * v3 : 786432;
    if (v4 > v3)
    {
      v5 = v3;
      pages = sld_allocate_pages(v4);
      if (pages)
      {
        v7 = pages;
        v8 = (vm_map_t *)MEMORY[0x24BDB1040];
        if (mach_vm_copy(*MEMORY[0x24BDB1040], *a1, v5, pages))
        {
          mach_vm_deallocate(*v8, v7, v4);
        }
        else
        {
          v9 = *(unsigned __int16 *)(*a1 + 12);
          mach_vm_deallocate(*v8, *a1, v5);
          *a1 = v7;
          *(_WORD *)(v7 + 12) = ((v4 & 0x1FFFFC) - 20) / 0xC;
          *(_DWORD *)(v7 + 16) = v9;
          *(_BYTE *)(v7 + 12 * v9 + 22) = 0;
          *(_WORD *)(*a1 + 12 * v9 + 20) = v9 + 1;
        }
      }
    }
  }
  v10 = *a1;
  v11 = *(unsigned int *)(*a1 + 16);
  if (!(_DWORD)v11)
    return v11;
  v12 = *(unsigned __int16 *)(v10 + 12);
  if (v12 < (unsigned __int16)v11)
    radix_tree_allocate_node_cold_1();
  v13 = (unsigned __int16 *)(v10 + 12 * (unsigned __int16)v11 + 20);
  v14 = *v13;
  *(_DWORD *)(v10 + 16) = v14;
  if (!v14 || *(_BYTE *)(v10 + 12 * (unsigned __int16)v11 + 22))
  {
LABEL_19:
    bzero(v13, 0xCuLL);
    return v11;
  }
  if (v12 >= v14)
  {
    v15 = v10 + 12 * v14;
    if (v14 + 1 < v12)
      v16 = v14 + 1;
    else
      v16 = 0;
    *(_WORD *)(v15 + 20) = v16;
    goto LABEL_19;
  }
  v18 = radix_tree_panic("radix tree is corrupt, next_free=%d num_nodes=%d\n", v14, v12);
  return radix_tree_free_node(v18, v19);
}

uint64_t radix_tree_free_node(uint64_t result, int a2)
{
  uint64_t v2;

  if (*(unsigned __int16 *)(result + 12) < (unsigned __int16)a2)
    radix_tree_free_node_cold_1();
  v2 = result + 12 * (unsigned __int16)a2;
  *(_WORD *)(v2 + 20) = *(_DWORD *)(result + 16);
  *(_BYTE *)(v2 + 22) = 1;
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t uniquing_table_unwind_stack_remote(uint64_t result, unsigned int a2, uint64_t a3, _DWORD *a4, unsigned int a5)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  if (!result)
  {
LABEL_27:
    LODWORD(v6) = 0;
    goto LABEL_28;
  }
  if (a5 >= 0x200)
    v6 = 512;
  else
    v6 = a5;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = *(_BYTE *)(result + 60);
    v9 = -1;
    while (1)
    {
      if (a2 == -1)
        goto LABEL_25;
      v10 = a2;
      if (*(_QWORD *)(result + 8) <= (unint64_t)a2)
        goto LABEL_25;
      if (a2 == v9)
        break;
      v11 = *(_QWORD *)(result + 44);
      if (!v11)
        goto LABEL_24;
      if (*(_DWORD *)v11 < a2)
      {
        v12 = 0;
        while (1)
        {
          v11 = *(_QWORD *)(v11 + 24);
          if (!v11)
            break;
          v12 += *(_DWORD *)v11;
          if (*(_DWORD *)v11 + v12 >= a2)
            goto LABEL_17;
        }
LABEL_24:
        result = msl_printf(3);
LABEL_25:
        LODWORD(v6) = v7;
        goto LABEL_28;
      }
      v12 = 0;
LABEL_17:
      v13 = *(_QWORD *)(v11 + 16);
      if (!v13)
        goto LABEL_24;
      v14 = v13 + 16 * (a2 - v12);
      if ((v8 & 2) != 0)
      {
        if (*(_QWORD *)(v14 + 8) < 0x10000uLL)
          goto LABEL_25;
        *(_QWORD *)(a3 + 8 * v7) = *(_QWORD *)v14 & 0xFFFFFFFFFFFFLL;
        a2 = *(_DWORD *)(v14 + 6);
      }
      else
      {
        atomic_load((unsigned int *)(v14 + 12));
        *(_QWORD *)(a3 + 8 * v7) = *(_QWORD *)v14;
        a2 = *(_DWORD *)(v14 + 8);
      }
      ++v7;
      v9 = v10;
      if (v7 == v6)
        goto LABEL_28;
    }
    result = msl_printf(3);
    goto LABEL_27;
  }
LABEL_28:
  *a4 = v6;
  return result;
}

unint64_t *uniquing_table_clone_from_task(vm_map_read_t a1, mach_vm_address_t a2)
{
  mach_vm_size_t v3;
  mach_error_t v4;
  mach_error_t v5;
  FILE *v6;
  char *v7;
  unint64_t *v8;
  unint64_t *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  unint64_t v14;
  mach_vm_address_t v15;
  mach_vm_size_t v16;
  mach_error_t v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  vm_offset_t v21;
  mach_error_t v22;
  FILE *v23;
  char *v24;
  mach_msg_type_number_t v26;
  vm_offset_t v27;
  mach_msg_type_number_t dataCnt;
  vm_offset_t data;

  data = 0;
  dataCnt = 0;
  v3 = (*MEMORY[0x24BDB1100] + 67) & -*MEMORY[0x24BDB1100];
  v4 = mach_vm_read(a1, a2, v3, &data, &dataCnt);
  if (v4)
  {
    v5 = v4;
    v6 = (FILE *)*MEMORY[0x24BDB0D30];
    v7 = mach_error_string(v4);
    fprintf(v6, "error while attempting to mach_vm_read remote stack uniquing table (%d): %s\n", v5, v7);
    return 0;
  }
  else
  {
    if (v3 == dataCnt)
    {
      v9 = (unint64_t *)malloc_type_malloc(0x44uLL, 0x10200402DA45A13uLL);
      v8 = v9;
      if (v9)
      {
        v10 = *(_OWORD *)data;
        v11 = *(_OWORD *)(data + 16);
        v12 = *(_OWORD *)(data + 48);
        *((_OWORD *)v9 + 2) = *(_OWORD *)(data + 32);
        *((_OWORD *)v9 + 3) = v12;
        *(_OWORD *)v9 = v10;
        *((_OWORD *)v9 + 1) = v11;
        *(unint64_t *)((char *)v9 + 44) = 0;
        v13 = (unint64_t *)((char *)v9 + 44);
        *((_DWORD *)v9 + 16) = 1;
        v14 = v9[2];
        if (v14)
        {
          v15 = v9[4];
          do
          {
            v27 = 0;
            v26 = 0;
            if (v14 >= 0x80000000)
              v16 = 0x80000000;
            else
              v16 = v14;
            while (1)
            {
              v17 = mach_vm_read(a1, v15, v16, &v27, &v26);
              if (!v17)
                break;
              v18 = v16 > 0x200001;
              v16 >>= 1;
              if (!v18)
              {
                v22 = v17;
                v23 = (FILE *)*MEMORY[0x24BDB0D30];
                v24 = mach_error_string(v17);
                fprintf(v23, "error while attempting to mach_vm_read remote stack uniquing table contents (%d): %s\n", v22, v24);
                free_uniquing_table_chunks((uint64_t)v8);
                free(v8);
                goto LABEL_15;
              }
            }
            v19 = malloc_type_malloc(0x20uLL, 0x102004078DD3916uLL);
            *v13 = v19;
            v20 = v26;
            *(_DWORD *)v19 = v26 >> 4;
            v21 = v27;
            v19[1] = v20;
            v19[2] = v21;
            v19[3] = 0;
            v15 += v20;
            v13 = v19 + 3;
            v14 -= v20;
          }
          while (v14);
        }
      }
    }
    else
    {
LABEL_15:
      v8 = 0;
    }
    mach_vm_deallocate(*MEMORY[0x24BDB1040], data, dataCnt);
  }
  return v8;
}

void free_uniquing_table_chunks(uint64_t a1)
{
  mach_vm_size_t *v1;
  vm_map_t *v2;
  mach_vm_size_t *v3;

  v1 = *(mach_vm_size_t **)(a1 + 44);
  if (v1)
  {
    v2 = (vm_map_t *)MEMORY[0x24BDB1040];
    do
    {
      mach_vm_deallocate(*v2, v1[2], v1[1]);
      v3 = (mach_vm_size_t *)v1[3];
      free(v1);
      v1 = v3;
    }
    while (v3);
  }
}

mach_vm_size_t *uniquing_table_chunk_from_slots(mach_vm_address_t a1, unsigned int a2)
{
  mach_vm_size_t *v4;
  mach_vm_size_t *v5;
  mach_vm_size_t v6;
  vm_map_t *v7;
  mach_vm_address_t address;

  v4 = (mach_vm_size_t *)malloc_type_malloc(0x20uLL, 0x102004078DD3916uLL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)v4 = a2;
    v6 = 16 * a2;
    v4[1] = v6;
    v4[3] = 0;
    address = 0;
    v7 = (vm_map_t *)MEMORY[0x24BDB1040];
    if (mach_vm_allocate(*MEMORY[0x24BDB1040], &address, v6, 167772161) || mach_vm_copy(*v7, a1, v5[1], address))
    {
      free(v5);
      return 0;
    }
    else
    {
      v5[2] = address;
    }
  }
  return v5;
}

uint64_t uniquing_table_remote_retain(uint64_t result)
{
  int v1;

  if (!result)
    uniquing_table_remote_retain_cold_1();
  v1 = *(_DWORD *)(result + 64);
  if (!v1)
    uniquing_table_remote_retain_cold_2();
  *(_DWORD *)(result + 64) = v1 + 1;
  return result;
}

void uniquing_table_remote_release(_DWORD *a1)
{
  int v2;
  int v3;

  if (a1)
  {
    v2 = a1[16];
    if (!v2)
      uniquing_table_remote_release_cold_1();
    v3 = v2 - 1;
    a1[16] = v3;
    if (!v3)
    {
      free_uniquing_table_chunks((uint64_t)a1);
      free(a1);
    }
  }
}

uint64_t uniquing_table_remote_enumerate_chunks(uint64_t result, uint64_t a2)
{
  unsigned int *i;

  if (result)
  {
    if (!a2)
      uniquing_table_remote_enumerate_chunks_cold_1();
    for (i = *(unsigned int **)(result + 44); i; i = (unsigned int *)*((_QWORD *)i + 3))
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *((_QWORD *)i + 2), *i);
  }
  return result;
}

uint64_t uniquing_table_create(unsigned int a1, unsigned int a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *pages;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if (a2 < a1)
    return 0;
  v2 = (_QWORD *)MEMORY[0x24BDB1100];
  v3 = 16 * (unint64_t)a1 / *MEMORY[0x24BDB1100] * *MEMORY[0x24BDB1100] <= 0x100000
     ? 0x100000
     : 16 * (unint64_t)a1 / *MEMORY[0x24BDB1100] * *MEMORY[0x24BDB1100];
  v4 = 16 * (unint64_t)a2 / *MEMORY[0x24BDB1100] * *MEMORY[0x24BDB1100];
  if (v3 > v4)
    return 0;
  if (dword_2544F43D8
    || (bzero(&global_stack_uniquing_state, 0x2828uLL),
        qword_2544F3BB8 = (uint64_t)&global_stack_uniquing_state,
        qword_2544F3BC0 = (uint64_t)&global_stack_uniquing_state + 4104,
        dword_2544F43D8 = 1,
        pthread_key_create((pthread_key_t *)&global_stack_uniquing_state + 1285, (void (__cdecl *)(void *))msl_tsd_destroy)))
  {
    if (!dword_2544F43DC)
      msl_printf(3);
  }
  else
  {
    dword_2544F43DC = 1;
  }
  pages = (void *)sld_allocate_pages((*v2 + 1679) & -*v2);
  v5 = (uint64_t)pages;
  if (pages)
  {
    bzero(pages, 0x690uLL);
    v8 = 0;
    v9 = 96;
    do
    {
      *(_QWORD *)(v5 + v9) = v3;
      v10 = 4 * v3;
      if (4 * v3 <= v3)
        break;
      if (v8 > 8)
        break;
      ++v8;
      v9 += 160;
      v3 *= 4;
    }
    while (v10 <= v4);
    uniquing_table_initialize(v5);
  }
  return v5;
}

mach_vm_address_t msl_tsd_destroy(mach_vm_address_t result)
{
  if (result)
    return sld_deallocate_pages(result, 0x2828uLL);
  return result;
}

uint64_t uniquing_table_initialize(uint64_t a1)
{
  mach_vm_size_t v2;
  uint64_t result;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v2 = *(_QWORD *)(a1 + 96);
  result = sld_allocate_pages(v2);
  *(_QWORD *)(a1 + 72) = result;
  v4 = (v2 >> 4) & 0xFFFFFFFFFFFFFFELL;
  *(_DWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 84) = v4;
  *(_DWORD *)(a1 + 88) = 19;
  v5 = (unsigned int *)(a1 + 224);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  *(_QWORD *)(a1 + 16) = v2;
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a1 + 60) & 0xF9 | 4;
  *(_QWORD *)(a1 + 52) = *(_QWORD *)(a1 + 1536);
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)a1 = v2 / *MEMORY[0x24BDB1100];
  *(_QWORD *)(a1 + 8) = v4;
  do
  {
    v7 = __ldxr((unsigned int *)&uniquing_table_initialize_process_wide_generation);
    v8 = v7 + 1;
  }
  while (__stxr(v8, (unsigned int *)&uniquing_table_initialize_process_wide_generation));
  *(_DWORD *)(a1 + 1676) = v8;
  atomic_store(0, (unsigned int *)(a1 + 1672));
  return result;
}

uint64_t uniquing_table_is_husk(uint64_t result)
{
  unsigned int v1;

  if (result)
  {
    v1 = atomic_load((unsigned int *)(result + 1672));
    return v1 >> 31;
  }
  return result;
}

uint64_t uniquing_table_destroy_husk_exclusive(mach_vm_address_t a1)
{
  unsigned int v1;

  if (!a1 || (v1 = atomic_load((unsigned int *)(a1 + 1672)), (v1 & 0x80000000) == 0))
    uniquing_table_destroy_husk_exclusive_cold_1();
  return sld_deallocate_pages(a1, 0x690uLL);
}

void uniquing_table_deinitialize(uint64_t a1, int a2)
{
  unsigned int v4;

  if (a1)
  {
    if (!a2)
      __malloc_lock_stack_logging();
    v4 = atomic_load((unsigned int *)(a1 + 1672));
    if ((v4 & 0x80000000) == 0)
    {
      atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 1672));
      uniquing_table_release(a1 + 160 * v4 + 72, 1);
      if (a2)
        return;
LABEL_8:
      __malloc_unlock_stack_logging();
      return;
    }
    msl_printf(3);
    if (!a2)
      goto LABEL_8;
  }
}

void uniquing_table_release(uint64_t a1, int a2)
{
  unsigned int *v4;
  unsigned int v5;

  v4 = (unsigned int *)(a1 + 152);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  if (!v5)
    uniquing_table_release_cold_1();
  if (v5 == 1)
  {
    if (!a2)
      __malloc_lock_stack_logging();
    if (atomic_load(v4))
      uniquing_table_release_cold_2();
    sld_deallocate_pages(*(_QWORD *)a1, *(_QWORD *)(a1 + 24));
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    if (!a2)
      __malloc_unlock_stack_logging();
  }
}

uint64_t uniquing_table_stack_retain(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  _QWORD *hash_cache;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v14;

  if (!a1)
    return 0;
  v14 = 0;
  hash_cache = msl_get_hash_cache(a3, &v14);
  v9 = v14;
  thread_stack_pcs();
  v10 = hash_cache[1026];
  if (*(_DWORD *)(v10 + 4096) <= (a2 + 2))
  {
    *a4 = -1;
LABEL_9:
    v12 = 0;
    if (!v9)
      return v12;
    goto LABEL_5;
  }
  *(_DWORD *)(v10 + 4100) = a2 + 2;
  v11 = uniquing_table_stack_retain_internal(a1, (uint64_t)hash_cache, v9 | a3);
  *a4 = v11;
  if (v11 == -1)
    goto LABEL_9;
  v12 = 1;
  if (v9)
LABEL_5:
    __malloc_unlock_stack_logging();
  return v12;
}

_QWORD *msl_get_hash_cache(int a1, _DWORD *a2)
{
  _QWORD *v4;
  _QWORD *pages;

  if (!dword_2544F43DC)
    return 0;
  v4 = pthread_getspecific(qword_2544F43D0);
  if (!v4)
  {
    if (pthread_self_is_exiting_np())
    {
      if (!a1)
      {
        __malloc_lock_stack_logging();
        *a2 = 1;
      }
      return &global_stack_uniquing_state;
    }
    else
    {
      pages = (_QWORD *)sld_allocate_pages(0x2828uLL);
      if (!pages)
        msl_get_hash_cache_cold_1();
      v4 = pages;
      bzero(pages, 0x2828uLL);
      v4[1026] = v4;
      v4[1027] = v4 + 513;
      pthread_setspecific(qword_2544F43D0, v4);
    }
  }
  return v4;
}

uint64_t uniquing_table_stack_retain_internal(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  unsigned __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  unsigned int v24;
  unsigned int *v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  unsigned __int128 *v32;
  unsigned __int128 v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned __int128 *v42;
  unsigned int v43;
  unsigned __int128 *v44;
  BOOL v45;
  unsigned __int128 *v46;
  unsigned int v47;
  unsigned __int128 v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  unsigned __int128 v53;
  _BOOL4 v55;
  unint64_t v56;
  unsigned __int128 v57;
  int v58;
  BOOL v59;
  uint64_t v60;
  unsigned int v61;
  unsigned __int128 v62;
  uint64_t v63;
  unsigned int v64;
  unsigned __int128 v65;
  unsigned __int128 v66;
  int v67;
  unsigned int v68;
  BOOL v69;
  unsigned int v70;
  uint64_t v71;
  int v72;
  _QWORD *v73;
  unsigned int v74;
  unsigned __int128 v75;
  unsigned __int128 v76;
  BOOL v78;
  unsigned __int128 v79;
  unsigned __int128 *v80;
  unsigned __int128 v81;
  uint64_t v82;
  unsigned __int128 *v83;
  unsigned __int128 v84;
  uint64_t v85;
  signed int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  mach_vm_address_t v90;
  uint64_t v91;
  mach_vm_address_t v92;
  mach_vm_size_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  mach_vm_size_t v97;
  uint64_t pages;
  mach_vm_address_t v99;
  uint64_t v100;
  _DWORD *v101;
  unsigned int *v102;
  unsigned int v103;
  uint64_t v104;
  unsigned __int128 *v105;
  unsigned __int128 v106;
  unsigned __int128 v108;
  unsigned int v109;
  unsigned int v110;
  unint64_t v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  unsigned int v115;
  unsigned int v116;
  uint64_t v117;
  uint64_t v118;
  char v120;
  unsigned int v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unsigned int v125;
  uint64_t v126;
  int v127;
  unsigned __int128 __pattern4;
  vm_prot_t cur_protection[4];

  v3 = a2;
  v116 = *(_DWORD *)(*(_QWORD *)(a2 + 8208) + 4100);
  v5 = uniquing_table_retain(a1);
  if (!v5)
    return 0xFFFFFFFFLL;
  v7 = v5;
  v8 = *(_QWORD *)(v3 + 8208);
  v9 = *(unsigned int *)(v8 + 4096);
  v120 = *(_BYTE *)(a1 + 60);
  if ((v120 & 4) != 0)
  {
    v10 = *(_DWORD *)(a1 + 1676);
    if (*(_DWORD *)(v3 + 10276) == v10)
    {
      if (*(_DWORD *)(v3 + 10272) == -1)
        goto LABEL_17;
      v11 = *(_QWORD *)(v3 + 8216);
      v12 = *(unsigned int *)(v11 + 4096);
      v13 = v12 - *(_DWORD *)(v11 + 4100);
      if (v13 >= (int)v9 - *(_DWORD *)(v8 + 4100))
        v13 = v9 - *(_DWORD *)(v8 + 4100);
      if (v13 < 1)
        goto LABEL_17;
      v14 = (v13 + 1);
      v15 = ~v13;
      v16 = (uint64_t *)(v8 + 8 * v9 - 8);
      v17 = (uint64_t *)(v11 + 8 * v12 - 8);
      v18 = 1;
      while (1)
      {
        v20 = *v17--;
        v19 = v20;
        v21 = *v16--;
        if (v19 != v21)
          break;
        if (v14 == ++v18)
          goto LABEL_14;
      }
      v15 = -(int)v18;
      LODWORD(v14) = v18;
LABEL_14:
      v9 = (v9 + v15 + 1);
      v23 = v14 >= 2;
      v24 = v14 - 2;
      if (v23)
        v22 = *(unsigned int *)(v3 + 4 * v24 + 8224);
      else
LABEL_17:
        v22 = 0xFFFFFFFFLL;
    }
    else
    {
      bzero(*(void **)(v3 + 8216), 0x1008uLL);
      LODWORD(__pattern4) = -1;
      memset_pattern4((void *)(v3 + 8224), &__pattern4, 0x800uLL);
      *(_DWORD *)(v3 + 10272) = -1;
      *(_DWORD *)(v3 + 10276) = v10;
      v22 = 0xFFFFFFFFLL;
      v9 = *(unsigned int *)(*(_QWORD *)(v3 + 8208) + 4096);
    }
    if (v9 <= v116)
    {
      if (*(_DWORD *)(v7 + 12) <= v22)
        uniquing_table_stack_retain_internal_cold_15();
      v105 = (unsigned __int128 *)(*(_QWORD *)v7 + 16 * v22);
      do
        v106 = __ldxp(v105);
      while (__stxp(__PAIR128__(*((_QWORD *)&v106 + 1) + 0x100000000, v106), v105));
      if (!HIDWORD(*((_QWORD *)&v106 + 1)))
        uniquing_table_stack_retain_internal_cold_14();
      if ((*((_QWORD *)&v106 + 1) & 0x8000000000000000) != 0)
      {
        do
          v108 = __ldxp(v105);
        while (__stxp(__PAIR128__(*((_QWORD *)&v108 + 1) - 0x100000000, v108), v105));
      }
      uniquing_table_release(v7, a3);
      return v22;
    }
  }
  else
  {
    v22 = 0xFFFFFFFFLL;
  }
  v122 = v3 + 8224;
  v25 = (unsigned int *)((unint64_t)&__pattern4 | 0xC);
  v113 = a1;
  v114 = v3;
  while (2)
  {
    v27 = *(_DWORD *)(v7 + 8);
    v26 = *(_DWORD *)(v7 + 12);
    v28 = *(_QWORD *)(v3 + 8208);
    v123 = *(unsigned int *)(v28 + 4096);
    v126 = v28;
    v29 = *(_DWORD *)(v28 + 4100);
    v30 = *(_DWORD *)(v7 + 16);
    v31 = *(_QWORD *)v7;
    if ((v120 & 4) == 0 && (_DWORD)v22 != -1)
      uniquing_table_stack_retain_internal_cold_1();
    if ((_DWORD)v22 != -1)
    {
      v32 = (unsigned __int128 *)(v31 + 16 * v22);
      do
        v33 = __ldxp(v32);
      while (__stxp(v33, v32));
      if (!HIDWORD(*((_QWORD *)&v33 + 1)))
        uniquing_table_stack_retain_internal_cold_11();
    }
    if ((v120 & 4) != 0)
      v34 = *(unsigned int *)(v3 + 10272);
    else
      v34 = 0xFFFFFFFFLL;
    v117 = v9;
    v115 = v22;
    if (v29 >= v9)
    {
      v39 = v9;
      v38 = v22;
      goto LABEL_149;
    }
    v35 = v26 - v27;
    v124 = (v26 - v27 - 1);
    v36 = v22;
    v37 = v9;
    v38 = v22;
    v39 = v9;
    v121 = v35 / ((2 * v30) | 1u);
    do
    {
      LODWORD(v9) = v37 - 1;
      v40 = *(_DWORD *)(v7 + 16);
      if (!v40)
      {
        LODWORD(v9) = v37;
        LODWORD(v22) = v36;
        break;
      }
      v125 = v39;
      v41 = 2 * (v9 <= v29);
      v42 = *(unsigned __int128 **)(v126 + 8 * v9);
      v22 = *(_DWORD *)(v7 + 8) + (((16 * v36) ^ ((unint64_t)v42 >> 2)) % v124);
      if (2 * (v9 <= v29) <= 1)
        v43 = 1;
      else
        v43 = 2 * (v9 <= v29);
      v44 = (unsigned __int128 *)(v31 + 16 * v36);
      v45 = v36 == -1 || (_DWORD)v34 == v36;
      v5 = v45;
LABEL_41:
      --v40;
      v46 = (unsigned __int128 *)(v31 + 16 * v22);
      do
      {
        v48 = __ldxp(v46);
        v47 = DWORD2(v48);
        v6 = (unsigned __int128 *)v48;
      }
      while (__stxp(v48, v46));
      v49 = 0;
      v50 = HIDWORD(*((_QWORD *)&v48 + 1));
      while (1)
      {
        v51 = v50;
        v52 = v50 == 0;
        if ((_DWORD)v51)
        {
          if (v36 != -1 && v49)
          {
            do
              v53 = __ldxp(v44);
            while (__stxp(__PAIR128__(*((_QWORD *)&v53 + 1) - 0x100000000, v53), v44));
            if (!HIDWORD(*((_QWORD *)&v53 + 1)))
              uniquing_table_stack_retain_internal_cold_8(v5, v34, (uint64_t)v6);
          }
          v55 = v6 != v42 || v47 != v36;
          if (!(_DWORD)v41 || v55)
          {
            if (!v55)
            {
              v5 = v34;
              v39 = v125;
LABEL_110:
              *(_DWORD *)(v122 + 4 * (v123 - v37)) = v22;
              v34 = v5;
              goto LABEL_138;
            }
            v22 = v22 + v40 * v121 + 1;
            v70 = *(_DWORD *)(v7 + 12);
            if (v22 >= v70)
              v22 = v22 - v70 + *(_DWORD *)(v7 + 8);
            if (!v40)
            {
              LODWORD(v9) = v37;
              LODWORD(v22) = v36;
              v39 = v125;
              goto LABEL_149;
            }
            goto LABEL_41;
          }
          goto LABEL_56;
        }
        if (((v5 | v49) & 1) == 0)
          break;
LABEL_57:
        v56 = v47 | (unint64_t)(v51 << 32);
        do
        {
          while (1)
          {
            v57 = __ldxp(v46);
            v47 = DWORD2(v57);
            v58 = (_QWORD)v57 != (_QWORD)v6;
            if (*((_QWORD *)&v57 + 1) != v56)
              ++v58;
            if (!v58)
              break;
            if (!__stxp(v57, v46))
              goto LABEL_64;
          }
        }
        while (__stxp(__PAIR128__(v36 | ((unint64_t)(v51 + v43) << 32), (unint64_t)v42), v46));
LABEL_64:
        v50 = HIDWORD(*((_QWORD *)&v57 + 1));
        v59 = *((_QWORD *)&v57 + 1) == v56 && (_QWORD)v57 == (_QWORD)v6;
        v6 = (unsigned __int128 *)v57;
        if (v59)
        {
          if ((_DWORD)v51)
            v71 = 4294967293;
          else
            v71 = v43;
          v72 = v71;
LABEL_106:
          if (v36 == (_DWORD)v38)
          {
LABEL_107:
            v39 = v37 - 1;
            v38 = v22;
            v5 = v22;
            if (v72 != -3)
            {
              v39 = v37 - 1;
              v38 = v22;
              v5 = v22;
              if ((_DWORD)v34 != v36)
              {
                uniquing_table_node_release_internal(v7, v34);
                v39 = v37 - 1;
                v38 = v22;
                v5 = v22;
              }
            }
            goto LABEL_110;
          }
          v73 = (_QWORD *)(v126 + 8 * v37);
          v74 = v36;
          while ((unint64_t)v73 < v126 + 8 * v123)
          {
            if (v74 == -1)
              break;
            v6 = (unsigned __int128 *)(v31 + 16 * v74);
            do
            {
              v75 = __ldxp(v6);
              v74 = DWORD2(v75);
              v5 = v75;
            }
            while (__stxp(v75, v6));
            if (!HIDWORD(*((_QWORD *)&v75 + 1)) || *v73 != (_QWORD)v75)
              break;
            ++v73;
            if ((_DWORD)v38 == DWORD2(v75))
              goto LABEL_107;
          }
          if (v72 != -3)
            v41 = v71;
          if ((_DWORD)v22 == -1)
            goto LABEL_136;
          do
          {
            v76 = __ldxp(v46);
            v5 = __stxp(__PAIR128__(*((_QWORD *)&v76 + 1) - (v41 << 32), v76), v46);
          }
          while ((_DWORD)v5);
          if (HIDWORD(v76) < v41)
            uniquing_table_stack_retain_internal_cold_8(v5, v34, (uint64_t)v6);
          if (v72 == -3)
          {
LABEL_136:
            v39 = v125;
          }
          else
          {
            v78 = HIDWORD(v76) != (_DWORD)v41 || (_DWORD)v34 == v36 || v36 == -1;
            v39 = v125;
            if (!v78)
            {
              do
                v79 = __ldxp(v44);
              while (__stxp(__PAIR128__(*((_QWORD *)&v79 + 1) - 0x100000000, v79), v44));
              LODWORD(v9) = v125;
              LODWORD(v22) = v38;
              if (!HIDWORD(*((_QWORD *)&v79 + 1)))
                uniquing_table_stack_retain_internal_cold_8(v5, v34, (uint64_t)v6);
              goto LABEL_138;
            }
          }
          LODWORD(v9) = v39;
          LODWORD(v22) = v38;
          goto LABEL_138;
        }
      }
      do
      {
        v62 = __ldxp(v44);
        v61 = DWORD2(v62);
        v60 = v62;
      }
      while (__stxp(v62, v44));
      v63 = HIDWORD(*((_QWORD *)&v62 + 1));
      if (HIDWORD(v62))
      {
        v109 = v5;
        v110 = v29;
        while ((v63 & 0x80000000) == 0)
        {
          *(_QWORD *)&__pattern4 = v60;
          *((_QWORD *)&__pattern4 + 1) = __PAIR64__(v63, v61);
          v112 = v63;
          do
            v64 = __ldaxr(v25);
          while (__stlxr(v64 + 1, v25));
          do
            v65 = __ldaxp(&__pattern4);
          while (__stlxp(v65, &__pattern4));
          do
          {
            while (1)
            {
              v66 = __ldxp(v44);
              v67 = (_QWORD)v66 != v60;
              if (*((_QWORD *)&v66 + 1) != (v61 | ((unint64_t)v112 << 32)))
                ++v67;
              if (!v67)
                break;
              if (!__stxp(v66, v44))
                goto LABEL_84;
            }
          }
          while (__stxp(v65, v44));
LABEL_84:
          v111 = v66 ^ v60 | *((_QWORD *)&v66 + 1) ^ (v61 | ((unint64_t)v112 << 32));
          if (v111)
          {
            v61 = DWORD2(v66);
            v60 = v66;
          }
          v25 = (unsigned int *)((unint64_t)&__pattern4 | 0xC);
          if (v111)
            v68 = HIDWORD(v66);
          else
            v68 = v112;
          LODWORD(v63) = v68;
          if (v111)
            v69 = v68 == 0;
          else
            v69 = 1;
          v5 = v109;
          v29 = v110;
          if (v69)
          {
            if (!v111)
              break;
            goto LABEL_141;
          }
        }
LABEL_56:
        v49 = v52;
        if ((v51 & 0x80000000) != 0)
        {
          v71 = 4294967293;
          v72 = -3;
          goto LABEL_106;
        }
        goto LABEL_57;
      }
LABEL_141:
      if ((_DWORD)v38 == -1)
      {
        v39 = v125;
        LODWORD(v9) = v125;
        LODWORD(v22) = -1;
      }
      else
      {
        v80 = (unsigned __int128 *)(v31 + 16 * v38);
        v39 = v125;
        do
          v81 = __ldxp(v80);
        while (__stxp(v81, v80));
        LODWORD(v9) = v125;
        LODWORD(v22) = v38;
        if (!HIDWORD(*((_QWORD *)&v81 + 1)))
          uniquing_table_stack_retain_internal_cold_11();
      }
LABEL_138:
      v36 = v22;
      v37 = v9;
    }
    while (v9 > v29);
LABEL_149:
    if ((v120 & 4) != 0)
    {
      v82 = v113;
      v3 = v114;
      *(_DWORD *)(v114 + 10272) = v34;
      if (v9 > v29)
      {
        v22 = v38;
        v9 = v39;
        goto LABEL_162;
      }
    }
    else
    {
      v82 = v113;
      v3 = v114;
      if ((_DWORD)v34 != -1)
      {
        v83 = (unsigned __int128 *)(v31 + 16 * v34);
        do
          v84 = __ldxp(v83);
        while (__stxp(__PAIR128__(*((_QWORD *)&v84 + 1) - 0x100000000, v84), v83));
        if (!HIDWORD(*((_QWORD *)&v84 + 1)))
          uniquing_table_stack_retain_internal_cold_8(v5, v34, (uint64_t)v6);
      }
      if (v9 > v29)
      {
        v9 = v117;
        v22 = v115;
        if (*(_DWORD *)(*(_QWORD *)(v114 + 8208) + 4096) != (_DWORD)v117)
          uniquing_table_stack_retain_internal_cold_5();
        goto LABEL_162;
      }
    }
    if ((_DWORD)v22 != (_DWORD)v38)
      uniquing_table_stack_retain_internal_cold_7();
    v22 = v38;
    v45 = (_DWORD)v9 == (_DWORD)v39;
    v9 = v39;
    if (!v45)
      uniquing_table_stack_retain_internal_cold_6();
LABEL_162:
    if (v9 > v116)
    {
      v85 = v22;
      if (!a3)
        __malloc_lock_stack_logging();
      v86 = atomic_load((unsigned int *)(v82 + 1672));
      v87 = v82 + 160 * v86 + 72;
      uniquing_table_release(v7, 1);
      if (v7 != v87)
      {
        v5 = uniquing_table_retain(v82);
        v7 = v5;
        goto LABEL_176;
      }
      v88 = atomic_load((unsigned int *)(v82 + 1672));
      if ((int)v88 >= 10)
        uniquing_table_stack_retain_internal_cold_2();
      if ((v88 & 0x80000000) != 0)
        uniquing_table_stack_retain_internal_cold_3();
      if (v88 >= 9)
      {
        v5 = msl_printf(3);
        v7 = 0;
        goto LABEL_176;
      }
      v118 = v9;
      v89 = v82 + 160 * v88;
      v92 = *(_QWORD *)(v89 + 72);
      v91 = v89 + 72;
      v90 = v92;
      v93 = *(_QWORD *)(v91 + 24);
      v94 = *(_DWORD *)(v91 + 12);
      v127 = *(_DWORD *)(v91 + 16);
      v95 = v88 + 1;
      v96 = v82 + 160 * (v88 + 1);
      v97 = *(_QWORD *)(v96 + 96);
      pages = sld_allocate_pages(v97);
      *(_QWORD *)&__pattern4 = pages;
      if (!pages)
      {
        v5 = msl_printf(3);
        goto LABEL_175;
      }
      v99 = pages;
      *(_QWORD *)cur_protection = 0;
      if (mach_vm_remap(*MEMORY[0x24BDB1040], (mach_vm_address_t *)&__pattern4, v93, 0, 0x4000, *MEMORY[0x24BDB1040], v90, 0, &cur_protection[1], cur_protection, 1u))
      {
        msl_printf(3);
        v5 = sld_deallocate_pages(v99, v97);
LABEL_175:
        v7 = 0;
        v3 = v114;
        v9 = v118;
LABEL_176:
        v25 = (unsigned int *)((unint64_t)&__pattern4 | 0xC);
      }
      else
      {
        v100 = (v97 >> 4) & 0xFFFFFFFFFFFFFFELL;
        *(_QWORD *)(v96 + 72) = v99;
        v25 = (unsigned int *)((unint64_t)&__pattern4 | 0xC);
        v101 = (_DWORD *)(v113 + 160 * v95);
        v101[20] = v94;
        v101[21] = v100;
        v101[22] = v127 + 3;
        v102 = v101 + 56;
        do
          v103 = __ldaxr(v102);
        while (__stlxr(v103 + 1, v102));
        *(_QWORD *)(v113 + 32) = v99;
        v104 = v113;
        *(_QWORD *)(v113 + 16) = v97;
        *(_QWORD *)v113 = v97 / *MEMORY[0x24BDB1100];
        *(_QWORD *)(v113 + 8) = v100;
        atomic_store(v95, (unsigned int *)(v113 + 1672));
        uniquing_table_release(v91, 1);
        v5 = uniquing_table_retain(v104);
        v7 = v5;
        v3 = v114;
        v9 = v118;
      }
      v22 = v85;
      if (a3)
      {
        if (!v7)
          return 0xFFFFFFFFLL;
        continue;
      }
      __malloc_unlock_stack_logging();
      if (!v7)
        return 0xFFFFFFFFLL;
      continue;
    }
    break;
  }
  uniquing_table_release(v7, a3);
  if ((_DWORD)v22 == -1)
    uniquing_table_stack_retain_internal_cold_4();
  *(int8x16_t *)(v3 + 8208) = vextq_s8(*(int8x16_t *)(v3 + 8208), *(int8x16_t *)(v3 + 8208), 8uLL);
  return v22;
}

void uniquing_table_stack_release(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    if (a2 == -1)
    {
      msl_printf(3);
    }
    else
    {
      v5 = uniquing_table_retain(a1);
      if (v5)
      {
        v6 = v5;
        uniquing_table_node_release_internal(v5, a2);
        uniquing_table_release(v6, a3);
      }
    }
  }
}

uint64_t uniquing_table_retain(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int *v4;
  unsigned int v5;
  BOOL v6;

  v1 = *(unsigned int *)(a1 + 1672);
  while ((v1 & 0x80000000) == 0)
  {
    v2 = a1 + 160 * v1;
    v3 = *(_DWORD *)(v2 + 224);
    if (v3)
    {
      v4 = (unsigned int *)(v2 + 224);
      do
      {
        v5 = __ldaxr(v4);
        if (v5 == v3)
        {
          if (!__stlxr(v3 + 1, v4))
            break;
        }
        else
        {
          __clrex();
        }
        v3 = v5;
      }
      while (v5);
      if (v5)
        return a1 + 160 * v1 + 72;
    }
    v6 = *(unsigned int *)(a1 + 1672) == v1;
    v1 = *(unsigned int *)(a1 + 1672);
    if (v6)
      uniquing_table_retain_cold_1();
  }
  return 0;
}

uint64_t uniquing_table_node_release_internal(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned __int128 *v6;
  unsigned __int128 v7;

  if (a2 != -1)
  {
    v2 = 0;
    v3 = *(unsigned int *)(result + 12);
    v4 = 0xFFFFFFFFLL;
    v5 = a2;
    while (1)
    {
      if (v5 == v4)
        return msl_printf(3);
      if (v2 == 512)
        return msl_printf(3);
      v4 = v5;
      if (v5 >= v3)
        return msl_printf(3);
      v6 = (unsigned __int128 *)(*(_QWORD *)result + 16 * v5);
      do
        v7 = __ldxp(v6);
      while (__stxp(__PAIR128__(*((_QWORD *)&v7 + 1) - 0x100000000, v7), v6));
      if (HIDWORD(v7) != 1)
        break;
      v5 = DWORD2(v7);
      ++v2;
      if (DWORD2(v7) == -1)
        return result;
    }
    if (!HIDWORD(v7))
      uniquing_table_node_release_internal_cold_1();
  }
  return result;
}

uint64_t uniquing_table_node_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 659, a4);
}

uint64_t msl_get_lite_wrapped_zone()
{
  if (active_lite_zone)
    return *(_QWORD *)(active_lite_zone + 200);
  else
    return 0;
}

uint64_t msl_is_stack_logging_lite_enabled()
{
  return stack_logging_lite_enabled;
}

void enable_stack_logging_lite()
{
  stack_logging_lite_enabled = 1;
}

void disable_stack_logging_lite()
{
  stack_logging_lite_enabled = 0;
}

uint64_t create_and_insert_lite_zone(_BYTE *a1)
{
  mach_vm_size_t v2;
  uint64_t result;
  malloc_zone_t *v4;
  malloc_zone_t *zone;
  uint64_t v6;

  *a1 = 0;
  if (active_lite_zone)
    create_and_insert_lite_zone_cold_1();
  v2 = (*MEMORY[0x24BDB1100] + 207) & -*MEMORY[0x24BDB1100];
  result = sld_allocate_pages(v2);
  if (result)
  {
    v4 = (malloc_zone_t *)result;
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = stack_logging_lite_size;
    *(_QWORD *)(result + 24) = stack_logging_lite_malloc;
    *(_QWORD *)(result + 32) = stack_logging_lite_calloc;
    *(_QWORD *)(result + 40) = stack_logging_lite_valloc;
    *(_QWORD *)(result + 48) = stack_logging_lite_free;
    *(_QWORD *)(result + 56) = stack_logging_lite_realloc;
    *(_QWORD *)(result + 64) = stack_logging_lite_destroy;
    *(_QWORD *)(result + 72) = "MallocStackLoggingLiteZone_Wrapper";
    *(_QWORD *)(result + 80) = stack_logging_lite_batch_malloc;
    *(_QWORD *)(result + 88) = stack_logging_lite_batch_free;
    *(_QWORD *)(result + 96) = stack_logging_lite_zone_introspect;
    *(_DWORD *)(result + 104) = 15;
    *(_QWORD *)(result + 112) = stack_logging_lite_memalign;
    *(_QWORD *)(result + 120) = stack_logging_lite_free_definite_size;
    *(_QWORD *)(result + 128) = stack_logging_lite_pressure_relief;
    *(_QWORD *)(result + 136) = stack_logging_lite_claimed_address;
    *(_QWORD *)(result + 144) = 0;
    *(_QWORD *)(result + 152) = stack_logging_lite_malloc_with_options;
    *(_OWORD *)(result + 176) = 0u;
    *(_OWORD *)(result + 192) = 0u;
    *(_OWORD *)(result + 160) = 0u;
    zone = malloc_create_zone(0, 0x400u);
    malloc_zone_unregister(zone);
    v4[1].free = (void (__cdecl *)(_malloc_zone_t *, void *))zone;
    active_lite_zone = (uint64_t)v4;
    v6 = off_2544F4470();
    lite_helper_zone = v6;
    if (zone->version < 0xF || !zone[1].reserved1 || *(_DWORD *)(v6 + 104) < 0xFu || !*(_QWORD *)(v6 + 152))
      v4[1].reserved1 = 0;
    mprotect(v4, v2, 1);
    malloc_zone_register(v4);
    malloc_zone_register(zone);
    malloc_set_zone_name(v4, "MallocStackLoggingLiteZone_Wrapper");
    malloc_set_zone_name(zone, "MallocStackLoggingLiteZone");
    result = off_2544F4468(v4);
    *a1 = 1;
  }
  return result;
}

uint64_t stack_logging_lite_size(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 16))();
  if (v3)
    return v3 - msl_payload_get_size_info((_QWORD *)(v3 + a2 - 8), (unsigned int *)(v3 + a2 - 16), 0, 0) - 8;
  else
    return (*(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 16))(lite_helper_zone, a2);
}

uint64_t stack_logging_lite_malloc(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 24))(lite_helper_zone, a2);
  v3 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 24))(lite_helper_zone, a2);
  v7 = 0;
  v8 = 0;
  v4 = 0;
  if (required_allocation_size(v3, a2, (unint64_t *)&v8, &v7))
  {
    v5 = v7;
    v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 24))(v3, v7);
    if (v4)
      add_stack_to_ptr(v3, v4, a2, v8, v5);
  }
  return v4;
}

uint64_t stack_logging_lite_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(lite_helper_zone + 32))(lite_helper_zone, a2, a3);
  v5 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(lite_helper_zone + 32))(lite_helper_zone, a2, a3);
  if (is_mul_ok(a2, a3))
  {
    v8 = a2 * a3;
    v10 = 0;
    v11 = 0;
    v6 = 0;
    if (required_allocation_size(v5, v8, (unint64_t *)&v11, &v10))
    {
      v9 = v10;
      v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 32))(v5, 1, v10);
      if (v6)
        add_stack_to_ptr(v5, v6, v8, v11, v9);
    }
  }
  else
  {
    v6 = 0;
    *__error() = 12;
  }
  return v6;
}

uint64_t stack_logging_lite_valloc(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 40))(lite_helper_zone, a2);
  v3 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, unint64_t))(lite_helper_zone + 40))(lite_helper_zone, a2);
  v7 = 0;
  v8 = 0;
  v4 = 0;
  if (required_allocation_size(v3, a2, (unint64_t *)&v8, &v7))
  {
    v5 = v7;
    v4 = (*(uint64_t (**)(uint64_t, unint64_t))(v3 + 40))(v3, v7);
    if (v4)
      add_stack_to_ptr(v3, v4, a2, v8, v5);
  }
  return v4;
}

uint64_t stack_logging_lite_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int uniquing_table_index;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 200);
  v4 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  if (v4)
  {
    v5 = msl_payload_from_lite_zone_ptr_internal(a2, v4);
    uniquing_table_index = msl_payload_get_uniquing_table_index(v5);
    if (uniquing_table_index != -1)
    {
      v7 = global_uniquing_table();
      if (v7)
        uniquing_table_stack_release(v7, uniquing_table_index, 0);
    }
    v8 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 48);
    v9 = v3;
  }
  else
  {
    v9 = lite_helper_zone;
    v8 = *(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48);
  }
  return v8(v9, a2);
}

uint64_t stack_logging_lite_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char thread_options;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int uniquing_table_index;
  uint64_t v17;
  uint64_t v18;
  size_t v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v6 = *(_QWORD *)(a1 + 200);
  v7 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
  v8 = v7;
  if ((stack_logging_lite_enabled & 1) != 0)
  {
    thread_options = malloc_get_thread_options();
    v10 = v8 != 0;
    v11 = (thread_options & 4) == 0;
    if (v8)
      v12 = (thread_options & 4) == 0;
    else
      v12 = 0;
    if (v12)
    {
      v26 = 0;
      v27 = 0;
      v13 = 0;
      if (required_allocation_size(v6, a3, &v27, &v26))
      {
        v24 = 0;
        v25 = 0;
        msl_payload_get_size_info(&a2[v8 - 8], (unsigned int *)&a2[v8 - 16], &v25, &v24);
        v14 = *(_QWORD *)&a2[v8 - 8];
        v15 = v26;
        v13 = (char *)(*(uint64_t (**)(uint64_t, char *, unint64_t))(v6 + 56))(v6, a2, v26);
        if (v13)
        {
          uniquing_table_index = msl_payload_get_uniquing_table_index(v14);
          if (uniquing_table_index != -1)
          {
            v17 = global_uniquing_table();
            if (v17)
              uniquing_table_stack_release(v17, uniquing_table_index, 0);
          }
          if (v13 == a2)
          {
            v23 = (*(uint64_t (**)(uint64_t, char *))(v6 + 16))(v6, a2);
            v18 = v27;
            if (v23 == v8)
            {
              if (v27 <= v8 - v24)
                v18 = v8 - v24;
              v15 = v8;
            }
          }
          else
          {
            v18 = v27;
          }
          add_stack_to_ptr(v6, (uint64_t)v13, a3, v18, v15);
        }
      }
      return (uint64_t)v13;
    }
  }
  else
  {
    v11 = 0;
    v10 = v7 != 0;
  }
  if (!v10 && !v11)
    return (*(uint64_t (**)(uint64_t, char *, unint64_t))(lite_helper_zone + 56))(lite_helper_zone, a2, a3);
  v13 = (char *)stack_logging_lite_malloc(a1, a3);
  if (v13)
  {
    v20 = malloc_size(a2);
    v21 = malloc_size(v13);
    if (v20 >= v21)
      v22 = v21;
    else
      v22 = v20;
    memcpy(v13, a2, v22);
  }
  stack_logging_lite_free(a1, (uint64_t)a2);
  return (uint64_t)v13;
}

uint64_t stack_logging_lite_destroy(mach_vm_address_t a1)
{
  uint64_t result;

  if (!active_lite_zone)
    stack_logging_lite_destroy_cold_1();
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  result = mach_vm_deallocate(*MEMORY[0x24BDB1040], a1, (*MEMORY[0x24BDB1100] + 207) & -*MEMORY[0x24BDB1100]);
  if ((_DWORD)result)
    stack_logging_lite_destroy_cold_2();
  active_lite_zone = 0;
  return result;
}

uint64_t stack_logging_lite_batch_malloc(uint64_t a1, unint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(lite_helper_zone + 80))(lite_helper_zone, a2, a3, a4);
  v7 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(lite_helper_zone + 80))(lite_helper_zone, a2, a3, a4);
  v15 = 0;
  v16 = 0;
  if (!required_allocation_size(v7, a2, (unint64_t *)&v16, &v15))
    return 0;
  v8 = v15;
  v9 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t *, uint64_t))(v7 + 80))(v7, v15, a3, a4);
  v10 = v9;
  if ((_DWORD)v9)
  {
    v11 = v16;
    v12 = v9;
    do
    {
      v13 = *a3++;
      add_stack_to_ptr(v7, v13, a2, v11, v8);
      --v12;
    }
    while (v12);
  }
  return v10;
}

uint64_t stack_logging_lite_batch_free(uint64_t result, uint64_t *a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int uniquing_table_index;
  uint64_t v10;

  if (a3)
  {
    v4 = *(_QWORD *)(result + 200);
    v5 = a3;
    do
    {
      v6 = *a2;
      if (*a2)
      {
        v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, *a2);
        if (v7)
        {
          v8 = msl_payload_from_lite_zone_ptr_internal(v6, v7);
          uniquing_table_index = msl_payload_get_uniquing_table_index(v8);
          if (uniquing_table_index != -1)
          {
            v10 = global_uniquing_table();
            if (v10)
              uniquing_table_stack_release(v10, uniquing_table_index, 0);
          }
          result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v4, v6);
        }
        else
        {
          result = (*(uint64_t (**)(uint64_t, uint64_t))(lite_helper_zone + 48))(lite_helper_zone, v6);
        }
      }
      ++a2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t stack_logging_lite_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(lite_helper_zone + 112))(lite_helper_zone, a2, a3);
  v5 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(lite_helper_zone + 112))(lite_helper_zone, a2, a3);
  v9 = 0;
  v10 = 0;
  v6 = 0;
  if (required_allocation_size(v5, a3, (unint64_t *)&v10, &v9))
  {
    v7 = v9;
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v5 + 112))(v5, a2, v9);
    if (v6)
      add_stack_to_ptr(v5, v6, a3, v10, v7);
  }
  return v6;
}

uint64_t stack_logging_lite_pressure_relief()
{
  return 0;
}

uint64_t stack_logging_lite_claimed_address(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 200) + 136))();
}

uint64_t stack_logging_lite_malloc_with_options(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v11;
  uint64_t v12;

  if (stack_logging_lite_enabled != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(lite_helper_zone + 152))(lite_helper_zone, a2, a3, a4);
  v7 = *(_QWORD *)(a1 + 200);
  if ((malloc_get_thread_options() & 4) != 0)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(lite_helper_zone + 152))(lite_helper_zone, a2, a3, a4);
  v11 = 0;
  v12 = 0;
  v8 = 0;
  if (required_allocation_size(v7, a3, (unint64_t *)&v12, &v11))
  {
    v9 = v11;
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t))(v7 + 152))(v7, a2, v11, a4);
    if (v8)
      add_stack_to_ptr(v7, v8, a3, v12, v9);
  }
  return v8;
}

uint64_t msl_lite_block_size()
{
  if (active_lite_zone)
    return (*(uint64_t (**)(void))(*(_QWORD *)(active_lite_zone + 200) + 16))();
  else
    return 0;
}

uint64_t required_allocation_size(uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;

  result = 0;
  if (a2 <= 1)
    v6 = 1;
  else
    v6 = a2;
  if (v6 < 0xFFFFFFFFFFFFFFF8 && v6 + 8 < 0xFFFFFFFFFFFFFFF8)
  {
    v9 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(a1 + 96) + 8))(a1, v6);
    if (v9 >= v6
      && (v10 = v9,
          v11 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(a1 + 96) + 8))(a1, v6 + 8),
          v11 >= v10)
      && ((v12 = v11, v11 <= v10)
       || (v13 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(a1 + 96) + 8))(a1, v6 + 16),
           v14 = v13 >= v12,
           v12 = v13,
           v14)))
    {
      *a3 = v10;
      *a4 = v12;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void add_stack_to_ptr(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t invalid;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  _BOOL4 v17;
  unsigned int v18;

  invalid = msl_payload_get_invalid();
  if (!__malloc_stack_logging_is_reentered())
  {
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a2);
    if (v11 > a5)
    {
      a5 = v11;
      a4 = v11;
    }
    if (stack_logging_lite_enabled == 1)
    {
      __prepare_to_log_stacks_unlocked(1);
      v12 = global_uniquing_table();
      if (v12)
      {
        v13 = v12;
        if (a3 <= 1)
          v14 = 1;
        else
          v14 = a3;
        v15 = v14 + 8 < a5;
        v18 = 0;
        v16 = uniquing_table_stack_retain(v12, 2, 0, &v18);
        v17 = uniquing_table_node_count(v13) <= 0x400000;
        invalid = msl_payload_create(v18, v17, v15);
        if (!v16)
        {
          malloc_printf("MallocStackLogging: stack id is invalid. Turning off stack logging\n");
          msl_turn_off_stack_logging();
        }
      }
    }
  }
  msl_payload_set_in_lite_zone_ptr(a2, a3, a4, a5, invalid);
}

uint64_t stack_logging_lite_introspect_enumerator()
{
  return 0;
}

uint64_t stack_logging_lite_introspect_good_size(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 200) + 96) + 8))();
}

uint64_t stack_logging_lite_introspect_check()
{
  return 1;
}

void stack_logging_lite_introspect_log()
{
  malloc_printf("MallocStackLoggingLiteZone_Wrapper (empty))\n");
}

double stack_logging_lite_introspect_statistics(uint64_t a1, _OWORD *a2)
{
  double result;

  result = 0.0;
  *a2 = 0u;
  a2[1] = 0u;
  return result;
}

uint64_t stack_logging_lite_introspect_zone_locked()
{
  return 0;
}

void stack_logging_lite_introspect_print_task()
{
  malloc_printf("MallocStackLoggingLiteZone_Wrapper (empty))\n");
}

double stack_logging_lite_introspect_task_statistics(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  double result;

  result = 0.0;
  *a4 = 0u;
  a4[1] = 0u;
  return result;
}

uint64_t msl_printf(uint64_t a1)
{
  return msl_printf_allowStdErr(a1, 1);
}

uint64_t msl_printf_allowStdErr(uint64_t a1, int a2)
{
  uint64_t result;

  result = _simple_salloc();
  if (result)
  {
    getprogname();
    getpid();
    _simple_sprintf();
    _simple_vsprintf();
    if (a2 && (debug_mode & 1) == 0)
      _simple_put();
    if (!*MEMORY[0x24BDB1120])
    {
      _simple_string();
      _simple_asl_log();
    }
    return _simple_sfree();
  }
  else if (a2 && (debug_mode & 1) == 0)
  {
    getprogname();
    getpid();
    _simple_dprintf();
    return _simple_vdprintf();
  }
  return result;
}

uint64_t msl_printf_nostderr(uint64_t a1)
{
  return msl_printf_allowStdErr(a1, 0);
}

BOOL msl_should_reap_old_logs()
{
  return (msl_should_reap & 1) == 0;
}

BOOL msl_get_writable_log_dir(_BOOL8 result, unint64_t a2)
{
  _BYTE *v3;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDB0D28];
  if (result)
  {
    v3 = (_BYTE *)result;
    bzero(v4, 0x400uLL);
    if (msl_log_dir)
    {
      if (realpath_DARWIN_EXTSN(&msl_log_dir, v4)
        && access(v4, 2) != -1
        && !sandbox_query_approval_policy_for_path())
      {
        return _platform_strlcpy() < a2;
      }
      msl_printf(3);
    }
    if (realpath_DARWIN_EXTSN("/tmp/", v4) && access(v4, 2) != -1
      || tmp_dir && realpath_DARWIN_EXTSN(&tmp_dir, v4) && access(v4, 2) != -1)
    {
      return _platform_strlcpy() < a2;
    }
    result = 0;
    *v3 = 0;
  }
  return result;
}

char *msl_get_tmp_dir()
{
  return &tmp_dir;
}

char *msl_get_log_dir()
{
  return &msl_log_dir;
}

uint64_t msl_set_flags_from_environment(uint64_t a1)
{
  const char *v1;
  uint64_t result;
  BOOL v3;
  int v4;

  msl_cache_environment(a1);
  stack_logging_enable_logging = 0;
  stack_logging_dontcompact = 0;
  v1 = (const char *)_simple_getenv();
  if (!v1)
  {
    result = _simple_getenv();
    if (!result)
      return result;
    v1 = (const char *)result;
    stack_logging_dontcompact = 1;
  }
  result = strncmp(v1, "0", 1uLL);
  if ((_DWORD)result)
  {
    result = strncmp(v1, "N", 1uLL);
    if ((_DWORD)result)
    {
      result = _platform_strcmp();
      if ((_DWORD)result)
      {
        result = _platform_strcmp();
        if ((_DWORD)result)
        {
          result = _platform_strcmp();
          if ((_DWORD)result)
          {
            result = _platform_strcmp();
            v3 = (_DWORD)result == 0;
            if ((_DWORD)result)
              v4 = 1;
            else
              v4 = 5;
          }
          else
          {
            v3 = 1;
            v4 = 3;
          }
        }
        else
        {
          v3 = 0;
          v4 = 2;
        }
      }
      else
      {
        v3 = 1;
        v4 = 4;
      }
      stack_logging_mode = v4;
      if (stack_logging_dontcompact)
      {
        if (!v3)
          return msl_printf(5);
      }
    }
  }
  return result;
}

uint64_t msl_cache_environment(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  if (a1)
    v2 = _simple_getenv();
  else
    v2 = (uint64_t)getenv("MallocStackLoggingDirectory");
  if (v2 && (unint64_t)_platform_strlcpy() >= 0x400)
    msl_log_dir = 0;
  if (a1)
    v3 = _simple_getenv();
  else
    v3 = (uint64_t)getenv("TMPDIR");
  if (v3 && (unint64_t)_platform_strlcpy() >= 0x400)
    tmp_dir = 0;
  if (a1)
    v4 = (const char *)_simple_getenv();
  else
    v4 = getenv("MallocStackLoggingNoReaping");
  if (v4 && strcasecmp(v4, "no") && _platform_strcmp())
    msl_should_reap = 1;
  debug_mode = 1;
  if (a1)
    v5 = _simple_getenv();
  else
    v5 = (uint64_t)getenv("MallocDebugReport");
  if (!v5)
  {
    if (!isatty(2))
      return initialize_no_footprint_for_debug_flag();
LABEL_28:
    v6 = 0;
    goto LABEL_29;
  }
  if (!_platform_strcmp())
    goto LABEL_28;
  if (_platform_strcmp())
  {
    v6 = _platform_strcmp() == 0;
LABEL_29:
    debug_mode = v6;
  }
  return initialize_no_footprint_for_debug_flag();
}

uint64_t msl_initialize()
{
  uint64_t result;

  stack_logging_finished_init = 1;
  stack_logging_postponed = 0;
  result = stack_logging_mode;
  if (stack_logging_mode)
  {
    if ((stack_logging_mode & 0xFFFFFFFE) == 4)
    {
      result = create_lite_zone_if_has_default_zone0();
      if (!(_DWORD)result)
        return result;
      LODWORD(result) = stack_logging_mode;
    }
    return enable_stack_logging_for_mode_and_prepare_to_log_stacks(result);
  }
  return result;
}

uint64_t create_lite_zone_if_has_default_zone0()
{
  if (malloc_msl_lite_hooks())
  {
    if (lite_zone_created_predicate != -1)
      _os_once();
    return 1;
  }
  else
  {
    msl_printf(3);
    return 0;
  }
}

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks(int a1)
{
  uint64_t v2;
  _BOOL8 result;
  int v4;
  int v5;
  int v6;

  v2 = global_uniquing_table();
  if (uniquing_table_is_husk(v2))
    return 0;
  switch(a1)
  {
    case 1:
      v4 = 1;
      v5 = 1;
      goto LABEL_11;
    case 2:
      v4 = 2;
      v5 = 1;
      v6 = 0;
      goto LABEL_12;
    case 3:
      v4 = 3;
      goto LABEL_10;
    case 4:
      v4 = 4;
      goto LABEL_10;
    case 5:
      v4 = 5;
LABEL_10:
      v5 = 0;
LABEL_11:
      v6 = 1;
LABEL_12:
      result = enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(v4, v5, v6);
      break;
    default:
      msl_printf(3);
      return 0;
  }
  return result;
}

void *msl_copy_msl_lite_hooks(void *__src, unint64_t a2)
{
  size_t v2;

  if (a2 >= 0x18)
    v2 = 24;
  else
    v2 = a2;
  return memcpy(&malloc_msl_lite_hooks, __src, v2);
}

BOOL msl_turn_on_stack_logging(int a1)
{
  _BOOL8 v2;

  malloc_register_stack_logger();
  if (stack_logging_enable_logging)
  {
    msl_printf(5);
    return 0;
  }
  if ((a1 & 0xFFFFFFFE) == 4 && !create_lite_zone_if_has_default_zone0())
    return 0;
  __malloc_lock_stack_logging();
  if (stack_logging_enable_logging)
  {
    msl_printf(5);
    v2 = 0;
  }
  else
  {
    msl_cache_environment(0);
    v2 = enable_stack_logging_for_mode_and_prepare_to_log_stacks(a1);
  }
  __malloc_unlock_stack_logging();
  return v2;
}

void msl_turn_off_stack_logging()
{
  uint64_t v0;

  __malloc_lock_stack_logging();
  if (stack_logging_enable_logging)
  {
    switch(stack_logging_mode)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        v0 = 5;
        break;
      default:
        v0 = 3;
        break;
    }
    msl_printf(v0);
    *MEMORY[0x24BDB1148] = 0;
    *MEMORY[0x24BDB0F58] = 0;
    stack_logging_enable_logging = 0;
    disable_stack_logging_lite();
  }
  else
  {
    msl_printf(3);
  }
  __malloc_unlock_stack_logging();
}

uint64_t msl_set_mode_for_pid(unsigned int a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v7;

  if (a1 > 5)
    v2 = 0;
  else
    v2 = qword_206336F18[a1];
  v7 = v2 | a2;
  v3 = sysctlbyname("kern.memorystatus_vm_pressure_send", 0, 0, &v7, 8uLL);
  if ((_DWORD)v3)
  {
    v4 = __error();
    strerror(*v4);
    v5 = 3;
  }
  else
  {
    v5 = 5;
  }
  msl_printf(v5);
  return v3;
}

void msl_handle_memory_event(int a1)
{
  if ((a1 & 0xF0000000) != 0 && (a1 & 0xFFFFFFF) == 0)
  {
    if (a1 < 0)
    {
      msl_turn_off_stack_logging();
    }
    else if ((a1 & 0x40000000) != 0)
    {
      if ((~a1 & 0x30000000) != 0)
      {
        if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 5 || !msl_type_enabled_at_runtime))
        {
          msl_type_enabled_at_runtime = 5;
          msl_turn_on_stack_logging(5);
        }
      }
      else if ((msl_type_enabled_at_runtime & 0xFFFFFFFB) == 0)
      {
        msl_type_enabled_at_runtime = 4;
        msl_turn_on_stack_logging(4);
      }
    }
    else if ((~a1 & 0x30000000) != 0)
    {
      if ((a1 & 0x10000000) != 0)
      {
        if ((msl_type_enabled_at_runtime & 0xFFFFFFFD) == 0)
        {
          msl_type_enabled_at_runtime = 2;
          msl_turn_on_stack_logging(2);
        }
      }
      else if ((a1 & 0x20000000) != 0 && (msl_type_enabled_at_runtime == 3 || !msl_type_enabled_at_runtime))
      {
        msl_type_enabled_at_runtime = 3;
        msl_turn_on_stack_logging(3);
      }
    }
    else if (msl_type_enabled_at_runtime <= 1)
    {
      msl_type_enabled_at_runtime = 1;
      msl_turn_on_stack_logging(1);
    }
  }
}

BOOL msl_is_stack_logging_enabled()
{
  return stack_logging_enable_logging != 0;
}

BOOL enable_stack_logging_for_mode_and_prepare_to_log_stacks_helper(int a1, int a2, int a3)
{
  int v6;

  v6 = __prepare_to_log_stacks((a1 & 0xFFFFFFFE) == 4);
  if (v6)
  {
    if (a2)
      *MEMORY[0x24BDB1148] = __disk_stack_logging_log_stack;
    if (a3)
      *MEMORY[0x24BDB0F58] = __disk_stack_logging_log_stack;
    stack_logging_mode = a1;
    stack_logging_enable_logging = 1;
    if (a1 == 4)
      enable_stack_logging_lite();
    msl_printf(5);
    set_malloc_stack_logging_start_timestamp();
  }
  return v6 != 0;
}

uint64_t global_uniquing_table()
{
  if (pre_write_buffers)
    return *(_QWORD *)(pre_write_buffers + 16);
  else
    return 0;
}

void __delete_and_unlink_uniquing_table_while_locked()
{
  uint64_t v0;

  if (pre_write_buffers)
  {
    v0 = *(_QWORD *)(pre_write_buffers + 16);
    if (v0)
    {
      if (!uniquing_table_is_husk(*(_QWORD *)(pre_write_buffers + 16)))
        uniquing_table_deinitialize(v0, 1);
    }
  }
  *MEMORY[0x24BDB1118] = 0;
}

uint64_t __prepare_to_log_stacks(int a1)
{
  int v3;
  char *pages;
  uint64_t v5;
  uint64_t v6;
  mach_vm_address_t v7;
  uint64_t v8;

  if (pre_write_buffers)
    return 1;
  last_logged_malloc_address = 0;
  if (stack_logging_dontcompact)
    v3 = 0;
  else
    v3 = logging_use_compaction;
  logging_use_compaction = v3;
  pages = (char *)sld_allocate_pages(0x4000uLL);
  pre_write_buffers = (uint64_t)pages;
  if (!pages)
    goto LABEL_11;
  strcpy(pages, "mslshm1");
  v5 = pre_write_buffers;
  *(_QWORD *)(pre_write_buffers + 8) = 0;
  *(_DWORD *)(v5 + 52) = 0;
  *(_BYTE *)(v5 + 56) = *(_BYTE *)(v5 + 56) & 0xFC | a1 & 1 | 2;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  v6 = uniquing_table_create(0x10000u, 0x40000000u);
  if (v6)
  {
    v7 = v6;
    if (a1 || create_log_file())
    {
      v8 = pre_write_buffers;
      *(_QWORD *)(pre_write_buffers + 16) = v7;
      *MEMORY[0x24BDB1118] = v8;
      return 1;
    }
    uniquing_table_deinitialize(v7, 1);
    uniquing_table_destroy_husk_exclusive(v7);
    munmap((void *)pre_write_buffers, 0x4000uLL);
    pre_write_buffers = 0;
    if (!stack_logging_postponed)
      disable_stack_logging();
  }
  else
  {
LABEL_11:
    msl_printf(3);
    msl_printf(3);
    stack_logging_enable_logging = 0;
    *MEMORY[0x24BDB1148] = 0;
    *MEMORY[0x24BDB0F58] = 0;
    disable_stack_logging_lite();
  }
  return 0;
}

void disable_stack_logging()
{
  msl_printf(3);
  stack_logging_enable_logging = 0;
  *MEMORY[0x24BDB1148] = 0;
  *MEMORY[0x24BDB0F58] = 0;
  disable_stack_logging_lite();
}

uint64_t create_log_file()
{
  pid_t v0;
  const char *v1;
  char *pages;
  unint64_t v3;
  int appended;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  const char *v13;
  char *v14;
  char *v15;
  int *v16;
  int v17;
  unint64_t v18;
  unsigned int v20;
  int *v21;
  unsigned __int8 *v22;
  char *v23;
  uint64_t v24;
  int v25;
  _BYTE buffer[16];
  _BYTE __dst[1025];
  uint64_t v28;

  v28 = *MEMORY[0x24BDB0D28];
  v0 = getpid();
  v1 = getprogname();
  pages = (char *)__stack_log_file_path__;
  if (!__stack_log_file_path__)
  {
    pages = (char *)sld_allocate_pages((*MEMORY[0x24BDB1100] + 1023) & -*MEMORY[0x24BDB1100]);
    __stack_log_file_path__ = (uint64_t)pages;
    if (!pages)
      goto LABEL_31;
  }
  if (msl_get_writable_log_dir((_BOOL8)pages, 0x400uLL))
    goto LABEL_6;
  if (!stack_logging_finished_init)
  {
    msl_printf(6);
    stack_logging_postponed = 1;
LABEL_30:
    *pages = 0;
    if (stack_logging_postponed)
      return 0;
LABEL_31:
    msl_printf(3);
    return 0;
  }
  if (confstr(65537, pages, 0x400uLL) - 1024 < 0xFFFFFFFFFFFFFC01)
    goto LABEL_30;
LABEL_6:
  v3 = _platform_strlen();
  if (v3 >= 0x400)
    create_log_file_cold_1();
  if ((!v3 || *(_BYTE *)(v3 + __stack_log_file_path__ - 1) != 47) && _platform_strlcat() != v3 + 1
    || (unint64_t)_platform_strlcat() > 0x3FF)
  {
    goto LABEL_14;
  }
  appended = append_int(__stack_log_file_path__, v0, 0xAu);
  if (appended)
  {
    if ((unint64_t)_platform_strlcat() <= 0x3FF)
    {
      appended = append_int(__stack_log_file_path__, pre_write_buffers, 0x10u);
      goto LABEL_15;
    }
LABEL_14:
    appended = 0;
  }
LABEL_15:
  if (v1 && *v1)
  {
    if (!appended || (unint64_t)_platform_strlcat() > 0x3FF || (unint64_t)_platform_strlcat() >= 0x400)
      goto LABEL_28;
  }
  else if (!appended)
  {
    goto LABEL_28;
  }
  if ((unint64_t)_platform_strlcat() <= 0x3FF && (unint64_t)_platform_strlcat() <= 0x3FF)
  {
    v5 = (const char *)__stack_log_file_path__;
    v6 = _platform_strlen();
    v7 = 0;
    v8 = v6 << 32;
    while (v5[v7++])
      ;
    if (v7 - 1 > 1023)
    {
      v10 = 63;
LABEL_37:
      v16 = __error();
      v17 = 0;
      *v16 = v10;
LABEL_38:
      index_file_descriptor = v17;
      msl_printf(5);
      v11 = __stack_log_file_path__;
      *(_QWORD *)(pre_write_buffers + 40) = __stack_log_file_path__;
      *(_DWORD *)(pre_write_buffers + 48) = _platform_strlen();
      return v11;
    }
    v13 = &v5[v7 - (int)v6];
    v14 = (char *)(v13 - 2);
    if (v13 - 2 < v5 || (v15 = (char *)(v13 - 1), _platform_strchr()))
    {
      v10 = 22;
      goto LABEL_37;
    }
    getentropy(buffer, 0x10uLL);
    v18 = 0;
    do
    {
      if (*v14 != 88 || v18 > 0xE)
        break;
      v20 = buffer[v18++];
      *v14-- = my_mkstemps_padchar[(v20 - 62 * ((133 * (v20 >> 1)) >> 12))];
    }
    while (v14 >= v5);
    memcpy(__dst, v14 + 1, &v5[-(v8 >> 32)] - v14 + v7 - 2);
    v17 = open(v5, 553650690, 384);
    if ((v17 & 0x80000000) == 0)
      goto LABEL_38;
    while (2)
    {
      v21 = __error();
      if (v15 != v14 + 1 && *v21 == 17)
      {
        v22 = __dst;
        v23 = v14 + 1;
        while (1)
        {
          v24 = _platform_strchr();
          if (!v24)
          {
            *__error() = 5;
            goto LABEL_58;
          }
          v25 = *(unsigned __int8 *)(v24 + 1);
          if (!*(_BYTE *)(v24 + 1))
            v25 = 48;
          *v23 = v25;
          if (v25 != *v22)
            break;
          ++v23;
          ++v22;
          if (v15 == v23)
            goto LABEL_58;
        }
        v17 = open(v5, 553650690, 384);
        if (v17 < 0)
          continue;
        goto LABEL_38;
      }
      break;
    }
LABEL_58:
    index_file_descriptor = -1;
  }
LABEL_28:
  msl_printf(3);
  v11 = 0;
  *(_BYTE *)__stack_log_file_path__ = 0;
  return v11;
}

uint64_t __prepare_to_log_stacks_unlocked(int a1)
{
  uint64_t v3;

  if (pre_write_buffers)
    return 1;
  __malloc_lock_stack_logging();
  v3 = __prepare_to_log_stacks(a1);
  __malloc_unlock_stack_logging();
  return v3;
}

void reap_orphaned_log_files_once()
{
  unsigned __int8 v0;
  uint64_t v1;
  _BYTE v2[2];

  if ((reap_orphaned_log_files_once_orphaned_log_files[0] & 1) == 0)
  {
    do
      v0 = __ldxr((unsigned __int8 *)reap_orphaned_log_files_once_orphaned_log_files);
    while (__stxr(1u, (unsigned __int8 *)reap_orphaned_log_files_once_orphaned_log_files));
    if ((v0 & 1) == 0)
    {
      v1 = getpid();
      get_remote_env_var(v1, "MallocStackLoggingDontDeleteStackLogFile", v2);
      if (v2[0] != 49)
        atexit((void (*)(void))delete_log_files);
      if ((!getprogname() || _platform_strcmp() && _platform_strcmp())
        && msl_should_reap_old_logs())
      {
        reap_orphaned_log_files(v1, 0);
      }
    }
  }
}

uint64_t delete_log_files()
{
  uint64_t result;

  result = __stack_log_file_path__;
  if (__stack_log_file_path__ && *(_BYTE *)__stack_log_file_path__)
  {
    if (delete_logging_file(__stack_log_file_path__))
    {
      return msl_printf(5);
    }
    else
    {
      result = msl_printf(5);
      *(_BYTE *)__stack_log_file_path__ = 0;
    }
  }
  return result;
}

void __disk_stack_logging_log_stack(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  BOOL v6;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t invalid;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _QWORD __src[4];
  uint64_t v27;

  if (stack_logging_enable_logging)
    v6 = stack_logging_postponed == 0;
  else
    v6 = 0;
  if (v6)
  {
    v11 = (a6 + 1);
    while (1)
    {
      v12 = a4;
      if ((malloc_get_thread_options() & 4) != 0)
        return;
      v13 = stack_logging_mode & 0xFFFFFFFE;
      v14 = a1 & 0x30;
      if ((a1 & 0x30) == 0 && v13 == 4)
        return;
      if ((~a1 & 6) != 0)
        break;
      if (!a3)
      {
        a1 ^= 4u;
        a3 = a5;
        goto LABEL_20;
      }
      if (a5)
      {
        __disk_stack_logging_log_stack(4, a2, a3, 0, 0, v11);
        if (stack_logging_enable_logging)
        {
          a4 = 0;
          v11 = (v11 + 1);
          a1 = 2;
          a3 = v12;
          if (!stack_logging_postponed)
            continue;
        }
      }
      return;
    }
    if ((a1 & 0x24) != 0)
    {
      if (!a3)
        return;
    }
    else
    {
      if ((a1 & 0x12) == 0)
      {
        msl_printf(3);
        return;
      }
      v12 = a3;
      a3 = a5;
      if ((unint64_t)(a5 + 1) < 2)
        return;
    }
LABEL_20:
    if ((!v14 || *MEMORY[0x24BDB1040] == (_DWORD)a2) && !__malloc_stack_logging_is_reentered())
    {
      if ((a1 & 2) != 0)
        reap_orphaned_log_files_once();
      __malloc_lock_stack_logging();
      if (v13 == 4 && (a1 & 0x20) != 0)
      {
        if (pre_write_buffers)
        {
          v27 = *(_QWORD *)(pre_write_buffers + 24);
          if (v27)
          {
            radix_tree_delete(&v27, a3 & -*MEMORY[0x24BDB1100], ((v12 + a3 + *MEMORY[0x24BDB1100] - 1) & -*MEMORY[0x24BDB1100]) - (a3 & -*MEMORY[0x24BDB1100]));
            v15 = v27;
            v16 = pre_write_buffers;
            *(_QWORD *)(pre_write_buffers + 24) = v27;
            if (v15)
            {
              v15 = radix_tree_size(v15);
              v16 = pre_write_buffers;
            }
            *(_QWORD *)(v16 + 32) = v15;
            goto LABEL_41;
          }
        }
      }
      if (!stack_logging_enable_logging || stack_logging_postponed)
      {
LABEL_41:
        __malloc_unlock_stack_logging();
        return;
      }
      v17 = a3 ^ 0x5555;
      if ((a3 ^ 0x5555) == last_logged_malloc_address && (a1 & 4) != 0 && last_logged_malloc_address)
      {
        *(_DWORD *)(pre_write_buffers + 52) -= 32;
        last_logged_malloc_address = 0;
        goto LABEL_41;
      }
      invalid = msl_payload_get_invalid();
      if (pre_write_buffers && (v19 = *(_QWORD *)(pre_write_buffers + 16)) != 0)
      {
        LODWORD(v27) = 0;
        v20 = uniquing_table_stack_retain(v19, v11, 1, &v27) == 0;
        v21 = uniquing_table_node_count(v19) <= 0x400000;
        invalid = msl_payload_create(v27, v21, 0);
      }
      else
      {
        v20 = 0;
      }
      if (msl_payload_is_invalid(invalid))
        goto LABEL_48;
      if (v13 == 4 && (a1 & 0x10) != 0)
      {
        if (!pre_write_buffers)
          goto LABEL_48;
        v27 = *(_QWORD *)(pre_write_buffers + 24);
        if (!v27)
        {
          v22 = radix_tree_create();
          v27 = v22;
          v23 = pre_write_buffers;
          *(_QWORD *)(pre_write_buffers + 24) = v22;
          if (!v22)
          {
LABEL_58:
            *(_QWORD *)(v23 + 32) = v22;
            goto LABEL_48;
          }
          *(_QWORD *)(pre_write_buffers + 32) = radix_tree_size(v22);
        }
        radix_tree_insert(&v27, a3 & -*MEMORY[0x24BDB1100], ((v12 + a3 + *MEMORY[0x24BDB1100] - 1) & -*MEMORY[0x24BDB1100]) - (a3 & -*MEMORY[0x24BDB1100]), invalid);
        v22 = v27;
        v23 = pre_write_buffers;
        *(_QWORD *)(pre_write_buffers + 24) = v27;
        if (v22)
        {
          v22 = radix_tree_size(v22);
          v23 = pre_write_buffers;
        }
        goto LABEL_58;
      }
      __src[0] = v12;
      __src[1] = a3 ^ 0x5555;
      __src[2] = invalid;
      __src[3] = a1 & 0xFF0000B7;
      if ((a1 & 0x12) != 0)
      {
        if (!logging_use_compaction)
        {
LABEL_64:
          v24 = pre_write_buffers;
          v25 = *(_DWORD *)(pre_write_buffers + 52);
          if (v25 >> 5 >= 0x1FD)
          {
            if (!flush_data())
              goto LABEL_48;
            v24 = pre_write_buffers;
            v25 = *(_DWORD *)(pre_write_buffers + 52);
          }
          memcpy((void *)(v24 + v25 + 64), __src, 0x20uLL);
          *(_DWORD *)(pre_write_buffers + 52) += 32;
LABEL_48:
          __malloc_unlock_stack_logging();
          if (v20)
            msl_turn_off_stack_logging();
          return;
        }
      }
      else
      {
        v17 = 0;
      }
      last_logged_malloc_address = v17;
      goto LABEL_64;
    }
  }
}

uint64_t flush_data()
{
  uint64_t result;
  uint64_t v1;
  size_t v2;
  char *v3;
  int v4;
  ssize_t v5;
  int v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDB0D28];
  if (index_file_descriptor == -1)
  {
    result = create_log_file();
    if (!result)
      return result;
  }
  v1 = pre_write_buffers;
  v2 = *(unsigned int *)(pre_write_buffers + 52);
  if (!(_DWORD)v2)
  {
    v7 = 0;
LABEL_24:
    *(_QWORD *)(v1 + 8) += v7;
    *(_DWORD *)(v1 + 52) = 0;
    return 1;
  }
  v3 = (char *)(pre_write_buffers + 64);
  while (1)
  {
    v4 = index_file_descriptor;
    v5 = write(index_file_descriptor, v3, v2);
    if (v5 != -1)
      goto LABEL_19;
    if (*__error() != 9)
      goto LABEL_22;
    if (index_file_descriptor != v4)
      break;
    v6 = open((const char *)__stack_log_file_path__, 553648137);
    if (v6 < 3)
    {
      v10 = 0;
      v9 = 0;
      do
      {
        if (v6 == -1)
        {
          msl_printf(3);
          delete_log_files();
          goto LABEL_22;
        }
        *((_DWORD *)&v9 + v6) = 1;
        v6 = dup(v6);
      }
      while (v6 < 3);
      if ((_DWORD)v9)
        close(0);
      if (HIDWORD(v9))
        close(1);
      if (v10)
        close(2);
    }
    index_file_descriptor = v6;
    v5 = write(v6, v3, v2);
    if (v5 == -1)
      goto LABEL_22;
LABEL_19:
    v3 += v5;
    v2 -= v5;
    if (!v2)
    {
      v1 = pre_write_buffers;
      v7 = *(unsigned int *)(pre_write_buffers + 52);
      goto LABEL_24;
    }
  }
  msl_printf(3);
LABEL_22:
  v8 = __error();
  strerror(*v8);
  msl_printf(3);
  msl_printf(3);
  stack_logging_enable_logging = 0;
  *MEMORY[0x24BDB1148] = 0;
  *MEMORY[0x24BDB0F58] = 0;
  disable_stack_logging_lite();
  return 0;
}

void msl_fork_child()
{
  mach_vm_address_t v0;

  msl_lock_init();
  msl_turn_off_stack_logging();
  __malloc_lock_stack_logging();
  if (__stack_log_file_path__)
  {
    sld_deallocate_pages(__stack_log_file_path__, (*MEMORY[0x24BDB1100] + 1023) & -*MEMORY[0x24BDB1100]);
    __stack_log_file_path__ = 0;
  }
  if (index_file_descriptor != -1)
  {
    close(index_file_descriptor);
    index_file_descriptor = -1;
  }
  v0 = pre_write_buffers;
  if (pre_write_buffers)
  {
    if (!*(_QWORD *)(pre_write_buffers + 24)
      || (radix_tree_destroy(*(_QWORD *)(pre_write_buffers + 24)), (v0 = pre_write_buffers) != 0))
    {
      if (*(_QWORD *)(v0 + 16))
      {
        __delete_and_unlink_uniquing_table_while_locked();
        v0 = pre_write_buffers;
      }
    }
    sld_deallocate_pages(v0, 0x4000uLL);
    pre_write_buffers = 0;
  }
  __malloc_unlock_stack_logging();
}

uint64_t update_cache_for_file_streams()
{
  uint64_t v0;
  unsigned int *v1;
  int v2;
  pid_t v3;
  FILE *v4;
  int v5;
  off_t st_size;
  uint64_t v7;
  mach_vm_address_t v8;
  mach_vm_address_t v9;
  int v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  _BOOL4 v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t i;
  FILE *v36;
  size_t v37;
  stat v38;
  task_suspension_token_t suspend_token;
  _QWORD __ptr[514];

  v0 = MEMORY[0x24BDB0C10]();
  __ptr[512] = *MEMORY[0x24BDB0D28];
  v1 = *(unsigned int **)(v0 + 32);
  if (!v1)
  {
    v1 = (unsigned int *)malloc_type_calloc(1uLL, 0x4048uLL, 0x1020040901AD395uLL);
    *(_QWORD *)(v0 + 32) = v1;
    v1[4] = 17;
    *((_QWORD *)v1 + 2053) = 0;
    *(_OWORD *)v1 = xmmword_206336F70;
    *((_QWORD *)v1 + 3) = malloc_type_calloc(0x4000uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    v7 = *(_QWORD *)(v0 + 40);
    if (v7)
    {
      v8 = *(_QWORD *)(v7 + 24);
      if (v8)
      {
        v9 = map_shared_memory_from_task(*(_DWORD *)v0, v8, *(_QWORD *)(v7 + 32));
        *((_QWORD *)v1 + 2056) = v9;
        if (!v9)
          msl_printf(3);
      }
    }
  }
  v2 = *(_DWORD *)(v0 + 4);
  v3 = getpid();
  suspend_token = 0;
  if (v2 != v3)
    task_suspend2(*(_DWORD *)v0, &suspend_token);
  memset(&v38, 0, sizeof(v38));
  v4 = *(FILE **)(v0 + 16);
  if (v4)
  {
    v5 = fileno(v4);
    fstat(v5, &v38);
    st_size = v38.st_size;
  }
  else
  {
    st_size = 0;
  }
  v10 = *(_DWORD *)(v0 + 8);
  if (v10)
    v11 = 32;
  else
    v11 = 24;
  v12 = *((_QWORD *)v1 + 2053);
  v13 = st_size - v12;
  v14 = *(_QWORD *)(v0 + 40);
  if (v11 <= st_size - v12)
  {
    if (v14)
    {
      v16 = 0;
      v17 = v12 + v1[21];
      *((_QWORD *)v1 + 2053) = v17;
      v13 = st_size - v17;
      v15 = 1;
      goto LABEL_20;
    }
LABEL_19:
    v15 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  if (!v14)
    goto LABEL_19;
  v15 = 0;
  v16 = v1[21] / v11;
LABEL_20:
  if (v11 <= v13 || v15 || !v14)
  {
    if (!v14)
      goto LABEL_26;
  }
  else
  {
    v15 = *(_DWORD *)(v14 + 52) != v1[21];
  }
  if ((*(_BYTE *)(v14 + 56) & 1) != 0)
  {
    if (!*((_QWORD *)v1 + 2054))
      LOBYTE(v15) = 1;
    if (v15)
      goto LABEL_27;
    goto LABEL_32;
  }
LABEL_26:
  if (v15)
  {
LABEL_27:
    memcpy(v1 + 8, (const void *)v14, 0x4000uLL);
    if (*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16))
    {
      msl_uniquing_table_release(*((_QWORD *)v1 + 2054));
      *((_QWORD *)v1 + 2054) = uniquing_table_clone_from_task(*(_DWORD *)v0, *(_QWORD *)(*(_QWORD *)(v0 + 40) + 16));
      v18 = 1;
    }
    else
    {
      v18 = 1;
      fwrite("Uniquing table deleted in remote task. This could be the result of memory pressure\n", 0x53uLL, 1uLL, (FILE *)*MEMORY[0x24BDB0D30]);
    }
    goto LABEL_34;
  }
LABEL_32:
  v18 = 0;
LABEL_34:
  if (v2 != v3)
    task_resume2(suspend_token);
  if (v18)
  {
    if (!*((_QWORD *)v1 + 2054))
      return 5;
  }
  else if (v11 > v13)
  {
    return 0;
  }
  if (v11 > v13)
    goto LABEL_61;
  if (v10)
    v20 = 128;
  else
    v20 = 170;
  v36 = *(FILE **)(v0 + 16);
  if (fseeko(v36, *((_QWORD *)v1 + 2053), 0))
    fwrite("error while attempting to cache information from remote stack index file. (update_cache_for_file_streams)\n", 0x6AuLL, 1uLL, (FILE *)*MEMORY[0x24BDB0D30]);
  v21 = 0;
  v22 = *((_QWORD *)v1 + 2053);
  v37 = v13 / v11;
  for (i = v0; ; v0 = i)
  {
    if (v37 - v21 < v20)
      v20 = v37 - v21;
    v23 = fread(__ptr, v11, v20, v36);
    v24 = v23;
    if (!*(_DWORD *)(v0 + 8))
      break;
    if (!v23)
      goto LABEL_58;
    v25 = 0;
    v26 = 0;
    do
    {
      insert_node((uint64_t)v1, __ptr[4 * v26 + 1] ^ 0x5555, v22);
      v22 += v11;
      v26 = ++v25;
    }
    while (v24 > v25);
LABEL_57:
    v21 += v25;
  }
  if (v23)
  {
    v25 = 0;
    v27 = 0;
    do
    {
      insert_node((uint64_t)v1, HIDWORD(__ptr[3 * v27]) ^ 0x5555, v22);
      v22 += v11;
      v27 = ++v25;
    }
    while (v24 > v25);
    goto LABEL_57;
  }
LABEL_58:
  if (v37 > v21)
    fwrite("insufficient data in remote stack index file; expected more records.\n",
      0x45uLL,
      1uLL,
      (FILE *)*MEMORY[0x24BDB0D30]);
  *((_QWORD *)v1 + 2053) += v21 * v11;
LABEL_61:
  if (v18)
  {
    v28 = *((_QWORD *)v1 + 5);
    v29 = v1[21] / v11;
    v30 = v29 - v16;
    if (*(_DWORD *)(v0 + 8))
    {
      if (v29 > v16)
      {
        v31 = v28 + v11 * (unint64_t)v16;
        v32 = 32 * v16 + 104;
        do
        {
          insert_node((uint64_t)v1, *(_QWORD *)((char *)v1 + v32) ^ 0x5555, v31);
          v31 += v11;
          v32 += 32;
          --v30;
        }
        while (v30);
      }
    }
    else if (v29 > v16)
    {
      v33 = v28 + v11 * (unint64_t)v16;
      v34 = 24 * v16 + 100;
      do
      {
        insert_node((uint64_t)v1, *(unsigned int *)((char *)v1 + v34) ^ 0x5555, v33);
        v33 += v11;
        v34 += 24;
        --v30;
      }
      while (v30);
    }
  }
  return 0;
}

void release_file_streams_for_task(int a1)
{
  uint64_t v2;
  _DWORD **v3;
  _DWORD *v4;
  int v5;
  unsigned int v6;

  os_unfair_lock_lock_with_options();
  v2 = remote_fds_count;
  if (remote_fds_count)
  {
    v3 = (_DWORD **)remote_fds;
    while (1)
    {
      v4 = *v3;
      if (*v3)
      {
        if (*v4 == a1)
          break;
      }
      ++v3;
      if (!--v2)
        goto LABEL_8;
    }
    --v4[3];
  }
LABEL_8:
  v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v6 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v6 != v5)
      break;
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque))
      return;
  }
  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
}

uint64_t msl_stop_reading(int a1)
{
  uint64_t v2;
  _DWORD **v3;
  _DWORD *v4;
  uint64_t v5;
  int v6;
  unsigned int v7;

  release_file_streams_for_task(a1);
  os_unfair_lock_lock_with_options();
  v2 = remote_fds_count;
  if (remote_fds_count)
  {
    v3 = (_DWORD **)remote_fds;
    while (1)
    {
      v4 = *v3;
      if (*v3)
      {
        if (*v4 == a1)
          break;
      }
      ++v3;
      if (!--v2)
        goto LABEL_6;
    }
    if ((int)v4[3] > 0)
    {
      v5 = 5;
      goto LABEL_7;
    }
    free_file_streams(v4);
  }
LABEL_6:
  v5 = 0;
LABEL_7:
  v6 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v7 = __ldxr(&remote_fd_list_lock._os_unfair_lock_opaque);
    if (v7 != v6)
      break;
    if (!__stlxr(0, &remote_fd_list_lock._os_unfair_lock_opaque))
      return v5;
  }
  __clrex();
  os_unfair_lock_unlock(&remote_fd_list_lock);
  return v5;
}

void free_file_streams(void *a1)
{
  FILE *v2;
  void *v3;
  uint64_t v4;

  v2 = (FILE *)*((_QWORD *)a1 + 2);
  if (v2)
    fclose(v2);
  v3 = (void *)*((_QWORD *)a1 + 5);
  if (v3)
    munmap(v3, 0x4000uLL);
  v4 = *((_QWORD *)a1 + 4);
  if (v4)
  {
    free(*(void **)(v4 + 24));
    msl_uniquing_table_release(*(_QWORD *)(*((_QWORD *)a1 + 4) + 16432));
    free(*((void **)a1 + 4));
  }
  bzero(a1, 0x30uLL);
}

BOOL msl_payload_version_from_task(mach_port_name_t a1)
{
  void *v2;

  v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (v2)
    release_file_streams_for_task(a1);
  return v2 != 0;
}

uint64_t msl_coldest_frame_is_threadid(mach_port_name_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (!v2)
    return 1;
  v3 = v2[5];
  if (v3)
    v4 = (*(_BYTE *)(v3 + 56) & 3) == 0;
  else
    v4 = 1;
  release_file_streams_for_task(a1);
  return v4;
}

uint64_t msl_payload_for_malloc_address_in_task(mach_port_name_t a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (!v4)
    return msl_payload_get_invalid();
  v5 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v4, a2);
  release_file_streams_for_task(a1);
  return v5;
}

uint64_t msl_payload_for_malloc_address_in_task_helper(uint64_t a1, unint64_t a2)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  uint64_t invalid;
  uint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE __ptr[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDB0D28];
  if (update_cache_for_file_streams())
    return msl_payload_get_invalid();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = (a2 >> 2) % (v6 - 1);
  v8 = *(_DWORD *)(v5 + 16);
  v9 = 1;
  v10 = *(_QWORD *)(v5 + 24);
  while (1)
  {
    v11 = *(_QWORD *)(v10 + 16 * v7);
    if (v11 == a2)
      break;
    if (v11)
    {
      v12 = v7 + v6 / ((2 * v8) | 1) * v9;
      v13 = v12 >= v6 ? v6 : 0;
      v7 = v12 - v13;
      if (v9++ <= v8)
        continue;
    }
    return msl_payload_get_invalid();
  }
  v15 = *(_QWORD *)(v10 + 16 * v7 + 8);
  invalid = msl_payload_get_invalid();
  v17 = *(_QWORD *)(a1 + 32);
  if (v15 >= *(_QWORD *)(v17 + 16424))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v20 = v17 + v15 - *(_QWORD *)(v17 + 40) + 96;
      if (*(_DWORD *)(a1 + 8))
        return *(_QWORD *)(v20 + 16);
      else
        return *(_QWORD *)(v20 + 8);
    }
  }
  else
  {
    if (*(_DWORD *)(a1 + 8))
      v18 = 32;
    else
      v18 = 24;
    fseeko(*(FILE **)(a1 + 16), v15, 0);
    if (fread(__ptr, v18, 1uLL, *(FILE **)(a1 + 16)))
    {
      v19 = 16;
      if (!*(_DWORD *)(a1 + 8))
        v19 = 8;
      return *(_QWORD *)&__ptr[v19];
    }
  }
  return invalid;
}

uint64_t msl_get_frames_for_address(mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t frames_from_task_helper;
  unint64_t uniquing_table_index;
  int v16;

  v16 = 0;
  v10 = retain_file_streams_for_task_with_error(a1, 0, &v16);
  if (!v10)
    return 5;
  v11 = (uint64_t)v10;
  v12 = msl_payload_for_malloc_address_in_task_helper((uint64_t)v10, a2);
  if (msl_payload_is_invalid(v12))
  {
    frames_from_task_helper = 5;
  }
  else
  {
    uniquing_table_index = msl_payload_get_uniquing_table_index(v12);
    frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v11, uniquing_table_index, a3, a4, a5, 0);
  }
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_get_frames_from_task_helper(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  uint64_t result;
  unsigned int v11;
  uint64_t v13;
  BOOL v14;

  if (a2 > 0xFFFFFFFE)
    return 5;
  v11 = a2;
  result = update_cache_for_file_streams();
  if (!(_DWORD)result)
  {
    uniquing_table_unwind_stack_remote(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16432), v11, a3, a5, a4);
    if (a6)
    {
      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
        v14 = (*(_BYTE *)(v13 + 56) & 3) == 0;
      else
        v14 = 1;
      *a6 = v14;
    }
    if (*a5)
      return 0;
    else
      return 5;
  }
  return result;
}

uint64_t msl_copy_disk_stack_logs(mach_port_name_t a1, uint64_t a2)
{
  FILE **v4;
  FILE **v5;
  FILE *v6;
  void *v7;
  uint64_t updated;
  int v9;
  size_t v10;
  unint64_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  uint64_t v16;
  FILE *v17;
  int v19;

  v19 = 0;
  v4 = (FILE **)retain_file_streams_for_task_with_error(a1, 0, &v19);
  if (v4)
  {
    v5 = v4;
    v6 = v4[2];
    if (v6)
    {
      v7 = malloc_type_malloc(0x100000uLL, 0x4FBB177uLL);
      updated = update_cache_for_file_streams();
      if (!(_DWORD)updated)
      {
        v9 = *((_DWORD *)v5 + 2);
        fseeko(v6, 0, 0);
        if (v9)
          v10 = 32;
        else
          v10 = 24;
        if (v9)
          v11 = 0x8000;
        else
          v11 = 43690;
        v12 = *(_QWORD *)&v5[4][108]._r / v10;
        while (1)
        {
          v13 = v11 >= v12 ? v12 : v11;
          v14 = fread(v7, v10, v13, v6);
          if (!v14)
            break;
          v15 = v14;
          v16 = (*(uint64_t (**)(uint64_t, void *, size_t))(a2 + 16))(a2, v7, v14 * v10);
          if ((_DWORD)v16)
            goto LABEL_26;
          v12 -= v15;
          if (!v12)
            goto LABEL_23;
        }
        if (ferror(v6))
        {
          updated = 5;
          if (v7)
            goto LABEL_28;
          goto LABEL_29;
        }
LABEL_23:
        if (v5[5])
        {
          v17 = v5[4];
          if (HIDWORD(v17->_write))
          {
            v16 = (*(uint64_t (**)(uint64_t, int *))(a2 + 16))(a2, &v17->_ub._size);
LABEL_26:
            updated = v16;
            goto LABEL_27;
          }
        }
        updated = 0;
        if (!v7)
          goto LABEL_29;
        goto LABEL_28;
      }
LABEL_27:
      if (v7)
LABEL_28:
        free(v7);
    }
    else
    {
      updated = 5;
    }
LABEL_29:
    release_file_streams_for_task(a1);
    return updated;
  }
  return 5;
}

uint64_t msl_disk_stack_logs_enumerate_from_buffer(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, int *);
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, int *);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a3)
  {
    if (a2 >= 0x20)
    {
      v5 = a2 >> 5;
      v6 = (uint64_t *)(a1 + 16);
      do
      {
        v7 = *(v6 - 2);
        v8 = *(v6 - 1) ^ 0x5555;
        v9 = *v6;
        v10 = *(void (**)(uint64_t, int *))(a4 + 16);
        v18 = *((_DWORD *)v6 + 2);
        v19 = 0;
        v20 = v9;
        v21 = v7;
        v22 = v8;
        v10(a4, &v18);
        v6 += 4;
        --v5;
      }
      while (v5);
    }
  }
  else if (a2 >= 0x18)
  {
    v11 = a2 / 0x18;
    v12 = (uint64_t *)(a1 + 8);
    do
    {
      v13 = *((unsigned int *)v12 - 2);
      v14 = *((unsigned int *)v12 - 1) ^ 0x5555;
      v15 = *v12;
      v16 = *(void (**)(uint64_t, int *))(a4 + 16);
      v18 = *((_DWORD *)v12 + 2);
      v19 = 0;
      v20 = v15;
      v21 = v13;
      v22 = v14;
      v16(a4, &v18);
      v12 += 3;
      --v11;
    }
    while (v11);
  }
  return 0;
}

uint64_t msl_disk_stack_logs_enumerate_from_task(mach_port_name_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDB0CE0];
  v5[1] = 0x40000000;
  v5[2] = __msl_disk_stack_logs_enumerate_from_task_block_invoke;
  v5[3] = &__block_descriptor_tmp;
  v5[4] = a3;
  v5[5] = a4;
  return msl_disk_stack_logs_enumerate_from_task_with_block(a1, a2, (uint64_t)v5);
}

uint64_t msl_disk_stack_logs_enumerate_from_task_with_block(mach_port_name_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t updated;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int *v13;
  size_t v14;
  size_t v15;
  off_t v16;
  uint64_t v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, unsigned int *);
  uint64_t v30;
  unsigned int v31;
  int v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, unsigned int *);
  void *v38;
  size_t __size;
  FILE *__stream;
  char v41;
  size_t v42;
  size_t __nitems;
  unsigned int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int __ptr[512];
  uint64_t v50;

  v50 = *MEMORY[0x24BDB0D28];
  __ptr[0] = 0;
  v6 = retain_file_streams_for_task_with_error(a1, 0, __ptr);
  if (!v6)
    return 5;
  v7 = v6;
  updated = update_cache_for_file_streams();
  if (!(_DWORD)updated)
  {
    v10 = 0;
    if (*((_DWORD *)v7 + 2))
      v11 = 32;
    else
      v11 = 24;
    v12 = 64;
    if (!*((_DWORD *)v7 + 2))
      v12 = 85;
    __nitems = v12;
    v41 = 1;
    v13 = __ptr;
    __size = v11;
    __stream = (FILE *)*((_QWORD *)v7 + 2);
    v42 = *(_QWORD *)(*((_QWORD *)v7 + 4) + 16424) / v11;
    v38 = v7;
    while (1)
    {
      v14 = __nitems;
      if (__nitems >= v42)
        v14 = v42;
      __nitems = v14;
      if (v14)
      {
        if (!__stream)
          goto LABEL_39;
        fseeko(__stream, v10, 0);
        v15 = fread(__ptr, __size, __nitems, __stream);
        v16 = ftello(__stream);
        if (v16 < 0)
          goto LABEL_39;
        v10 = v16;
        v42 -= v15;
        if (!v15)
          goto LABEL_39;
      }
      else
      {
        if (!*((_QWORD *)v7 + 5))
          goto LABEL_39;
        v17 = *((_QWORD *)v7 + 4);
        v18 = *(_QWORD *)(v17 + 40) + *(unsigned int *)(v17 + 84);
        v19 = v18 > v10;
        v20 = v18 - v10;
        if (!v19)
          goto LABEL_39;
        v41 = 0;
        v13 = (int *)(v17 + 96);
        v21 = 16320;
        if (v20 < 0x3FC0)
          v21 = v20;
        v15 = v21 / __size;
        v10 += v21 / __size * __size;
        if (!(v21 / __size))
        {
LABEL_39:
          release_file_streams_for_task(a1);
          return 0;
        }
      }
      if (*((_DWORD *)v7 + 2))
      {
        v22 = 0;
        v23 = 1;
        do
        {
          v24 = &v13[8 * v22];
          v25 = *((_QWORD *)v24 + 1);
          if (!a2 || (v26 = v25 == (a2 ^ 0x5555), v25 = a2 ^ 0x5555, v26))
          {
            v27 = *(_QWORD *)v24;
            v28 = *((_QWORD *)v24 + 2);
            v29 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            v44 = v24[6];
            v45 = 0;
            v46 = v28;
            v47 = v27;
            v48 = v25 ^ 0x5555;
            v29(a3, &v44);
          }
          v22 = v23;
          v19 = v15 > v23++;
        }
        while (v19);
      }
      else
      {
        v30 = 0;
        v31 = 1;
        do
        {
          v32 = v13[6 * v30 + 1];
          if (!a2 || (v26 = v32 == (a2 ^ 0x5555), v32 = a2 ^ 0x5555, v26))
          {
            v33 = &v13[6 * v30];
            v34 = *v33;
            v35 = *((_QWORD *)v33 + 1);
            v36 = *(void (**)(uint64_t, unsigned int *))(a3 + 16);
            v44 = v33[4];
            v45 = 0;
            v46 = v35;
            v47 = v34;
            v48 = v32 ^ 0x5555u;
            v36(a3, &v44);
          }
          v30 = v31;
          v19 = v15 > v31++;
        }
        while (v19);
      }
      v7 = v38;
      if ((v41 & 1) == 0)
        goto LABEL_39;
    }
  }
  v9 = updated;
  release_file_streams_for_task(a1);
  return v9;
}

uint64_t __msl_disk_stack_logs_enumerate_from_task_block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t (*v3)(_OWORD *, uint64_t);
  __int128 v4;
  _OWORD v6[2];

  v3 = *(uint64_t (**)(_OWORD *, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return v3(v6, v2);
}

uint64_t msl_payload_for_vm_region_in_task(mach_port_name_t a1, unint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t invalid;
  uint64_t v7;
  uint64_t v8;
  int v10;

  v10 = 0;
  v4 = retain_file_streams_for_task_with_error(a1, 0, &v10);
  if (!v4)
    return msl_payload_get_invalid();
  v5 = v4;
  if (update_cache_for_file_streams())
  {
    release_file_streams_for_task(a1);
    return msl_payload_get_invalid();
  }
  invalid = msl_payload_get_invalid();
  v7 = v5[4];
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 16448);
    if (v8)
      invalid = radix_tree_lookup(v8, a2);
  }
  release_file_streams_for_task(a1);
  return invalid;
}

uint64_t msl_uniquing_table_get_frames_from_task(mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  void *v12;
  uint64_t frames_from_task_helper;
  int v15;

  if (a2 > 0xFFFFFFFE)
    return 5;
  v15 = 0;
  v12 = retain_file_streams_for_task_with_error(a1, 0, &v15);
  if (!v12)
    return 5;
  frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper((uint64_t)v12, a2, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_get_frames_for_stackid(mach_port_name_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5, BOOL *a6)
{
  void *v12;
  uint64_t v13;
  unint64_t uniquing_table_index;
  uint64_t frames_from_task_helper;
  int v17;

  v17 = 0;
  v12 = retain_file_streams_for_task_with_error(a1, 0, &v17);
  if (!v12)
    return 5;
  v13 = (uint64_t)v12;
  uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
  frames_from_task_helper = msl_uniquing_table_get_frames_from_task_helper(v13, uniquing_table_index, a3, a4, a5, a6);
  release_file_streams_for_task(a1);
  return frames_from_task_helper;
}

uint64_t msl_uniquing_table_read_stack(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4, unsigned int a5)
{
  uint64_t v10;
  unsigned int uniquing_table_index;

  v10 = 5;
  if (!msl_payload_is_invalid(a2))
  {
    uniquing_table_index = msl_payload_get_uniquing_table_index(a2);
    uniquing_table_unwind_stack_remote(a1, uniquing_table_index, a3, a4, a5);
    if (*a4)
      return 0;
    else
      return 5;
  }
  return v10;
}

_QWORD *msl_uniquing_table_copy_from_task(mach_port_name_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = retain_file_streams_for_task_with_error(a1, 0, 0);
  if (v2)
  {
    if (update_cache_for_file_streams())
    {
      v2 = 0;
    }
    else
    {
      v3 = v2[4];
      v2 = *(_QWORD **)(v3 + 16432);
      if (v2)
        *(_QWORD *)(v3 + 16432) = 0;
    }
    release_file_streams_for_task(a1);
  }
  return v2;
}

uint64_t append_int(uint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  _BYTE *v11;

  if (_platform_strlen() < (unint64_t)a3)
    return 0;
  v6 = _platform_strlen();
  LODWORD(v7) = 0;
  v8 = a2;
  do
  {
    v7 = (v7 + 1);
    v9 = v8 >= a3;
    v8 /= a3;
  }
  while (v9);
  v10 = v6 + v7;
  if (v10 > 0x3FF)
    return 0;
  *(_BYTE *)(a1 + v10) = 0;
  if ((_DWORD)v7)
  {
    v11 = (_BYTE *)(v6 + a1 + v7 - 1);
    do
    {
      *v11-- = a0123456789abcd[a2 % a3];
      a2 /= a3;
      --v7;
    }
    while (v7);
  }
  return 1;
}

uint64_t delete_logging_file(uint64_t result)
{
  const char *v1;
  stat v2;

  if (result)
  {
    v1 = (const char *)result;
    if (*(_BYTE *)result && (memset(&v2, 0, sizeof(v2)), unlink((const char *)result)) && !stat(v1, &v2))
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

FILE *open_log_file_at_path(char *a1, uint64_t a2)
{
  FILE *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = fopen(a1, "re");
  if (v4)
  {
    if (strrchr(a1, 47) && _platform_strchr() && (v5 = _platform_strchr()) != 0)
    {
      v6 = strtoll((const char *)(v5 + 1), 0, 16);
      *(_QWORD *)(a2 + 16) = v4;
      *(_QWORD *)(a2 + 24) = v6;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t map_shared_memory(uint64_t a1, mach_vm_address_t a2)
{
  mach_vm_address_t v4;
  uint64_t result;
  void *v6;
  size_t v7;

  v4 = map_shared_memory_from_task(*(_DWORD *)a1, a2, 0x4000uLL);
  *(_QWORD *)(a1 + 40) = v4;
  if (v4)
  {
    result = _platform_memcmp();
    if (!(_DWORD)result)
      return result;
    v6 = *(void **)(a1 + 40);
    v7 = 0x4000;
  }
  else
  {
    v7 = 8;
    v6 = (void *)map_shared_memory_from_task(*(_DWORD *)a1, a2, 8uLL);
    *(_QWORD *)(a1 + 40) = v6;
    if (!v6)
    {
      msl_printf(3);
      return 5;
    }
  }
  munmap(v6, v7);
  *(_QWORD *)(a1 + 40) = 0;
  return 257;
}

mach_vm_address_t map_shared_memory_from_task(vm_map_read_t src_task, mach_vm_address_t src_address, mach_vm_size_t a3)
{
  vm_prot_t v4;
  vm_prot_t cur_protection;
  mach_vm_address_t target_address;

  target_address = 0;
  v4 = 1;
  cur_protection = 0;
  if (mach_vm_remap_new(*MEMORY[0x24BDB1040], &target_address, a3, 0, 33, src_task, src_address, 0, &cur_protection, &v4, 2u))
  {
    return 0;
  }
  else
  {
    return target_address;
  }
}

FILE *open_log_file_from_directory(int a1, char *a2, uint64_t a3)
{
  DIR *v6;
  DIR *v7;
  size_t v8;
  dirent *v9;
  const char *d_name;
  FILE *v11;
  char v13[1024];
  char __str[1024];
  uint64_t v15;

  v15 = *MEMORY[0x24BDB0D28];
  v6 = opendir(a2);
  if (!v6)
    return 0;
  v7 = v6;
  snprintf(__str, 0x400uLL, "%s%d.", "stack-logs.", a1);
  v8 = _platform_strlen();
  while (1)
  {
    v9 = readdir(v7);
    if (!v9)
      break;
    d_name = v9->d_name;
    if (!strncmp(v9->d_name, __str, v8))
    {
      snprintf(v13, 0x400uLL, "%s/%s", a2, d_name);
      v11 = open_log_file_at_path(v13, a3);
      goto LABEL_8;
    }
  }
  v11 = 0;
LABEL_8:
  closedir(v7);
  return v11;
}

void insert_node(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  unsigned int v11;
  FILE **v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  unint64_t *v29;
  unint64_t v31;

  v4 = *(_QWORD *)(a1 + 8);
  v31 = a2 >> 2;
  v5 = (a2 >> 2) % (v4 - 1);
  v6 = *(_QWORD **)(a1 + 24);
  v7 = v6[2 * v5];
  if (v7)
    v8 = v7 == a2;
  else
    v8 = 1;
  if (!v8)
  {
    LODWORD(v10) = 0;
    v11 = *(_DWORD *)(a1 + 16);
    v12 = (FILE **)MEMORY[0x24BDB0D30];
    v13 = v4 / ((2 * v11) | 1);
    do
    {
      v10 = (v10 + 1);
      v14 = v5 + v13 * v10;
      if (v14 >= v4)
        v15 = v4;
      else
        v15 = 0;
      if (v10 <= v11)
      {
        v5 = v14 - v15;
      }
      else
      {
        *(_QWORD *)a1 *= 4;
        *(_QWORD *)(a1 + 8) = 4 * v4;
        *(_DWORD *)(a1 + 16) = v11 + 3;
        *(_QWORD *)(a1 + 24) = malloc_type_calloc(4 * v4, 0x10uLL, 0x1000040451B5BE8uLL);
        if (v4)
        {
          for (i = 0; i != v4; ++i)
          {
            v17 = &v6[2 * i];
            v18 = *v17;
            if (*v17)
            {
              LODWORD(v19) = 0;
              v20 = *(_QWORD *)(a1 + 8);
              v21 = (v18 >> 2) % (v20 - 1);
              v22 = *(_DWORD *)(a1 + 16);
              v23 = *(_QWORD *)(a1 + 24);
              while (1)
              {
                v24 = *(_QWORD *)(v23 + 16 * v21);
                if (v24 == v18)
                {
                  fwrite("impossible collision! two address==address lists! (transfer_node)\n", 0x42uLL, 1uLL, *v12);
                  goto LABEL_23;
                }
                if (!v24)
                  break;
                v19 = (v19 + 1);
                v25 = v21 + v20 / ((2 * v22) | 1) * v19;
                if (v25 >= v20)
                  v26 = *(_QWORD *)(a1 + 8);
                else
                  v26 = 0;
                v21 = v25 - v26;
                if (v19 > v22)
                  goto LABEL_23;
              }
              *(_OWORD *)(v23 + 16 * v21) = *(_OWORD *)v17;
LABEL_23:
              if (v19 > *(_DWORD *)(a1 + 16))
                fprintf(*v12, "reporting bad hash function! disk stack logging reader %lu bit. (transfer_node)\n", 64);
            }
          }
        }
        free(v6);
        LODWORD(v10) = 0;
        v4 = *(_QWORD *)(a1 + 8);
        v5 = v31 % (v4 - 1);
        v11 = *(_DWORD *)(a1 + 16);
        v6 = *(_QWORD **)(a1 + 24);
        v13 = v4 / ((2 * v11) | 1);
      }
      v27 = v6[2 * v5];
      if (v27)
        v28 = v27 == a2;
      else
        v28 = 1;
    }
    while (!v28);
  }
  v29 = &v6[2 * v5];
  *v29 = a2;
  v29[1] = a3;
}

uint64_t initialize_no_footprint_for_debug_flag()
{
  mach_error_t v0;
  uint64_t result;
  int v2;

  v2 = 1;
  v0 = sysctlbyname("vm.task_no_footprint_for_debug", 0, 0, &v2, 4uLL);
  if (v0)
  {
    mach_error_string(v0);
    return msl_printf(3);
  }
  else
  {
    result = msl_printf_nostderr(5);
    enabled_no_footprint = 1;
  }
  return result;
}

void set_malloc_stack_logging_start_timestamp()
{
  kern_return_t v0;
  double v1;

  if (!malloc_stack_logging_start_timestamp)
  {
    malloc_stack_logging_start_timestamp = mach_continuous_approximate_time();
    v0 = mach_timebase_info((mach_timebase_info_t)&set_malloc_stack_logging_start_timestamp_mach_time_info);
    v1 = 1.0;
    if (!v0 && dword_2544F443C)
    {
      LODWORD(v1) = set_malloc_stack_logging_start_timestamp_mach_time_info;
      v1 = (double)*(unint64_t *)&v1 / (double)dword_2544F443C;
      if ((*(_QWORD *)&v1 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000
        || *(_QWORD *)&v1 == 0x7FF0000000000000
        || (unint64_t)(*(_QWORD *)&v1 - 1) < 0xFFFFFFFFFFFFFLL
        || *(_QWORD *)&v1 == 0)
      {
        v1 = 1.0;
      }
    }
    mach_to_ns_factor = *(_QWORD *)&v1;
  }
}

uint64_t msl_payload_create(uint64_t a1, int a2, char a3)
{
  double v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a1 == -1)
  {
    v11 = -256;
    v10 = -1;
  }
  else
  {
    v6 = *(double *)&mach_to_ns_factor
       * (double)(mach_continuous_approximate_time() - malloc_stack_logging_start_timestamp);
    if (a2 && (v7 = (unint64_t)(v6 / 1000.0), !(v7 >> 39)))
    {
      v12 = (8 * (v7 & 0x7FFFFFFFFFLL)) | (2 * (a3 & 1)) | (a1 << 42);
      v10 = (8 * v7) | (2 * (a3 & 1)) | 1;
      v11 = v12 & 0xFFFFFFFFFFFFFF00;
    }
    else
    {
      v8 = v6 / 1000000.0;
      v9 = 0x7FFFFFFFLL;
      if ((unint64_t)v8 < 0x7FFFFFFF)
        v9 = (unint64_t)v8;
      v10 = (2 * (a3 & 1)) & 7 | (8 * v9);
      v11 = (8 * v9) & 0x3FFFFFF00 | (a1 << 34);
    }
  }
  return v11 | v10;
}

void msl_payload_set_in_lite_zone_ptr(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  size_t v8;

  if (a2 <= 1)
    v5 = 1;
  else
    v5 = a2;
  v6 = a1 + a4;
  *(_QWORD *)(a1 + a4 - 8) = a5;
  if (v5 + 8 > a4)
    msl_payload_set_in_lite_zone_ptr_cold_1();
  v7 = a4 - v5;
  if (a4 - v5 - 8 < 8)
  {
    if (a4 - v5 == 8)
    {
      v8 = 0;
    }
    else
    {
      if (a4 != a3)
        msl_payload_set_in_lite_zone_ptr_cold_2();
      *(_BYTE *)(v6 - 9) = 2 * (a4 - a2);
      v8 = v7 - 9;
    }
  }
  else
  {
    *(_DWORD *)(v6 - 16) = a3 - a2;
    *(_WORD *)(v6 - 12) = (a3 - a2) >> 32;
    *(_BYTE *)(v6 - 10) = a4 - a3;
    *(_BYTE *)(v6 - 9) = ((a4 - a3) >> 7) | 1;
    v8 = v7 - 16;
  }
  bzero((void *)(v5 + a1), v8);
}

uint64_t msl_payload_get_allocation_timestamp(unint64_t a1)
{
  if (a1 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  if ((a1 & 1) != 0)
    return malloc_stack_logging_start_timestamp + 1000 * ((a1 >> 3) & 0x7FFFFFFFFFLL);
  return malloc_stack_logging_start_timestamp + 1000000 * ((a1 >> 3) & 0x7FFFFFFF);
}

BOOL msl_payload_is_invalid(uint64_t a1)
{
  return (unint64_t)(a1 + 1) < 2;
}

uint64_t msl_payload_get_uniquing_table_index(unint64_t a1)
{
  char v1;
  unint64_t v2;

  v1 = 42;
  if ((a1 & 1) == 0)
    v1 = 34;
  v2 = a1 >> v1;
  if (a1 - 1 >= 0xFFFFFFFFFFFFFFFELL)
    return -1;
  else
    return v2;
}

uint64_t msl_payload_get_size_info(_QWORD *a1, unsigned int *a2, unint64_t *a3, uint64_t *a4)
{
  BOOL v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  int v9;
  BOOL v10;

  if (a1 && a2 && ((unint64_t)(*a1 + 1) >= 2 ? (v4 = (*a1 & 2) == 0) : (v4 = 1), !v4))
  {
    v7 = *((unsigned __int8 *)a2 + 7);
    if ((v7 & 1) != 0)
    {
      v8 = *a2 | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 32);
      if (a3)
        *a3 = v8;
      if (!a4)
        return 8;
      v9 = *((unsigned __int8 *)a2 + 7) >> 1;
      if (*((unsigned __int8 *)a2 + 6) | ((v9 & 0x7F) << 8))
        v10 = 1;
      else
        v10 = v8 >= 8;
      v5 = 0x8000;
      if (v10)
        v5 = *((unsigned __int8 *)a2 + 6) | ((v9 & 0x7F) << 8);
      result = 8;
      goto LABEL_11;
    }
    if (a3)
      *a3 = v7 >> 1;
    result = 1;
    if (a4)
    {
      v5 = 0;
LABEL_11:
      *a4 = v5;
    }
  }
  else
  {
    if (a3)
      *a3 = 8;
    v5 = 0;
    result = 0;
    if (a4)
      goto LABEL_11;
  }
  return result;
}

uint64_t msl_payload_get_invalid()
{
  return -1;
}

uint64_t msl_payload_create_from_index(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 << 34;
  if (a1 == 0xFFFFFFFFLL)
    v1 = -1;
  if (a1 == -1)
    return -1;
  else
    return v1;
}

uint64_t msl_payload_from_lite_zone_ptr_internal(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + a1 - 8);
}

uint64_t msl_payload_from_lite_zone_ptr(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  if (a3)
    return *(_QWORD *)(a2 + a1 - 8);
  result = -1;
  if (a1 && a2 >= 8 && !__CFADD__(a1, a2))
  {
    v5 = *(_QWORD *)(a2 + a1 - 8);
    v6 = v5 == -1 || v5 == 0xFFFFFFFFLL;
    v7 = v5 << 34;
    if (v6)
      return -1;
    else
      return v7;
  }
  return result;
}

uint64_t msl_uniquing_table_enumerate(uint64_t a1, uint64_t a2)
{
  int v2;
  _QWORD v4[5];
  int v5;

  v2 = (*(unsigned __int8 *)(a1 + 60) >> 1) & 1;
  v4[0] = MEMORY[0x24BDB0CE0];
  v4[1] = 0x40000000;
  v4[2] = __msl_uniquing_table_enumerate_block_invoke;
  v4[3] = &unk_24BF00E60;
  v5 = v2;
  v4[4] = a2;
  return uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v4);
}

uint64_t __msl_uniquing_table_enumerate_block_invoke(uint64_t result, _QWORD *a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = result;
    v5 = a3;
    while (*(_DWORD *)(v4 + 40))
    {
      if ((*a2 & 0xFFFFFFFFFFFFLL) != 0)
        goto LABEL_5;
LABEL_6:
      a2 += 2;
      if (!--v5)
        return result;
    }
    if (!*a2)
      goto LABEL_6;
LABEL_5:
    result = (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
    goto LABEL_6;
  }
  return result;
}

uint64_t msl_uniquing_table_get_frames_from_table(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v5;

  v5 = 5;
  if (a2 <= 0xFFFFFFFE)
  {
    uniquing_table_unwind_stack_remote(a1, a2, a3, a5, a4);
    if (*a5)
      return 0;
    else
      return 5;
  }
  return v5;
}

uint64_t msl_uniquing_table_sizeof(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0x4000;
  v3[0] = MEMORY[0x24BDB0CE0];
  v3[1] = 0x40000000;
  v3[2] = __msl_uniquing_table_sizeof_block_invoke;
  v3[3] = &unk_24BF00E88;
  v3[4] = &v4;
  uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __msl_uniquing_table_sizeof_block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 16 * a3;
  return result;
}

mach_vm_address_t msl_uniquing_table_serialize(uint64_t a1, mach_vm_size_t *a2)
{
  mach_vm_size_t v4;
  mach_vm_address_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  mach_vm_address_t address;

  v4 = msl_uniquing_table_sizeof(a1);
  *a2 = v4;
  address = 0;
  if (mach_vm_allocate(*MEMORY[0x24BDB1040], &address, v4, 1))
  {
    v5 = 0;
    *a2 = 0;
  }
  else
  {
    v5 = address;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2000000000;
    *(_OWORD *)address = *(_OWORD *)"MslUniquingTable";
    *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
    v7 = *(_OWORD *)(a1 + 32);
    v6 = *(_OWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 16);
    *(_DWORD *)(v5 + 80) = *(_DWORD *)(a1 + 64);
    *(_OWORD *)(v5 + 48) = v7;
    *(_OWORD *)(v5 + 64) = v6;
    *(_OWORD *)(v5 + 32) = v8;
    v15[3] = v5 + 0x4000;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2000000000;
    v14 = 0;
    v10[0] = MEMORY[0x24BDB0CE0];
    v10[1] = 0x40000000;
    v10[2] = __msl_uniquing_table_serialize_block_invoke;
    v10[3] = &unk_24BF00EB0;
    v10[4] = &v11;
    v10[5] = v15;
    uniquing_table_remote_enumerate_chunks(a1, (uint64_t)v10);
    if (v12[3] != *(_QWORD *)(a1 + 8))
      msl_uniquing_table_serialize_cold_1();
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(v15, 8);
  }
  return v5;
}

void *__msl_uniquing_table_serialize_block_invoke(uint64_t a1, const void *a2, unsigned int a3)
{
  mach_vm_size_t v5;
  void *result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a3;
  v5 = 16 * a3;
  result = (void *)mach_vm_copy(*MEMORY[0x24BDB1040], (mach_vm_address_t)a2, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if ((_DWORD)result)
    result = memcpy(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2, v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
  return result;
}

char *msl_uniquing_table_copy_from_serialized(uint64_t a1, unint64_t a2)
{
  char *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  mach_vm_size_t *v9;

  if (a2 < 0x54 || strncmp((const char *)a1, "MslUniquingTable", 0x10uLL))
    return 0;
  v4 = (char *)malloc_type_malloc(0x44uLL, 0x10200402DA45A13uLL);
  *(_OWORD *)v4 = *(_OWORD *)(a1 + 16);
  v6 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 32);
  *((_DWORD *)v4 + 16) = *(_DWORD *)(a1 + 80);
  *((_OWORD *)v4 + 2) = v6;
  *((_OWORD *)v4 + 3) = v5;
  *((_OWORD *)v4 + 1) = v7;
  v8 = *((_QWORD *)v4 + 1);
  if (16 * v8 + 0x4000 < a2
    || (v9 = uniquing_table_chunk_from_slots(a1 + 0x4000, v8), (*(_QWORD *)(v4 + 44) = v9) == 0))
  {
    free(v4);
    return 0;
  }
  *((_DWORD *)v4 + 16) = 1;
  return v4;
}

void msl_lock_init()
{
  stack_logging_lock = 0;
  thread_doing_logging = 0;
}

pthread_t __malloc_lock_stack_logging()
{
  pthread_t result;

  os_unfair_lock_lock_with_options();
  result = pthread_self();
  thread_doing_logging = (uint64_t)result;
  return result;
}

void __malloc_unlock_stack_logging()
{
  int v0;
  unsigned int v1;

  thread_doing_logging = 0;
  v0 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v1 = __ldxr((unsigned int *)&stack_logging_lock);
    if (v1 != v0)
      break;
    if (!__stlxr(0, (unsigned int *)&stack_logging_lock))
      return;
  }
  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
}

BOOL __malloc_stack_logging_is_reentered()
{
  pthread_t v0;

  v0 = (pthread_t)thread_doing_logging;
  return v0 == pthread_self();
}

uint64_t msl_stack_logging_locked()
{
  unint64_t StatusReg;
  unsigned int v1;
  int v3;
  int v4;
  unsigned int v5;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v1 = *(_DWORD *)(StatusReg + 24);
  do
  {
    if (__ldaxr((unsigned int *)&stack_logging_lock))
    {
      v3 = 0;
      __clrex();
      return v3 ^ 1u;
    }
  }
  while (__stxr(v1, (unsigned int *)&stack_logging_lock));
  v3 = 1;
  v4 = *(_DWORD *)(StatusReg + 24);
  while (1)
  {
    v5 = __ldxr((unsigned int *)&stack_logging_lock);
    if (v5 != v4)
      break;
    if (!__stlxr(0, (unsigned int *)&stack_logging_lock))
      return v3 ^ 1u;
  }
  __clrex();
  os_unfair_lock_unlock((os_unfair_lock_t)&stack_logging_lock);
  return v3 ^ 1u;
}

void radix_tree_lookup_interval_cold_1()
{
  __assert_rtn("radix_tree_lookup_interval", "radix_tree.c", 235, "!answer_found(ans) || intervals_intersect(keys, ans.interval)");
}

void radix_tree_delete_cold_1()
{
  __assert_rtn("radix_tree_delete", "radix_tree.c", 482, "ok");
}

void radix_tree_insert_recursive_cold_1()
{
  __assert_rtn("radix_tree_insert_recursive", "radix_tree.c", 291, "keyshift < RADIX_TREE_KEY_BITS");
}

void radix_tree_insert_recursive_cold_2()
{
  __assert_rtn("radix_tree_insert_recursive", "radix_tree.c", 292, "node");
}

void radix_tree_insert_recursive_cold_3()
{
  __assert_rtn("set_leaf_size", "radix_tree_internal.h", 129, "leaf_size(tree, node) == size");
}

void radix_tree_insert_recursive_cold_4()
{
  __assert_rtn("radix_tree_insert_recursive", "radix_tree.c", 300, "false");
}

void radix_tree_delete_recursive_cold_1()
{
  __assert_rtn("radix_tree_delete_recursive", "radix_tree.c", 426, "keyshift < RADIX_TREE_KEY_BITS");
}

void radix_tree_delete_recursive_cold_2()
{
  __assert_rtn("radix_tree_delete_recursive", "radix_tree.c", 427, "node");
}

void radix_tree_delete_recursive_cold_3()
{
  __assert_rtn("radix_tree_delete_recursive", "radix_tree.c", 445, "child");
}

void radix_tree_init_cold_1()
{
  __assert_rtn("radix_tree_init", "radix_tree.c", 516, "tree->num_nodes >= 3");
}

void radix_tree_init_cold_2()
{
  __assert_rtn("radix_tree_init", "radix_tree.c", 514, "nodestart < nodesend");
}

void radix_tree_destroy_cold_1()
{
  __assert_rtn("radix_tree_destroy", "radix_tree.c", 578, "result == KERN_SUCCESS");
}

void radix_tree_size_cold_1()
{
  __assert_rtn("radix_tree_size", "radix_tree.c", 609, "ceil - size < sizeof(struct radix_node)");
}

void radix_tree_lookup_recursive_cold_1()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 158, "node");
}

void radix_tree_lookup_recursive_cold_2()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 159, "intervals_intersect(nodekeys, keys)");
}

void radix_tree_lookup_recursive_cold_3()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 160, "keyshift < RADIX_TREE_KEY_BITS");
}

void radix_tree_lookup_recursive_cold_4()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 161, "!fixnode(node)");
}

void radix_tree_lookup_recursive_cold_5()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 179, "intervals_intersect(nodekeys, keys)");
}

void radix_tree_lookup_recursive_cold_6()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 198, "leaf");
}

void radix_tree_lookup_recursive_cold_7()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 201, "size <= edgekeys.size");
}

void radix_tree_lookup_recursive_cold_8()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 199, "keyshift + edge->labelBits == RADIX_TREE_KEY_BITS");
}

void radix_tree_lookup_recursive_cold_9()
{
  __assert_rtn("radix_tree_lookup_recursive", "radix_tree.c", 194, "interval_is_subset(edgekeys, nodekeys)");
}

void radix_tree_lookup_recursive_cold_10()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 178, "(key & (mask << shift)) == 0");
}

void radix_tree_lookup_recursive_cold_11()
{
  __assert_rtn("extend_key", "radix_tree_internal.h", 176, "(label & ~mask) == 0");
}

void radix_tree_allocate_node_cold_1()
{
  __assert_rtn("radix_tree_allocate_node", "radix_tree.c", 260, "node");
}

void radix_tree_free_node_cold_1()
{
  __assert_rtn("radix_tree_free_node", "radix_tree.c", 277, "node");
}

void uniquing_table_remote_retain_cold_1()
{
  __assert_rtn("uniquing_table_remote_retain", "uniquing_table_reader.c", 237, "table != NULL");
}

void uniquing_table_remote_retain_cold_2()
{
  __assert_rtn("uniquing_table_remote_retain", "uniquing_table_reader.c", 238, "table->refcount > 0");
}

void uniquing_table_remote_release_cold_1()
{
  __assert_rtn("uniquing_table_remote_release", "uniquing_table_reader.c", 248, "table->refcount > 0");
}

void uniquing_table_remote_enumerate_chunks_cold_1()
{
  __assert_rtn("uniquing_table_remote_enumerate_chunks", "uniquing_table_reader.c", 263, "enumerator != NULL");
}

void uniquing_table_destroy_husk_exclusive_cold_1()
{
  __assert_rtn("uniquing_table_destroy_husk_exclusive", "uniquing_table_mutator.c", 437, "uniquing_table_is_husk(table)");
}

void uniquing_table_release_cold_1()
{
  __assert_rtn("uniquing_table_release", "uniquing_table_mutator.c", 445, "previous_refcount >= 1");
}

void uniquing_table_release_cold_2()
{
  __assert_rtn("uniquing_table_release", "uniquing_table_mutator.c", 457, "atomic_load(&table_of_specific_size->refcount) == 0");
}

void msl_get_hash_cache_cold_1()
{
  __assert_rtn("msl_get_hash_cache", "uniquing_table_mutator.c", 812, "hash_cache != NULL");
}

void uniquing_table_stack_retain_internal_cold_1()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 902, "*in_out_parent == UNIQUING_TABLE_INVALID_INDEX || cache_allowed");
}

void uniquing_table_stack_retain_internal_cold_2()
{
  __assert_rtn("uniquing_table_expand", "uniquing_table_mutator.c", 592, "size_info_index < UNIQUING_TABLE_SIZES");
}

void uniquing_table_stack_retain_internal_cold_3()
{
  __assert_rtn("uniquing_table_expand", "uniquing_table_mutator.c", 594, "size_info_index >= 0");
}

void uniquing_table_stack_retain_internal_cold_4()
{
  __assert_rtn("uniquing_table_stack_retain_internal", "uniquing_table_mutator.c", 1150, "parent_slot != UNIQUING_TABLE_INVALID_INDEX");
}

void uniquing_table_stack_retain_internal_cold_5()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1079, "input_remaining_frames == thread_local_buffer->cur_cache->num_frames");
}

void uniquing_table_stack_retain_internal_cold_6()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1068, "remaining_frames == checkpoint_remaining_frames");
}

void uniquing_table_stack_retain_internal_cold_7()
{
  __assert_rtn("enter_frames_in_table", "uniquing_table_mutator.c", 1067, "parent == checkpoint_parent");
}

void uniquing_table_stack_retain_internal_cold_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("release_nonzero_slot", "uniquing_table_mutator.c", a3, "sub_result.normal_slot.refcount >= amount");
}

void uniquing_table_stack_retain_internal_cold_11()
{
  __assert_rtn("assert_nonzero_slot", "uniquing_table_mutator.c", 668, "check_result.normal_slot.refcount > 0");
}

void uniquing_table_stack_retain_internal_cold_14()
{
  __assert_rtn("uniquing_table_node_retain_internal", "uniquing_table_mutator.c", 1241, "retrieved.normal_slot.refcount > 0");
}

void uniquing_table_stack_retain_internal_cold_15()
{
  __assert_rtn("uniquing_table_node_retain_internal", "uniquing_table_mutator.c", 1236, "index < table_of_specific_size->numNodes");
}

void uniquing_table_retain_cold_1()
{
  __assert_rtn("uniquing_table_retain", "uniquing_table_mutator.c", 571, "updated_index != index");
}

void uniquing_table_node_release_internal_cold_1()
{
  __assert_rtn("uniquing_table_node_release_internal", "uniquing_table_mutator.c", 1275, "previous_refcount >= refs");
}

void create_and_insert_lite_zone_cold_1()
{
  __assert_rtn("create_and_insert_lite_zone", "magazine_lite.c", 728, "active_lite_zone == NULL");
}

void stack_logging_lite_destroy_cold_1()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 569, "active_lite_zone != NULL");
}

void stack_logging_lite_destroy_cold_2()
{
  __assert_rtn("stack_logging_lite_destroy", "magazine_lite.c", 579, "deallocate_zone_error == KERN_SUCCESS");
}

void create_log_file_cold_1()
{
  __assert_rtn("create_log_file", "stack_logging_disk.c", 507, "stack_log_len < PATH_MAX");
}

void msl_payload_set_in_lite_zone_ptr_cold_1()
{
  __assert_rtn("msl_payload_set_in_lite_zone_ptr", "msl_payload.c", 205, "expanded_size >= guaranteed_size + sizeof(msl_payload_t)");
}

void msl_payload_set_in_lite_zone_ptr_cold_2()
{
  __assert_rtn("msl_payload_set_in_lite_zone_ptr", "msl_payload.c", 229, "expanded_size == unexpanded_size");
}

void msl_uniquing_table_serialize_cold_1()
{
  __assert_rtn("msl_uniquing_table_serialize", "msl_uniquing_table_reader_adapter.c", 146, "num_nodes == table->numNodes");
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDB0CD0](a1, *(_QWORD *)&a2);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDB0CF8](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDB0F50]();
}

uint64_t _os_once()
{
  return MEMORY[0x24BDB11D0]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x24BDB11D8]();
}

uint64_t _platform_memcmp()
{
  return MEMORY[0x24BDB11E0]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x24BDB11E8]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x24BDB11F0]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x24BDB11F8]();
}

uint64_t _platform_strlcat()
{
  return MEMORY[0x24BDB1200]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x24BDB1208]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x24BDB1210]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x24BDB1218]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x24BDB1220]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x24BDB1228]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x24BDB1230]();
}

uint64_t _simple_put()
{
  return MEMORY[0x24BDB1238]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x24BDB1240]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x24BDB1248]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x24BDB1250]();
}

uint64_t _simple_string()
{
  return MEMORY[0x24BDB1258]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x24BDB1260]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x24BDB1268]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x24BDB0F70]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDB0F78](a1, *(_QWORD *)&a2);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x24BDB0D50](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDB0D68](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDB0F88](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDB0D78](a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDB0D80](*(_QWORD *)&a1, a2, a3);
}

int dup(int a1)
{
  return MEMORY[0x24BDB0F98](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDB0D88](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDB0D90](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDB0D98](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDB0DA0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDB0DA8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDB0DC0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDB1128](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDB0DC8](__stream, a2, *(_QWORD *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDB0FB0](*(_QWORD *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDB0DD0](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDB0DF8](__ptr, __size, __nitems, __stream);
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x24BDB0FD0](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDB0E00](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDB0FE8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDB0E08]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDB0E18](*(_QWORD *)&a1);
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x24BDB1010]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDB1018](*(_QWORD *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x24BDB1028](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x24BDB1030](*(_QWORD *)&mem_entry, *(_QWORD *)&owner, *(_QWORD *)&ledger_tag, *(_QWORD *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDB1038](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDB1048](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDB1050](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_copy(vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  return MEMORY[0x24BDB1058](*(_QWORD *)&target_task, source_address, size, dest_address);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDB1060](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_read(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x24BDB1068](*(_QWORD *)&target_task, address, size, data, dataCnt);
}

kern_return_t mach_vm_read_overwrite(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x24BDB1070](*(_QWORD *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB1078](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

kern_return_t mach_vm_remap_new(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB1080](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x24BDB1130](start_size, *(_QWORD *)&flags);
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
  MEMORY[0x24BDB1138](zone);
}

uint64_t malloc_get_thread_options()
{
  return MEMORY[0x24BDB1140]();
}

void malloc_printf(const char *format, ...)
{
  MEMORY[0x24BDB1160](format);
}

uint64_t malloc_register_stack_logger()
{
  return MEMORY[0x24BDB1168]();
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  MEMORY[0x24BDB1178](zone, name);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDB1180](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1188](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1190](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1198](ptr, size, type_id);
}

void malloc_zone_register(malloc_zone_t *zone)
{
  MEMORY[0x24BDB11A0](zone);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
  MEMORY[0x24BDB11A8](zone);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDB0E28](__dst, __src, __n);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x24BDB0E40](__b, __pattern4, __len);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDB1090](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDB1098](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDB10A0](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDB0E50](a1);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDB1280]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDB1288](lock);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x24BDB10B0](*(_QWORD *)&t, x);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDB1290](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDB1298](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDB12A0]();
}

uint64_t pthread_self_is_exiting_np()
{
  return MEMORY[0x24BDB12A8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDB12B0](a1, a2);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDB0E70](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDB0E78](a1, a2);
}

uint64_t sandbox_query_approval_policy_for_path()
{
  return MEMORY[0x24BDB12B8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDB0E80](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDB10D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0E90](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDB0EA8](*(_QWORD *)&__errnum);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDB0EC0](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDB0ED8](__s, *(_QWORD *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0EE0](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0EE8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB0EF8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0F00](a1, a2, a3, a4, a5);
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  return MEMORY[0x24BDB10D8](*(_QWORD *)&suspend_token);
}

kern_return_t task_suspend2(task_read_t target_task, task_suspension_token_t *suspend_token)
{
  return MEMORY[0x24BDB10E0](*(_QWORD *)&target_task, suspend_token);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x24BDB0F08]();
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB10E8](a1);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDB10F8](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0F38](__str, __size, __format, a4);
}

