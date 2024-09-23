@implementation MISignatureAgnosticHasher

- (MISignatureAgnosticHasher)initWithExecutable:(id)a3 searchForSectionNamed:(id)a4
{
  id v7;
  id v8;
  MISignatureAgnosticHasher *v9;
  MISignatureAgnosticHasher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MISignatureAgnosticHasher;
  v9 = -[MISignatureAgnosticHasher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_fd = -1;
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_sectionName, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if ((-[MISignatureAgnosticHasher fd](self, "fd") & 0x80000000) == 0)
    close(-[MISignatureAgnosticHasher fd](self, "fd"));
  v3.receiver = self;
  v3.super_class = (Class)MISignatureAgnosticHasher;
  -[MISignatureAgnosticHasher dealloc](&v3, sel_dealloc);
}

- (id)_hashSliceAtOffset:(int64_t)a3 withSize:(int64_t)a4 machHeaderAndCommands:(const mach_header *)a5 dictionaryKey:(id *)a6 error:(id *)a7
{
  MISignatureAgnosticHasher *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint32_t magic;
  void *v17;
  uint64_t v18;
  uint64_t sizeofcmds;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char *v27;
  uint32_t ncmds;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  int v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  ssize_t v56;
  BOOL v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  int v69;
  void *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  int64_t v90;
  ssize_t v91;
  int v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  MISignatureAgnosticHasher *v104;
  int64_t v105;
  char *v106;
  uint64_t v107;
  off_t v108;
  unsigned int v109;
  char v110;
  id *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  CC_SHA1_CTX c;
  _QWORD v117[8];
  unsigned __int8 md[8];
  uint64_t v119;
  int v120;
  uint64_t v121;

  v12 = self;
  v121 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  *(_QWORD *)md = 0;
  v119 = 0;
  v120 = 0;
  -[MISignatureAgnosticHasher sectionName](self, "sectionName");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (const char *)objc_msgSend(v13, "UTF8String");

  magic = a5->magic;
  if ((int)a5->magic <= -17958195)
  {
    if (magic == -822415874 || magic == -805638658)
    {
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 75, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Header magic indicates non-native-endian slice; that's not allowed."),
        v15,
        v100);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (magic == -17958194)
  {
    v18 = 28;
  }
  else
  {
    if (magic != -17958193)
    {
LABEL_11:
      -[MISignatureAgnosticHasher url](v12, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 87, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Invalid mach_header.magic in %@ : 0x%08x"), v23, (uint64_t)v21);
      goto LABEL_12;
    }
    v18 = 32;
  }
  objc_msgSend((id)objc_opt_class(), "packedNumberForCPUType:subtype:", a5->cputype, a5->cpusubtype);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  sizeofcmds = a5->sizeofcmds;
  if (sizeofcmds > 0x1000)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 95, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Invalid mach_header.sizeofcmds in %@"), v22, (uint64_t)v21);
LABEL_12:
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:
    v24 = 0;
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  v107 = v18;
  v108 = a3;
  v111 = a7;
  v27 = (char *)a5 + v18;
  ncmds = a5->ncmds;
  v105 = a4;
  v106 = v27;
  v109 = sizeofcmds;
  if (ncmds)
  {
    v29 = 0;
    v110 = 0;
    v113 = 0;
    v114 = 0;
    v115 = 0;
    v112 = 0;
    v30 = 0;
    v31 = (unint64_t)&v27[8 * sizeofcmds];
    while (1)
    {
      if ((unint64_t)(v27 + 8) > v31
        || (v32 = *((unsigned int *)v27 + 1), v33 = &v27[v32], (unint64_t)&v27[v32] > v31))
      {
        -[MISignatureAgnosticHasher url](v12, "url");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "path");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 105, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Load command %d exceeds bounds in %@"), v40, v30);
        goto LABEL_71;
      }
      v34 = *(_DWORD *)v27;
      if (*(_DWORD *)v27 != 29)
        break;
      if ((_DWORD)v32 != 16)
      {
        -[MISignatureAgnosticHasher url](v12, "url");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "path");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 169, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Invalid LC_CODE_SIGNATURE command in %@"), v48, (uint64_t)v47);
        goto LABEL_71;
      }
LABEL_53:
      v29 = v27;
      v30 = (v30 + 1);
      v27 = v33;
      if ((_DWORD)v30 == ncmds)
        goto LABEL_59;
    }
    if (v34 == 25)
    {
      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          v104 = v12;
          v37 = *((unsigned int *)v27 + 16);
          if (v37 > 0x1000)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 150, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("__DATA segment has too many sections in %@"), v83, (uint64_t)v47);
            goto LABEL_71;
          }
          if (80 * (unint64_t)v37 + 72 > v32)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 155, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("__DATA segment exceeds bounds in %@"), v85, (uint64_t)v47);
LABEL_71:
            v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_72:
            v24 = 0;
            goto LABEL_73;
          }
          if ((_DWORD)v37)
          {
            v38 = v27 + 72;
            while (strncmp(v38, v14, 0x10uLL))
            {
              v38 += 80;
              if (!--v37)
                goto LABEL_56;
            }
LABEL_55:
            v110 = 1;
          }
LABEL_56:
          v27 = v29;
          v12 = v104;
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      v114 = v27 + 32;
      v115 = v27 + 48;
      v112 = 8;
      v39 = 8;
    }
    else
    {
      if (v34 != 1)
      {
LABEL_52:
        v27 = v29;
        goto LABEL_53;
      }
      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          v104 = v12;
          v35 = *((unsigned int *)v27 + 12);
          if (v35 > 0x1000)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 121, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("__DATA segment has too many sections in %@"), v82, (uint64_t)v47);
            goto LABEL_71;
          }
          if (68 * (unint64_t)v35 + 56 > v32)
          {
            -[MISignatureAgnosticHasher url](v104, "url");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 126, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("__DATA segment exceeds bounds in %@"), v84, (uint64_t)v47);
            goto LABEL_71;
          }
          if ((_DWORD)v35)
          {
            v36 = v27 + 56;
            while (strncmp(v36, v14, 0x10uLL))
            {
              v36 += 68;
              if (!--v35)
                goto LABEL_56;
            }
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        goto LABEL_52;
      }
      v114 = v27 + 28;
      v115 = v27 + 36;
      v112 = 4;
      v39 = 4;
    }
    v113 = v39;
    goto LABEL_52;
  }
  v112 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v110 = 0;
  v29 = 0;
LABEL_59:
  if (!v114 || !v113 || !v115 || !v112)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 178, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Failed to find __LINKEDIT segment in %@"), v43, (uint64_t)v47);
    goto LABEL_71;
  }
  if (!v29)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 183, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Failed to find LC_CODE_SIGNATURE load command in %@"), v44, (uint64_t)v47);
    goto LABEL_71;
  }
  if (v114 > v29 || v115 > v29)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 188, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("__LINKEDIT segment found after LC_CODE_SIGNATURE load command in %@"), v45, (uint64_t)v47);
    goto LABEL_71;
  }
  v41 = *((unsigned int *)v29 + 2);
  if (v41 < v109)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 193, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("LC_CODE_SIGNATURE command's data offset is less than the size of the mach header in %@"), v42, (uint64_t)v47);
    goto LABEL_71;
  }
  v117[0] = &v114[v107] - v106;
  v117[1] = v113;
  v117[2] = &v115[v107] - v106;
  v117[3] = v112;
  v49 = *((unsigned int *)v29 + 3);
  v117[4] = &v29[v107 + 12] - v106;
  v117[5] = 4;
  v117[6] = v41;
  v117[7] = v49;
  CC_SHA1_Init(&c);
  if (lseek(-[MISignatureAgnosticHasher fd](v12, "fd"), v108, 0) == -1)
  {
    v63 = *__error();
    v64 = (void *)*MEMORY[0x1E0CB2FE0];
    strerror(v63);
    _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 218, v64, v63, 0, 0, CFSTR("lseek to %lld failed: %s"), v65, v108);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[MISignatureAgnosticHasher url](v12, "url");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "path");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v63);
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 218, CFSTR("MIInstallerErrorDomain"), 73, v66, 0, CFSTR("Failed to seek to %lld in %@ : %s"), v68, v108);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_72;
  }
  v50 = malloc_type_malloc(0x4000uLL, 0x4E02A280uLL);
  a7 = v111;
  if (!v50)
  {
    v69 = *__error();
    v70 = (void *)*MEMORY[0x1E0CB2FE0];
    strerror(v69);
    _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 225, v70, v69, 0, 0, CFSTR("Failed to allocate %lld bytes : %s"), v71, 0x4000);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = strerror(v69);
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 225, CFSTR("MIInstallerErrorDomain"), 73, v20, 0, CFSTR("Failed to allocate hash read buffer: %s"), v73, (uint64_t)v72);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v24 = v50;
  v51 = 0;
  v52 = 0;
  do
  {
    v53 = v117[v51];
    v54 = v53 - v52;
    if (v54 >= 1)
    {
      while (1)
      {
        if (v54 >= 0x4000)
          v55 = 0x4000;
        else
          v55 = v54;
        v56 = read(-[MISignatureAgnosticHasher fd](v12, "fd"), v24, v55);
        if (v56 < 0)
        {
          v74 = *__error();
          v75 = (void *)*MEMORY[0x1E0CB2FE0];
          strerror(v74);
          _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 238, v75, v74, 0, 0, CFSTR("Failed to read %zu bytes : %s"), v76, v55);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          -[MISignatureAgnosticHasher url](v12, "url");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "path");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v74);
          _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 238, CFSTR("MIInstallerErrorDomain"), 73, v77, 0, CFSTR("Failed to read file at %@: %s"), v80, (uint64_t)v79);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_95;
        }
        if (v56 != v55)
          break;
        CC_SHA1_Update(&c, v24, v55);
        v57 = v54 <= v55;
        v54 -= v55;
        if (v57)
          goto LABEL_86;
      }
      -[MISignatureAgnosticHasher url](v12, "url");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "path");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 241, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Expected to read %zu bytes but got %ld bytes when reading %@"), v81, v55);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_95;
    }
LABEL_86:
    v58 = *(_QWORD *)((char *)v117 + ((8 * v51) | 8));
    if (lseek(-[MISignatureAgnosticHasher fd](v12, "fd"), v58, 1) == -1)
    {
      v86 = *__error();
      v87 = (void *)*MEMORY[0x1E0CB2FE0];
      strerror(v86);
      _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 253, v87, v86, 0, 0, CFSTR("lseek to %lld from current offset failed: %s"), v88, v58);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[MISignatureAgnosticHasher url](v12, "url");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "path");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v86);
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 253, CFSTR("MIInstallerErrorDomain"), 73, v77, 0, CFSTR("Failed to seek to %lld from current offset in %@ : %s"), v89, v58);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      a7 = v111;
LABEL_95:

      goto LABEL_15;
    }
    v52 = v53 + v58;
    v59 = v51 >= 6;
    v51 += 2;
  }
  while (!v59);
  v60 = v105 - v52;
  if (v105 < v52)
  {
    -[MISignatureAgnosticHasher url](v12, "url");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "path");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 261, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Hashed more (%lld) than slice length %llu in %@"), v62, v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  if (v60 < 1)
  {
LABEL_109:
    CC_SHA1_Final(md, &c);
    if ((v110 & 1) != 0)
      -[MISignatureAgnosticHasher setCountOfSlicesWithNamedSection:](v12, "setCountOfSlicesWithNamedSection:", -[MISignatureAgnosticHasher countOfSlicesWithNamedSection](v12, "countOfSlicesWithNamedSection") + 1);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  else
  {
    while (1)
    {
      if (v60 >= 0x4000)
        v90 = 0x4000;
      else
        v90 = v60;
      v91 = read(-[MISignatureAgnosticHasher fd](v12, "fd"), v24, v90);
      if (v91 < 0)
      {
        v92 = *__error();
        v93 = (void *)*MEMORY[0x1E0CB2FE0];
        strerror(v92);
        _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 271, v93, v92, 0, 0, CFSTR("Failed to read %zu bytes : %s"), v94, v90);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[MISignatureAgnosticHasher url](v12, "url");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "path");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v92);
        _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 271, CFSTR("MIInstallerErrorDomain"), 73, v95, 0, CFSTR("Failed to read file at %@: %s"), v98, (uint64_t)v97);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_114;
      }
      if (v91 != v90)
        break;
      CC_SHA1_Update(&c, v24, v90);
      v57 = v60 <= v90;
      v60 -= v90;
      if (v57)
        goto LABEL_109;
    }
    -[MISignatureAgnosticHasher url](v12, "url");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "path");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 274, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Expected to read %zu bytes but got %ld bytes when reading %@"), v99, v90);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_114:

LABEL_73:
    v25 = 0;
  }
  a7 = v111;
LABEL_16:
  free(v24);
  if (a7 && !v25)
    *a7 = objc_retainAutorelease(v17);

  return v25;
}

- (BOOL)performHashWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  BOOL v11;
  unsigned int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v5 = (void *)objc_opt_new();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __50__MISignatureAgnosticHasher_performHashWithError___block_invoke;
  v28[3] = &unk_1E6CB6E38;
  v30 = &v36;
  v28[4] = self;
  v6 = v5;
  v29 = v6;
  v31 = &v32;
  v7 = (void *)MEMORY[0x1BCCAA218](v28);
  -[MISignatureAgnosticHasher url](self, "url");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[MISignatureAgnosticHasher setFd:](self, "setFd:", open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 256));

  if (-[MISignatureAgnosticHasher fd](self, "fd") < 0)
  {
    v13 = *__error();
    -[MISignatureAgnosticHasher url](self, "url");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "fileSystemRepresentation");
    strerror(v13);
    _CreateError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 371, (void *)*MEMORY[0x1E0CB2FE0], v13, 0, 0, CFSTR("Failed to open %s: %s"), v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MISignatureAgnosticHasher url](self, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 371, CFSTR("MIInstallerErrorDomain"), 73, v17, 0, CFSTR("Failed to open executable for reading at %@ : %s"), v20, (uint64_t)v19);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v37[5];
    v37[5] = v21;

LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v9 = -[MISignatureAgnosticHasher fd](self, "fd");
  -[MISignatureAgnosticHasher url](self, "url");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(v9) = parse_macho_iterate_slices_fd(v9, objc_msgSend(v10, "fileSystemRepresentation"), (uint64_t)v7);

  if ((v9 & 1) == 0)
  {
    -[MISignatureAgnosticHasher url](self, "url");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 376, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Could not iterate slices in macho %@"), v24, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v37[5];
    v37[5] = v25;

    goto LABEL_7;
  }
  v11 = v37[5] == 0;
  objc_storeStrong((id *)&self->_hashes, v5);
  v12 = -[MISignatureAgnosticHasher countOfSlicesWithNamedSection](self, "countOfSlicesWithNamedSection");
  if (v12 == *((_DWORD *)v33 + 6))
    self->_hasNamedSection = 1;
LABEL_8:
  if (a3 && !v11)
    *a3 = objc_retainAutorelease((id)v37[5]);
  if ((-[MISignatureAgnosticHasher fd](self, "fd") & 0x80000000) == 0)
  {
    close(-[MISignatureAgnosticHasher fd](self, "fd"));
    -[MISignatureAgnosticHasher setFd:](self, "setFd:", 0xFFFFFFFFLL);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v11;
}

uint64_t __50__MISignatureAgnosticHasher_performHashWithError___block_invoke(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v11;
  off_t st_size;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id obj;
  id v40;
  stat v41;

  v9 = a3[3];
  if ((_DWORD)v9 != 2)
  {
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 317, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Mach header specified unknown filetype %u"), a8, v9);
LABEL_11:
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

    goto LABEL_12;
  }
  if (a2)
  {
    if (*a2 == a3[1])
    {
      if (a2[1] == a3[2])
      {
        v11 = a2[2];
        st_size = a2[3];
        goto LABEL_16;
      }
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 342, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Mismatched cpusubtype between fat_arch and mach_header: fa: %d, mh: %d"), a8, a2[1]);
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 337, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Mismatched cputype between fat_arch and mach_header: fa: %d, mh: %d"), a8, *a2);
    }
    goto LABEL_11;
  }
  memset(&v41, 0, sizeof(v41));
  if (fstat(objc_msgSend(*(id *)(a1 + 32), "fd"), &v41))
  {
    v13 = *__error();
    v14 = (void *)*MEMORY[0x1E0CB2FE0];
    objc_msgSend(*(id *)(a1 + 32), "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    _CreateError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 327, v14, v13, 0, 0, CFSTR("fstat of %@ failed: %s"), v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "url");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v13);
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 327, CFSTR("MIInstallerErrorDomain"), 73, v18, 0, CFSTR("Could not determine size of %@ : %s"), v21, (uint64_t)v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

LABEL_12:
    v28 = 0;
    goto LABEL_13;
  }
  v11 = 0;
  st_size = v41.st_size;
LABEL_16:
  v31 = *(void **)(a1 + 32);
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v32 + 40);
  v40 = 0;
  objc_msgSend(v31, "_hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:", v11, st_size, a3, &v40, &obj);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v40;
  objc_storeStrong((id *)(v32 + 40), obj);
  if (v33)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v33, v28);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

      v29 = 1;
      goto LABEL_14;
    }
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 356, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Already have an entry in hashes dictionary for key %@"), v35, (uint64_t)v28);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

  }
LABEL_13:
  v29 = 0;
LABEL_14:

  return v29;
}

+ (id)packedNumberForCPUType:(int)a3 subtype:(int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4 | (*(_QWORD *)&a3 << 32));
}

+ (void)unpackPackedCpuTypeAndSubType:(id)a3 cputype:(int *)a4 subtype:(int *)a5
{
  uint64_t v7;

  v7 = objc_msgSend(a3, "unsignedLongLongValue");
  *a4 = HIDWORD(v7);
  *a5 = v7;
}

- (BOOL)hasNamedSection
{
  return self->_hasNamedSection;
}

- (NSDictionary)hashes
{
  return self->_hashes;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unsigned)countOfSlicesWithNamedSection
{
  return self->_countOfSlicesWithNamedSection;
}

- (void)setCountOfSlicesWithNamedSection:(unsigned int)a3
{
  self->_countOfSlicesWithNamedSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
}

@end
