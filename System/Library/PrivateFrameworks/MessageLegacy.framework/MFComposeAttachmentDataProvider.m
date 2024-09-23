@implementation MFComposeAttachmentDataProvider

- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4
{
  MFComposeAttachmentDataProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFComposeAttachmentDataProvider;
  v6 = -[MFComposeAttachmentDataProvider init](&v8, sel_init);
  if (v6)
  {
    v6->_attachmentsData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[MFComposeAttachmentDataProvider addData:forContentID:](v6, "addData:forContentID:", a3, a4);
    v6->_attachmentsPlaceholderData = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v6->_attachmentsPasteboardData = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v6->_attachmentsUndoData = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeAttachmentDataProvider;
  -[MFComposeAttachmentDataProvider dealloc](&v3, sel_dealloc);
}

- (void)addData:(id)a3 forContentID:(id)a4
{
  id v7;

  if (a4)
  {
    if ((objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", a4), "isEqualToData:", a3) & 1) == 0)
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithData:", a3);
      -[NSMutableDictionary setValue:forKey:](self->_attachmentsData, "setValue:forKey:", v7, a4);

    }
  }
}

- (void)removeDataForAttachment:(id)a3
{
  uint64_t v4;

  if (a3)
  {
    v4 = objc_msgSend(a3, "lastPathComponent");
    -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v4);
  }
}

- (void)recordPasteboardDataForAttachments:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableDictionary removeAllObjects](self->_attachmentsPasteboardData, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(a3);
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lastPathComponent");
          if (objc_msgSend(v9, "length"))
          {
            v10 = -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v9);
            if (v10)
              -[NSMutableDictionary setObject:forKey:](self->_attachmentsPasteboardData, "setObject:forKey:", v10, v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v9);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
}

- (void)recordUndoDataForAttachments:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSMutableDictionary removeAllObjects](self->_attachmentsUndoData, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(a3);
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lastPathComponent");
          if (objc_msgSend(v9, "length"))
          {
            v10 = -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v9);
            if (v10)
              -[NSMutableDictionary setObject:forKey:](self->_attachmentsUndoData, "setObject:forKey:", v10, v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v9);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
}

- (id)_dataForAttachment:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "contentID");
  if (!objc_msgSend(v5, "length"))
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "url"), "lastPathComponent");
  return -[MFComposeAttachmentDataProvider dataForContentID:](self, "dataForContentID:", v5);
}

- (id)dataForContentID:(id)a3
{
  id v5;
  id v6;
  id v8;

  v5 = -[MFComposeAttachmentDataProvider rawDataForContentID:](self, "rawDataForContentID:");
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", v5))
  {
    v6 = -[NSCache objectForKey:](self->_attachmentsPlaceholderData, "objectForKey:", a3);
    if (!v6)
    {
      v8 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v5);
      if (v8)
      {
        v6 = +[MFAttachmentPlaceholder dataForPlaceholder:](MFAttachmentPlaceholder, "dataForPlaceholder:", v8);
        if (objc_msgSend(v6, "length"))
          -[NSCache setObject:forKey:](self->_attachmentsPlaceholderData, "setObject:forKey:", v6, a3);
      }
      else
      {
        v6 = 0;
      }
    }
    if (v6)
      return v6;
  }
  return v5;
}

- (id)rawDataForContentID:(id)a3
{
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:");
  if (!v5)
  {
    v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attachmentsPasteboardData, "objectForKey:", a3);
    if (!v5)
      v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attachmentsUndoData, "objectForKey:", a3);
  }
  if (!objc_msgSend(v5, "length"))
  {
    v6 = MFLogGeneral();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        -[MFComposeAttachmentDataProvider rawDataForContentID:].cold.2((uint64_t)a3, v6, v8, v9, v10, v11, v12, v13);
    }
    else if (v7)
    {
      -[MFComposeAttachmentDataProvider rawDataForContentID:].cold.1((uint64_t)a3, v6, v8, v9, v10, v11, v12, v13);
    }
  }
  return v5;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  uint64_t v11;
  MFError *v12;

  v10 = -[MFComposeAttachmentDataProvider _dataForAttachment:](self, "_dataForAttachment:");
  if (v10)
  {
    objc_msgSend(a4, "appendData:", v10);
    v11 = objc_msgSend(a3, "encodedFileSize");
    objc_msgSend(a5, "setCompletedUnitCount:", v11);
    objc_msgSend(a5, "setTotalUnitCount:", v11);
    objc_msgSend(a4, "done");
    v12 = 0;
  }
  else
  {
    v12 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not find data for compose attachment."), CFSTR("No Data Found"), 0);
  }
  (*((void (**)(id, BOOL, MFError *, _QWORD))a6 + 2))(a6, v10 != 0, v12, 0);
}

- (id)messageForAttachment:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id result;

  result = (id)objc_msgSend(a4, "attachmentStorageLocation");
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "part"), "partNumber")), "stringByAppendingPathComponent:", objc_msgSend(a3, "fileName"));
  return result;
}

- (void)rawDataForContentID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1C8839000, a2, a3, "No attachment for [%@]", a5, a6, a7, a8, 2u);
}

- (void)rawDataForContentID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_1C8839000, a2, a3, "Zero length attachment for [%@]", a5, a6, a7, a8, 2u);
}

@end
