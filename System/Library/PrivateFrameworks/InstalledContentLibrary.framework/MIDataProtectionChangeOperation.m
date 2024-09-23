@implementation MIDataProtectionChangeOperation

- (MIDataProtectionChangeOperation)initWithURLs:(id)a3 newClass:(int)a4 changeType:(unint64_t)a5
{
  id v9;
  MIDataProtectionChangeOperation *v10;
  MIDataProtectionChangeOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MIDataProtectionChangeOperation;
  v10 = -[MIDataProtectionChangeOperation init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_urls, a3);
    v11->_newClass = a4;
    v11->_operationType = a5;
  }

  return v11;
}

+ (id)dataProtectionChangeOperationForURLs:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURLs:newClass:changeType:", v7, v6, a5);

  return v8;
}

+ (id)dataProtectionChangeOperationForURL:(id)a3 settingClass:(int)a4 changeType:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v6 = *(_QWORD *)&a4;
  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc((Class)objc_opt_class());
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithURLs:newClass:changeType:", v9, v6, a5);
  return v10;
}

- (BOOL)_runChangeOperationWasLocked:(BOOL *)a3 withError:(id *)a4
{
  void *v6;
  uint64_t v7;
  char **v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  FTS *v17;
  FTS *v18;
  FTSENT *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  FTSENT *v24;
  id v25;
  unsigned int fts_info;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  BOOL v58;
  uint64_t fts_path;
  char *v60;
  uint64_t st_mode;
  id v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *context;
  void *contexta;
  FTS *v70;
  BOOL *v72;
  id v73;
  _QWORD v74[6];
  int v75;
  id v76;
  _QWORD v77[7];

  -[MIDataProtectionChangeOperation urls](self, "urls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = (char **)malloc_type_malloc(8 * v7 + 8, 0x10040436913F5uLL);
  if (!v7)
    goto LABEL_59;
  v72 = a3;
  v9 = 0;
  v10 = 0;
  do
  {
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIDataProtectionChangeOperation urls](self, "urls");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "itemExistsAtURL:", v13);

    if (v14)
    {
      -[MIDataProtectionChangeOperation urls](self, "urls");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8[v10] = (char *)objc_msgSend(v16, "fileSystemRepresentation");

      ++v10;
    }
    ++v9;
  }
  while (v7 != v9);
  a3 = v72;
  if (!v10)
  {
LABEL_59:
    v33 = 0;
    *a3 = 0;
    v23 = 1;
    goto LABEL_71;
  }
  v8[v10] = 0;
  v17 = fts_open(v8, 84, 0);
  v18 = v17;
  if (!v17)
  {
    v50 = (void *)*MEMORY[0x1E0CB2FE0];
    v51 = *__error();
    -[MIDataProtectionChangeOperation urls](self, "urls");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = __error();
    v60 = strerror(*v53);
    _CreateError((uint64_t)"-[MIDataProtectionChangeOperation _runChangeOperationWasLocked:withError:]", 78, v50, v51, 0, 0, CFSTR("fts_open failed for %@ : %s"), v54, (uint64_t)v52);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_61;
  }
  v19 = fts_read(v17);
  v23 = 1;
  if (!v19)
  {
    v25 = 0;
LABEL_70:
    fts_close(v18);
    v33 = v25;
LABEL_71:
    if (v8)
      free(v8);
    goto LABEL_73;
  }
  v24 = v19;
  v25 = 0;
  v63 = (void *)*MEMORY[0x1E0CB2FE0];
  v70 = v18;
  while (1)
  {
    fts_info = v24->fts_info;
    if (fts_info > 0xD)
    {
LABEL_26:
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        fts_path = (uint64_t)v24->fts_path;
        v60 = strerror(v24->fts_errno);
        MOLogWrite();
      }
      goto LABEL_12;
    }
    if (((1 << fts_info) & 0x300A) != 0)
      goto LABEL_12;
    if (fts_info == 6)
      break;
    if (fts_info != 8)
      goto LABEL_26;
    v27 = (void *)MEMORY[0x1BCCAA068]();
    if ((-[MIDataProtectionChangeOperation operationType](self, "operationType") & 2) == 0)
      goto LABEL_47;
    v66 = v27;
    v28 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
    if (v28)
      v29 = v28;
    else
      v29 = 3;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v24->fts_path, 0, 0, fts_path, v60, st_mode, v62);
    v30 = objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke_2;
    v74[3] = &unk_1E6CB71F8;
    v75 = v29;
    v74[4] = self;
    v74[5] = v24;
    v31 = MEMORY[0x1BCCAA218](v74);
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v25;
    context = (void *)v30;
    v64 = (void *)v31;
    LOBYTE(v30) = objc_msgSend(v32, "setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:", v30, v29, v31, &v73);
    v33 = v73;

    if ((v30 & 1) != 0)
    {
      v34 = 0;
      v35 = 1;
LABEL_44:
      v18 = v70;
      goto LABEL_45;
    }
    objc_msgSend(v33, "domain");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v45, "isEqualToString:", v63);
    if (v35)
    {
      v46 = objc_msgSend(v33, "code");

      if (v46 != 9)
      {
        v35 = 0;
        v34 = 5;
        goto LABEL_44;
      }
      v18 = v70;
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        v34 = 0;
        v35 = 1;
        goto LABEL_45;
      }
      objc_msgSend(context, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      st_mode = v24->fts_statp->st_mode;
      v62 = v33;
      fts_path = v29;
      v60 = (char *)v45;
      MOLogWrite();
      v34 = 0;
    }
    else
    {
      v34 = 5;
      v18 = v70;
    }

LABEL_45:
    v27 = v66;

    if (v35)
    {
      v25 = v33;
LABEL_47:
      objc_autoreleasePoolPop(v27);
      goto LABEL_12;
    }
    objc_autoreleasePoolPop(v66);
    if (v34)
    {
      v58 = v34 == 5;
      goto LABEL_76;
    }
    v25 = v33;
LABEL_12:
    v19 = fts_read(v18);
    v24 = v19;
    if (!v19)
    {
      v23 = 1;
      goto LABEL_69;
    }
  }
  v36 = (void *)MEMORY[0x1BCCAA068](v19, v20, v21, v22);
  if ((-[MIDataProtectionChangeOperation operationType](self, "operationType") & 1) == 0)
  {
LABEL_53:
    objc_autoreleasePoolPop(v36);
    v18 = v70;
    goto LABEL_12;
  }
  contexta = v36;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v24->fts_path, 1, 0);
  v37 = objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke;
  v77[3] = &unk_1E6CB71D0;
  v77[4] = self;
  v77[5] = v24;
  v38 = MEMORY[0x1BCCAA218](v77);
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
  v76 = v25;
  v41 = (void *)v37;
  v67 = (void *)v38;
  LOBYTE(v37) = objc_msgSend(v39, "setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:", v37, v40, v38, &v76);
  v33 = v76;

  if ((v37 & 1) != 0)
  {
    v42 = 0;
    v43 = v41;
    goto LABEL_25;
  }
  objc_msgSend(v33, "domain");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v47, "isEqualToString:", v63);
  if (v65)
  {
    v48 = objc_msgSend(v33, "code");

    v43 = v41;
    if (v48 == 9)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v49 = -[MIDataProtectionChangeOperation newClass](self, "newClass", fts_path, v60, st_mode, v62);
        objc_msgSend(v41, "path");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        st_mode = v24->fts_statp->st_mode;
        v62 = v33;
        fts_path = v49;
        v60 = (char *)v47;
        MOLogWrite();
        v42 = 0;
        goto LABEL_42;
      }
      v42 = 0;
LABEL_25:
      v44 = 1;
    }
    else
    {
      v44 = 0;
      v42 = 5;
    }
  }
  else
  {
    v42 = 5;
    v43 = v41;
LABEL_42:

    v44 = v65;
  }

  if (v44)
  {
    v25 = v33;
    v36 = contexta;
    goto LABEL_53;
  }
  objc_autoreleasePoolPop(contexta);
  if (!v42)
  {
    v25 = v33;
    v18 = v70;
    goto LABEL_12;
  }
  v58 = v42 == 5;
  v18 = v70;
LABEL_76:
  v50 = v63;
  if (v58)
  {
LABEL_61:
    objc_msgSend(v33, "domain", fts_path, v60);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "isEqualToString:", v50))
    {
      v56 = objc_msgSend(v33, "code");

      if (v56 == 1)
      {
        v23 = 1;
        *v72 = 1;

        v25 = 0;
        goto LABEL_69;
      }
    }
    else
    {

    }
    if (a4)
    {
      v25 = objc_retainAutorelease(v33);
      v23 = 0;
      *a4 = v25;
    }
    else
    {
      v23 = 0;
      v25 = v33;
    }
LABEL_69:
    v33 = v25;
    if (!v18)
      goto LABEL_71;
    goto LABEL_70;
  }
LABEL_73:

  return v23 & 1;
}

BOOL __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke(uint64_t a1, int a2)
{
  if (a2 != 2 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "newClass");
    MOLogWrite();
  }
  return a2 != 2;
}

uint64_t __74__MIDataProtectionChangeOperation__runChangeOperationWasLocked_withError___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  result = 0;
  if (a2 != 2 && *(_DWORD *)(a1 + 48) != a2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "operationType") & 4) != 0 && *(_DWORD *)(a1 + 48) > a2)
    {
      return 0;
    }
    else
    {
      if (gLogHandle)
      {
        if (*(int *)(gLogHandle + 44) >= 7)
          MOLogWrite();
      }
      return 1;
    }
  }
  return result;
}

- (void)performChangeOperation
{
  BOOL v3;
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  unsigned __int8 v12;

  v12 = 0;
  v11 = 0;
  v3 = -[MIDataProtectionChangeOperation _runChangeOperationWasLocked:withError:](self, "_runChangeOperationWasLocked:withError:", &v12, &v11);
  v4 = v11;
  if (!v3 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
  {
    -[MIDataProtectionChangeOperation urls](self, "urls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MIDataProtectionChangeOperation newClass](self, "newClass");
    v10 = v4;
    v8 = v5;
    MOLogWrite();

  }
  -[MIDataProtectionChangeOperation completionBlock](self, "completionBlock", v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MIDataProtectionChangeOperation completionBlock](self, "completionBlock");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, v12, v4);

  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)urls
{
  return self->_urls;
}

- (int)newClass
{
  return self->_newClass;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
