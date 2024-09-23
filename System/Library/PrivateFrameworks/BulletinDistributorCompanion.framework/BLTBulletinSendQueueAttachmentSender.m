@implementation BLTBulletinSendQueueAttachmentSender

- (BLTBulletinSendQueueAttachmentSender)init
{
  BLTBulletinSendQueueAttachmentSender *v2;
  uint64_t v3;
  NSMutableArray *urls;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLTBulletinSendQueueAttachmentSender;
  v2 = -[BLTBulletinSendQueueAttachmentSender init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    urls = v2->_urls;
    v2->_urls = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addAttachment:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  BLTBulletinSendQueueAttachmentInfo *v8;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    v8 = objc_alloc_init(BLTBulletinSendQueueAttachmentInfo);
    -[BLTBulletinSendQueueAttachmentInfo setUrl:](v8, "setUrl:", v7);

    -[BLTBulletinSendQueueAttachmentInfo setKey:](v8, "setKey:", v6);
    -[NSMutableArray addObject:](self->_urls, "addObject:", v8);

  }
}

- (BOOL)sendAttachmentsWithSender:(id)a3 timeout:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v23;
  NSMutableArray *obj;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[NSMutableArray count](self->_urls, "count");
  if (v11)
  {
    v23 = v11;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdsMetadataFileURLType:", 1);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = self->_urls;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v17, "key");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setIdsMetadataFileKey:", v18);

          objc_msgSend(v17, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v12, "copy");
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __85__BLTBulletinSendQueueAttachmentSender_sendAttachmentsWithSender_timeout_completion___block_invoke;
          v25[3] = &unk_24D762330;
          v26 = v10;
          objc_msgSend(v8, "sendFileURL:withTimeout:extraMetadata:responseHandlers:didSend:didQueue:", v19, v9, v20, 0, v25, 0);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v14);
    }

    -[NSMutableArray removeAllObjects](self->_urls, "removeAllObjects");
    v11 = v23;
  }
  v21 = v11 != 0;

  return v21;
}

uint64_t __85__BLTBulletinSendQueueAttachmentSender_sendAttachmentsWithSender_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
