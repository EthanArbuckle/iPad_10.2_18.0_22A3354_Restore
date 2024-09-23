@implementation MFComposeAttachmentDataProvider

- (MFComposeAttachmentDataProvider)initWithData:(id)a3 forContentID:(id)a4
{
  id v6;
  id v7;
  MFComposeAttachmentDataProvider *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *attachmentsData;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFComposeAttachmentDataProvider;
  v8 = -[MFComposeAttachmentDataProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentsData = v8->_attachmentsData;
    v8->_attachmentsData = v9;

    -[MFComposeAttachmentDataProvider addData:forContentID:](v8, "addData:forContentID:", v6, v7);
    -[MFComposeAttachmentDataProvider _commonInitWithDataProvider:forContentID:](v8, "_commonInitWithDataProvider:forContentID:", v6, v7);
  }

  return v8;
}

- (MFComposeAttachmentDataProvider)initWithAttachmentDataItemProvider:(id)a3 forContentID:(id)a4
{
  id v6;
  id v7;
  MFComposeAttachmentDataProvider *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *attachmentsData;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFComposeAttachmentDataProvider;
  v8 = -[MFComposeAttachmentDataProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentsData = v8->_attachmentsData;
    v8->_attachmentsData = v9;

    -[MFComposeAttachmentDataProvider addDataItemProvider:forContentID:](v8, "addDataItemProvider:forContentID:", v6, v7);
    -[MFComposeAttachmentDataProvider _commonInitWithDataProvider:forContentID:](v8, "_commonInitWithDataProvider:forContentID:", v6, v7);
  }

  return v8;
}

- (void)_commonInitWithDataProvider:(id)a3 forContentID:(id)a4
{
  NSCache *v5;
  NSCache *attachmentsPlaceholderData;
  NSMutableDictionary *v7;
  NSMutableDictionary *attachmentsPasteboardData;
  NSMutableDictionary *v9;
  NSMutableDictionary *attachmentsUndoData;

  v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
  attachmentsPlaceholderData = self->_attachmentsPlaceholderData;
  self->_attachmentsPlaceholderData = v5;

  v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  attachmentsPasteboardData = self->_attachmentsPasteboardData;
  self->_attachmentsPasteboardData = v7;

  v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  attachmentsUndoData = self->_attachmentsUndoData;
  self->_attachmentsUndoData = v9;

}

- (void)addData:(id)a3 forContentID:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToData:", v10);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithData:", v10);
      -[NSMutableDictionary setValue:forKey:](self->_attachmentsData, "setValue:forKey:", v9, v6);

    }
  }

}

- (void)addDataItemProvider:(id)a3 forContentID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentsData, "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v7 != v8)) == 1)
      -[NSMutableDictionary setValue:forKey:](self->_attachmentsData, "setValue:forKey:", v8, v6);

  }
}

- (void)removeDataForAttachment:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v5);

    v4 = v6;
  }

}

- (void)recordPasteboardDataForAttachments:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeAllObjects](self->_attachmentsPasteboardData, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lastPathComponent", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              -[NSMutableDictionary setObject:forKey:](self->_attachmentsPasteboardData, "setObject:forKey:", v10, v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v9);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)recordUndoDataForAttachments:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeAllObjects](self->_attachmentsUndoData, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "lastPathComponent", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              -[NSMutableDictionary setObject:forKey:](self->_attachmentsUndoData, "setObject:forKey:", v10, v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsData, "removeObjectForKey:", v9);
            -[NSMutableDictionary removeObjectForKey:](self->_attachmentsPasteboardData, "removeObjectForKey:", v9);

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (id)_dataForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  -[MFComposeAttachmentDataProvider dataForContentID:](self, "dataForContentID:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dataForContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;

  v4 = a3;
  -[MFComposeAttachmentDataProvider rawDataForContentID:](self, "rawDataForContentID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MFAttachmentPlaceholder isPlaceholderSerializedRepresentation:](MFAttachmentPlaceholder, "isPlaceholderSerializedRepresentation:", v5))
  {
    -[NSCache objectForKey:](self->_attachmentsPlaceholderData, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
    +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[MFAttachmentPlaceholder dataForPlaceholder:](MFAttachmentPlaceholder, "dataForPlaceholder:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
        -[NSCache setObject:forKey:](self->_attachmentsPlaceholderData, "setObject:forKey:", v6, v4);

      if (v6)
      {
LABEL_3:
        v7 = v6;

        v5 = v7;
      }
    }
  }

  return v5;
}

- (id)rawDataForContentID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_attachmentsData, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = (id *)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__10;
  v40 = __Block_byref_object_dispose__10;
  v41 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[NSObject registeredTypeIdentifiers](v6, "registeredTypeIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke;
    v33 = &unk_1E4E8BDB8;
    v35 = &v36;
    v9 = v4;
    v34 = v9;
    v10 = (id)-[NSObject loadDataRepresentationForTypeIdentifier:completionHandler:](v6, "loadDataRepresentationForTypeIdentifier:completionHandler:", v8, &v30);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentsData, "setObject:forKeyedSubscript:", v37[5], v9, v30, v31, v32, v33);
LABEL_3:

    goto LABEL_8;
  }
  objc_storeStrong(v37 + 5, v5);
  v11 = v37[5];
  if (!v11)
  {
    -[NSMutableDictionary objectForKey:](self->_attachmentsPasteboardData, "objectForKey:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v37[5];
    v37[5] = (id)v12;

    v11 = v37[5];
    if (!v11)
    {
      -[NSMutableDictionary objectForKey:](self->_attachmentsUndoData, "objectForKey:", v4);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v37[5];
      v37[5] = (id)v14;

      v11 = v37[5];
    }
  }
  if (!objc_msgSend(v11, "length"))
  {
    if (v37[5])
    {
      MFLogGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[MFComposeAttachmentDataProvider rawDataForContentID:].cold.2((uint64_t)v4, v6, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      MFLogGeneral();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[MFComposeAttachmentDataProvider rawDataForContentID:].cold.1((uint64_t)v4, v6, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_3;
  }
LABEL_8:
  v16 = v37[5];
  _Block_object_dispose(&v36, 8);

  return v16;
}

void __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithData:", v5);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else if (v6)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke_cold_1(a1, (uint64_t)v7, v11);

  }
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, BOOL, void *, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, BOOL, void *, _QWORD))a6;
  -[MFComposeAttachmentDataProvider _dataForAttachment:](self, "_dataForAttachment:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v10, "appendData:", v13);
    v14 = objc_msgSend(v16, "encodedFileSize");
    objc_msgSend(v11, "setCompletedUnitCount:", v14);
    objc_msgSend(v11, "setTotalUnitCount:", v14);
    v15 = 0;
    objc_msgSend(v10, "done");
  }
  else
  {
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not find data for compose attachment."), CFSTR("No Data Found"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2](v12, v13 != 0, v15, 0);

}

- (id)messageForAttachment:(id)a3
{
  return 0;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsUndoData, 0);
  objc_storeStrong((id *)&self->_attachmentsPasteboardData, 0);
  objc_storeStrong((id *)&self->_attachmentsPlaceholderData, 0);
  objc_storeStrong((id *)&self->_attachmentsData, 0);
}

- (void)rawDataForContentID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, a2, a3, "No attachment for [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)rawDataForContentID:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A4F90000, a2, a3, "Zero length attachment for [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __55__MFComposeAttachmentDataProvider_rawDataForContentID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "failed to get attachment data for [%@], error:%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

@end
