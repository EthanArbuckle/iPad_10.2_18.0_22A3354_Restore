@implementation _ML3MultiUserDaemonMusicLibraryResourcesManager

- (_ML3MultiUserDaemonMusicLibraryResourcesManager)initWithAccountInfo:(id)a3 accountChangeObserver:(id)a4
{
  id v7;
  id v8;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *calloutQueue;
  NSOperationQueue *v14;
  NSOperationQueue *accountChangeOperationQueue;
  void *v16;
  uint64_t v17;
  NSString *currentActiveAccountDSID;
  uint64_t v19;
  ACAccountStore *accountStore;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  v9 = -[_ML3BaseMusicLibraryResourcesManager init](&v22, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("com.apple.medialibraryd.multi-user-deamon-resources-serial-queue", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.medialibraryd.multi-user-deamon-resources-callout-queue", MEMORY[0x1E0C80D50]);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v12;

    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    accountChangeOperationQueue = v9->_accountChangeOperationQueue;
    v9->_accountChangeOperationQueue = v14;

    -[NSOperationQueue setName:](v9->_accountChangeOperationQueue, "setName:", CFSTR("com.apple.medialibraryd.multi-user-deamon-resources-account-change-queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_accountChangeOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v9->_accountChangeOperationQueue, "setQualityOfService:", 25);
    objc_storeStrong((id *)&v9->_accountInfo, a3);
    objc_storeWeak((id *)&v9->_accountChangeObserver, v8);
    -[_MSVAccountInformationProviding accountDSID](v9->_accountInfo, "accountDSID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    currentActiveAccountDSID = v9->_currentActiveAccountDSID;
    v9->_currentActiveAccountDSID = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v19 = objc_claimAutoreleasedReturnValue();
    accountStore = v9->_accountStore;
    v9->_accountStore = (ACAccountStore *)v19;

    -[_ML3MultiUserDaemonMusicLibraryResourcesManager _setupNotifications](v9, "_setupNotifications");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _tearDownNotifications](self, "_tearDownNotifications");
  v3.receiver = self;
  v3.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager dealloc](&v3, sel_dealloc);
}

- (id)musicAssetsContainerPath
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  ldiv_t v7;
  uint64_t v8;
  char *v9;
  const UInt8 *v10;
  unsigned __int8 *v11;
  char *v12;
  char *v13;
  uint64_t m;
  unsigned int v15;
  char *v16;
  id v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  unsigned __int8 *v24;
  char *v25;
  char *v26;
  uint64_t j;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t quot;
  lldiv_t v33;
  uint64_t v34;
  CFStringRef v35;
  unsigned __int8 *v36;
  char *v37;
  char *v38;
  uint64_t k;
  unsigned int v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _BYTE *v44;
  unint64_t v45;
  unsigned __int8 *v46;
  char *v47;
  char *v48;
  uint64_t i;
  unsigned int v50;
  char *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  void *v57;
  void *v59;
  void *v60;
  objc_super v61;
  _BYTE buf[40];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[72];
  _OWORD v75[4];
  uint64_t v76;
  _QWORD v77[3];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _blockingCurrentActiveAccountDSID](self, "_blockingCurrentActiveAccountDSID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  memset(&buf[8], 0, 32);
  *(_QWORD *)buf = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)&buf[8]);
  v4 = objc_retainAutorelease(v3);
  CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], (const void *)objc_msgSend(v4, "UTF8String"), objc_msgSend(v4, "length"));

  memset(&v74[8], 0, 64);
  *(_QWORD *)v74 = 4001;
  CC_SHA1_Final(&v74[8], (CC_SHA1_CTX *)&buf[8]);
  v75[0] = *(_OWORD *)v74;
  v75[1] = *(_OWORD *)&v74[16];
  v75[2] = *(_OWORD *)&v74[32];
  v75[3] = *(_OWORD *)&v74[48];
  v76 = *(_QWORD *)&v74[64];
  if (*(uint64_t *)v74 > 3999)
  {
    if (*(uint64_t *)v74 > 4255)
    {
      if (*(_QWORD *)v74 == 4256)
      {
        v46 = (unsigned __int8 *)v75 + 8;
        v47 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v48 = v47;
        for (i = 0; i != 64; i += 2)
        {
          v50 = *v46++;
          v51 = &v47[i];
          *v51 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v50 >> 4];
          v51[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v50 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = v48;
        v19 = 64;
      }
      else
      {
        if (*(_QWORD *)v74 != 4512)
          goto LABEL_52;
        v24 = (unsigned __int8 *)v75 + 8;
        v25 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v26 = v25;
        for (j = 0; j != 128; j += 2)
        {
          v28 = *v24++;
          v29 = &v25[j];
          *v29 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v28 >> 4];
          v29[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v28 & 0xF];
        }
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = v26;
        v19 = 128;
      }
    }
    else if (*(_QWORD *)v74 == 4000)
    {
      v36 = (unsigned __int8 *)v75 + 8;
      v37 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v38 = v37;
      for (k = 0; k != 32; k += 2)
      {
        v40 = *v36++;
        v41 = &v37[k];
        *v41 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v40 >> 4];
        v41[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v40 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v38;
      v19 = 32;
    }
    else
    {
      if (*(_QWORD *)v74 != 4001)
        goto LABEL_52;
      v11 = (unsigned __int8 *)v75 + 8;
      v12 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v13 = v12;
      for (m = 0; m != 40; m += 2)
      {
        v15 = *v11++;
        v16 = &v12[m];
        *v16 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v15 >> 4];
        v16[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v15 & 0xF];
      }
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v13;
      v19 = 40;
    }
LABEL_45:
    v35 = (CFStringRef)objc_msgSend(v17, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v18, v19, 4, 1);
    goto LABEL_46;
  }
  if (*(uint64_t *)v74 > 2999)
  {
    if (*(_QWORD *)v74 == 3000)
    {
      LODWORD(v77[0]) = bswap32(DWORD2(v75[0]));
      v42 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v43 = 0;
      v44 = v42 + 1;
      do
      {
        v45 = *((unsigned __int8 *)v77 + v43);
        *(v44 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v45 >> 4];
        *v44 = MSVFastHexStringFromBytes_hexCharacters_22377[v45 & 0xF];
        v44 += 2;
        ++v43;
      }
      while (v43 != 4);
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v42;
      v19 = 8;
    }
    else
    {
      if (*(_QWORD *)v74 != 3001)
        goto LABEL_52;
      v77[0] = bswap64(*((unint64_t *)&v75[0] + 1));
      v20 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v21 = 0;
      v22 = v20 + 1;
      do
      {
        v23 = *((unsigned __int8 *)v77 + v21);
        *(v22 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v23 >> 4];
        *v22 = MSVFastHexStringFromBytes_hexCharacters_22377[v23 & 0xF];
        v22 += 2;
        ++v21;
      }
      while (v21 != 8);
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      v18 = v20;
      v19 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v74 == 1000)
  {
    v30 = *((_QWORD *)&v75[0] + 1);
    v31 = (char *)&v78 + 1;
    quot = *((_QWORD *)&v75[0] + 1);
    do
    {
      v33 = lldiv(quot, 10);
      quot = v33.quot;
      if (v33.rem >= 0)
        LOBYTE(v34) = v33.rem;
      else
        v34 = -v33.rem;
      *(v31 - 2) = v34 + 48;
      v10 = (const UInt8 *)(v31 - 2);
      --v31;
    }
    while (v33.quot);
    if (v30 < 0)
    {
      *(v31 - 2) = 45;
      v10 = (const UInt8 *)(v31 - 2);
    }
    v9 = (char *)((char *)&v78 - (char *)v10);
    goto LABEL_35;
  }
  if (*(_QWORD *)v74 == 2000)
  {
    v5 = DWORD2(v75[0]);
    v6 = &v78;
    do
    {
      v7 = ldiv(v5, 10);
      v5 = v7.quot;
      if (v7.rem >= 0)
        LOBYTE(v8) = v7.rem;
      else
        v8 = -v7.rem;
      *((_BYTE *)v6 - 1) = v8 + 48;
      v6 = (uint64_t *)((char *)v6 - 1);
    }
    while (v7.quot);
    v9 = (char *)((char *)&v78 - (char *)v6);
    v10 = (const UInt8 *)v6;
LABEL_35:
    v35 = CFStringCreateWithBytes(0, v10, (CFIndex)v9, 0x8000100u, 0);
LABEL_46:
    v52 = (__CFString *)v35;
    goto LABEL_47;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

  v52 = &stru_1E5B66908;
LABEL_47:

  v61.receiver = self;
  v61.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  -[_ML3BaseMusicLibraryResourcesManager musicAssetsContainerPath](&v61, sel_musicAssetsContainerPath);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "lastPathComponent");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "isEqualToString:", CFSTR("Music"));

  if ((v55 & 1) == 0)
  {
    v56 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v53;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v52;
      _os_log_impl(&dword_1AC149000, v56, OS_LOG_TYPE_FAULT, "%{public}@ - Unexpected musicAssetsContainerPath from base implementation. path=%{private}@ hashedDSID=%{public}@", buf, 0x20u);
    }

  }
  objc_msgSend(v53, "stringByAppendingPathComponent:", v52);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)libraryContainerPath
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _blockingCurrentActiveAccountDSID](self, "_blockingCurrentActiveAccountDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _libraryContainerPathForDSID:](self, "_libraryContainerPathForDSID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ - Retrieved libraryContainerPath %{public}@", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)_blockingCurrentActiveAccountDSID
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint8_t v12[4];
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v13;
  __int16 v14;
  void *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - BLOCKING - Retrieving libraryContainerPath on serial queue: %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__17006;
  v18 = __Block_byref_object_dispose__17007;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84___ML3MultiUserDaemonMusicLibraryResourcesManager__blockingCurrentActiveAccountDSID__block_invoke;
  v11[3] = &unk_1E5B65E48;
  v11[4] = self;
  v11[5] = buf;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeOperationQueue](self, "accountChangeOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v5);

  objc_msgSend(v5, "waitUntilFinished");
  v7 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v12 = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1AC149000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ - UNBLOCKED - Retrieved libraryContainerPath on serial queue: %{public}@", v12, 0x16u);

  }
  v9 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (NSString)currentActiveAccountDSID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__17006;
  v11 = __Block_byref_object_dispose__17007;
  v12 = 0;
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75___ML3MultiUserDaemonMusicLibraryResourcesManager_currentActiveAccountDSID__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setCurrentActiveAccountDSID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79___ML3MultiUserDaemonMusicLibraryResourcesManager_setCurrentActiveAccountDSID___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)_libraryContainerPathForDSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  ldiv_t v8;
  uint64_t v9;
  char *v10;
  const UInt8 *v11;
  unsigned __int8 *v12;
  char *v13;
  char *v14;
  uint64_t m;
  unsigned int v16;
  char *v17;
  id v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  unint64_t v24;
  unsigned __int8 *v25;
  char *v26;
  char *v27;
  uint64_t j;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t quot;
  lldiv_t v34;
  uint64_t v35;
  CFStringRef v36;
  unsigned __int8 *v37;
  char *v38;
  char *v39;
  uint64_t k;
  unsigned int v41;
  char *v42;
  char *v43;
  uint64_t v44;
  _BYTE *v45;
  unint64_t v46;
  unsigned __int8 *v47;
  char *v48;
  char *v49;
  uint64_t i;
  unsigned int v51;
  char *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  objc_super v59;
  uint64_t v60;
  _BYTE v61[208];
  _BYTE v62[72];
  _OWORD v63[4];
  uint64_t v64;
  _QWORD v65[3];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v61, 0, sizeof(v61));
  v60 = 4001;
  CC_SHA1_Init((CC_SHA1_CTX *)v61);
  v5 = objc_retainAutorelease(v4);
  CC_SHA1_Update((CC_SHA1_CTX *)v61, (const void *)objc_msgSend(v5, "UTF8String"), objc_msgSend(v5, "length"));

  memset(&v62[8], 0, 64);
  *(_QWORD *)v62 = 4001;
  CC_SHA1_Final(&v62[8], (CC_SHA1_CTX *)v61);
  v63[0] = *(_OWORD *)v62;
  v63[1] = *(_OWORD *)&v62[16];
  v63[2] = *(_OWORD *)&v62[32];
  v63[3] = *(_OWORD *)&v62[48];
  v64 = *(_QWORD *)&v62[64];
  if (*(uint64_t *)v62 > 3999)
  {
    if (*(uint64_t *)v62 > 4255)
    {
      if (*(_QWORD *)v62 == 4256)
      {
        v47 = (unsigned __int8 *)v63 + 8;
        v48 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v49 = v48;
        for (i = 0; i != 64; i += 2)
        {
          v51 = *v47++;
          v52 = &v48[i];
          *v52 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v51 >> 4];
          v52[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v51 & 0xF];
        }
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        v19 = v49;
        v20 = 64;
      }
      else
      {
        if (*(_QWORD *)v62 != 4512)
          goto LABEL_48;
        v25 = (unsigned __int8 *)v63 + 8;
        v26 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v27 = v26;
        for (j = 0; j != 128; j += 2)
        {
          v29 = *v25++;
          v30 = &v26[j];
          *v30 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v29 >> 4];
          v30[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v29 & 0xF];
        }
        v18 = objc_alloc(MEMORY[0x1E0CB3940]);
        v19 = v27;
        v20 = 128;
      }
    }
    else if (*(_QWORD *)v62 == 4000)
    {
      v37 = (unsigned __int8 *)v63 + 8;
      v38 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v39 = v38;
      for (k = 0; k != 32; k += 2)
      {
        v41 = *v37++;
        v42 = &v38[k];
        *v42 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v41 >> 4];
        v42[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v41 & 0xF];
      }
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v39;
      v20 = 32;
    }
    else
    {
      if (*(_QWORD *)v62 != 4001)
        goto LABEL_48;
      v12 = (unsigned __int8 *)v63 + 8;
      v13 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v14 = v13;
      for (m = 0; m != 40; m += 2)
      {
        v16 = *v12++;
        v17 = &v13[m];
        *v17 = MSVFastHexStringFromBytes_hexCharacters_22377[(unint64_t)v16 >> 4];
        v17[1] = MSVFastHexStringFromBytes_hexCharacters_22377[v16 & 0xF];
      }
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v14;
      v20 = 40;
    }
LABEL_45:
    v36 = (CFStringRef)objc_msgSend(v18, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v19, v20, 4, 1);
    goto LABEL_46;
  }
  if (*(uint64_t *)v62 > 2999)
  {
    if (*(_QWORD *)v62 == 3000)
    {
      LODWORD(v65[0]) = bswap32(DWORD2(v63[0]));
      v43 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v44 = 0;
      v45 = v43 + 1;
      do
      {
        v46 = *((unsigned __int8 *)v65 + v44);
        *(v45 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v46 >> 4];
        *v45 = MSVFastHexStringFromBytes_hexCharacters_22377[v46 & 0xF];
        v45 += 2;
        ++v44;
      }
      while (v44 != 4);
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v43;
      v20 = 8;
    }
    else
    {
      if (*(_QWORD *)v62 != 3001)
        goto LABEL_48;
      v65[0] = bswap64(*((unint64_t *)&v63[0] + 1));
      v21 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v22 = 0;
      v23 = v21 + 1;
      do
      {
        v24 = *((unsigned __int8 *)v65 + v22);
        *(v23 - 1) = MSVFastHexStringFromBytes_hexCharacters_22377[v24 >> 4];
        *v23 = MSVFastHexStringFromBytes_hexCharacters_22377[v24 & 0xF];
        v23 += 2;
        ++v22;
      }
      while (v22 != 8);
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = v21;
      v20 = 16;
    }
    goto LABEL_45;
  }
  if (*(_QWORD *)v62 == 1000)
  {
    v31 = *((_QWORD *)&v63[0] + 1);
    v32 = (char *)&v66 + 1;
    quot = *((_QWORD *)&v63[0] + 1);
    do
    {
      v34 = lldiv(quot, 10);
      quot = v34.quot;
      if (v34.rem >= 0)
        LOBYTE(v35) = v34.rem;
      else
        v35 = -v34.rem;
      *(v32 - 2) = v35 + 48;
      v11 = (const UInt8 *)(v32 - 2);
      --v32;
    }
    while (v34.quot);
    if (v31 < 0)
    {
      *(v32 - 2) = 45;
      v11 = (const UInt8 *)(v32 - 2);
    }
    v10 = (char *)((char *)&v66 - (char *)v11);
    goto LABEL_35;
  }
  if (*(_QWORD *)v62 != 2000)
  {
LABEL_48:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v53 = &stru_1E5B66908;
    goto LABEL_47;
  }
  v6 = DWORD2(v63[0]);
  v7 = &v66;
  do
  {
    v8 = ldiv(v6, 10);
    v6 = v8.quot;
    if (v8.rem >= 0)
      LOBYTE(v9) = v8.rem;
    else
      v9 = -v8.rem;
    *((_BYTE *)v7 - 1) = v9 + 48;
    v7 = (uint64_t *)((char *)v7 - 1);
  }
  while (v8.quot);
  v10 = (char *)((char *)&v66 - (char *)v7);
  v11 = (const UInt8 *)v7;
LABEL_35:
  v36 = CFStringCreateWithBytes(0, v11, (CFIndex)v10, 0x8000100u, 0);
LABEL_46:
  v53 = (__CFString *)v36;
LABEL_47:

  v59.receiver = self;
  v59.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  -[_ML3BaseMusicLibraryResourcesManager libraryContainerPath](&v59, sel_libraryContainerPath);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "stringByAppendingPathComponent:", v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (void)_setupNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accountStoreDidChangeNotification_, *MEMORY[0x1E0C8F1C0], 0);

}

- (void)_tearDownNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)_accountStoreDidChangeNotification:(id)a3
{
  NSObject *v4;
  int v5;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - Received account change notification", (uint8_t *)&v5, 0xCu);
  }

  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _processAccountChangeNotification](self, "_processAccountChangeNotification");
}

- (void)_processAccountChangeNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  _ML3MultiUserDaemonAccountChangeOperation *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountInfo](self, "accountInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ML3MultiUserDaemonMusicLibraryResourcesManager currentActiveAccountDSID](self, "currentActiveAccountDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v7)
    {
      v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v18 = 138543362;
        v19 = self;
        v9 = "%{public}@ - User was logged-in and is still logged-in with the same dsid: nothing to to";
LABEL_11:
        _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v18, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
LABEL_6:
    v10 = [_ML3MultiUserDaemonAccountChangeOperation alloc];
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager currentActiveAccountDSID](self, "currentActiveAccountDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeObserver](self, "accountChangeObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_ML3MultiUserDaemonAccountChangeOperation initWithInitialDSID:finalDSID:accountChangeObserver:](v10, "initWithInitialDSID:finalDSID:accountChangeObserver:", v11, v4, v12);

    -[NSObject setDelegate:](v8, "setDelegate:", self);
    v13 = os_log_create("com.apple.amp.medialibrary", "MultiUser_Oversize");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[_ML3MultiUserDaemonMusicLibraryResourcesManager currentActiveAccountDSID](self, "currentActiveAccountDSID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeOperationQueue](self, "accountChangeOperationQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "operations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544387;
      v19 = self;
      v20 = 2113;
      v21 = v14;
      v22 = 2113;
      v23 = v4;
      v24 = 2048;
      v25 = v8;
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - current dsid: %{private}@ - new dsid: %{private}@ - Enqueueing change operation=%p, all operations on queue=%{public}@", (uint8_t *)&v18, 0x34u);

    }
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager accountChangeOperationQueue](self, "accountChangeOperationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOperation:", v8);

    goto LABEL_12;
  }

  if (v6)
    goto LABEL_6;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543362;
    v19 = self;
    v9 = "%{public}@ - User was logged-out and is still logged-out: nothing to to";
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_notifyClients:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager calloutQueue](self, "calloutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___ML3MultiUserDaemonMusicLibraryResourcesManager__notifyClients___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)shouldExecuteAccountChangeOperation:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  *a4 = &stru_1E5B66908;
  v6 = a3;
  objc_msgSend(v6, "finalDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager currentActiveAccountDSID](self, "currentActiveAccountDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "finalDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v10, "stringWithFormat:", CFSTR("final and current dsid are identical: %@"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ML3MultiUserDaemonMusicLibraryResourcesManager currentActiveAccountDSID](self, "currentActiveAccountDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("final (%@) and current (%@) dsid are different"), v11, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 ^ 1;
}

- (id)databasePathForDSID:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  -[_ML3MultiUserDaemonMusicLibraryResourcesManager _libraryContainerPathForDSID:](self, "_libraryContainerPathForDSID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_ML3MultiUserDaemonMusicLibraryResourcesManager;
  -[_ML3BaseMusicLibraryResourcesManager pathForResourceFileOrFolder:basePath:relativeToBase:createParentFolderIfNecessary:](&v7, sel_pathForResourceFileOrFolder_basePath_relativeToBase_createParentFolderIfNecessary_, 15, v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)accountChangeOperationWillStartPerformingDatabasePathChange:(id)a3 newDatabasePath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  _ML3MultiUserDaemonMusicLibraryResourcesManager *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "finalDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543619;
    v12 = self;
    v13 = 2113;
    v14 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - accountChangeOperationWillStartPerformingDatabasePathChange - final DSID: %{private}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v6, "finalDSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ML3MultiUserDaemonMusicLibraryResourcesManager setCurrentActiveAccountDSID:](self, "setCurrentActiveAccountDSID:", v10);

  +[ML3MusicLibrary setAutoupdatingSharedLibraryPath:](ML3MusicLibrary, "setAutoupdatingSharedLibraryPath:", v7);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (NSOperationQueue)accountChangeOperationQueue
{
  return self->_accountChangeOperationQueue;
}

- (void)setAccountChangeOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, a3);
}

- (_MSVAccountInformationProviding)accountInfo
{
  return self->_accountInfo;
}

- (void)setAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_accountInfo, a3);
}

- (MLMediaLibraryAccountChangeObserver)accountChangeObserver
{
  return (MLMediaLibraryAccountChangeObserver *)objc_loadWeakRetained((id *)&self->_accountChangeObserver);
}

- (void)setAccountChangeObserver:(id)a3
{
  objc_storeWeak((id *)&self->_accountChangeObserver, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_destroyWeak((id *)&self->_accountChangeObserver);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_accountChangeOperationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_currentActiveAccountDSID, 0);
}

@end
