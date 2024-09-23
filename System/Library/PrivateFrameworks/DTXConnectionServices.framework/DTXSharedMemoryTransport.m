@implementation DTXSharedMemoryTransport

+ (id)schemes
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("shm"), CFSTR("mmap"), CFSTR("shmem"), 0);
}

+ (id)addressForPosixSharedMemoryWithName:(id)a3
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@://%@"), CFSTR("shm"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v3, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)addressForMemory:(unint64_t)a3 inProcess:(int)a4
{
  void *v4;
  void *v5;
  const char *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@://%d/%#llx"), CFSTR("mmap"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLWithString_(v4, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)totalSharedMemorySize
{
  return self->_shm->var0;
}

- (BOOL)_setupWithShm:(DTXSharedMemory *)a3 asCreator:(BOOL)a4
{
  OS_dispatch_queue *v6;
  OS_dispatch_queue *listenQueue;
  NSObject *v8;
  _QWORD block[5];

  if (a3)
  {
    self->_shm = a3;
    self->_creator = a4;
    v6 = (OS_dispatch_queue *)dispatch_queue_create("shared memory transport listener queue", 0);
    listenQueue = self->_listenQueue;
    self->_listenQueue = v6;

    v8 = self->_listenQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_21DC959F4;
    block[3] = &unk_24E1AAAC8;
    block[4] = self;
    dispatch_async(v8, block);
  }
  return a3 != 0;
}

- (BOOL)_setupCreatingSharedMemory:(id)a3 size:(int)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  int v15;
  int v16;
  void *v17;
  _QWORD *v18;
  const char *v19;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  size_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v6, v7, v8);
  v10 = (2 * a4);
  if (v9)
  {
    v11 = v9;
    v12 = strlen(v9);
    v13 = v12 + 1;
    v14 = (v10 + 16463 + v12 + 1) & 0xFFFFFFFFFFFFC000;
    if (v12 != -1)
    {
      v15 = shm_open(v11, 16777730, 511);
      if (v15 == -1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v21 = *__error();
          *(_DWORD *)buf = 136315906;
          v23 = v11;
          v24 = 2048;
          v25 = v14;
          v26 = 1024;
          v27 = 511;
          v28 = 1024;
          v29 = v21;
          _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error creating shared memory (name: %s, size: %lld, permissions: %x): %d\n", buf, 0x22u);
        }
      }
      else
      {
        v16 = v15;
        ftruncate(v15, v14);
        v17 = mmap(0, v14, 3, 1, v16, 0);
        close(v16);
        if (v17 != (void *)-1)
        {
          *(_QWORD *)v17 = v14;
          *((_QWORD *)v17 + 1) = v17;
          *((_QWORD *)v17 + 2) = v10 + 80;
          strlcpy((char *)v17 + v10 + 80, v11, v13);
LABEL_9:
          *((_DWORD *)v17 + 6) = 0;
          *((_DWORD *)v17 + 7) = a4;
          *((_DWORD *)v17 + 8) = a4;
          *((_DWORD *)v17 + 9) = a4;
          atomic_store(0, (unsigned int *)v17 + 13);
          atomic_store(0, (unsigned int *)v17 + 14);
          atomic_store(0, (unsigned int *)v17 + 15);
          atomic_store(0, (unsigned int *)v17 + 16);
          atomic_store(0, (unsigned int *)v17 + 12);
          atomic_store(getpid(), (unsigned int *)v17 + 10);
          atomic_store(0, (unsigned int *)v17 + 11);
          return objc_msgSend__setupWithShm_asCreator_(self, v19, (uint64_t)v17, 1);
        }
      }
      return 0;
    }
  }
  else
  {
    v14 = (v10 + 16463) & 0x1FFFFC000;
  }
  v18 = mmap(0, v14, 3, 4098, 167772160, 0);
  if (v18 != (_QWORD *)-1)
  {
    v17 = v18;
    *v18 = v14;
    v18[1] = v18;
    v18[2] = 0;
    goto LABEL_9;
  }
  return 0;
}

- (DTXSharedMemoryTransport)initWithLocalName:(id)a3 size:(int)a4
{
  uint64_t v4;
  id v6;
  DTXSharedMemoryTransport *v7;
  const char *v8;
  DTXSharedMemoryTransport *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTXSharedMemoryTransport;
  v7 = -[DTXTransport init](&v11, sel_init);
  v9 = v7;
  if (v7 && (objc_msgSend__setupCreatingSharedMemory_size_(v7, v8, (uint64_t)v6, v4) & 1) == 0)
  {

    v9 = 0;
  }

  return v9;
}

- (DTXSharedMemoryTransport)initWithRemoteAddress:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  DTXSharedMemoryTransport *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int isEqualToString;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  int v22;
  size_t *v23;
  size_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  mach_vm_address_t v43;
  vm_map_t *v44;
  kern_return_t v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint32_t v49;
  vm_map_t v50;
  vm_map_t v51;
  _BYTE *v52;
  int v53;
  NSObject *v54;
  const char *v55;
  int v56;
  const char *v57;
  vm_map_t v59;
  kern_return_t v60;
  mach_vm_address_t v61;
  mach_vm_size_t v62;
  kern_return_t v63;
  unsigned int v64;
  uint64_t v65;
  mach_port_name_t name;
  objc_super v67;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  _BYTE buf[24];
  void *v71;
  uint8_t *v72;
  uint8_t v73[8];
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t v77[4];
  mach_vm_address_t v78;
  __int16 v79;
  vm_map_t v80;
  __int16 v81;
  vm_prot_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)DTXSharedMemoryTransport;
  v7 = -[DTXTransport initWithRemoteAddress:](&v67, sel_initWithRemoteAddress_, v4);
  if (!v7)
    goto LABEL_40;
  objc_msgSend_scheme(v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("shm")))
  {

LABEL_5:
    objc_msgSend_host(v4, v12, v13);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend_UTF8String(v17, v18, v19);
    v21 = v20;
    if (!v20 || !*v20)
      goto LABEL_36;
    v22 = shm_open(v20, 2);
    if (v22 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v46 = *__error();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v46;
        v47 = MEMORY[0x24BDACB70];
        v48 = "Error connecting to shared memory (name: %s): %d\n";
        v49 = 18;
LABEL_24:
        _os_log_impl(&dword_21DC85000, v47, OS_LOG_TYPE_ERROR, v48, buf, v49);
      }
LABEL_36:
      v25 = 0;
      goto LABEL_37;
    }
    v23 = (size_t *)mmap(0, 0x1000uLL, 3, 1, v22, 0);
    if (v23 == (size_t *)-1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v53 = *__error();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 4096;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v53;
        v54 = MEMORY[0x24BDACB70];
        v55 = "Unable to map shared memory \"%s\" with size %ld: %d\n";
LABEL_34:
        _os_log_impl(&dword_21DC85000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x1Cu);
      }
    }
    else
    {
      v24 = *v23;
      munmap(v23, 0x1000uLL);
      v25 = (uint64_t)mmap(0, v24, 3, 1, v22, 0);
      if (v25 != -1)
      {
        close(v22);
        if (!v25)
        {
LABEL_37:

          goto LABEL_38;
        }
        v26 = atomic_load((unsigned int *)(v25 + 44));
        if (!v26 || v26 == getpid())
        {
          atomic_store(getpid(), (unsigned int *)(v25 + 44));
          v27 = *(_QWORD *)(v25 + 16);
          if (v27)
            shm_unlink((const char *)(v25 + v27));
          goto LABEL_37;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v26;
          v47 = MEMORY[0x24BDACB70];
          v48 = "Unable to attach to shared memory - process %d already attached.\n";
          v49 = 8;
          goto LABEL_24;
        }
        goto LABEL_36;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v56 = *__error();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v71) = v56;
        v54 = MEMORY[0x24BDACB70];
        v55 = "Unable to map shared memory \"%s\" with size %lld: %d\n";
        goto LABEL_34;
      }
    }
    close(v22);
    goto LABEL_36;
  }
  objc_msgSend_scheme(v4, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v14, v15, (uint64_t)CFSTR("shmem"));

  if (isEqualToString)
    goto LABEL_5;
  objc_msgSend_host(v4, v12, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_intValue(v28, v29, v30);

  objc_msgSend_path(v4, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_length(v34, v35, v36) <= 1)
  {

    v43 = 0;
  }
  else
  {
    objc_msgSend_path(v4, v37, v38);
    v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = objc_msgSend_UTF8String(v39, v40, v41);

    v43 = strtoull((const char *)(v42 + 1), 0, 16);
  }
  name = 0;
  v44 = (vm_map_t *)MEMORY[0x24BDAEC58];
  v45 = task_for_pid(*MEMORY[0x24BDAEC58], v31, &name);
  if (v45)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v31;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v45;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to acquire task for pid: %d (%d)\n", buf, 0xEu);
    }
    goto LABEL_39;
  }
  if (!v43)
    goto LABEL_58;
  v50 = name;
  if (name - 1 > 0xFFFFFFFD)
    goto LABEL_58;
  v51 = *v44;
  if (*v44 - 1 >= 0xFFFFFFFE)
    goto LABEL_58;
  *(_QWORD *)v73 = 0;
  v74 = v73;
  v75 = 0x2020000000;
  v76 = 0;
  *(_QWORD *)buf = MEMORY[0x24BDAC760];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_21DC973E8;
  v71 = &unk_24E1AB388;
  v72 = v73;
  v52 = buf;
  if (mach_task_is_self(v50))
  {
    (*(void (**)(_BYTE *, mach_vm_address_t))&buf[16])(v52, v43);
  }
  else
  {
    v59 = *v44;
    *(_QWORD *)cur_protection = 0;
    target_address = 0;
    v60 = mach_vm_remap(v59, &target_address, 0x50uLL, 0, 1048577, v50, v43, 0, &cur_protection[1], cur_protection, 2u);
    if (v60)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v77 = 134218496;
        v78 = v43;
        v79 = 1024;
        v80 = v50;
        v81 = 1024;
        v82 = v60;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", v77, 0x18u);
      }
      v61 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v77 = 134218496;
          v78 = v43;
          v79 = 1024;
          v80 = v50;
          v81 = 1024;
          v82 = cur_protection[1];
          _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", v77, 0x18u);
        }
        mach_vm_deallocate(v59, target_address, 0x50uLL);
      }
      v61 = target_address;
    }
    (*(void (**)(_BYTE *, mach_vm_address_t))&buf[16])(v52, v61);
    mach_vm_deallocate(*v44, v61, 0x50uLL);
  }

  v62 = *((_QWORD *)v74 + 3);
  if (!v62)
    goto LABEL_57;
  *(_QWORD *)cur_protection = 0;
  target_address = 0;
  v63 = mach_vm_remap(v51, &target_address, v62, 0, 1048577, v50, v43, 0, &cur_protection[1], cur_protection, 2u);
  if (v63)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = v63;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", v77, 0x18u);
    }
LABEL_57:
    _Block_object_dispose(v73, 8);
    goto LABEL_58;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 134218496;
      v78 = v43;
      v79 = 1024;
      v80 = v50;
      v81 = 1024;
      v82 = cur_protection[1];
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", v77, 0x18u);
    }
    mach_vm_deallocate(v51, target_address, v62);
  }
  v25 = target_address;
  _Block_object_dispose(v73, 8);
  if (!v25)
    goto LABEL_59;
  v64 = atomic_load((unsigned int *)(v25 + 44));
  if (!v64 || v64 == getpid())
  {
    atomic_store(getpid(), (unsigned int *)(v25 + 44));
    v65 = *(_QWORD *)(v25 + 16);
    if (v65)
      shm_unlink((const char *)(v25 + v65));
    goto LABEL_59;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v73 = 67109120;
    *(_DWORD *)&v73[4] = v64;
    _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to attach to shared memory - process %d already attached.\n", v73, 8u);
  }
LABEL_58:
  v25 = 0;
LABEL_59:
  mach_port_deallocate(*v44, name);
LABEL_38:
  if ((objc_msgSend__setupWithShm_asCreator_(v7, v57, v25, 0) & 1) == 0)
  {
LABEL_39:

    v7 = 0;
  }
LABEL_40:

  return v7;
}

- (DTXSharedMemoryTransport)initWithMemoryAddress:(unint64_t)a3 inTask:(unsigned int)a4
{
  vm_map_t *v6;
  vm_map_t v7;
  _QWORD *v9;
  vm_map_t v10;
  kern_return_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  kern_return_t v14;
  DTXSharedMemoryTransport *v15;
  const char *v17;
  _QWORD v18[2];
  uint64_t (*v19)(uint64_t, _QWORD *);
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  uint8_t buf[4];
  unint64_t v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  vm_prot_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    goto LABEL_21;
  if (a4 - 1 > 0xFFFFFFFD)
    goto LABEL_21;
  v6 = (vm_map_t *)MEMORY[0x24BDAEC58];
  v7 = *MEMORY[0x24BDAEC58];
  if ((*MEMORY[0x24BDAEC58] - 1) >= 0xFFFFFFFE)
    goto LABEL_21;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v19 = sub_21DC973E8;
  v20 = &unk_24E1AB388;
  v21 = &v22;
  v9 = v18;
  if (mach_task_is_self(a4))
  {
    v19((uint64_t)v9, (_QWORD *)a3);
  }
  else
  {
    v10 = *v6;
    *(_QWORD *)cur_protection = 0;
    target_address = 0;
    v11 = mach_vm_remap(v10, &target_address, 0x50uLL, 0, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        v29 = a3;
        v30 = 1024;
        v31 = a4;
        v32 = 1024;
        v33 = v11;
        _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
      }
      v12 = 0;
    }
    else
    {
      if ((~cur_protection[1] & 3) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          v29 = a3;
          v30 = 1024;
          v31 = a4;
          v32 = 1024;
          v33 = cur_protection[1];
          _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
        }
        mach_vm_deallocate(v10, target_address, 0x50uLL);
      }
      v12 = target_address;
    }
    v19((uint64_t)v9, (_QWORD *)v12);
    mach_vm_deallocate(*v6, v12, 0x50uLL);
  }

  v13 = v23[3];
  if (!v13)
  {
LABEL_20:
    _Block_object_dispose(&v22, 8);
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  *(_QWORD *)cur_protection = 0;
  target_address = 0;
  v14 = mach_vm_remap(v7, &target_address, v13, 0, 1048577, a4, a3, 0, &cur_protection[1], cur_protection, 2u);
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v29 = a3;
      v30 = 1024;
      v31 = a4;
      v32 = 1024;
      v33 = v14;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    goto LABEL_20;
  }
  if ((~cur_protection[1] & 3) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v29 = a3;
      v30 = 1024;
      v31 = a4;
      v32 = 1024;
      v33 = cur_protection[1];
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to map memory r/w for address: %#llx in task: %d (%d)\n", buf, 0x18u);
    }
    mach_vm_deallocate(v7, target_address, v13);
  }
  v15 = (DTXSharedMemoryTransport *)target_address;
  _Block_object_dispose(&v22, 8);
  if (v15)
  {
    self = (DTXSharedMemoryTransport *)(id)objc_msgSend_initWithMappedMemory_(self, v17, (uint64_t)v15);
    v15 = self;
  }
LABEL_22:

  return v15;
}

- (DTXSharedMemoryTransport)initWithMappedMemory:(DTXSharedMemory *)a3
{
  const char *v4;
  DTXSharedMemoryTransport *v5;
  unsigned int v6;
  unint64_t var2;
  objc_super v9;
  uint8_t buf[4];
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)DTXSharedMemoryTransport;
  v5 = -[DTXTransport init](&v9, sel_init);
  if (v5)
  {
    if (a3)
    {
      v6 = atomic_load((unsigned int *)&a3->var8);
      if (v6 && v6 != getpid())
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v11 = v6;
          _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to attach to shared memory - process %d already attached.\n", buf, 8u);
        }
        a3 = 0;
      }
      else
      {
        atomic_store(getpid(), (unsigned int *)&a3->var8);
        var2 = a3->var2;
        if (var2)
          shm_unlink((const char *)a3 + var2);
      }
    }
    if ((objc_msgSend__setupWithShm_asCreator_(v5, v4, (uint64_t)a3, 0) & 1) == 0)
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  DTXSharedMemory *shm;
  objc_super v5;

  shm = self->_shm;
  if (shm)
  {
    atomic_store(1u, &shm->var9);
    if (shm->var2)
    {
      if (!atomic_load((unsigned int *)&shm->var8))
        shm_unlink((const char *)shm + shm->var2);
    }
    mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)shm, shm->var0);
  }
  self->_shm = 0;
  v5.receiver = self;
  v5.super_class = (Class)DTXSharedMemoryTransport;
  -[DTXTransport dealloc](&v5, sel_dealloc);
}

- (int)remotePid
{
  uint64_t v2;

  v2 = 44;
  if (!self->_creator)
    v2 = 40;
  return atomic_load((unsigned int *)((char *)self->_shm + v2));
}

- (void)setRemotePid:(int)a3
{
  uint64_t v3;

  v3 = 44;
  if (!self->_creator)
    v3 = 40;
  atomic_store(a3, (unsigned int *)((char *)self->_shm + v3));
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  DTXSharedMemory *shm;
  uint64_t v6;
  unsigned int *p_var10;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  int v14;
  char *v15;
  unint64_t v16;
  unsigned int v17;
  signed int v19;
  signed int v20;
  int v21;
  unsigned int v22;
  signed int v23;
  size_t v24;
  size_t v25;
  BOOL v26;
  pid_t v27;
  useconds_t v28;
  unsigned int v29;
  int *v30;
  unsigned int *v32;
  int v33;
  char *v34;
  unsigned int *v35;
  unsigned int *v36;
  uint8_t buf[16];

  shm = self->_shm;
  if (shm)
  {
    v6 = 52;
    if (self->_creator)
    {
      p_var10 = (unsigned int *)&shm->var10;
    }
    else
    {
      v6 = 60;
      p_var10 = (unsigned int *)&shm->var12;
    }
    v8 = 56;
    if (!self->_creator)
      v8 = 64;
    v9 = 32;
    if (self->_creator)
      v9 = 24;
    v10 = 36;
    if (self->_creator)
      v10 = 28;
    v11 = 44;
    if (!self->_creator)
      v11 = 40;
    if (a4)
    {
      v12 = (char *)a3;
      v13 = 0;
      v14 = *(_DWORD *)((char *)&shm->var0 + v10);
      v15 = &shm->var17[*(unsigned int *)((char *)&shm->var0 + v9)];
      v35 = (unsigned int *)((char *)shm + v6);
      v36 = (unsigned int *)((char *)shm + v8);
      v32 = (unsigned int *)((char *)shm + v11);
      v16 = a4;
      v17 = 64;
      v34 = v15;
      v33 = v14;
      while (1)
      {
        if (atomic_load(&shm->var9))
          goto LABEL_57;
        v19 = atomic_load(v36);
        v20 = atomic_load(v35);
        if (v19 <= v20)
          v21 = v14;
        else
          v21 = 0;
        v22 = v19 + ~v20 + v21;
        if (v22)
        {
          v23 = v20;
          LODWORD(v24) = v14 - v20;
          if (v14 - v20 >= v22)
            v24 = v22;
          else
            v24 = v24;
          if (v16 >= v24)
            v25 = v24;
          else
            v25 = v16;
          memcpy(&v15[v20], v12, v25);
          v12 += v25;
          v16 -= v25;
          v13 += v25;
          if (v16)
            v26 = v22 == (_DWORD)v25;
          else
            v26 = 1;
          if (v26)
          {
            LODWORD(v25) = v23 + v25;
          }
          else
          {
            if (v16 >= v22 - v25)
              v25 = v22 - v25;
            else
              v25 = v16;
            memmove(v15, v12, v25);
            v12 += v25;
            v16 -= v25;
            v13 += v25;
          }
          v15 = v34;
          while (1)
          {
            v29 = __ldaxr(p_var10);
            if (v29 != v23)
              break;
            if (!__stlxr(v25, p_var10))
            {
              v17 = 64;
              goto LABEL_49;
            }
          }
          __clrex();
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Inconsistent writer offset in shared memory! MT transmission suspected...\n", buf, 2u);
          }
          goto LABEL_57;
        }
        v27 = atomic_load(v32);
        v28 = v17 <= 0x40 ? 64 : v17;
        usleep(v28);
        if (v28 <= 0x10000)
          break;
        if (!v27 || kill(v27, 0) != -1)
        {
          v17 = 0x20000;
          goto LABEL_48;
        }
        v30 = __error();
        v14 = v33;
        if (*v30 == 3)
          goto LABEL_57;
        v17 = 0x20000;
        v15 = v34;
LABEL_50:
        if (!v16)
          goto LABEL_57;
      }
      v17 = 2 * v28;
LABEL_48:
      v15 = v34;
LABEL_49:
      v14 = v33;
      goto LABEL_50;
    }
  }
  v13 = 0;
LABEL_57:
  if (v13 < a4)
    objc_msgSend_disconnect(self, a2, (uint64_t)a3);
  return v13;
}

- (void)disconnect
{
  NSObject *listenQueue;
  objc_super v4;

  atomic_store(1u, &self->_shm->var9);
  listenQueue = self->_listenQueue;
  if (listenQueue)
    dispatch_sync(listenQueue, &unk_24E1AA940);
  v4.receiver = self;
  v4.super_class = (Class)DTXSharedMemoryTransport;
  -[DTXTransport disconnect](&v4, sel_disconnect);
}

- (id)localAddresses
{
  uint64_t v3;
  const char *v4;
  void *v5;
  DTXSharedMemory *shm;
  unint64_t var2;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;

  v3 = atomic_load((unsigned int *)&self->_shm->var7);
  objc_msgSend_addressForMemory_inProcess_(DTXSharedMemoryTransport, a2, self->_shm->var1, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  shm = self->_shm;
  var2 = shm->var2;
  if (var2)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v4, (uint64_t)shm + var2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend_addressForPosixSharedMemoryWithName_(DTXSharedMemoryTransport, v8, (uint64_t)v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v11, (uint64_t)v5, v10, 0);
    }
    else
    {
      v10 = 0;
      objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v8, (uint64_t)v5, 0, 0);
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
    objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v4, (uint64_t)v5, 0, 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)permittedBlockCompressionTypes
{
  uint64_t v2;

  return (id)objc_msgSend_set(MEMORY[0x24BDBCF20], a2, v2);
}

- (DTXSharedMemory)sharedMemory
{
  return self->_shm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenQueue, 0);
}

@end
