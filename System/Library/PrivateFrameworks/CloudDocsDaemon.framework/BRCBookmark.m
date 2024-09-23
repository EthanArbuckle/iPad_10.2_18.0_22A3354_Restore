@implementation BRCBookmark

- (BOOL)containsItemID
{
  void *v4;
  NSObject *v5;

  if (!self->_targetResolved)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCBookmark containsItemID].cold.1();

  }
  return self->_containsItemID;
}

- (BRCServerZone)targetServerZone
{
  void *v4;
  NSObject *v5;

  if (!self->_targetResolved)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCBookmark containsItemID].cold.1();

  }
  return self->_targetServerZone;
}

- (BRCLocalItem)target
{
  void *v4;
  NSObject *v5;

  if (!self->_targetResolved)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCBookmark containsItemID].cold.1();

  }
  return self->_target;
}

- (void)_computeSignature:(unsigned __int8)a3[32]
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  size_t v9;
  size_t v10;
  _BYTE macOut[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[BRCAccountSession ubiquityTokenSalt](self->_session, "ubiquityTokenSalt");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  -[BRCAppLibrary appLibraryID](self->_appLibrary, "appLibraryID");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  v9 = strlen(v6);
  CCHmac(2u, v6, v9, -[NSData bytes](self->_bookmarkData, "bytes"), -[NSData length](self->_bookmarkData, "length"), macOut);
  v10 = strlen(v8);
  CCHmac(2u, v8, v10, macOut, 0x20uLL, a3);
}

- (int)_validateSignatureWithFd:(int)a3
{
  int8x16_t v4;
  int8x16_t v6[2];
  int8x16_t value[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (fgetxattr(a3, "com.apple.clouddocs.security", value, 0x20uLL, 0, 0) != 32)
    return 81;
  -[BRCBookmark _computeSignature:](self, "_computeSignature:", v6);
  v4 = vorrq_s8(veorq_s8(value[1], v6[1]), veorq_s8(value[0], v6[0]));
  if (vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)))
    return 80;
  else
    return 0;
}

- (BRCBookmark)initWithRelpath:(id)a3
{
  id v4;
  BRCBookmark *v5;
  uint64_t v6;
  BRCAccountSession *session;
  uint64_t v8;
  BRCAppLibrary *appLibrary;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSData *bookmarkData;
  BRCBookmark *v15;
  BRCBookmark *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  NSObject *v27;
  _QWORD v28[4];
  BRCBookmark *v29;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRCBookmark;
  v5 = -[BRCBookmark init](&v32, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "session");
  v6 = objc_claimAutoreleasedReturnValue();
  session = v5->_session;
  v5->_session = (BRCAccountSession *)v6;

  objc_msgSend(v4, "appLibrary");
  v8 = objc_claimAutoreleasedReturnValue();
  appLibrary = v5->_appLibrary;
  v5->_appLibrary = (BRCAppLibrary *)v8;

  if (!v8)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCBookmark initWithRelpath:].cold.1();

    goto LABEL_23;
  }
  if ((objc_msgSend(v4, "isBRAlias") & 1) == 0)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[BRCBookmark initWithRelpath:].cold.4();

  }
  if ((objc_msgSend(v4, "isBRAlias") & 1) == 0)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      -[BRCBookmark initWithRelpath:].cold.3();

    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "physicalURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v10, "bookmarkDataWithContentsOfURL:error:", v11, &v31);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v31;
  bookmarkData = v5->_bookmarkData;
  v5->_bookmarkData = (NSData *)v12;

  if (!v5->_bookmarkData)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v4;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v21;
      _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] Unable to get bookmark data on bookmark at %@: %@%@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __31__BRCBookmark_initWithRelpath___block_invoke;
  v28[3] = &unk_1E875DEB8;
  v15 = v5;
  v29 = v15;
  v30 = v4;
  if ((objc_msgSend(v30, "performOnOpenFileDescriptor:error:", v28, 0) & 1) == 0)
  {
    brc_bread_crumbs();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      -[BRCBookmark initWithRelpath:].cold.2();

LABEL_21:
LABEL_22:
    v5 = 0;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }

  v15->_dataResolved = 1;
LABEL_8:
  v5 = v5;
  v16 = v5;
LABEL_24:

  return v16;
}

uint64_t __31__BRCBookmark_initWithRelpath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = objc_msgSend(*(id *)(a1 + 32), "_validateSignatureWithFd:", a2);
  if ((_DWORD)v3 == 80)
    objc_msgSend((id)objc_opt_class(), "unlinkAliasAtPath:", *(_QWORD *)(a1 + 40));
  return v3;
}

- (BRCBookmark)initWithTarget:(id)a3 owningAppLibrary:(id)a4 path:(id)a5 session:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  BRCBookmark *v19;
  void *v20;
  NSObject *v21;
  BRCBookmark *v22;
  uint64_t v23;
  BRCServerZone *targetServerZone;
  id v26;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11 && !objc_msgSend(v11, "isDocument") || v13 && (objc_msgSend(v13, "isDocument") & 1) == 0)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCBookmark initWithTarget:owningAppLibrary:path:session:].cold.2();

    v19 = 0;
  }
  else
  {
    v26 = v14;
    objc_msgSend(v11, "appLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToAppLibrary:", v12);

    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        -[BRCBookmark initWithTarget:owningAppLibrary:path:session:].cold.1();

      v19 = 0;
    }
    else
    {
      v27.receiver = self;
      v27.super_class = (Class)BRCBookmark;
      v22 = -[BRCBookmark init](&v27, sel_init);
      v19 = v22;
      if (v22)
      {
        objc_storeStrong((id *)&v22->_session, a6);
        objc_storeStrong((id *)&v19->_appLibrary, a4);
        objc_storeStrong((id *)&v19->_target, a3);
        objc_msgSend(v11, "serverZone");
        v23 = objc_claimAutoreleasedReturnValue();
        targetServerZone = v19->_targetServerZone;
        v19->_targetServerZone = (BRCServerZone *)v23;

        objc_storeStrong((id *)&v19->_targetRelpath, a5);
        v19->_targetResolved = 1;
      }
    }
    v14 = v26;
  }

  return v19;
}

- (BOOL)_resolveTargetWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  BRCAppLibrary *v45;
  BRCAppLibrary *appLibrary;
  char *v47;
  NSObject *v48;
  BRCLocalItem *v49;
  BRCLocalItem *target;
  void *v51;
  NSObject *v52;
  BRCLocalItem *v53;
  BRCLocalItem *v54;
  BRCLocalItem *v55;
  void *v56;
  NSObject *v57;
  BRCLocalItem *v58;
  BRCAppLibrary *v59;
  char *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  BRCRelativePath *v65;
  void *v66;
  int v67;
  void *v68;
  NSObject *v69;
  id *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  BRCServerZone *v75;
  BRCServerZone *targetServerZone;
  const char *v77;
  BRCRelativePath *v78;
  unsigned int v79;
  int v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  const char *v88;
  const char *v89;
  const char *v90;
  void *v91;
  id *v92;
  id *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  char *v102;
  id v103;
  char *v104;
  uint8_t v105[128];
  uint8_t buf[4];
  const char *v107;
  __int16 v108;
  const char *v109;
  __int16 v110;
  id v111;
  __int16 v112;
  void *v113;
  _QWORD v114[2];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = *MEMORY[0x1E0C998F8];
  v7 = *MEMORY[0x1E0C99AA8];
  v114[0] = *MEMORY[0x1E0C998F8];
  v114[1] = v7;
  v9 = *MEMORY[0x1E0C9AD30];
  v115 = *MEMORY[0x1E0C9B3C8];
  v8 = v115;
  v116 = v9;
  v96 = v9;
  v10 = *MEMORY[0x1E0C9AC50];
  v11 = *MEMORY[0x1E0C99A90];
  v117 = *MEMORY[0x1E0C9AC50];
  v118 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourceValuesForKeys:fromBookmarkData:", v12, self->_bookmarkData);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v104 = 0;
  v102 = 0;
  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "hasPrefix:", CFSTR("docs.icloud.com:")))
  {
    v94 = v10;
    objc_msgSend(v15, "substringFromIndex:", objc_msgSend(CFSTR("docs.icloud.com:"), "length"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "parseBookmarkDataWithAccountSession:docID:itemID:mangledID:unsaltedBookmarkData:error:", self->_session, &v103, &v102, &v104, 0, a3))
    {
      v17 = v103;
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v17)
      {
        if (v18)
        {
          v20 = v103;
          objc_msgSend(v13, "objectForKeyedSubscript:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v20) = objc_msgSend(v20, "br_isEqualToNumber:", v21);

          if ((v20 & 1) != 0)
          {
LABEL_38:

            -[BRCAccountSession appLibraryByMangledID:](self->_session, "appLibraryByMangledID:", v104);
            v45 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
            appLibrary = self->_appLibrary;
            self->_appLibrary = v45;

            -[BRCAccountSession clientZoneByMangledID:](self->_session, "clientZoneByMangledID:", v104);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              brc_bread_crumbs();
              v47 = (char *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v107 = v104;
                v108 = 2112;
                v109 = v47;
                _os_log_impl(&dword_1CBD43000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] no target container %@ for bookmark%@", buf, 0x16u);
              }

            }
            if (v102)
            {
              objc_msgSend(v16, "itemByItemID:");
              v49 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
              target = self->_target;
              self->_target = v49;

              if (!self->_target)
              {
                brc_bread_crumbs();
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v107 = v102;
                  v108 = 2112;
                  v109 = v104;
                  v110 = 2112;
                  v111 = v51;
                  _os_log_impl(&dword_1CBD43000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] no target itemID for %@ in container %@%@", buf, 0x20u);
                }

              }
              self->_containsItemID = 1;
            }
            v53 = self->_target;
            if (!v53 && v103)
            {
              objc_msgSend(v16, "itemByDocumentID:", objc_msgSend(v103, "unsignedIntValue"));
              v54 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
              v55 = self->_target;
              self->_target = v54;

              if (self->_target)
              {
LABEL_55:
                if (!self->_appLibrary)
                {
                  v58 = self->_target;
                  if (v58)
                  {
                    -[BRCLocalItem appLibrary](v58, "appLibrary");
                    v59 = (BRCAppLibrary *)objc_claimAutoreleasedReturnValue();
                    v60 = (char *)self->_appLibrary;
                    self->_appLibrary = v59;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v60 = (char *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v74 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v107 = v60;
                      _os_log_impl(&dword_1CBD43000, v74, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resolve target app library%@", buf, 0xCu);
                    }

                  }
                }
                objc_msgSend(v16, "serverZone");
                v75 = (BRCServerZone *)objc_claimAutoreleasedReturnValue();
                targetServerZone = self->_targetServerZone;
                self->_targetServerZone = v75;

                LOBYTE(a3) = 1;
                self->_targetResolved = 1;
                goto LABEL_96;
              }
              brc_bread_crumbs();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v107 = (const char *)v103;
                v108 = 2112;
                v109 = v104;
                v110 = 2112;
                v111 = v56;
                _os_log_impl(&dword_1CBD43000, v57, OS_LOG_TYPE_DEFAULT, "[WARNING] no target docID for %@ in container %@%@", buf, 0x20u);
              }

              v53 = self->_target;
            }
            if (v53)
              goto LABEL_55;
            v91 = v15;
            v93 = a3;
            objc_msgSend(v13, "objectForKeyedSubscript:", v11);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v96);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v94);
            v63 = objc_claimAutoreleasedReturnValue();
            v64 = (void *)v63;
            if (!self->_appLibrary)
            {
LABEL_87:
              brc_bread_crumbs();
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, (os_log_type_t)0x90u))
                -[BRCBookmark _resolveTargetWithError:].cold.1();

              objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 18);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              if (v83)
              {
                v84 = v62;
                brc_bread_crumbs();
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v86 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v86, (os_log_type_t)0x90u))
                {
                  v89 = "(passed to caller)";
                  *(_DWORD *)buf = 136315906;
                  v107 = "-[BRCBookmark _resolveTargetWithError:]";
                  v108 = 2080;
                  if (!v93)
                    v89 = "(ignored by caller)";
                  v109 = v89;
                  v110 = 2112;
                  v111 = v83;
                  v112 = 2112;
                  v113 = v85;
                  _os_log_error_impl(&dword_1CBD43000, v86, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
                }

                v62 = v84;
              }
              if (v93)
                *v93 = objc_retainAutorelease(v83);

LABEL_95:
              LOBYTE(a3) = 0;
              v15 = v91;
              goto LABEL_96;
            }
            if (v63 && v61)
            {
              v97 = v62;
              v65 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", objc_msgSend(v62, "unsignedLongLongValue"), self->_session);
              if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v65, "resolveAndKeepOpenMustExist:error:", 1, 0))
              {
                -[BRCRelativePath pathWithChildAtPath:](v65, "pathWithChildAtPath:", v61);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v66, "resolveAndKeepOpenMustExist:error:", 1, 0))
                {
                  v95 = objc_msgSend(v66, "documentID");
                  v67 = objc_msgSend(v103, "unsignedIntValue");
                  objc_msgSend(v66, "close");
                  -[BRCRelativePath close](v65, "close");

                  v62 = v97;
                  if (v95 == v67)
                    goto LABEL_85;
                  goto LABEL_83;
                }
                -[BRCRelativePath close](v65, "close");

              }
              v62 = v97;
            }
LABEL_83:
            v78 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", objc_msgSend(v64, "unsignedLongLongValue"), self->_session);
            if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](v78, "resolveAndKeepOpenMustExist:error:", 1, 0))
            {
              v79 = -[BRCRelativePath documentID](v78, "documentID");
              v80 = objc_msgSend(v103, "unsignedIntValue");
              -[BRCRelativePath close](v78, "close");

              if (v79 == v80)
              {
LABEL_85:

                v15 = v91;
                goto LABEL_55;
              }
            }
            else
            {

            }
            goto LABEL_87;
          }
        }
        brc_bread_crumbs();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[BRCBookmark _resolveTargetWithError:].cold.2();

      }
      else
      {
        v22 = v103;
        v103 = v18;
      }
LABEL_37:

      goto LABEL_38;
    }
LABEL_26:
    LOBYTE(a3) = 0;
    goto LABEL_96;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v103;
  v103 = v24;

  if (v14 && v103)
  {
    v92 = a3;
    v94 = v10;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    -[BRCAccountSession roots](self->_session, "roots");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v99;
      v91 = v15;
LABEL_13:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v99 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * v30), "absolutePath", v91);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "br_pathRelativeToPath:", v31);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
          break;
        if (v28 == ++v30)
        {
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v98, v105, 16);
          v15 = v91;
          if (v28)
            goto LABEL_13;
          goto LABEL_19;
        }
      }

      v41 = objc_msgSend(v16, "rangeOfString:", CFSTR("/"));
      if (v42)
      {
        objc_msgSend(v16, "substringToIndex:", v41);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v43 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10E88]), "initWithMangledString:", v22);
        v44 = v104;
        v104 = v43;

        v15 = v91;
        a3 = v92;
        goto LABEL_37;
      }
      brc_bread_crumbs();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v92;
      if (os_log_type_enabled(v69, (os_log_type_t)0x90u))
        -[BRCBookmark _resolveTargetWithError:].cold.4();

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 18);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        brc_bread_crumbs();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, (os_log_type_t)0x90u))
        {
          v90 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v107 = "-[BRCBookmark _resolveTargetWithError:]";
          v108 = 2080;
          if (!v92)
            v90 = "(ignored by caller)";
          v109 = v90;
          v110 = 2112;
          v111 = v71;
          v112 = 2112;
          v113 = v72;
          _os_log_error_impl(&dword_1CBD43000, v73, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        v70 = v92;
      }
      if (v70)
        *v70 = objc_retainAutorelease(v71);

      goto LABEL_95;
    }
LABEL_19:

    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      -[BRCBookmark _resolveTargetWithError:].cold.3();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 18);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v88 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v107 = "-[BRCBookmark _resolveTargetWithError:]";
        v108 = 2080;
        if (!v92)
          v88 = "(ignored by caller)";
        v109 = v88;
        v110 = 2112;
        v111 = v16;
        v112 = 2112;
        v113 = v34;
        _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (v92)
    {
      v16 = objc_retainAutorelease(v16);
      LOBYTE(a3) = 0;
      *v92 = v16;
      goto LABEL_96;
    }
    goto LABEL_26;
  }
  brc_bread_crumbs();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, (os_log_type_t)0x90u))
    -[BRCBookmark _resolveTargetWithError:].cold.5();

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    brc_bread_crumbs();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
    {
      v77 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v107 = "-[BRCBookmark _resolveTargetWithError:]";
      v108 = 2080;
      if (!a3)
        v77 = "(ignored by caller)";
      v109 = v77;
      v110 = 2112;
      v111 = v16;
      v112 = 2112;
      v113 = v38;
      _os_log_error_impl(&dword_1CBD43000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a3)
  {
    v16 = objc_retainAutorelease(v16);
    v40 = a3;
    LOBYTE(a3) = 0;
    *v40 = v16;
  }
LABEL_96:

  return (char)a3;
}

- (BOOL)_resolveDataWithError:(id *)a3
{
  void *v5;
  BRCItemToPathLookup *v6;
  void *v7;
  BRCLocalItem *target;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSData *v13;
  NSData *bookmarkData;
  BOOL v15;
  void *v16;
  void *v17;
  BRCRelativePath *targetRelpath;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  -[BRCRelativePath physicalURL](self->_targetRelpath, "physicalURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[BRCItemToPathLookup initWithItem:]([BRCItemToPathLookup alloc], "initWithItem:", self->_target);
    -[BRCItemToPathLookup byFileSystemID](v6, "byFileSystemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "physicalURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[BRCItemToPathLookup closePaths](v6, "closePaths");
    if (!v5)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
        v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      goto LABEL_6;
    }
  }
  target = self->_target;
  if (target)
  {
    -[BRCLocalItem bookmarkData](target, "bookmarkData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
LABEL_5:
      objc_msgSend(v5, "br_preCacheBookmarkData:versionEtag:", v9, 0);
      v10 = *MEMORY[0x1E0C9B3C8];
      v24[0] = *MEMORY[0x1E0C998F8];
      v24[1] = v10;
      v11 = *MEMORY[0x1E0C9AD30];
      v24[2] = *MEMORY[0x1E0C9AC50];
      v24[3] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 67109888, v12, v5, a3);
      v13 = (NSData *)objc_claimAutoreleasedReturnValue();
      bookmarkData = self->_bookmarkData;
      self->_bookmarkData = v13;

LABEL_6:
      v15 = self->_bookmarkData != 0;
      self->_dataResolved = v15;
      goto LABEL_15;
    }
  }
  else
  {
    +[BRCPathToItemLookup lookupForRelativePath:](BRCPathToItemLookup, "lookupForRelativePath:", self->_targetRelpath);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    targetRelpath = self->_targetRelpath;
    objc_msgSend(v16, "clientZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serverZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bookmarkDataWithRelativePath:serverZone:", targetRelpath, v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_5;
  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    -[BRCBookmark _resolveDataWithError:].cold.1();

  self->_dataResolved = 0;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 2);
    v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (BOOL)resolveWithError:(id *)a3
{
  void *v6;
  NSObject *v7;

  if (self->_targetResolved)
  {
    return self->_dataResolved || -[BRCBookmark _resolveDataWithError:](self, "_resolveDataWithError:", a3);
  }
  else
  {
    if (!self->_dataResolved)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BRCBookmark resolveWithError:].cold.1();

    }
    return -[BRCBookmark _resolveTargetWithError:](self, "_resolveTargetWithError:", a3);
  }
}

- (id)writeUnderParent:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSData *v12;
  NSData *bookmarkData;
  char *v14;
  NSObject *p_super;
  NSObject *v16;
  NSData *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v23;
  const char *v24;
  unsigned int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  _BYTE value[32];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "physicalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v12 = 0;
  if (objc_msgSend(MEMORY[0x1E0C99E98], "writeBookmarkData:toURL:options:error:", self->_bookmarkData, v11, 0, a5))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "bookmarkDataWithContentsOfURL:error:", v11, a5);
    v12 = (NSData *)objc_claimAutoreleasedReturnValue();
    bookmarkData = self->_bookmarkData;
    self->_bookmarkData = v12;

    if (v12)
    {
      -[BRCBookmark _computeSignature:](self, "_computeSignature:", value);
      v14 = objc_retainAutorelease(v11);
      if (setxattr((const char *)objc_msgSend(v14, "fileSystemRepresentation"), "com.apple.clouddocs.security", value, 0x20uLL, 0, 0) < 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
        p_super = objc_claimAutoreleasedReturnValue();
        if (p_super)
        {
          brc_bread_crumbs();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
          {
            v23 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v27 = "-[BRCBookmark writeUnderParent:name:error:]";
            v28 = 2080;
            if (!a5)
              v23 = "(ignored by caller)";
            v29 = v23;
            v30 = 2112;
            v31 = p_super;
            v32 = 2112;
            v33 = v18;
            _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
        {
          p_super = objc_retainAutorelease(p_super);
          v12 = 0;
          *a5 = p_super;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        objc_msgSend(v8, "pathWithChildAtPath:", v9);
        v12 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ((-[NSData resolveMustExist:error:](v12, "resolveMustExist:error:", 1, &v25) & 1) != 0)
        {
          brc_bread_crumbs();
          p_super = objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = self->_bookmarkData;
            *(_DWORD *)buf = 138412802;
            v27 = (const char *)v17;
            v28 = 2112;
            v29 = v14;
            v30 = 2112;
            v31 = p_super;
            _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote %@ at %@%@", buf, 0x20u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v25);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            brc_bread_crumbs();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
            {
              v24 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v27 = "-[BRCBookmark writeUnderParent:name:error:]";
              v28 = 2080;
              if (!a5)
                v24 = "(ignored by caller)";
              v29 = v24;
              v30 = 2112;
              v31 = v16;
              v32 = 2112;
              v33 = v20;
              _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
          {
            v16 = objc_retainAutorelease(v16);
            *a5 = v16;
          }
          p_super = &v12->super;
          v12 = 0;
        }

      }
    }
  }

  return v12;
}

+ (id)createName
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR(".%@.alias"), v4);

  return v5;
}

+ (void)unlinkAliasAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__BRCBookmark_unlinkAliasAtPath___block_invoke;
  v7[3] = &unk_1E875EF40;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v6, "performOnOpenParentFileDescriptor:error:", v7, 0);

}

uint64_t __33__BRCBookmark_unlinkAliasAtPath___block_invoke(uint64_t a1, int a2)
{
  uint64_t *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BRCUnlinkAt(a2, v4, 0);

  if (v5 < 0)
  {
    v8 = *__error();
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v12 = *v3;
      v13 = *__error();
      v14 = 138413058;
      v15 = v12;
      v16 = 1024;
      v17 = v13;
      v18 = 1024;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to unlink bookmark at %@ %{errno}d %{errno}d%@", (uint8_t *)&v14, 0x22u);
    }

    *__error() = v8;
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __33__BRCBookmark_unlinkAliasAtPath___block_invoke_cold_1(v3, (uint64_t)v6, v7);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetRelpath, 0);
  objc_storeStrong((id *)&self->_targetServerZone, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)containsItemID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _targetResolved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRelpath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: not in a container%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithRelpath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Invalid signature for bookmark at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithRelpath:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] Not a bookmark at %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithRelpath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: path.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTarget:owningAppLibrary:path:session:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: not allowing an alias in the same app library as its target%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithTarget:owningAppLibrary:path:session:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: somebody doesn't understand what bookmarks are for!%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveTargetWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] the bookmark doesn't resolve: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveTargetWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: props[NSURLDocumentIdentifierKey] && [docID br_isEqualToNumber:props[NSURLDocumentIdentifierKey]]%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_resolveTargetWithError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] the path isn't within iCloud: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveTargetWithError:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] the path isn't within a container: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveTargetWithError:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1CBD43000, v0, v1, "[ERROR] bookmark is lacking path or document-id: %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)_resolveDataWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: cannot create bookmark data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resolveWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _dataResolved%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __33__BRCBookmark_unlinkAliasAtPath___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Unlinked bookmark at %@%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
