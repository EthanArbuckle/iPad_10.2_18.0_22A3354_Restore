@implementation MTRDownloads

- (MTRDownloads)init
{
  MTRDownloads *v2;
  NSMutableArray *v3;
  NSMutableArray *downloads;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRDownloads;
  v2 = -[MTRDownloads init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    downloads = v2->_downloads;
    v2->_downloads = v3;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *downloads;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  int v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  LODWORD(v16) = 172;
  *((_QWORD *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/"
                          "MTRDiagnosticLogsDownloader.mm";
  v17 = 317;
  sub_2340017F0((uint64_t)MTRError, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_downloads;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend_failure_(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v9++), v6, (uint64_t)v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v12, v18, 16);
    }
    while (v7);
  }

  downloads = self->_downloads;
  self->_downloads = 0;

  v11.receiver = self;
  v11.super_class = (Class)MTRDownloads;
  -[MTRDownloads dealloc](&v11, sel_dealloc);
}

- (id)get:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  const char *v12;
  const char *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_downloads;
  v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend_matches_fabricIndex_nodeID_(v17, v13, (uint64_t)v8, v9, v10, (_QWORD)v19) & 1) != 0)
        {
          v14 = v17;
          goto LABEL_11;
        }
      }
      v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v19, v23, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v14;
}

- (id)add:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  MTRDownload *v19;
  const char *v20;
  const char *v21;
  void *v22;
  id v23;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 342);
  v19 = [MTRDownload alloc];
  v22 = (void *)objc_msgSend_initWithType_fabricIndex_nodeID_queue_completion_done_(v19, v20, a3, v14, v15, v16, v17, v18);
  if (v22)
  {
    objc_msgSend_addObject_(self->_downloads, v21, (uint64_t)v22);
    v23 = v22;
  }

  return v22;
}

- (void)remove:(id)a3
{
  const char *v4;
  id v5;

  v5 = a3;
  sub_2341B1F64("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/MTRDiagnosticLogsDownloader.mm", 353);
  objc_msgSend_removeObject_(self->_downloads, v4, (uint64_t)v5);

}

- (NSMutableArray)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_downloads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
}

@end
