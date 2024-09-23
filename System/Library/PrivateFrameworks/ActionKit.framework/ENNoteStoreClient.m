@implementation ENNoteStoreClient

+ (id)noteStoreClientWithUrl:(id)a3 authenticationToken:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setCachedNoteStoreUrl:", v7);

  objc_msgSend(v8, "setCachedAuthenticationToken:", v6);
  return v8;
}

- (void)setUploadProgressHandler:(id)a3
{
  void *v4;
  id uploadProgressHandler;

  v4 = _Block_copy(a3);
  uploadProgressHandler = self->_uploadProgressHandler;
  self->_uploadProgressHandler = v4;

  -[ENNoteStoreClient updateProgressHandlers](self, "updateProgressHandlers");
}

- (void)setDownloadProgressHandler:(id)a3
{
  void *v4;
  id downloadProgressHandler;

  v4 = _Block_copy(a3);
  downloadProgressHandler = self->_downloadProgressHandler;
  self->_downloadProgressHandler = v4;

  -[ENNoteStoreClient updateProgressHandlers](self, "updateProgressHandlers");
}

- (void)updateProgressHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  EDAMNoteStoreClient *client;
  id v7;
  void *v8;
  void *v9;
  EDAMNoteStoreClient *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  if (self->_client)
  {
    -[ENNoteStoreClient uploadProgressHandler](self, "uploadProgressHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = MEMORY[0x24BDAC760];
    if (v3)
    {
      -[ENNoteStoreClient uploadProgressHandler](self, "uploadProgressHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      client = self->_client;
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __43__ENNoteStoreClient_updateProgressHandlers__block_invoke;
      v14[3] = &unk_24F8B8450;
      v15 = v5;
      v7 = v5;
      -[EDAMNoteStoreClient setUploadProgressBlock:](client, "setUploadProgressBlock:", v14);

    }
    else
    {
      -[EDAMNoteStoreClient setUploadProgressBlock:](self->_client, "setUploadProgressBlock:", 0);
    }
    -[ENNoteStoreClient downloadProgressHandler](self, "downloadProgressHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ENNoteStoreClient downloadProgressHandler](self, "downloadProgressHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_client;
      v12[0] = v4;
      v12[1] = 3221225472;
      v12[2] = __43__ENNoteStoreClient_updateProgressHandlers__block_invoke_2;
      v12[3] = &unk_24F8B8450;
      v13 = v9;
      v11 = v9;
      -[EDAMNoteStoreClient setDownloadProgressBlock:](v10, "setDownloadProgressBlock:", v12);

    }
    else
    {
      -[EDAMNoteStoreClient setDownloadProgressBlock:](self->_client, "setDownloadProgressBlock:", 0);
    }
  }
}

- (EDAMNoteStoreClient)client
{
  EDAMNoteStoreClient *client;
  void *v4;
  void *v5;
  ENTHTTPClient *v6;
  ENTBinaryProtocol *v7;
  EDAMNoteStoreClient *v8;
  EDAMNoteStoreClient *v9;

  client = self->_client;
  if (!client)
  {
    -[ENNoteStoreClient noteStoreUrl](self, "noteStoreUrl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ENTHTTPClient initWithURL:]([ENTHTTPClient alloc], "initWithURL:", v5);
    v7 = -[ENTBinaryProtocol initWithTransport:]([ENTBinaryProtocol alloc], "initWithTransport:", v6);
    v8 = -[EDAMNoteStoreClient initWithProtocol:]([EDAMNoteStoreClient alloc], "initWithProtocol:", v7);
    v9 = self->_client;
    self->_client = v8;

    -[ENNoteStoreClient updateProgressHandlers](self, "updateProgressHandlers");
    client = self->_client;
  }
  return client;
}

- (id)authenticateToSharedNotebookWithGlobalId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ENNoteStoreClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENNoteStoreClient authenticationToken](self, "authenticationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticateToSharedNotebook:authenticationToken:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)fetchSyncStateWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__ENNoteStoreClient_fetchSyncStateWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)fetchSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 completion:(id)a6
{
  _QWORD v6[5];
  int v7;
  int v8;
  BOOL v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__ENNoteStoreClient_fetchSyncChunkAfterUSN_maxEntries_fullSyncOnly_completion___block_invoke;
  v6[3] = &unk_24F8B84A0;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v6, a6);
}

- (void)fetchFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int v14;
  int v15;

  v10 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__ENNoteStoreClient_fetchFilteredSyncChunkAfterUSN_maxEntries_filter_completion___block_invoke;
  v12[3] = &unk_24F8B84C8;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a6);

}

- (void)fetchSyncStateForLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__ENNoteStoreClient_fetchSyncStateForLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchSyncChunkForLinkedNotebook:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int v16;
  int v17;
  BOOL v18;

  v12 = a3;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__ENNoteStoreClient_fetchSyncChunkForLinkedNotebook_afterUSN_maxEntries_fullSyncOnly_completion___block_invoke;
  v14[3] = &unk_24F8B8518;
  v14[4] = self;
  v15 = v12;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v13 = v12;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v14, a7);

}

- (void)listNotebooksWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__ENNoteStoreClient_listNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)fetchNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_fetchNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchDefaultNotebookWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__ENNoteStoreClient_fetchDefaultNotebookWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)createNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  +[ENSession sharedSession](ENSession, "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "listNotebooks_cleanCache");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__ENNoteStoreClient_createNotebook_completion___block_invoke;
  v10[3] = &unk_24F8B84F0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v10, v7);

}

- (void)updateNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__ENNoteStoreClient_updateNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)expungeNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_expungeNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)listTagsWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__ENNoteStoreClient_listTagsWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)listTagsInNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ENNoteStoreClient_listTagsInNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchTagWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ENNoteStoreClient_fetchTagWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ENNoteStoreClient_createTag_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)updateTag:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ENNoteStoreClient_updateTag_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)untagAllWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__ENNoteStoreClient_untagAllWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8BA480;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncBlock:completion:](self, "invokeAsyncBlock:completion:", v8, a4);

}

- (void)expungeTagWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__ENNoteStoreClient_expungeTagWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)listSearchesWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__ENNoteStoreClient_listSearchesWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)fetchSearchWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__ENNoteStoreClient_fetchSearchWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)createSearch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__ENNoteStoreClient_createSearch_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)updateSearch:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__ENNoteStoreClient_updateSearch_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)expungeSearchWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_expungeSearchWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_findRelatedWithQuery_resultSpec_completion___block_invoke;
  v12[3] = &unk_24F8B8568;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a5);

}

- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int v14;
  int v15;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_completion___block_invoke;
  v12[3] = &unk_24F8B84C8;
  v12[4] = self;
  v13 = v10;
  v14 = a4;
  v15 = a5;
  v11 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a6);

}

- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__ENNoteStoreClient_findNoteOffsetWithFilter_guid_completion___block_invoke;
  v12[3] = &unk_24F8B8590;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v12, a5);

}

- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  int v19;
  int v20;

  v12 = a3;
  v13 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_completion___block_invoke;
  v16[3] = &unk_24F8B85B8;
  v16[4] = self;
  v17 = v12;
  v19 = a4;
  v20 = a5;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v16, a7);

}

- (void)findNoteCountsWithFilter:(id)a3 includingTrash:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ENNoteStoreClient_findNoteCountsWithFilter_includingTrash_completion___block_invoke;
  v10[3] = &unk_24F8B85E0;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v10, a5);

}

- (void)fetchNoteWithGuid:(id)a3 includingContent:(BOOL)a4 resourceOptions:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  BOOL v15;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__ENNoteStoreClient_fetchNoteWithGuid_includingContent_resourceOptions_completion___block_invoke;
  v12[3] = &unk_24F8B8518;
  v12[4] = self;
  v13 = v10;
  v15 = a4;
  v14 = a5;
  v11 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a6);

}

- (void)fetchNoteApplicationDataWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__ENNoteStoreClient_fetchNoteApplicationDataWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__ENNoteStoreClient_fetchNoteApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_24F8B8568;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a5);

}

- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_completion___block_invoke;
  v16[3] = &unk_24F8B8608;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v16, a6);

}

- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_24F8B8590;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v12, a5);

}

- (void)fetchNoteContentWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__ENNoteStoreClient_fetchNoteContentWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchSearchTextForNoteWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  BOOL v15;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __92__ENNoteStoreClient_fetchSearchTextForNoteWithGuid_noteOnly_tokenizeForIndexing_completion___block_invoke;
  v12[3] = &unk_24F8B8630;
  v12[4] = self;
  v13 = v10;
  v14 = a4;
  v15 = a5;
  v11 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a6);

}

- (void)fetchSearchTextForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__ENNoteStoreClient_fetchSearchTextForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchTagNamesForNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__ENNoteStoreClient_fetchTagNamesForNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)createNote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__ENNoteStoreClient_createNote_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)updateNote:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__ENNoteStoreClient_updateNote_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)deleteNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__ENNoteStoreClient_deleteNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)expungeNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__ENNoteStoreClient_expungeNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)expungeNotesWithGuids:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_expungeNotesWithGuids_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)expungeInactiveNoteWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_expungeInactiveNoteWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8658;
  v3[4] = self;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v3, a3);
}

- (void)copyNoteWithGuid:(id)a3 toNotebookWithGuid:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_copyNoteWithGuid_toNotebookWithGuid_completion___block_invoke;
  v12[3] = &unk_24F8B8568;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a5);

}

- (void)listNoteVersionsWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__ENNoteStoreClient_listNoteVersionsWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 resourceOptions:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  int v15;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__ENNoteStoreClient_fetchNoteVersionWithGuid_updateSequenceNum_resourceOptions_completion___block_invoke;
  v12[3] = &unk_24F8B8680;
  v12[4] = self;
  v13 = v10;
  v15 = a4;
  v14 = a5;
  v11 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a6);

}

- (void)fetchResourceWithGuid:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__ENNoteStoreClient_fetchResourceWithGuid_options_completion___block_invoke;
  v10[3] = &unk_24F8B84C8;
  v10[4] = self;
  v11 = v8;
  v12 = a4;
  v9 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v10, a5);

}

- (void)fetchResourceApplicationDataWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__ENNoteStoreClient_fetchResourceApplicationDataWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__ENNoteStoreClient_fetchResourceApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_24F8B8568;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v12, a5);

}

- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_completion___block_invoke;
  v16[3] = &unk_24F8B8608;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v16, a6);

}

- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_24F8B8590;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v12, a5);

}

- (void)updateResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__ENNoteStoreClient_updateResource_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)fetchResourceDataWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__ENNoteStoreClient_fetchResourceDataWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchResourceByHashWithGuid:(id)a3 contentHash:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__ENNoteStoreClient_fetchResourceByHashWithGuid_contentHash_options_completion___block_invoke;
  v14[3] = &unk_24F8B85B8;
  v14[4] = self;
  v15 = v10;
  v16 = v11;
  v17 = a5;
  v12 = v11;
  v13 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v14, a6);

}

- (void)fetchRecognitionDataForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__ENNoteStoreClient_fetchRecognitionDataForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchAlternateDataForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__ENNoteStoreClient_fetchAlternateDataForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchAttributesForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__ENNoteStoreClient_fetchAttributesForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchPublicNotebookWithUserID:(int)a3 publicURI:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int v12;

  v8 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ENNoteStoreClient_fetchPublicNotebookWithUserID_publicURI_completion___block_invoke;
  v10[3] = &unk_24F8B86A8;
  v12 = a3;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v10, a5);

}

- (void)createSharedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_createSharedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)sendMessageToMembersOfSharedNotebookWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __100__ENNoteStoreClient_sendMessageToMembersOfSharedNotebookWithGuid_messageText_recipients_completion___block_invoke;
  v16[3] = &unk_24F8B8608;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v16, a6);

}

- (void)listSharedNotebooksWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_listSharedNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)expungeSharedNotebooksWithIds:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__ENNoteStoreClient_expungeSharedNotebooksWithIds_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)createLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_createLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)updateLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_updateLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)listLinkedNotebooksWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_listLinkedNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)expungeLinkedNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__ENNoteStoreClient_expungeLinkedNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)authenticateToSharedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__ENNoteStoreClient_authenticateToSharedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)fetchSharedNotebookByAuthWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__ENNoteStoreClient_fetchSharedNotebookByAuthWithCompletion___block_invoke;
  v3[3] = &unk_24F8B8478;
  v3[4] = self;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v3, a3);
}

- (void)emailNoteWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_emailNoteWithParameters_completion___block_invoke;
  v8[3] = &unk_24F8BA480;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncBlock:completion:](self, "invokeAsyncBlock:completion:", v8, a4);

}

- (void)shareNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__ENNoteStoreClient_shareNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8B84F0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v8, a4);

}

- (void)stopSharingNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_stopSharingNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_24F8BA480;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncBlock:completion:](self, "invokeAsyncBlock:completion:", v8, a4);

}

- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_completion___block_invoke;
  v16[3] = &unk_24F8B86D0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ENStoreClient invokeAsyncObjectBlock:completion:](self, "invokeAsyncObjectBlock:completion:", v16, a6);

}

- (void)updateSharedNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_updateSharedNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B8540;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v8, a4);

}

- (void)setRecipientSettings:(id)a3 forSharedNotebookWithID:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v8 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__ENNoteStoreClient_setRecipientSettings_forSharedNotebookWithID_completion___block_invoke;
  v10[3] = &unk_24F8B86F8;
  v11 = v8;
  v12 = a4;
  v10[4] = self;
  v9 = v8;
  -[ENStoreClient invokeAsyncInt32Block:completion:](self, "invokeAsyncInt32Block:completion:", v10, a5);

}

- (void)cancelFirstOperation
{
  id v2;

  -[ENNoteStoreClient client](self, "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)findNotesMetadataWithFilter:(id)a3 maxResults:(unint64_t)a4 resultSpec:(id)a5 success:(id)a6 failure:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = (objc_class *)MEMORY[0x24BDBCEB8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  -[ENNoteStoreClient findNotesMetadataInternalWithFilter:offset:resultSpec:maxResults:results:success:failure:](self, "findNotesMetadataInternalWithFilter:offset:resultSpec:maxResults:results:success:failure:", v16, 0, v15, a4, v17, v14, v13);

}

- (void)findNotesMetadataInternalWithFilter:(id)a3 offset:(int)a4 resultSpec:(id)a5 maxResults:(unint64_t)a6 results:(id)a7 success:(id)a8 failure:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id);
  id v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  _QWORD v23[4];
  id v24;
  ENNoteStoreClient *v25;
  id v26;
  id v27;
  id v28;
  void (**v29)(id, id);
  unint64_t v30;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = (void (**)(id, id))a8;
  v19 = a9;
  if (a6)
  {
    if (objc_msgSend(v17, "count") >= a6)
    {
      v18[2](v18, v17);
      goto LABEL_9;
    }
    v22 = a4;
    v20 = objc_msgSend(v17, "count");
    if (a6 - v20 >= 0x64)
      v21 = 100;
    else
      v21 = a6 - v20;
  }
  else
  {
    v22 = a4;
    v21 = 100;
  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __110__ENNoteStoreClient_findNotesMetadataInternalWithFilter_offset_resultSpec_maxResults_results_success_failure___block_invoke;
  v23[3] = &unk_24F8B8720;
  v28 = v19;
  v24 = v17;
  v25 = self;
  v26 = v15;
  v27 = v16;
  v30 = a6;
  v29 = v18;
  -[ENNoteStoreClient findNotesMetadataWithFilter:offset:maxNotes:resultSpec:completion:](self, "findNotesMetadataWithFilter:offset:maxNotes:resultSpec:completion:", v26, v22, v21, v27, v23);

LABEL_9:
}

- (void)getSyncStateWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__ENNoteStoreClient_getSyncStateWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8748;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient fetchSyncStateWithCompletion:](self, "fetchSyncStateWithCompletion:", v10);

}

- (void)getSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 success:(id)a6 failure:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__ENNoteStoreClient_getSyncChunkAfterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke;
  v16[3] = &unk_24F8B8770;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient fetchSyncChunkAfterUSN:maxEntries:fullSyncOnly:completion:](self, "fetchSyncChunkAfterUSN:maxEntries:fullSyncOnly:completion:", v10, v9, v8, v16);

}

- (void)getFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __84__ENNoteStoreClient_getFilteredSyncChunkAfterUSN_maxEntries_filter_success_failure___block_invoke;
  v16[3] = &unk_24F8B8770;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient fetchFilteredSyncChunkAfterUSN:maxEntries:filter:completion:](self, "fetchFilteredSyncChunkAfterUSN:maxEntries:filter:completion:", v10, v9, a5, v16);

}

- (void)getLinkedNotebookSyncState:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_getLinkedNotebookSyncState_success_failure___block_invoke;
  v12[3] = &unk_24F8B8748;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchSyncStateForLinkedNotebook:completion:](self, "fetchSyncStateForLinkedNotebook:completion:", a3, v12);

}

- (void)getLinkedNotebookSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 success:(id)a7 failure:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v14 = a7;
  v15 = a8;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __97__ENNoteStoreClient_getLinkedNotebookSyncChunk_afterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke;
  v18[3] = &unk_24F8B8770;
  v19 = v14;
  v20 = v15;
  v16 = v15;
  v17 = v14;
  -[ENNoteStoreClient fetchSyncChunkForLinkedNotebook:afterUSN:maxEntries:fullSyncOnly:completion:](self, "fetchSyncChunkForLinkedNotebook:afterUSN:maxEntries:fullSyncOnly:completion:", a3, v11, v10, v9, v18);

}

- (void)listNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__ENNoteStoreClient_listNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient listNotebooksWithCompletion:](self, "listNotebooksWithCompletion:", v10);

}

- (void)getNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__ENNoteStoreClient_getNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87C0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchNotebookWithGuid:completion:](self, "fetchNotebookWithGuid:completion:", a3, v12);

}

- (void)getDefaultNotebookWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__ENNoteStoreClient_getDefaultNotebookWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B87C0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient fetchDefaultNotebookWithCompletion:](self, "fetchDefaultNotebookWithCompletion:", v10);

}

- (void)createNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_createNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B87C0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createNotebook:completion:](self, "createNotebook:completion:", a3, v12);

}

- (void)updateNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_updateNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateNotebook:completion:](self, "updateNotebook:completion:", a3, v12);

}

- (void)expungeNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_expungeNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeNotebookWithGuid:completion:](self, "expungeNotebookWithGuid:completion:", a3, v12);

}

- (void)listTagsWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__ENNoteStoreClient_listTagsWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient listTagsWithCompletion:](self, "listTagsWithCompletion:", v10);

}

- (void)listTagsByNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_listTagsByNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8798;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient listTagsInNotebookWithGuid:completion:](self, "listTagsInNotebookWithGuid:completion:", a3, v12);

}

- (void)getTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_getTagWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8810;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchTagWithGuid:completion:](self, "fetchTagWithGuid:completion:", a3, v12);

}

- (void)createTag:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__ENNoteStoreClient_createTag_success_failure___block_invoke;
  v12[3] = &unk_24F8B8810;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createTag:completion:](self, "createTag:completion:", a3, v12);

}

- (void)updateTag:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__ENNoteStoreClient_updateTag_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateTag:completion:](self, "updateTag:completion:", a3, v12);

}

- (void)untagAllWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__ENNoteStoreClient_untagAllWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8838;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient untagAllWithGuid:completion:](self, "untagAllWithGuid:completion:", a3, v12);

}

- (void)expungeTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__ENNoteStoreClient_expungeTagWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeTagWithGuid:completion:](self, "expungeTagWithGuid:completion:", a3, v12);

}

- (void)listSearchesWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__ENNoteStoreClient_listSearchesWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient listSearchesWithCompletion:](self, "listSearchesWithCompletion:", v10);

}

- (void)getSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__ENNoteStoreClient_getSearchWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8860;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchSearchWithGuid:completion:](self, "fetchSearchWithGuid:completion:", a3, v12);

}

- (void)createSearch:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__ENNoteStoreClient_createSearch_success_failure___block_invoke;
  v12[3] = &unk_24F8B8860;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createSearch:completion:](self, "createSearch:completion:", a3, v12);

}

- (void)updateSearch:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__ENNoteStoreClient_updateSearch_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateSearch:completion:](self, "updateSearch:completion:", a3, v12);

}

- (void)expungeSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__ENNoteStoreClient_expungeSearchWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeSearchWithGuid:completion:](self, "expungeSearchWithGuid:completion:", a3, v12);

}

- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ENNoteStoreClient_findRelatedWithQuery_resultSpec_success_failure___block_invoke;
  v14[3] = &unk_24F8B8888;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient findRelatedWithQuery:resultSpec:completion:](self, "findRelatedWithQuery:resultSpec:completion:", a3, a4, v14);

}

- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a4;
  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_success_failure___block_invoke;
  v16[3] = &unk_24F8B88B0;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient findNotesWithFilter:offset:maxNotes:completion:](self, "findNotesWithFilter:offset:maxNotes:completion:", a3, v9, v8, v16);

}

- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__ENNoteStoreClient_findNoteOffsetWithFilter_guid_success_failure___block_invoke;
  v14[3] = &unk_24F8B87E8;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient findNoteOffsetWithFilter:guid:completion:](self, "findNoteOffsetWithFilter:guid:completion:", a3, a4, v14);

}

- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 success:(id)a7 failure:(id)a8
{
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v14 = a7;
  v15 = a8;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_success_failure___block_invoke;
  v18[3] = &unk_24F8B88D8;
  v19 = v14;
  v20 = v15;
  v16 = v15;
  v17 = v14;
  -[ENNoteStoreClient findNotesMetadataWithFilter:offset:maxNotes:resultSpec:completion:](self, "findNotesMetadataWithFilter:offset:maxNotes:resultSpec:completion:", a3, v11, v10, a6, v18);

}

- (void)findNoteCountsWithFilter:(id)a3 withTrash:(BOOL)a4 success:(id)a5 failure:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__ENNoteStoreClient_findNoteCountsWithFilter_withTrash_success_failure___block_invoke;
  v14[3] = &unk_24F8B8900;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient findNoteCountsWithFilter:includingTrash:completion:](self, "findNoteCountsWithFilter:includingTrash:completion:", a3, v7, v14);

}

- (void)getNoteWithGuid:(id)a3 withContent:(BOOL)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = a8;
  v16 = a9;
  v17 = v11;
  if (v10)
    v17 = v11 | 2;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __135__ENNoteStoreClient_getNoteWithGuid_withContent_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke;
  v21[3] = &unk_24F8B8928;
  if (v9)
    v18 = v17 | 4;
  else
    v18 = v17;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  -[ENNoteStoreClient fetchNoteWithGuid:includingContent:resourceOptions:completion:](self, "fetchNoteWithGuid:includingContent:resourceOptions:completion:", a3, v12, v18, v21);

}

- (void)getNoteApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_getNoteApplicationDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8950;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchNoteApplicationDataWithGuid:completion:](self, "fetchNoteApplicationDataWithGuid:completion:", a3, v12);

}

- (void)getNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__ENNoteStoreClient_getNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_24F8B8978;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient fetchNoteApplicationDataEntryWithGuid:key:completion:](self, "fetchNoteApplicationDataEntryWithGuid:key:completion:", a3, a4, v14);

}

- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_success_failure___block_invoke;
  v16[3] = &unk_24F8B87E8;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient setNoteApplicationDataEntryWithGuid:key:value:completion:](self, "setNoteApplicationDataEntryWithGuid:key:value:completion:", a3, a4, a5, v16);

}

- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_24F8B87E8;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient unsetNoteApplicationDataEntryWithGuid:key:completion:](self, "unsetNoteApplicationDataEntryWithGuid:key:completion:", a3, a4, v14);

}

- (void)getNoteContentWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__ENNoteStoreClient_getNoteContentWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8978;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchNoteContentWithGuid:completion:](self, "fetchNoteContentWithGuid:completion:", a3, v12);

}

- (void)getNoteSearchTextWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 success:(id)a6 failure:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __92__ENNoteStoreClient_getNoteSearchTextWithGuid_noteOnly_tokenizeForIndexing_success_failure___block_invoke;
  v16[3] = &unk_24F8B8978;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient fetchSearchTextForNoteWithGuid:noteOnly:tokenizeForIndexing:completion:](self, "fetchSearchTextForNoteWithGuid:noteOnly:tokenizeForIndexing:completion:", a3, v9, v8, v16);

}

- (void)getResourceSearchTextWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_getResourceSearchTextWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8978;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchSearchTextForResourceWithGuid:completion:](self, "fetchSearchTextForResourceWithGuid:completion:", a3, v12);

}

- (void)getNoteTagNamesWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_getNoteTagNamesWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8798;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchTagNamesForNoteWithGuid:completion:](self, "fetchTagNamesForNoteWithGuid:completion:", a3, v12);

}

- (void)createNote:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__ENNoteStoreClient_createNote_success_failure___block_invoke;
  v12[3] = &unk_24F8B8928;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createNote:completion:](self, "createNote:completion:", a3, v12);

}

- (void)updateNote:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__ENNoteStoreClient_updateNote_success_failure___block_invoke;
  v12[3] = &unk_24F8B8928;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateNote:completion:](self, "updateNote:completion:", a3, v12);

}

- (void)deleteNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__ENNoteStoreClient_deleteNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient deleteNoteWithGuid:completion:](self, "deleteNoteWithGuid:completion:", a3, v12);

}

- (void)expungeNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__ENNoteStoreClient_expungeNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeNoteWithGuid:completion:](self, "expungeNoteWithGuid:completion:", a3, v12);

}

- (void)expungeNotesWithGuids:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__ENNoteStoreClient_expungeNotesWithGuids_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeNotesWithGuids:completion:](self, "expungeNotesWithGuids:completion:", a3, v12);

}

- (void)expungeInactiveNoteWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_expungeInactiveNoteWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B87E8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient expungeInactiveNoteWithCompletion:](self, "expungeInactiveNoteWithCompletion:", v10);

}

- (void)copyNoteWithGuid:(id)a3 toNoteBookGuid:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ENNoteStoreClient_copyNoteWithGuid_toNoteBookGuid_success_failure___block_invoke;
  v14[3] = &unk_24F8B8928;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient copyNoteWithGuid:toNotebookWithGuid:completion:](self, "copyNoteWithGuid:toNotebookWithGuid:completion:", a3, a4, v14);

}

- (void)listNoteVersionsWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__ENNoteStoreClient_listNoteVersionsWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8798;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient listNoteVersionsWithGuid:completion:](self, "listNoteVersionsWithGuid:completion:", a3, v12);

}

- (void)getNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v15 = a8;
  v16 = a9;
  v17 = v11;
  if (v10)
    v17 = v11 | 2;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __148__ENNoteStoreClient_getNoteVersionWithGuid_updateSequenceNum_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke;
  v21[3] = &unk_24F8B8928;
  if (v9)
    v18 = v17 | 4;
  else
    v18 = v17;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  -[ENNoteStoreClient fetchNoteVersionWithGuid:updateSequenceNum:resourceOptions:completion:](self, "fetchNoteVersionWithGuid:updateSequenceNum:resourceOptions:completion:", a3, v12, v18, v21);

}

- (void)getResourceWithGuid:(id)a3 withData:(BOOL)a4 withRecognition:(BOOL)a5 withAttributes:(BOOL)a6 withAlternateDate:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = a8;
  v16 = a9;
  v17 = v12;
  if (v11)
    v17 = v12 | 2;
  if (v9)
    v17 |= 4uLL;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __115__ENNoteStoreClient_getResourceWithGuid_withData_withRecognition_withAttributes_withAlternateDate_success_failure___block_invoke;
  v21[3] = &unk_24F8B89A0;
  if (v10)
    v18 = v17 | 8;
  else
    v18 = v17;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  -[ENNoteStoreClient fetchResourceWithGuid:options:completion:](self, "fetchResourceWithGuid:options:completion:", a3, v18, v21);

}

- (void)getResourceApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__ENNoteStoreClient_getResourceApplicationDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8950;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchResourceApplicationDataWithGuid:completion:](self, "fetchResourceApplicationDataWithGuid:completion:", a3, v12);

}

- (void)getResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__ENNoteStoreClient_getResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_24F8B8978;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient fetchResourceApplicationDataEntryWithGuid:key:completion:](self, "fetchResourceApplicationDataEntryWithGuid:key:completion:", a3, a4, v14);

}

- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_success_failure___block_invoke;
  v16[3] = &unk_24F8B87E8;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient setResourceApplicationDataEntryWithGuid:key:value:completion:](self, "setResourceApplicationDataEntryWithGuid:key:value:completion:", a3, a4, a5, v16);

}

- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_24F8B87E8;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient unsetResourceApplicationDataEntryWithGuid:key:completion:](self, "unsetResourceApplicationDataEntryWithGuid:key:completion:", a3, a4, v14);

}

- (void)updateResource:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_updateResource_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateResource:completion:](self, "updateResource:completion:", a3, v12);

}

- (void)getResourceDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_getResourceDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B89C8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchResourceDataWithGuid:completion:](self, "fetchResourceDataWithGuid:completion:", a3, v12);

}

- (void)getResourceByHashWithGuid:(id)a3 contentHash:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v15 = a8;
  v16 = a9;
  v17 = v11;
  if (v10)
    v17 = v11 | 2;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __118__ENNoteStoreClient_getResourceByHashWithGuid_contentHash_withData_withRecognition_withAlternateData_success_failure___block_invoke;
  v21[3] = &unk_24F8B89A0;
  if (v9)
    v18 = v17 | 4;
  else
    v18 = v17;
  v22 = v15;
  v23 = v16;
  v19 = v16;
  v20 = v15;
  -[ENNoteStoreClient fetchResourceByHashWithGuid:contentHash:options:completion:](self, "fetchResourceByHashWithGuid:contentHash:options:completion:", a3, a4, v18, v21);

}

- (void)getResourceRecognitionWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_getResourceRecognitionWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B89C8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchRecognitionDataForResourceWithGuid:completion:](self, "fetchRecognitionDataForResourceWithGuid:completion:", a3, v12);

}

- (void)getResourceAlternateDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__ENNoteStoreClient_getResourceAlternateDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B89C8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchAlternateDataForResourceWithGuid:completion:](self, "fetchAlternateDataForResourceWithGuid:completion:", a3, v12);

}

- (void)getResourceAttributesWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_getResourceAttributesWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B89F0;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient fetchAttributesForResourceWithGuid:completion:](self, "fetchAttributesForResourceWithGuid:completion:", a3, v12);

}

- (void)getPublicNotebookWithUserID:(int)a3 publicUri:(id)a4 success:(id)a5 failure:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__ENNoteStoreClient_getPublicNotebookWithUserID_publicUri_success_failure___block_invoke;
  v14[3] = &unk_24F8B87C0;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient fetchPublicNotebookWithUserID:publicURI:completion:](self, "fetchPublicNotebookWithUserID:publicURI:completion:", v8, a4, v14);

}

- (void)createSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_createSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B8A18;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createSharedNotebook:completion:](self, "createSharedNotebook:completion:", a3, v12);

}

- (void)sendMessageToSharedNotebookMembersWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __103__ENNoteStoreClient_sendMessageToSharedNotebookMembersWithGuid_messageText_recipients_success_failure___block_invoke;
  v16[3] = &unk_24F8B87E8;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient sendMessageToMembersOfSharedNotebookWithGuid:messageText:recipients:completion:](self, "sendMessageToMembersOfSharedNotebookWithGuid:messageText:recipients:completion:", a3, a4, a5, v16);

}

- (void)listSharedNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_listSharedNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient listSharedNotebooksWithCompletion:](self, "listSharedNotebooksWithCompletion:", v10);

}

- (void)expungeSharedNotebooksWithIds:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_expungeSharedNotebooksWithIds_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeSharedNotebooksWithIds:completion:](self, "expungeSharedNotebooksWithIds:completion:", a3, v12);

}

- (void)createLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_createLinkedNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B8A40;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient createLinkedNotebook:completion:](self, "createLinkedNotebook:completion:", a3, v12);

}

- (void)updateLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_updateLinkedNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateLinkedNotebook:completion:](self, "updateLinkedNotebook:completion:", a3, v12);

}

- (void)listLinkedNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_listLinkedNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8798;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient listLinkedNotebooksWithCompletion:](self, "listLinkedNotebooksWithCompletion:", v10);

}

- (void)expungeLinkedNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_expungeLinkedNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient expungeLinkedNotebookWithGuid:completion:](self, "expungeLinkedNotebookWithGuid:completion:", a3, v12);

}

- (void)authenticateToSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__ENNoteStoreClient_authenticateToSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B8A68;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient authenticateToSharedNotebook:completion:](self, "authenticateToSharedNotebook:completion:", a3, v12);

}

- (void)getSharedNotebookByAuthWithSuccess:(id)a3 failure:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__ENNoteStoreClient_getSharedNotebookByAuthWithSuccess_failure___block_invoke;
  v10[3] = &unk_24F8B8A18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[ENNoteStoreClient fetchSharedNotebookByAuthWithCompletion:](self, "fetchSharedNotebookByAuthWithCompletion:", v10);

}

- (void)emailNoteWithParameters:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_emailNoteWithParameters_success_failure___block_invoke;
  v12[3] = &unk_24F8B8838;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient emailNoteWithParameters:completion:](self, "emailNoteWithParameters:completion:", a3, v12);

}

- (void)shareNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__ENNoteStoreClient_shareNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8978;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient shareNoteWithGuid:completion:](self, "shareNoteWithGuid:completion:", a3, v12);

}

- (void)stopSharingNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_stopSharingNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_24F8B8838;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient stopSharingNoteWithGuid:completion:](self, "stopSharingNoteWithGuid:completion:", a3, v12);

}

- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v12 = a6;
  v13 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_success_failure___block_invoke;
  v16[3] = &unk_24F8B8A68;
  v17 = v12;
  v18 = v13;
  v14 = v13;
  v15 = v12;
  -[ENNoteStoreClient authenticateToSharedNoteWithGuid:noteKey:authenticationToken:completion:](self, "authenticateToSharedNoteWithGuid:noteKey:authenticationToken:completion:", a3, a4, a5, v16);

}

- (void)updateSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_updateSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B87E8;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENNoteStoreClient updateSharedNotebook:completion:](self, "updateSharedNotebook:completion:", a3, v12);

}

- (void)setSharedNotebookRecipientSettingsWithSharedNotebookId:(int64_t)a3 recipientSettings:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __110__ENNoteStoreClient_setSharedNotebookRecipientSettingsWithSharedNotebookId_recipientSettings_success_failure___block_invoke;
  v14[3] = &unk_24F8B87E8;
  v15 = v10;
  v16 = v11;
  v12 = v11;
  v13 = v10;
  -[ENNoteStoreClient setRecipientSettings:forSharedNotebookWithID:completion:](self, "setRecipientSettings:forSharedNotebookWithID:completion:", a4, a3, v14);

}

- (id)uploadProgressHandler
{
  return self->_uploadProgressHandler;
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSString)cachedNoteStoreUrl
{
  return self->_cachedNoteStoreUrl;
}

- (void)setCachedNoteStoreUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cachedAuthenticationToken
{
  return self->_cachedAuthenticationToken;
}

- (void)setCachedAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_cachedNoteStoreUrl, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong(&self->_uploadProgressHandler, 0);
}

uint64_t __110__ENNoteStoreClient_setSharedNotebookRecipientSettingsWithSharedNotebookId_recipientSettings_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ENNoteStoreClient_updateSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ENNoteStoreClient_stopSharingNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ENNoteStoreClient_shareNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ENNoteStoreClient_emailNoteWithParameters_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__ENNoteStoreClient_getSharedNotebookByAuthWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__ENNoteStoreClient_authenticateToSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENNoteStoreClient_expungeLinkedNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ENNoteStoreClient_listLinkedNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ENNoteStoreClient_updateLinkedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ENNoteStoreClient_createLinkedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENNoteStoreClient_expungeSharedNotebooksWithIds_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ENNoteStoreClient_listSharedNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__ENNoteStoreClient_sendMessageToSharedNotebookMembersWithGuid_messageText_recipients_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__ENNoteStoreClient_createSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__ENNoteStoreClient_getPublicNotebookWithUserID_publicUri_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENNoteStoreClient_getResourceAttributesWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__ENNoteStoreClient_getResourceAlternateDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__ENNoteStoreClient_getResourceRecognitionWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__ENNoteStoreClient_getResourceByHashWithGuid_contentHash_withData_withRecognition_withAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ENNoteStoreClient_getResourceDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__ENNoteStoreClient_updateResource_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__ENNoteStoreClient_getResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__ENNoteStoreClient_getResourceApplicationDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__ENNoteStoreClient_getResourceWithGuid_withData_withRecognition_withAttributes_withAlternateDate_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __148__ENNoteStoreClient_getNoteVersionWithGuid_updateSequenceNum_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__ENNoteStoreClient_listNoteVersionsWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__ENNoteStoreClient_copyNoteWithGuid_toNoteBookGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ENNoteStoreClient_expungeInactiveNoteWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ENNoteStoreClient_expungeNotesWithGuids_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__ENNoteStoreClient_expungeNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__ENNoteStoreClient_deleteNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ENNoteStoreClient_updateNote_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__ENNoteStoreClient_createNote_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ENNoteStoreClient_getNoteTagNamesWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENNoteStoreClient_getResourceSearchTextWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__ENNoteStoreClient_getNoteSearchTextWithGuid_noteOnly_tokenizeForIndexing_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__ENNoteStoreClient_getNoteContentWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__ENNoteStoreClient_getNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__ENNoteStoreClient_getNoteApplicationDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __135__ENNoteStoreClient_getNoteWithGuid_withContent_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__ENNoteStoreClient_findNoteCountsWithFilter_withTrash_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __92__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__ENNoteStoreClient_findNoteOffsetWithFilter_guid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__ENNoteStoreClient_findRelatedWithQuery_resultSpec_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ENNoteStoreClient_expungeSearchWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__ENNoteStoreClient_updateSearch_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __50__ENNoteStoreClient_createSearch_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__ENNoteStoreClient_getSearchWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__ENNoteStoreClient_listSearchesWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__ENNoteStoreClient_expungeTagWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__ENNoteStoreClient_untagAllWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__ENNoteStoreClient_updateTag_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__ENNoteStoreClient_createTag_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__ENNoteStoreClient_getTagWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__ENNoteStoreClient_listTagsByNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __49__ENNoteStoreClient_listTagsWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__ENNoteStoreClient_expungeNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__ENNoteStoreClient_updateNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__ENNoteStoreClient_createNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__ENNoteStoreClient_getDefaultNotebookWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__ENNoteStoreClient_getNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__ENNoteStoreClient_listNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97__ENNoteStoreClient_getLinkedNotebookSyncChunk_afterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__ENNoteStoreClient_getLinkedNotebookSyncState_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__ENNoteStoreClient_getFilteredSyncChunkAfterUSN_maxEntries_filter_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__ENNoteStoreClient_getSyncChunkAfterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__ENNoteStoreClient_getSyncStateWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __110__ENNoteStoreClient_findNotesMetadataInternalWithFilter_offset_resultSpec_maxResults_results_success_failure___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  v13 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_6:
    v6();
    goto LABEL_7;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "notes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

  objc_msgSend(v13, "startIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "intValue");
  objc_msgSend(v13, "notes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 + objc_msgSend(v10, "count");

  objc_msgSend(v13, "totalNotes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "intValue");

  if ((int)v10 <= (int)v11)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "findNotesMetadataInternalWithFilter:offset:resultSpec:maxResults:results:success:failure:", *(_QWORD *)(a1 + 48), v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
LABEL_7:

}

uint64_t __77__ENNoteStoreClient_setRecipientSettings_forSharedNotebookWithID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "setSharedNotebookRecipientSettings:sharedNotebookId:recipientSettings:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __53__ENNoteStoreClient_updateSharedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateSharedNotebook:sharedNotebook:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __93__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticateToSharedNote:noteKey:authenticationToken:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __56__ENNoteStoreClient_stopSharingNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopSharingNote:guid:", v2, *(_QWORD *)(a1 + 40));

}

id __50__ENNoteStoreClient_shareNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareNote:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __56__ENNoteStoreClient_emailNoteWithParameters_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailNote:parameters:", v2, *(_QWORD *)(a1 + 40));

}

id __61__ENNoteStoreClient_fetchSharedNotebookByAuthWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSharedNotebookByAuth:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__ENNoteStoreClient_authenticateToSharedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authenticateToSharedNotebook:authenticationToken:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __62__ENNoteStoreClient_expungeLinkedNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeLinkedNotebook:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __55__ENNoteStoreClient_listLinkedNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listLinkedNotebooks:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__ENNoteStoreClient_updateLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateLinkedNotebook:linkedNotebook:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __53__ENNoteStoreClient_createLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createLinkedNotebook:linkedNotebook:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__ENNoteStoreClient_expungeSharedNotebooksWithIds_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeSharedNotebooks:sharedNotebookIds:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __55__ENNoteStoreClient_listSharedNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listSharedNotebooks:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __100__ENNoteStoreClient_sendMessageToMembersOfSharedNotebookWithGuid_messageText_recipients_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "sendMessageToSharedNotebookMembers:notebookGuid:messageText:recipients:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return v4;
}

id __53__ENNoteStoreClient_createSharedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createSharedNotebook:sharedNotebook:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__ENNoteStoreClient_fetchPublicNotebookWithUserID_publicURI_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPublicNotebook:publicUri:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __67__ENNoteStoreClient_fetchAttributesForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceAttributes:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __70__ENNoteStoreClient_fetchAlternateDataForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceAlternateData:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__ENNoteStoreClient_fetchRecognitionDataForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceRecognition:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__ENNoteStoreClient_fetchResourceByHashWithGuid_contentHash_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceByHash:noteGuid:contentHash:withData:withRecognition:withAlternateData:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56) & 1, (*(_QWORD *)(a1 + 56) >> 1) & 1, (*(_QWORD *)(a1 + 56) >> 2) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __58__ENNoteStoreClient_fetchResourceDataWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceData:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __47__ENNoteStoreClient_updateResource_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateResource:resource:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __78__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "unsetResourceApplicationDataEntry:guid:key:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4;
}

uint64_t __82__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "setResourceApplicationDataEntry:guid:key:value:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return v4;
}

id __78__ENNoteStoreClient_fetchResourceApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceApplicationDataEntry:guid:key:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __69__ENNoteStoreClient_fetchResourceApplicationDataWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceApplicationData:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __62__ENNoteStoreClient_fetchResourceWithGuid_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResource:guid:withData:withRecognition:withAttributes:withAlternateData:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) & 1, (*(_QWORD *)(a1 + 48) >> 1) & 1, (*(_QWORD *)(a1 + 48) >> 3) & 1, (*(_QWORD *)(a1 + 48) >> 2) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __91__ENNoteStoreClient_fetchNoteVersionWithGuid_updateSequenceNum_resourceOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteVersion:noteGuid:updateSequenceNum:withResourcesData:withResourcesRecognition:withResourcesAlternateData:", v3, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48) & 1, (*(_QWORD *)(a1 + 48) >> 1) & 1, (*(_QWORD *)(a1 + 48) >> 2) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__ENNoteStoreClient_listNoteVersionsWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listNoteVersions:noteGuid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __68__ENNoteStoreClient_copyNoteWithGuid_toNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "copyNote:noteGuid:toNotebookGuid:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4;
}

uint64_t __55__ENNoteStoreClient_expungeInactiveNoteWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeInactiveNotes:", v3);

  return v4;
}

uint64_t __54__ENNoteStoreClient_expungeNotesWithGuids_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeNotes:noteGuids:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __52__ENNoteStoreClient_expungeNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeNote:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __51__ENNoteStoreClient_deleteNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "deleteNote:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __43__ENNoteStoreClient_updateNote_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateNote:note:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __43__ENNoteStoreClient_createNote_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createNote:note:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__ENNoteStoreClient_fetchTagNamesForNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteTagNames:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __67__ENNoteStoreClient_fetchSearchTextForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getResourceSearchText:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __92__ENNoteStoreClient_fetchSearchTextForNoteWithGuid_noteOnly_tokenizeForIndexing_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteSearchText:guid:noteOnly:tokenizeForIndexing:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __57__ENNoteStoreClient_fetchNoteContentWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteContent:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __74__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "unsetNoteApplicationDataEntry:guid:key:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4;
}

uint64_t __78__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "setNoteApplicationDataEntry:guid:key:value:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  return v4;
}

id __74__ENNoteStoreClient_fetchNoteApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteApplicationDataEntry:guid:key:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__ENNoteStoreClient_fetchNoteApplicationDataWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNoteApplicationData:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __83__ENNoteStoreClient_fetchNoteWithGuid_includingContent_resourceOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNote:guid:withContent:withResourcesData:withResourcesRecognition:withResourcesAlternateData:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48) & 1, (*(_QWORD *)(a1 + 48) >> 1) & 1, (*(_QWORD *)(a1 + 48) >> 2) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __72__ENNoteStoreClient_findNoteCountsWithFilter_includingTrash_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNoteCounts:filter:withTrash:", v3, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __87__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNotesMetadata:filter:offset:maxNotes:resultSpec:", v3, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__ENNoteStoreClient_findNoteOffsetWithFilter_guid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "findNoteOffset:filter:guid:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return v4;
}

id __68__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findNotes:filter:offset:maxNotes:", v3, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__ENNoteStoreClient_findRelatedWithQuery_resultSpec_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findRelated:query:resultSpec:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __54__ENNoteStoreClient_expungeSearchWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeSearch:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __45__ENNoteStoreClient_updateSearch_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateSearch:search:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __45__ENNoteStoreClient_createSearch_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createSearch:search:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__ENNoteStoreClient_fetchSearchWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSearch:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__ENNoteStoreClient_listSearchesWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listSearches:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__ENNoteStoreClient_expungeTagWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeTag:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

void __49__ENNoteStoreClient_untagAllWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "untagAll:guid:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __42__ENNoteStoreClient_updateTag_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateTag:tag:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __42__ENNoteStoreClient_createTag_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createTag:tag:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __49__ENNoteStoreClient_fetchTagWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getTag:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __59__ENNoteStoreClient_listTagsInNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listTagsByNotebook:notebookGuid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __44__ENNoteStoreClient_listTagsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listTags:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__ENNoteStoreClient_expungeNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "expungeNotebook:guid:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

uint64_t __47__ENNoteStoreClient_updateNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "updateNotebook:notebook:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

id __47__ENNoteStoreClient_createNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createNotebook:notebook:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __56__ENNoteStoreClient_fetchDefaultNotebookWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDefaultNotebook:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__ENNoteStoreClient_fetchNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getNotebook:guid:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __49__ENNoteStoreClient_listNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listNotebooks:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __97__ENNoteStoreClient_fetchSyncChunkForLinkedNotebook_afterUSN_maxEntries_fullSyncOnly_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLinkedNotebookSyncChunk:linkedNotebook:afterUSN:maxEntries:fullSyncOnly:", v3, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__ENNoteStoreClient_fetchSyncStateForLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLinkedNotebookSyncState:linkedNotebook:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __81__ENNoteStoreClient_fetchFilteredSyncChunkAfterUSN_maxEntries_filter_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getFilteredSyncChunk:afterUSN:maxEntries:filter:", v3, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __79__ENNoteStoreClient_fetchSyncChunkAfterUSN_maxEntries_fullSyncOnly_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSyncChunk:afterUSN:maxEntries:fullSyncOnly:", v3, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __50__ENNoteStoreClient_fetchSyncStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSyncState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __43__ENNoteStoreClient_updateProgressHandlers__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
    return (*(uint64_t (**)(double))(*(_QWORD *)(result + 32) + 16))((double)a3 / (double)a4);
  return result;
}

uint64_t __43__ENNoteStoreClient_updateProgressHandlers__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
    return (*(uint64_t (**)(double))(*(_QWORD *)(result + 32) + 16))((double)a3 / (double)a4);
  return result;
}

@end
