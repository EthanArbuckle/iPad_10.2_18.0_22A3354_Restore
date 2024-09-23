@implementation MIBOMWrapper

+ (BOOL)_countFilesAndBytesInArchiveAtURL:(id)a3 withBOMCopier:(_BOMCopier *)a4 totalFiles:(unint64_t *)a5 totalUncompressedBytes:(unint64_t *)a6 error:(id *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  BOOL v14;

  objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v8 = BOMCopierCountFilesInArchive();
  v10 = v8;
  if ((_DWORD)v8 == -1)
  {
    v12 = *__error();
    v13 = (void *)*MEMORY[0x1E0D3ACC0];
    if (v12)
      strerror(v12);
  }
  else
  {
    if (!(_DWORD)v8)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v13 = (void *)*MEMORY[0x1E0D3ACC0];
  }
  _CreateError((uint64_t)"+[MIBOMWrapper _countFilesAndBytesInArchiveAtURL:withBOMCopier:totalFiles:totalUncompressedBytes:error:]", 149, v13, 4, 0, 0, CFSTR("Failed to count the files and bytes in archive : %d (%s)"), v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (a7 && v11)
  {
    v11 = objc_retainAutorelease(v11);
    *a7 = v11;
  }
LABEL_10:
  v14 = v11 == 0;

  return v14;
}

+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a3;
  LOBYTE(a5) = objc_msgSend((id)objc_opt_class(), "extractZipArchiveAtURL:toURL:withError:extractionProgressBlock:", v8, v7, a5, 0);

  return (char)a5;
}

+ (BOOL)extractZipArchiveAtURL:(id)a3 toURL:(id)a4 withError:(id *)a5 extractionProgressBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD, double);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD, double))a6;
  v43 = 0u;
  v44 = 0u;
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (a5)
    *a5 = 0;
  objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("extractPKZip"));
  v42 = 0;
  BomSys_init();
  BomSys_set_open();
  v15 = BOMCopierNewWithSys();
  if (v15)
  {
    BOMCopierSetFileErrorHandler();
    BOMCopierSetFatalErrorHandler();
    BOMCopierSetFatalFileErrorHandler();
    BOMCopierSetUserData();
    if (v11)
    {
      v40 = 0;
      v41 = 0;
      v39 = 0;
      v16 = objc_msgSend((id)objc_opt_class(), "_countFilesAndBytesInArchiveAtURL:withBOMCopier:totalFiles:totalUncompressedBytes:error:", v9, v15, &v41, &v40, &v39);
      v17 = v39;
      v18 = v40;
      if (v40)
        v19 = v16;
      else
        v19 = 0;
      if ((v19 & 1) != 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          objc_msgSend(v9, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          v18 = v40;
        }
        v20 = (void *)MEMORY[0x1B5E0AE64](v11);
        *((_QWORD *)&v43 + 1) = v18;
        *(_QWORD *)&v44 = 0;
        v21 = MEMORY[0x1B5E0AE64]();
        v22 = (void *)*((_QWORD *)&v44 + 1);
        *((_QWORD *)&v44 + 1) = v21;

        BOMCopierSetCopyFileFinishedHandler();
        BOMCopierSetCopyFileUpdateHandler();

      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          objc_msgSend(v9, "path");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        v11[2](v11, -1.0);
      }

    }
    v26 = v9;
    v27 = v10;
    v28 = v13;
    if (!v28)
      v28 = (id)objc_opt_new();
    MIAssertHighResourceUsage();
    v29 = objc_retainAutorelease(v26);
    objc_msgSend(v29, "fileSystemRepresentation");
    v30 = objc_retainAutorelease(v27);
    objc_msgSend(v30, "fileSystemRepresentation");
    v31 = BOMCopierCopyWithOptions();
    MIClearResourceAssertion();

    v32 = v31 | BYTE4(v43);
    v25 = v32 == 0;
    if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], (int)v43, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"+[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:extractionProgressBlock:]", 223, (void *)*MEMORY[0x1E0D3ACC0], 5, v33, &unk_1E6169048, CFSTR("Could not extract archive"), v34, (uint64_t)v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }
    v35 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = 0;

    BOMCopierFree();
  }
  else
  {
    _CreateAndLogError((uint64_t)"+[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:extractionProgressBlock:]", 189, (void *)*MEMORY[0x1E0D3ACC0], 5, 0, 0, CFSTR("Failed to create copier"), v14, (uint64_t)v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)&v44 + 1);
    *((_QWORD *)&v44 + 1) = 0;

    v25 = 0;
  }
  if (v42)
    BomSys_free();
  if (a5)
    v36 = v25;
  else
    v36 = 1;
  if ((v36 & 1) == 0)
    *a5 = objc_retainAutorelease(v23);

  return v25;
}

@end
