@implementation FPDiagnosticCollector

- (FPDiagnosticCollector)initWithFD:(int)a3 trashURL:(id)a4
{
  id v7;
  FPDiagnosticCollector *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *diagnostic;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPDiagnosticCollector;
  v8 = -[FPDiagnosticCollector init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    diagnostic = v8->_diagnostic;
    v8->_diagnostic = v9;

    v8->_fd = a3;
    objc_storeStrong((id *)&v8->_trashURL, a4);
    v8->_stepsNeeded = 147;
  }

  return v8;
}

- (BOOL)_performStep:(unint64_t)a3 error:(id *)a4
{
  BOOL result;

  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
        return -[FPDiagnosticCollector _tryReadFirstByteOfFileWithError:](self, "_tryReadFirstByteOfFileWithError:", a4);
      if (a3 == 128)
        return -[FPDiagnosticCollector _collectParentACLCountWithError:](self, "_collectParentACLCountWithError:", a4);
    }
    else
    {
      if (a3 == 16)
        return -[FPDiagnosticCollector _collectMountAttributesWithError:](self, "_collectMountAttributesWithError:", a4);
      if (a3 == 32)
        return -[FPDiagnosticCollector _collectdocIDAttributesWithError:](self, "_collectdocIDAttributesWithError:", a4);
    }
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 45);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        result = -[FPDiagnosticCollector _collectInodeAttributesWithError:](self, "_collectInodeAttributesWithError:", a4);
        break;
      case 2uLL:
        result = -[FPDiagnosticCollector _collectFnameAttributesWithError:](self, "_collectFnameAttributesWithError:", a4);
        break;
      case 4uLL:
        result = -[FPDiagnosticCollector _collectXattrAttributesWithError:](self, "_collectXattrAttributesWithError:", a4);
        break;
      case 8uLL:
        result = -[FPDiagnosticCollector _collectPurgeAttributesWithError:](self, "_collectPurgeAttributesWithError:", a4);
        break;
      default:
        goto LABEL_16;
    }
  }
  return result;
}

- (BOOL)collectDiagnosticDiskAttributesWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  v5 = 0;
  v6 = 0;
  v7 = 1;
  v8 = 1;
  do
  {
    if ((self->_stepsNeeded & v7) != 0)
    {
      v23 = 0;
      v9 = -[FPDiagnosticCollector _performStep:error:](self, "_performStep:error:", v7, &v23);
      v10 = v23;
      v11 = v10;
      if (v9)
      {
        self->_stepsNeeded &= ~v7;
      }
      else
      {
        v5 |= v7;
        if (!v6)
          v6 = v10;
        v8 = 0;
      }

    }
    v12 = v7 >= 0x41;
    v7 *= 2;
  }
  while (!v12);
  if ((v8 & 1) == 0)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    objc_msgSend(v6, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDC7EA8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BDC7EA0]);

    objc_msgSend(v6, "underlyingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      objc_msgSend(v6, "underlyingErrors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDC7EC0]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "code"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDC7EB8]);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDC7EB0]);

  }
  return v8 & 1;
}

- (BOOL)_collectInodeAttributesWithError:(id *)a3
{
  id v5;
  size_t v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  int v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _DWORD *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v44 = xmmword_23B1CA580;
  v45 = 0x60000001601;
  v6 = getpagesize();
  v7 = (unsigned __int16 *)malloc_type_malloc(v6, 0xA3433FA3uLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  v8 = v7;
  if (fgetattrlist(self->_fd, &v44, v7, v6, 0x28u) < 0)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v11 = *__error();
    v10 = v13;
    goto LABEL_9;
  }
  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 4) != 0)
  {
    self->_fsid = (fsid)*((_QWORD *)v8 + 3);
    v9 = *((_DWORD *)v8 + 1);
  }
  if ((v9 & 8) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = 9;
LABEL_9:
    objc_msgSend(v10, "fp_errorWithPOSIXCode:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v8);
    v12 = 0;
    goto LABEL_69;
  }
  v14 = *((_DWORD *)v8 + 8) - 1;
  if (v14 > 6)
    v15 = 0;
  else
    v15 = word_23B1CA5B0[v14];
  if ((v9 & 0x20000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v15 | v8[52]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDC7F98]);

    v9 = *((_DWORD *)v8 + 1);
    if ((v9 & 0x200) == 0)
    {
LABEL_15:
      if ((v9 & 0x400) == 0)
        goto LABEL_16;
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(v8 + 18));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDC7F30]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", fpfs_is_busy_date());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDC7F38]);

  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x400) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(v8 + 26));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDC7FA0]);

  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x8000) == 0)
      goto LABEL_18;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", bswap32(v8[38]) >> 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDC7F68]);

  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x8000) == 0)
  {
LABEL_18:
    if ((v9 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 25));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDC7FC0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", geteuid());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDC7FE0]);

  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x40000) == 0)
  {
LABEL_19:
    if ((v9 & 0x80000) == 0)
      goto LABEL_20;
LABEL_28:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 28));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BDC7F70]);

    v9 = *((_DWORD *)v8 + 1);
    if ((v9 & 0x100000) == 0)
      goto LABEL_31;
    goto LABEL_29;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 27));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BDC7F28]);

  v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x80000) != 0)
    goto LABEL_28;
LABEL_20:
  if ((v9 & 0x100000) == 0)
    goto LABEL_31;
LABEL_29:
  if (*((_DWORD *)v8 + 29))
  {
    self->_stepsNeeded |= 0x20uLL;
    self->_docid = *((_DWORD *)v8 + 29);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 29));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, *MEMORY[0x24BDC7F58]);

    v9 = *((_DWORD *)v8 + 1);
  }
LABEL_31:
  if ((v9 & 0x400000) != 0)
  {
    v26 = (_DWORD *)((char *)v8 + *((int *)v8 + 30) + 120);
    if (*v26 == 19710317 && (v26[9] + 1) >= 2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, *MEMORY[0x24BDC7F88]);

      v9 = *((_DWORD *)v8 + 1);
    }
  }
  if ((v9 & 0x2000000) != 0)
  {
    self->_ino = *((_QWORD *)v8 + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)v8 + 16));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BDC7F60]);

    v9 = *((_DWORD *)v8 + 1);
  }
  if ((v9 & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 34));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDC7F48]);

  }
  v30 = *((_DWORD *)v8 + 8);
  if (v30 != 1)
    goto LABEL_51;
  v31 = *((_DWORD *)v8 + 4);
  if ((v31 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((_DWORD *)v8 + 35) > 1u);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BDC7F78]);

    v31 = *((_DWORD *)v8 + 4);
    if ((v31 & 0x200) == 0)
    {
LABEL_42:
      if ((v31 & 0x400) == 0)
        goto LABEL_43;
LABEL_72:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *((_QWORD *)v8 + 19));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, *MEMORY[0x24BDC7FB0]);

      if ((*((_DWORD *)v8 + 4) & 0x1000) == 0)
        goto LABEL_45;
      goto LABEL_44;
    }
  }
  else if ((v31 & 0x200) == 0)
  {
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *((_QWORD *)v8 + 18));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, *MEMORY[0x24BDC7F90]);

  v31 = *((_DWORD *)v8 + 4);
  if ((v31 & 0x400) != 0)
    goto LABEL_72;
LABEL_43:
  if ((v31 & 0x1000) != 0)
  {
LABEL_44:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *((_QWORD *)v8 + 20));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDC7FB8]);

  }
LABEL_45:
  if ((*((_BYTE *)v8 + 21) & 2) != 0)
  {
    v33 = *((_QWORD *)v8 + 21);
    if ((v33 & 8) != 0)
    {
      self->_stepsNeeded |= 8uLL;
      v33 = *((_QWORD *)v8 + 21);
    }
    if ((v33 & 2) == 0)
      self->_stepsNeeded |= 4uLL;
  }
  v30 = *((_DWORD *)v8 + 8);
LABEL_51:
  if (v30 == 2)
  {
    if ((v8[6] & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *((unsigned int *)v8 + 35));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BDC7F50]);

    }
    if ((*((_BYTE *)v8 + 21) & 2) != 0)
    {
      v35 = *((_QWORD *)v8 + 18);
      if ((v35 & 8) != 0)
      {
        self->_stepsNeeded |= 8uLL;
        v35 = *((_QWORD *)v8 + 18);
      }
      if ((v35 & 2) == 0)
        self->_stepsNeeded |= 4uLL;
    }
    if ((*((_BYTE *)v8 + 21) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((_QWORD *)v8 + 19) != 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BDC7F80]);

    }
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BDC7FD0]);

  if (*((_DWORD *)v8 + 8) == 1
    && *((uint64_t *)v8 + 18) >= 1
    && (v8[54] & 0x20) == 0
    && (*((_DWORD *)v8 + 34) - 1) >= 2)
  {
    self->_stepsNeeded |= 0x40uLL;
  }
  v43 = 0;
  if (!ffsctl(self->_fd, 0x40084A4AuLL, &v43, 0))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, *MEMORY[0x24BDC7F40]);

  }
  free(v8);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_diagnostic, "addEntriesFromDictionary:", v5);
  v12 = 1;
LABEL_69:

  return v12;
}

- (BOOL)_collectFnameAttributesWithError:(id *)a3
{
  id v5;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  BOOL v28;
  void *v29;
  NSURL *v30;
  NSURL *parentURL;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  _QWORD v42[7];

  v42[5] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = (char *)malloc_type_malloc(0x2000uLL, 0x814F23CBuLL);
  if (v6)
  {
    v7 = v6;
    if (fsgetpath(v6, 0x2000uLL, &self->_fsid, self->_ino) < 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      free(v7);
      v28 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDC7EE0]);

      if (objc_msgSend(v9, "hasPrefix:", CFSTR("._")))
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC7ED0]);
      objc_msgSend(v9, "getUnicodeNormalization");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDC7F00]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDC7EF0]);

      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "pathComponents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDC7EE8]);

      objc_msgSend(v9, "pathExtension");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDC7EC8]);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v40, *MEMORY[0x24BDBCBE8], 0);
      v19 = v40;
      if (v18)
      {
        v33 = v16;
        v34 = v9;
        v35 = v8;
        v20 = *MEMORY[0x24BDF8368];
        v42[0] = *MEMORY[0x24BDF8500];
        v42[1] = v20;
        v21 = *MEMORY[0x24BDF85C0];
        v42[2] = *MEMORY[0x24BDF8280];
        v42[3] = v21;
        v42[4] = *MEMORY[0x24BDF8350];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 5);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              if (objc_msgSend(v19, "conformsToType:", v27))
              {
                objc_msgSend(v27, "identifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, *MEMORY[0x24BDC7EF8]);

                goto LABEL_20;
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
            if (v24)
              continue;
            break;
          }
        }
LABEL_20:

        v9 = v34;
        v8 = v35;
        v16 = v33;
      }
      objc_msgSend(v17, "URLByDeletingLastPathComponent");
      v30 = (NSURL *)objc_claimAutoreleasedReturnValue();
      parentURL = self->_parentURL;
      self->_parentURL = v30;

      if (!-[NSURL fp_relationshipToItemAtURL:](self->_trashURL, "fp_relationshipToItemAtURL:", v17))
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC7ED8]);
      free(v7);
      -[NSMutableDictionary addEntriesFromDictionary:](self->_diagnostic, "addEntriesFromDictionary:", v5);

      v28 = 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    v28 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (BOOL)_collectXattrAttributesWithError:(id *)a3
{
  id v5;
  size_t v6;
  char *v7;
  unsigned int *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  ssize_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  ssize_t v27;
  void *v28;
  void *v29;
  FPDiagnosticCollector *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = getpagesize();
  v7 = (char *)malloc_type_malloc(v6, 0xDD37CAD2uLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v8 = (unsigned int *)v7;
  v9 = flistxattr(self->_fd, v7, v6, 32);
  if ((v9 & 0x8000000000000000) != 0)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v11 = *__error();
    v10 = v13;
    goto LABEL_7;
  }
  if (v9 > v6)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = 12;
LABEL_7:
    objc_msgSend(v10, "fp_errorWithPOSIXCode:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v8);
    v12 = 0;
    goto LABEL_33;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (_QWORD *)MEMORY[0x24BDC7FF0];
    goto LABEL_31;
  }
  v31 = self;
  LODWORD(self) = 0;
  v35 = 0;
  v14 = (char *)v8 + v9;
  v32 = *MEMORY[0x24BDC7FF8];
  v33 = *MEMORY[0x24BDC8008];
  v34 = *MEMORY[0x24BDC8000];
  v15 = MEMORY[0x24BDBD1C8];
  v16 = *MEMORY[0x24BDC8010];
  v17 = (const char *)v8;
  do
  {
    v18 = strlen(v17);
    if (!strcmp(v17, "com.apple.quarantine"))
    {
      v19 = v5;
      v20 = v15;
      v21 = v16;
    }
    else if (!strcmp(v17, "com.apple.fileprovider.dir#N"))
    {
      v19 = v5;
      v20 = v15;
      v21 = v34;
    }
    else if (!strcmp(v17, "com.apple.fileprovider.fpfs#P"))
    {
      v19 = v5;
      v20 = v15;
      v21 = v33;
    }
    else
    {
      if (strcmp(v17, "com.apple.fileprovider.before-bounce#P"))
      {
        v35 |= strcmp(v17, "com.apple.decmpfs") == 0;
        goto LABEL_20;
      }
      v19 = v5;
      v20 = v15;
      v21 = v32;
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v21);
LABEL_20:
    v17 += v18 + 1;
    self = (FPDiagnosticCollector *)((_DWORD)self + 1);
  }
  while (v17 < v14);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDC7FF0]);

  self = v31;
  if ((v35 & 1) != 0)
  {
    v23 = fgetxattr(v31->_fd, "com.apple.decmpfs", v8, v6, 0, 32);
    if (v23 >= 16)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8[1]);
      v24 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (v23 < 0)
    {
      if (*__error() == 34)
      {
        v29 = (void *)MEMORY[0x24BDD16E0];
        v27 = -fgetxattr(v31->_fd, "com.apple.decmpfs", 0, 0, 0, 32);
        v28 = v29;
        goto LABEL_29;
      }
    }
    else
    {
      v27 = -v23;
      v28 = (void *)MEMORY[0x24BDD16E0];
LABEL_29:
      objc_msgSend(v28, "numberWithLong:", v27);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_30:
      v25 = (void *)v24;
      v26 = (_QWORD *)MEMORY[0x24BDC7FE8];
LABEL_31:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, *v26);

    }
  }
  free(v8);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_diagnostic, "addEntriesFromDictionary:", v5);
  v12 = 1;
LABEL_33:

  return v12;
}

- (BOOL)_collectPurgeAttributesWithError:(id *)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  v6 = ffsctl(self->_fd, 0x40304A6DuLL, &v12, 0);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (_QWORD)v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDC7F10]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *((_QWORD *)&v13 + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDC7F18]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (_QWORD)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDC7F08]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (_QWORD)v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDC7F20]);

    -[NSMutableDictionary addEntriesFromDictionary:](self->_diagnostic, "addEntriesFromDictionary:", v5);
  }

  return v6 >= 0;
}

- (BOOL)_collectMountAttributesWithError:(id *)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  bzero(&v12, 0x878uLL);
  v6 = fstatfs(self->_fd, &v12);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", 12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12.f_bavail * v12.f_bsize);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDC7DC0]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12.f_flags);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDC7DD8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12.f_bsize);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDC7DC8]);

    if (!APFSVolumeRole())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDC7DE0]);

    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDC7DD0]);
    -[NSMutableDictionary addEntriesFromDictionary:](self->_diagnostic, "addEntriesFromDictionary:", v5);
  }

  return v6 >= 0;
}

- (BOOL)_collectdocIDAttributesWithError:(id *)a3
{
  uint64_t v4;

  if (GSLibraryResolveDocumentId2() == self->_ino)
    v4 = MEMORY[0x24BDBD1C8];
  else
    v4 = MEMORY[0x24BDBD1C0];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDC7FC8]);
  return 1;
}

- (BOOL)_tryReadFirstByteOfFileWithError:(id *)a3
{
  void *v4;
  char __buf;

  __buf = 0;
  if (pread(self->_fd, &__buf, 1uLL, 0) < 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *__error());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BDC7FD8]);

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", &unk_250C31390, *MEMORY[0x24BDC7FD8]);
  }
  return 1;
}

- (BOOL)_collectParentACLCountWithError:(id *)a3
{
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;
  _DWORD *v8;
  void *v9;
  BOOL result;
  id v11;
  __int128 v12;
  uint64_t v13;

  if (!self->_parentURL)
    return 1;
  v13 = 0;
  v12 = xmmword_23B1CA598;
  v5 = getpagesize();
  v6 = malloc_type_malloc(v5, 0x249DFE08uLL);
  if (v6)
  {
    v7 = v6;
    if ((getattrlist(-[NSURL fileSystemRepresentation](self->_parentURL, "fileSystemRepresentation", v12, v13), &v12, v6, v5, 0x20u) & 0x80000000) == 0)
    {
      if ((v7[6] & 0x40) != 0)
      {
        v8 = &v7[*((int *)v7 + 6) + 24];
        if (*v8 == 19710317 && (v8[9] + 1) >= 2)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_diagnostic, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDC7FA8]);

        }
      }
      free(v7);
      return 1;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v7);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "fp_errorWithPOSIXCode:", *__error(), v12, v13);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v11;
  }
  return result;
}

- (NSDictionary)diagnostic
{
  return &self->_diagnostic->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashURL, 0);
  objc_storeStrong((id *)&self->_parentURL, 0);
  objc_storeStrong((id *)&self->_diagnostic, 0);
}

@end
