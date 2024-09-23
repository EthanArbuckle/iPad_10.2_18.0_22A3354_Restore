@implementation ICAttachmentPreviewGeneratorOperationQueue

- (void)cancelOperationsForAttachment:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ICAttachmentPreviewGeneratorOperationQueue operations](self, "operations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "attachmentID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
          objc_msgSend(v10, "cancel");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)suspend
{
  unint64_t suspendCount;
  ICAttachmentPreviewGeneratorOperationQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  suspendCount = obj->_suspendCount;
  if (!suspendCount)
  {
    -[ICAttachmentPreviewGeneratorOperationQueue setSuspended:](obj, "setSuspended:", 1);
    suspendCount = obj->_suspendCount;
  }
  obj->_suspendCount = suspendCount + 1;
  objc_sync_exit(obj);

}

- (void)resume
{
  unint64_t suspendCount;
  unint64_t v3;
  ICAttachmentPreviewGeneratorOperationQueue *obj;

  obj = self;
  objc_sync_enter(obj);
  suspendCount = obj->_suspendCount;
  if (suspendCount)
  {
    v3 = suspendCount - 1;
    obj->_suspendCount = v3;
    if (!v3)
      -[ICAttachmentPreviewGeneratorOperationQueue setSuspended:](obj, "setSuspended:", 0);
  }
  objc_sync_exit(obj);

}

- (unint64_t)suspendCount
{
  return self->_suspendCount;
}

- (void)setSuspendCount:(unint64_t)a3
{
  self->_suspendCount = a3;
}

@end
