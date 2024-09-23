@implementation BRQueryItem(BRCNotificationAdditions)

- (_BYTE)initWithRelPath:()BRCNotificationAdditions error:
{
  id v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  char *v60;
  unint64_t v61;
  void *v62;
  int v63;
  unint64_t v64;
  char *v65;
  objc_super v67;

  v6 = a3;
  v67.receiver = a1;
  v67.super_class = (Class)BRQueryItem_0;
  v7 = objc_msgSendSuper2(&v67, sel_init);
  if (!v7)
    goto LABEL_28;
  if ((objc_msgSend(v6, "exists") & 1) != 0)
  {
    *(_QWORD *)&v7[*MEMORY[0x1E0D10F78]] = -1;
    *(_QWORD *)&v7[*MEMORY[0x1E0D10FA8]] = -1;
    if (objc_msgSend(v6, "isFinderAlias"))
    {
      v8 = (int)*MEMORY[0x1E0D10F68];
      v7[v8 + 5] = 3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (int)*MEMORY[0x1E0D10F88];
      v11 = *(void **)&v7[v10];
      *(_QWORD *)&v7[v10] = v9;

    }
    else if (objc_msgSend(v6, "isSymLink"))
    {
      v8 = (int)*MEMORY[0x1E0D10F68];
      v7[v8 + 5] = 4;
    }
    else if (objc_msgSend(v6, "isDocument"))
    {
      v8 = (int)*MEMORY[0x1E0D10F68];
      v12 = &v7[v8];
      v7[v8 + 5] = 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (int)*MEMORY[0x1E0D10F88];
      v15 = *(void **)&v7[v14];
      *(_QWORD *)&v7[v14] = v13;

      v16 = *(_DWORD *)v12 & 0xFFFFFFF7 | ((unint64_t)v12[4] << 32);
      *(_DWORD *)v12 = *(_DWORD *)v12 & 0xFFFFFFF3 | 4;
      v12[4] = BYTE4(v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "modificationTime"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (int)*MEMORY[0x1E0D10F88];
      v19 = *(void **)&v7[v18];
      *(_QWORD *)&v7[v18] = v17;

      v8 = (int)*MEMORY[0x1E0D10F68];
      v7[v8 + 5] = 0;
    }
    objc_msgSend(v6, "appLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "appLibraryID");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (int)*MEMORY[0x1E0D10F28];
    v23 = *(void **)&v7[v22];
    *(_QWORD *)&v7[v22] = v21;

    if (objc_msgSend(v6, "isFault"))
    {
      objc_msgSend(v6, "faultDisplayName");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (int)*MEMORY[0x1E0D10F80];
      v26 = *(void **)&v7[v25];
      *(_QWORD *)&v7[v25] = v24;

      objc_msgSend(v6, "filename");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (int)*MEMORY[0x1E0D10FB0];
      v29 = *(void **)&v7[v28];
      *(_QWORD *)&v7[v28] = v27;

      if (*(_QWORD *)&v7[v25])
      {
LABEL_20:
        v40 = (int)*MEMORY[0x1E0D10FD0];
        v41 = *(void **)&v7[v40];
        *(_QWORD *)&v7[v40] = 0;

        v42 = (int)*MEMORY[0x1E0D10FA0];
        v43 = *(void **)&v7[v42];
        *(_QWORD *)&v7[v42] = 0;

        objc_msgSend(v6, "absolutePath");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringByDeletingLastPathComponent");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (int)*MEMORY[0x1E0D10F98];
        v47 = *(void **)&v7[v46];
        *(_QWORD *)&v7[v46] = v45;

        objc_msgSend(v6, "fileObjectID");
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = (int)*MEMORY[0x1E0D10F60];
        v50 = *(void **)&v7[v49];
        *(_QWORD *)&v7[v49] = v48;

        objc_msgSend(v6, "parentFileObjectID");
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = (int)*MEMORY[0x1E0D10F90];
        v53 = *(void **)&v7[v52];
        *(_QWORD *)&v7[v52] = v51;

        objc_msgSend(v7, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D110F8]);
        if (objc_msgSend(v6, "isFile"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "size"));
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = (int)*MEMORY[0x1E0D10FC0];
          v56 = *(void **)&v7[v55];
          *(_QWORD *)&v7[v55] = v54;

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v6, "birthTime"));
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = (int)*MEMORY[0x1E0D10F38];
        v59 = *(void **)&v7[v58];
        *(_QWORD *)&v7[v58] = v57;

        v60 = &v7[(int)v8];
        v61 = *(_DWORD *)v60 & 0xFFEFFFFF | ((unint64_t)v60[4] << 32);
        *(_DWORD *)v60 = *(_DWORD *)v60 & 0xFFEFFBFC | 0x403;
        v60[4] = BYTE4(v61);
        if (objc_msgSend(v6, "type") == 5)
        {
          objc_msgSend(v6, "appLibrary");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v62, "isiCloudDesktopAppLibrary");

          v64 = *(unsigned int *)&v7[(int)v8] | ((unint64_t)v7[(int)v8 + 4] << 32);
          if (!v63)
            v64 |= 0x8000000uLL;
        }
        else
        {
          v64 = *(unsigned int *)&v7[(int)v8] | ((unint64_t)v7[(int)v8 + 4] << 32);
        }
        v65 = &v7[(int)v8];
        v65[4] = BYTE4(v64);
        *(_DWORD *)v65 = v64 | 0x20000000;
        goto LABEL_28;
      }
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[BRQueryItem(BRCNotificationAdditions) initWithRelPath:error:].cold.1((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37);

    }
    else
    {
      objc_msgSend(v6, "filename");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (int)*MEMORY[0x1E0D10F80];
      v30 = *(void **)&v7[v39];
      *(_QWORD *)&v7[v39] = v38;
    }

    goto LABEL_20;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v7 = 0;
LABEL_28:

  return v7;
}

- (void)initWithRelPath:()BRCNotificationAdditions error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, a2, a3, "[CRIT] Assertion failed: _logicalName != nil%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
