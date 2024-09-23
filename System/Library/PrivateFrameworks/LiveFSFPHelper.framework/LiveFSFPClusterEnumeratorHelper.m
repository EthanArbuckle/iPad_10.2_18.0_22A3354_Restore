@implementation LiveFSFPClusterEnumeratorHelper

- (LiveFSFPClusterEnumeratorHelper)initWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v7;
  LiveFSFPClusterEnumeratorHelper *v8;
  LiveFSFPClusterEnumeratorHelper *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSFPClusterEnumeratorHelper;
  v8 = -[LiveFSFPClusterEnumeratorHelper init](&v11, sel_init);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->ext, a4);

  return v9;
}

+ (id)newWithEnumeratedItem:(id)a3 extension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC8238]);
  v11 = (void *)*MEMORY[0x24BDC8228];
  if (v10)
  {
    v12 = v11;

    v8 = v12;
LABEL_4:
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEnumeratedItem:extension:error:", v8, v9, a5);
    goto LABEL_5;
  }
  if ((objc_msgSend(v8, "isEqualToString:", v11) & 1) != 0)
    goto LABEL_4;
  if (a5)
  {
    +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:", 22);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_5:

  return v13;
}

- (void)invalidate
{
  NSObject *v3;
  LiveFSFPClusterEnumeratorHelper *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  livefs_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[LiveFSFPClusterEnumeratorHelper invalidate]";
    _os_log_impl(&dword_21F8A5000, v3, OS_LOG_TYPE_INFO, "%s: marking state as DEAD", (uint8_t *)&v5, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_state = 3;
  objc_sync_exit(v4);

}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v5;
  void *v6;
  LiveFSFPExtensionHelper *ext;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  ext = self->ext;
  v15 = 0;
  -[LiveFSFPExtensionHelper clusterDomainItemsOrError:](ext, "clusterDomainItemsOrError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  livefs_std_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s: err (%@)", buf, 0x16u);
    }

    objc_msgSend(v5, "finishEnumeratingWithError:", v9);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21F8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s: clusterDomainItems (%@)", buf, 0x16u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __76__LiveFSFPClusterEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke;
    v13[3] = &unk_24E46BA10;
    v13[4] = self;
    v12 = v6;
    v14 = v12;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
    objc_msgSend(v5, "didEnumerateItems:", v12);
    objc_msgSend(v5, "finishEnumeratingUpToPage:", 0);

  }
}

void __76__LiveFSFPClusterEnumeratorHelper_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = +[LiveFSFPClusterItem newWithName:extension:](LiveFSFPClusterItem, "newWithName:extension:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  livefs_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[LiveFSFPClusterEnumeratorHelper enumerateItemsForObserver:startingAtPage:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_21F8A5000, v5, OS_LOG_TYPE_DEFAULT, "%s: clusterItem(%@) LiveFSFPClusterItem (%@)", (uint8_t *)&v6, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return self->_enumeratedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

@end
