@implementation AMPAppleCardArtwork

+ (id)cardIcon
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  __int128 *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  Class (*v29)(uint64_t);
  void *v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (cardIcon_onceToken != -1)
    dispatch_once(&cardIcon_onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (v4)
  {
    LODWORD(v28) = 138543362;
    *(_QWORD *)((char *)&v28 + 4) = objc_opt_class();
    v6 = *(id *)((char *)&v28 + 4);
    LODWORD(v23) = 12;
    v22 = &v28;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, &v28, v23);
      v8 = (__int128 *)objc_claimAutoreleasedReturnValue();
      free(v7);
      v22 = v8;
      SSFileLog();

    }
  }
  else
  {

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v9 = (void *)getPKVirtualCardClass_softClass;
  v27 = getPKVirtualCardClass_softClass;
  if (!getPKVirtualCardClass_softClass)
  {
    *(_QWORD *)&v28 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v28 + 1) = 3221225472;
    v29 = __getPKVirtualCardClass_block_invoke;
    v30 = &unk_24F966CF8;
    v31 = &v24;
    __getPKVirtualCardClass_block_invoke((uint64_t)&v28);
    v9 = (void *)v25[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v24, 8);
  v11 = objc_alloc_init(v10);
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog", v22);
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      LODWORD(v28) = 138543362;
      *(_QWORD *)((char *)&v28 + 4) = v18;
      v19 = v18;
      LODWORD(v23) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_29:

        v13 = 0;
        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v28, v23, v24);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog();
    }

    goto LABEL_29;
  }
  objc_msgSend(v11, "cardIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v13;
}

void __31__AMPAppleCardArtwork_cardIcon__block_invoke()
{
  void *v0;

  if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
  {
    PassKitUIFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitUIFoundationLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

+ (id)cardIconString
{
  UIImage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "cardIcon");
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v15) = 138543362;
      *(_QWORD *)((char *)&v15 + 4) = objc_opt_class();
      v11 = *(id *)((char *)&v15 + 4);
      LODWORD(v14) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_14:

        v6 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v15, v14, v15);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

    goto LABEL_14;
  }
  objc_msgSend(v3, "base64EncodedStringWithOptions:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("data:image/png;base64,%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v6;
}

@end
