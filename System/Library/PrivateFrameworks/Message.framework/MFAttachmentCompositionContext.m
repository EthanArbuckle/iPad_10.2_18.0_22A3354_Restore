@implementation MFAttachmentCompositionContext

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MFAttachmentCompositionContext attachments](self, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        -[MFAttachmentCompositionContext attachmentsManager](self, "attachmentsManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeAttachmentForURL:", v9);

        -[MFAttachmentCompositionContext attachmentsManager](self, "attachmentsManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clearMetadataForAttachment:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  -[MFAttachmentCompositionContext attachmentsManager](self, "attachmentsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentCompositionContext attachmentsBaseURL](self, "attachmentsBaseURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeProviderForBaseURL:", v12);

  v13.receiver = self;
  v13.super_class = (Class)MFAttachmentCompositionContext;
  -[MFAttachmentCompositionContext dealloc](&v13, sel_dealloc);
}

- (MFAttachmentCompositionContext)init
{
  void *v3;
  MFAttachmentCompositionContext *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFAttachmentCompositionContext initWithContextID:](self, "initWithContextID:", v3);

  return v4;
}

- (MFAttachmentCompositionContext)initWithContextID:(id)a3
{
  id v4;
  MFAttachmentCompositionContext *v5;
  uint64_t v6;
  NSString *contextID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFAttachmentCompositionContext;
  v5 = -[MFAttachmentCompositionContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contextID = v5->_contextID;
    v5->_contextID = (NSString *)v6;

  }
  return v5;
}

- (NSArray)attachments
{
  void *v3;
  void *v4;
  void *v5;

  -[MFAttachmentCompositionContext attachmentsManager](self, "attachmentsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentCompositionContext contextID](self, "contextID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentsForContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setHostIdentifier:(id)a3 forAttachment:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *hostIdentifierToAttachmentContentIDMap;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_hostIdentifierToAttachmentContentIDMap)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    hostIdentifierToAttachmentContentIDMap = self->_hostIdentifierToAttachmentContentIDMap;
    self->_hostIdentifierToAttachmentContentIDMap = v7;

  }
  objc_msgSend(v6, "contentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostIdentifierToAttachmentContentIDMap, "setObject:forKeyedSubscript:", v9, v10);

}

- (id)attachmentForHostIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostIdentifierToAttachmentContentIDMap, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentCompositionContext attachmentsManager](self, "attachmentsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentForContentID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSURL)attachmentsBaseURL
{
  return self->_attachmentsBaseURL;
}

- (void)setAttachmentsBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsBaseURL, a3);
}

- (MFAttachmentManager)attachmentsManager
{
  return self->_attachmentsManager;
}

- (void)setAttachmentsManager:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsManager, 0);
  objc_storeStrong((id *)&self->_attachmentsBaseURL, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_hostIdentifierToAttachmentContentIDMap, 0);
}

@end
