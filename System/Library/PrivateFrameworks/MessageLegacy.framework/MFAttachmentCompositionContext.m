@implementation MFAttachmentCompositionContext

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[MFAttachmentCompositionContext attachments](self, "attachments");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "removeAttachmentForURL:", objc_msgSend(v8, "url"));
        objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "clearMetadataForAttachment:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "removeProviderForBaseURL:", -[MFAttachmentCompositionContext attachmentsBaseURL](self, "attachmentsBaseURL"));

  v9.receiver = self;
  v9.super_class = (Class)MFAttachmentCompositionContext;
  -[MFAttachmentCompositionContext dealloc](&v9, sel_dealloc);
}

- (NSArray)attachments
{
  return (NSArray *)objc_msgSend(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"), "attachmentsForContext:", -[MFAttachmentCompositionContext contextID](self, "contextID"));
}

- (NSString)contextID
{
  return self->_contextID;
}

- (NSURL)attachmentsBaseURL
{
  return self->_attachmentsBaseURL;
}

- (MFAttachmentCompositionContext)init
{
  return -[MFAttachmentCompositionContext initWithContextID:](self, "initWithContextID:", objc_msgSend(MEMORY[0x1E0CB3940], "mf_UUID"));
}

- (MFAttachmentCompositionContext)initWithContextID:(id)a3
{
  MFAttachmentCompositionContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFAttachmentCompositionContext;
  v4 = -[MFAttachmentCompositionContext init](&v6, sel_init);
  if (v4)
    v4->_contextID = (NSString *)a3;
  return v4;
}

- (void)setAttachmentsBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
