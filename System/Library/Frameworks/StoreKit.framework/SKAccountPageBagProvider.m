@implementation SKAccountPageBagProvider

+ (id)sharedBag
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SKAccountPageBagProvider_sharedBag__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBag_onceToken != -1)
    dispatch_once(&sharedBag_onceToken, block);
  return (id)sharedBag__shared;
}

void __37__SKAccountPageBagProvider_sharedBag__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  char v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v0 = (void *)getISLoadURLBagOperationClass_softClass;
  v23 = getISLoadURLBagOperationClass_softClass;
  if (!getISLoadURLBagOperationClass_softClass)
  {
    *(_QWORD *)v24 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v24[8] = 3221225472;
    *(_QWORD *)&v24[16] = __getISLoadURLBagOperationClass_block_invoke;
    v25 = &unk_1E5B26828;
    v26 = &v20;
    __getISLoadURLBagOperationClass_block_invoke((uint64_t)v24);
    v0 = (void *)v21[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v20, 8);
  v2 = objc_alloc_init(v1);
  objc_msgSend(v2, "start");
  v3 = objc_msgSend(v2, "success");
  objc_msgSend(v2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 0;
  else
    v5 = v3;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharediTunesStoreConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v8 &= 2u;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)v24 = 138543618;
      *(_QWORD *)&v24[4] = v10;
      *(_WORD *)&v24[12] = 2114;
      *(_QWORD *)&v24[14] = v4;
      v11 = v10;
      LODWORD(v19) = 22;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, v24, v19, v20);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_18;
  }
LABEL_19:
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v13 = (void *)getISAMSBagShimClass_softClass;
  v23 = getISAMSBagShimClass_softClass;
  if (!getISAMSBagShimClass_softClass)
  {
    *(_QWORD *)v24 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v24[8] = 3221225472;
    *(_QWORD *)&v24[16] = __getISAMSBagShimClass_block_invoke;
    v25 = &unk_1E5B26828;
    v26 = &v20;
    __getISAMSBagShimClass_block_invoke((uint64_t)v24);
    v13 = (void *)v21[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v20, 8);
  v15 = [v14 alloc];
  objc_msgSend(v2, "URLBag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "initWithURLBag:", v16);
  v18 = (void *)sharedBag__shared;
  sharedBag__shared = v17;

}

@end
