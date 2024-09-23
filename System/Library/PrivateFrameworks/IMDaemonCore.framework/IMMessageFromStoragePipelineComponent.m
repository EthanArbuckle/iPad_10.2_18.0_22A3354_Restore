@implementation IMMessageFromStoragePipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t processingType;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  unint64_t v13;
  _BOOL8 v14;
  NSObject *v15;
  _BOOL8 v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id broadcaster;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  __CFString *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  const __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = IMOSLoggingEnabled(v5);
  if ((_DWORD)v6)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      processingType = self->_processingType;
      v9 = CFSTR("Unknown");
      if (processingType == 1)
        v9 = CFSTR("Post");
      if (processingType)
        v10 = (__CFString *)v9;
      else
        v10 = CFSTR("Pre");
      v11 = v10;
      *(_DWORD *)buf = 138412546;
      v49 = v11;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "<IMMessageFromStoragePipelineComponent> Started processing type (%@) for guid %@", buf, 0x16u);

    }
  }
  v12 = 16;
  v13 = self->_processingType;
  if (v13 == 1)
  {
    if (objc_msgSend(v4, "isLastFromStorage"))
    {
      v16 = -[IMMessageFromStoragePipelineComponent _itemIsEligibleForStorageControllerWithInput:](self, "_itemIsEligibleForStorageControllerWithInput:", v4);
      if (v16)
      {
        if (IMOSLoggingEnabled(v16))
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "    Last item from storage finished processing", buf, 2u);
          }

        }
        -[IMDMessageFromStorageController noteLastItemProcessed](self->_storageController, "noteLastItemProcessed");
      }
    }
    v18 = -[IMDMessageFromStorageController isAwaitingStorageTimer](self->_storageController, "isAwaitingStorageTimer");
    if (v18
      || (objc_msgSend(v4, "messageItems"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "count") == 0,
          v19,
          v20))
    {
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "    Suppressing message from storage update.", buf, 2u);
        }

      }
      v6 = -[IMDMessageFromStorageController noteSuppressedMessageUpdate:](self->_storageController, "noteSuppressedMessageUpdate:", v5);
    }
    else
    {
      if (IMOSLoggingEnabled(v18))
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "messageItems");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");
          objc_msgSend(v4, "account");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "service");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "internalName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          broadcaster = self->_broadcaster;
          *(_DWORD *)buf = 134218498;
          v49 = (__CFString *)v23;
          v50 = 2112;
          v51 = v26;
          v52 = 2048;
          v53 = broadcaster;
          _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "    Updated messages: %lu for service: %@ with broadcaster: %p", buf, 0x20u);

        }
      }
      objc_msgSend(v4, "messageItems", 16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)IMCreateSerializedItemsFromArray();

      v29 = self->_broadcaster;
      objc_msgSend(v4, "account");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "service");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "internalName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chat");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "chatIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "chat");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "service:chat:style:messagesUpdated:", v32, v34, objc_msgSend(v35, "style"), v47);

      v12 = v46;
    }
  }
  else if (!v13)
  {
    if (objc_msgSend(v4, "isLastFromStorage")
      && (v14 = -[IMMessageFromStoragePipelineComponent _itemIsEligibleForStorageControllerWithInput:](self, "_itemIsEligibleForStorageControllerWithInput:", v4)))
    {
      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "    Last item from storage", buf, 2u);
        }

      }
      v6 = -[IMDMessageFromStorageController noteLastItemFromStorage:](self->_storageController, "noteLastItemFromStorage:", v5);
    }
    else
    {
      v6 = -[IMMessageFromStoragePipelineComponent _itemIsEligibleForStorageControllerWithInput:](self, "_itemIsEligibleForStorageControllerWithInput:", v4);
      if ((_DWORD)v6)
      {
        if (IMOSLoggingEnabled(v6))
        {
          OSLogHandleForIMFoundationCategory();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isFromStorage"));
            v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v49 = v37;
            _os_log_impl(&dword_1D1413000, v36, OS_LOG_TYPE_INFO, "    Is from storage (%@)", buf, 0xCu);

          }
        }
        v6 = -[IMDMessageFromStorageController noteItemFromStorage:extendsStorageTimer:](self->_storageController, "noteItemFromStorage:extendsStorageTimer:", v5, objc_msgSend(v4, "isFromStorage"));
      }
    }
  }
  if (IMOSLoggingEnabled(v6))
  {
    OSLogHandleForIMFoundationCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = *(uint64_t *)((char *)&self->super.super.isa + v12);
      v41 = CFSTR("Unknown");
      if (v40 == 1)
        v41 = CFSTR("Post");
      if (v40)
        v42 = (__CFString *)v41;
      else
        v42 = CFSTR("Pre");
      v43 = v42;
      *(_DWORD *)buf = 138412546;
      v49 = v43;
      v50 = 2112;
      v51 = v5;
      _os_log_impl(&dword_1D1413000, v39, OS_LOG_TYPE_INFO, "    Processed type (%@) for guid %@", buf, 0x16u);

    }
  }
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);

  return v44;
}

- (IMMessageFromStoragePipelineComponent)initWithStorageProcessingType:(unint64_t)a3 storageController:(id)a4 broadcaster:(id)a5
{
  id v9;
  id v10;
  IMMessageFromStoragePipelineComponent *v11;
  IMMessageFromStoragePipelineComponent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageFromStoragePipelineComponent;
  v11 = -[IMMessageFromStoragePipelineComponent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storageController, a4);
    v12->_processingType = a3;
    objc_storeStrong(&v12->_broadcaster, a5);
  }

  return v12;
}

- (BOOL)_itemIsEligibleForStorageControllerWithInput:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSObject *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[IMDMessageFromStorageController isAwaitingStorageTimer](self->_storageController, "isAwaitingStorageTimer");
  if (v5)
  {
    if (IMOSLoggingEnabled(v5))
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "    Storage timer is running, noting item to storage controller", buf, 2u);
      }

    }
    v7 = 1;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isScheduledMessagesCoreEnabled") & 1) == 0)
  {

    goto LABEL_15;
  }
  +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "GUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithGUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "scheduleType");

  if (v12 != 2)
  {
LABEL_15:
    v7 = objc_msgSend(v4, "isFromStorage");
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled(v13))
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "    Item is user scheduled message and storage timer is not running, does not need to be noted to storage controller", v16, 2u);
    }

  }
  v7 = 0;
LABEL_16:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageController, 0);
  objc_storeStrong(&self->_broadcaster, 0);
}

@end
