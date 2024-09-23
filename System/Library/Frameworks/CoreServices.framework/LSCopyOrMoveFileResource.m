@implementation LSCopyOrMoveFileResource

uint64_t ___LSCopyOrMoveFileResource_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _LSOpenCopierContext *v4;
  id v5;
  id *v6;
  uint64_t v7;
  const __CFURL *v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  CFTypeRef v12;
  CFMachPortRef *v13;
  __CFRunLoop *Current;
  void *v15;
  __CFRunLoop *v16;
  char v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int *v37;
  id v38;
  int *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  CFTypeRef v49;
  void *v50;
  CFTypeRef v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  char v74;
  CFTypeRef cf;
  __int128 v76;
  uint64_t v77;
  _BYTE v78[36];
  stat v79;
  id v80;
  _BYTE buf[12];
  _BYTE v82[1024];
  statfs v83;
  uint64_t v84;
  void *v85;
  id v86[3];

  v86[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", CFSTR("LS MDT helper thread/run loop"));

  cf = 0;
  v4 = objc_alloc_init(_LSOpenCopierContext);
  v5 = *(id *)(a1 + 32);
  LOBYTE(v73) = 0;
  v74 = 0;
  if (*(_BYTE *)(a1 + 72))
  {
    v6 = 0;
LABEL_3:
    v7 = 3;
    goto LABEL_4;
  }
  v18 = *(void **)(a1 + 40);
  v19 = *(id *)(a1 + 32);
  v20 = v18;
  v21 = v20;
  v76 = xmmword_1829FAB68;
  v77 = 0;
  DWORD2(v76) = -2147352576;
  if (!v20)
  {
    v86[0] = *(id *)MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = CFSTR("Missing resource file handle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v86, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", 317, v43);
    v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_33;
  }
  if (fstat(objc_msgSend(v20, "fileDescriptor"), &v79) < 0 || fstatfs(objc_msgSend(v21, "fileDescriptor"), &v83) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E0CB2FE0];
    v41 = 322;
LABEL_30:
    _LSMakeNSErrorImpl(v40, *v39, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", v41, 0);
    v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v44 = objc_retainAutorelease(v42);
    v6 = 0;
    v42 = v44;
    v22 = v19;
    goto LABEL_34;
  }
  if (getattrlist(v83.f_mntonname, &v76, v78, 0x24uLL, 0x800u) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E0CB2FE0];
    v41 = 327;
    goto LABEL_30;
  }
  if (fcntl(objc_msgSend(v21, "fileDescriptor"), 50, v82) == -1)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E0CB2FE0];
    v41 = 338;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v82, (v79.st_mode & 0xF000) == 0x4000, 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if ((v83.f_flags & 1) != 0)
    goto LABEL_68;
  if ((v78[10] & 1) == 0 || *(unsigned __int16 *)v83.f_mntonname == 47)
  {
    if (*(unsigned __int16 *)v83.f_mntonname != 47)
    {
      _LSDefaultLog();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_182882000, v56, OS_LOG_TYPE_DEFAULT, "Open of %@ from writable non-clone-supporting filesystem is unexpected.", buf, 0xCu);
      }

      if ((v79.st_mode & 0xF000) == 0x8000)
      {
        v86[0] = 0;
        copyProvidedResourceToStagingContainerRegularFile(v22, v21, v86, buf);
        v42 = v86[0];
        v6 = *(id **)buf;
        goto LABEL_80;
      }
      v86[0] = *(id *)MEMORY[0x1E0CB2938];
      *(_QWORD *)buf = CFSTR("Open of non-regular file from writable filesystem requires clone support");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v86, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", 355, v43);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v19 = v22;
      goto LABEL_32;
    }
LABEL_68:
    v6 = (id *)operator new();
    v22 = v22;
    v44 = 0;
    v42 = 0;
    *v6 = &off_1E103DFB0;
    v6[1] = v22;
    goto LABEL_34;
  }
  v23 = v22;
  v24 = v21;
  *(_QWORD *)buf = 0;
  v71 = v24;
  getFileProtectionValueForFileHandle(v24, buf);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(id *)buf;
  v27 = v26;
  if (!v25)
  {
    v29 = v26;
LABEL_78:
    v62 = objc_retainAutorelease(v29);
    v6 = 0;
    v61 = v62;
    v60 = v62;
    goto LABEL_79;
  }
  v69 = (void *)v25;
  +[LSOpenStagingDirectoryManager sharedServerInstance](LSOpenStagingDirectoryManager, "sharedServerInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v27;
  objc_msgSend(v28, "stagingDirectoryForCloningFileHandle:error:", v24, v86);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v86[0];

  if (!v70)
  {

    goto LABEL_78;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "UUIDString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "URLByAppendingPathComponent:", v31);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = *MEMORY[0x1E0C99938];
  v85 = v69;
  v65 = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v29;
  LODWORD(v32) = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v68, 0, v33, &v80);
  v67 = v80;

  if ((_DWORD)v32)
  {
    objc_msgSend(v23, "lastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "URLByAppendingPathComponent:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v68;
    v36 = v35;
    v63 = v71;
    LODWORD(v34) = objc_msgSend(v63, "fileDescriptor");
    v66 = objc_retainAutorelease(v36);
    if (fclonefileat((int)v34, -2, (const char *)objc_msgSend(v66, "fileSystemRepresentation"), 1u))
    {
      v37 = __error();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v37, (uint64_t)"stageResourceByCloningHandle", 233, 0);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 0;
    }
    else
    {
      v6 = (id *)operator new();
      v57 = v64;
      v58 = v66;
      *v6 = &off_1E103DFE0;
      v6[1] = v58;
      v6[2] = v57;
      v38 = v67;
    }

    v59 = v38;
    v67 = v59;
  }
  else
  {
    v6 = 0;
  }

  if (!v6)
  {
    v29 = v67;
    goto LABEL_78;
  }
  v60 = 0;
  v61 = v67;
LABEL_79:

  v42 = v60;
LABEL_80:
  if (!v6)
  {
    v19 = v22;
    goto LABEL_33;
  }
  v44 = 0;
LABEL_34:

  v45 = v44;
  v46 = v45;
  if (v6)
  {
    v72 = v45;
    (*((void (**)(statfs *__return_ptr, id *, id *))*v6 + 2))(&v83, v6, &v72);
    v47 = v72;

    v46 = v47;
  }
  else
  {
    *(_QWORD *)&v83.f_bsize = 0;
    LOBYTE(v83.f_blocks) = 1;
  }
  std::__optional_storage_base<NSString * {__strong},false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<NSString * {__strong},false>>((uint64_t)&v73, (uint64_t *)&v83);
  if (LOBYTE(v83.f_blocks))

  if (!v6)
  {
LABEL_46:
    v49 = v46;
    v50 = (void *)v49;
    v51 = cf;
    if (cf != v49)
    {
      cf = v49;
      v49 = v51;
    }
    if (v49)
      CFRelease(v49);

    v6 = 0;
    if (!*(_BYTE *)(a1 + 72))
      goto LABEL_51;
    goto LABEL_3;
  }
  if (!v74)
  {
    (*((void (**)(id *))*v6 + 1))(v6);
    goto LABEL_46;
  }
  v48 = v6[1];

  if ((*((unsigned int (**)(id *))*v6 + 3))(v6))
    v7 = 3;
  else
    v7 = 1;

  v5 = v48;
LABEL_4:
  v8 = *(const __CFURL **)(a1 + 48);
  v9 = *(const __CFString **)(a1 + 56);
  if (v74)
    v10 = v73;
  else
    v10 = 0;
  v11 = (const __CFString *)objc_retainAutorelease(v10);
  v12 = cf;
  cf = 0;
  if (v12)
    CFRelease(v12);
  v13 = MDTCreateCopierWithSandboxExtensionAndReturnError((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (const __CFURL *)v5, v8, v9, v11, (__CFMachPort *)v7, (__CFMachPort *)_LSCopierCallback, (__CFMachPort *)v4, (CFErrorRef *)&cf);
  if (!v13)
  {
LABEL_51:
    -[_LSOpenCopierContext setError:](v4, "setError:", cf);
    v13 = 0;
    v17 = 1;
    goto LABEL_52;
  }
  Current = CFRunLoopGetCurrent();
  if (MDTCopierScheduleWithRunLoop((uint64_t)v13, Current, CFSTR("LSOpenCallbackWaitMode")))
  {
    if (MDTCopierStart((uint64_t)v13))
    {
      CFRunLoopRunInMode(CFSTR("LSOpenCallbackWaitMode"), 1.0e99, 1u);
      MDTCopierInvalidate((uint64_t)v13);
      if (-[_LSOpenCopierContext callbackType](v4, "callbackType") == 2)
      {
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 89, (uint64_t)"_LSCopyOrMoveFileResource_block_invoke", 442, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LSOpenCopierContext setError:](v4, "setError:", v15);

      }
    }
    v16 = CFRunLoopGetCurrent();
    MDTCopierUnscheduleFromRunLoop((uint64_t)v13, v16, CFSTR("LSOpenCallbackWaitMode"));
  }
  v17 = 0;
LABEL_52:
  v52 = *(_QWORD *)(a1 + 64);
  -[_LSOpenCopierContext destURL](v4, "destURL");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSOpenCopierContext error](v4, "error");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v52 + 16))(v52, v53, v54);

  if (v74)
  if (v6)
    (*((void (**)(id *))*v6 + 1))(v6);

  if (cf)
    CFRelease(cf);
  if ((v17 & 1) == 0)
    CFRelease(v13);
  objc_autoreleasePoolPop(v2);
  return MEMORY[0x186DAF214]();
}

@end
