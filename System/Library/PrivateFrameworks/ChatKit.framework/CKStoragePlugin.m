@implementation CKStoragePlugin

+ (id)_representedApp
{
  return CFSTR("com.apple.MobileSMS");
}

- (CKStoragePlugin)init
{
  CKStoragePlugin *v2;
  CKStoragePlugin *v3;
  void *v4;
  void *v5;
  IMMessageDirectoryContents *v6;
  IMMessageDirectoryContents *messageDirectoryContents;
  uint64_t v8;
  PSSpecifier *initialAppSpecifier;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *privateWorkQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKStoragePlugin;
  v2 = -[CKStoragePlugin init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKStoragePlugin _loadTips](v2, "_loadTips");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__iCloudHooksSetEnabledReturned_, *MEMORY[0x1E0D35510], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__iCloudHooksValuesChanged_, *MEMORY[0x1E0D35518], 0);

    v6 = (IMMessageDirectoryContents *)objc_alloc_init(MEMORY[0x1E0D39900]);
    messageDirectoryContents = v3->_messageDirectoryContents;
    v3->_messageDirectoryContents = v6;

    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E276D870, 0, 0, 0, 0, 15, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    initialAppSpecifier = v3->_initialAppSpecifier;
    v3->_initialAppSpecifier = (PSSpecifier *)v8;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("_loadAppSpecifiers", v10);
    privateWorkQueue = v3->_privateWorkQueue;
    v3->_privateWorkQueue = (OS_dispatch_queue *)v11;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[STStorageOptionTip setDelegate:](self->_cachedAutoDeleteMessagesTip, "setDelegate:", 0);
  -[STStorageOptionTip setDelegate:](self->_cachedMessagesOniCloudTip, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKStoragePlugin;
  -[CKStoragePlugin dealloc](&v4, sel_dealloc);
}

- (void)calculateDirectorySizesIfNeeded
{
  id v3;
  id v4;
  void *v5;
  IMDirectoryContentsSizes *v6;
  IMDirectoryContentsSizes *messageDirectorySizes;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((-[IMMessageDirectoryContents gatherIfNeeded](self->_messageDirectoryContents, "gatherIfNeeded") & 1) != 0
    || !self->_messageDirectorySizes)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v3, "startTimingForKey:", CFSTR("sizes"));
    v4 = objc_alloc(MEMORY[0x1E0D39810]);
    -[IMMessageDirectoryContents allDirectoryContents](self->_messageDirectoryContents, "allDirectoryContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (IMDirectoryContentsSizes *)objc_msgSend(v4, "initWithDirectoryContents:", v5);
    messageDirectorySizes = self->_messageDirectorySizes;
    self->_messageDirectorySizes = v6;

    objc_msgSend(v3, "stopTimingForKey:", CFSTR("sizes"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "totalTimeForKey:", CFSTR("sizes"));
        v10 = 134217984;
        v11 = v9;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Calculated directory sizes in %f seconds", (uint8_t *)&v10, 0xCu);
      }

    }
  }
}

- (id)documentAppIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_representedApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)documentSpecifiersForApp:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *privateWorkQueue;
  _QWORD block[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_representedApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (!v6)
    return MEMORY[0x1E0C9AA60];
  -[CKStoragePlugin appSpecifiers](self, "appSpecifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKStoragePlugin appSpecifiers](self, "appSpecifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    privateWorkQueue = self->_privateWorkQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CKStoragePlugin_documentSpecifiersForApp___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(privateWorkQueue, block);
    v12[0] = self->_initialAppSpecifier;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

uint64_t __44__CKStoragePlugin_documentSpecifiersForApp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAppSpecifiers");
}

- (id)cloudDocumentSpecifiers
{
  -[CKStoragePlugin _loadiCloudAppSpecifiers](self, "_loadiCloudAppSpecifiers");
  return -[CKStoragePlugin cloudAppSpecifiers](self, "cloudAppSpecifiers");
}

- (id)externDataSizeAppIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_representedApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)externDataSizeForApp:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_representedApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    if (-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
    {
      -[CKStoragePlugin calculateDirectorySizesIfNeeded](self, "calculateDirectorySizesIfNeeded");
      -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "totalSize");
      v10 = v9;
      -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "totalPurgableSize");
      v14 = v13;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = (void *)MEMORY[0x1E0CB37F0];
          -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "totalSize");
          objc_msgSend(v16, "stringFromFileSize:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v20;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "             Total size: %@", (uint8_t *)&v38, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)MEMORY[0x1E0CB37F0];
          -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "totalPurgableSize");
          objc_msgSend(v22, "stringFromFileSize:", v24, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v26;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "    Total purgable size: %@", (uint8_t *)&v38, 0xCu);

        }
      }
      v27 = v10 - v14;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37F0], "stringFromFileSize:", v8 - v12, v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v29;
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Total non-purgable size: %@", (uint8_t *)&v38, 0xCu);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)MEMORY[0x1E0CB37F0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringFromHugeNumber:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v33;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Returning non-purgable size for display: %@", (uint8_t *)&v38, 0xCu);

        }
LABEL_23:

      }
    }
    else
    {
      v27 = -[CKStoragePlugin messageDatabaseSize](self, "messageDatabaseSize");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v34 = (void *)MEMORY[0x1E0CB37F0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v27);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringFromHugeNumber:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138412290;
          v39 = v36;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Returning database size for non MiC display: %@", (uint8_t *)&v38, 0xCu);

        }
        goto LABEL_23;
      }
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)_cloudKitEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)enableOptionForTip:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKStoragePlugin cachedAutoDeleteMessagesTip](self, "cachedAutoDeleteMessagesTip");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[CKStoragePlugin _enableAutoDeleteMessages](self, "_enableAutoDeleteMessages");
    goto LABEL_5;
  }
  -[CKStoragePlugin cachedMessagesOniCloudTip](self, "cachedMessagesOniCloudTip");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[CKStoragePlugin _enableMessagesOniCloud](self, "_enableMessagesOniCloud");
LABEL_5:
    v6 = v7;
  }

}

- (void)_loadAppSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD block[5];
  id v40;

  -[CKStoragePlugin appSpecifiers](self, "appSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKStoragePlugin _spaceSavedByReviewingLargeConversations](self, "_spaceSavedByReviewingLargeConversations"))
    {
      v5 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONS"), &stru_1E276D870, CFSTR("General"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    -[CKStoragePlugin _loadAttachmentSizes](self, "_loadAttachmentSizes");
    -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D35AD8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_1E276D870, CFSTR("General"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

    }
    -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D35AE0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "longLongValue");

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("VIDEOS"), &stru_1E276D870, CFSTR("General"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

    }
    -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D35AC8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "longLongValue");

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("GIFSANDSTICKERS"), &stru_1E276D870, CFSTR("General"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v28, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v29);

    }
    -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D35AD0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "longLongValue");

    if (v32)
    {
      v33 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("OTHER"), &stru_1E276D870, CFSTR("General"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v36);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__CKStoragePlugin__loadAppSpecifiers__block_invoke;
    block[3] = &unk_1E274A108;
    block[4] = self;
    v40 = v4;
    v38 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    objc_msgSend((id)objc_opt_class(), "_representedApp");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStoragePlugin reloadSpecifiersForApp:](self, "reloadSpecifiersForApp:", v37);

  }
}

void __37__CKStoragePlugin__loadAppSpecifiers__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setAppSpecifiers:", v2);

}

- (void)_loadiCloudAppSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKStoragePlugin cloudAppSpecifiers](self, "cloudAppSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D804E8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONVERSATIONS"), &stru_1E276D870, CFSTR("General"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel__spaceTakenForSpecifier_, objc_opt_class(), 2, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v7);

    v8 = (void *)objc_msgSend(v9, "copy");
    -[CKStoragePlugin setCloudAppSpecifiers:](self, "setCloudAppSpecifiers:", v8);

  }
}

- (void)_loadAttachmentSizes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  id v13;
  NSObject *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id obj;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  _QWORD v58[4];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return;
  if (!-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
  {
    IMDAttachmentSpaceTakenByAttachmentClass();
    v50 = (id)objc_claimAutoreleasedReturnValue();
    -[CKStoragePlugin setSpaceTakenByAttachmentClass:](self, "setSpaceTakenByAttachmentClass:", v50);

    return;
  }
  -[CKStoragePlugin calculateDirectorySizesIfNeeded](self, "calculateDirectorySizesIfNeeded");
  v34 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v34, "startTimingForKey:", CFSTR("sizes"));
  -[CKStoragePlugin messageDirectoryContents](self, "messageDirectoryContents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDirectoryContents");
  v49 = (id)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v49, "fileInfoMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
  if (!v4)
  {
    v37 = 0;
    v38 = 0;
    v35 = 0;
    v46 = 0;
    v44 = 0;
    goto LABEL_47;
  }
  v37 = 0;
  v38 = 0;
  v35 = 0;
  v46 = 0;
  v44 = 0;
  v5 = *(_QWORD *)v54;
  v47 = *MEMORY[0x1E0C998E0];
  v45 = *MEMORY[0x1E0CEC4F8];
  v41 = *MEMORY[0x1E0CEC520];
  v39 = *MEMORY[0x1E0CEC640];
  v36 = *MEMORY[0x1E0CEC568];
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v54 != v5)
        objc_enumerationMutation(obj);
      v7 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v6);
      objc_msgSend(v49, "fileInfoMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if ((objc_msgSend(v9, "isPurgableOnDisk") & 1) != 0)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v51 = 0;
          v52 = 0;
          v12 = -[NSObject getResourceValue:forKey:error:](v10, "getResourceValue:forKey:error:", &v52, v47, &v51);
          v13 = v52;
          v14 = v51;
          if (v14)
            v15 = 0;
          else
            v15 = v12;
          if ((v15 & 1) != 0)
          {
            objc_msgSend(v9, "fileSize");
            v17 = v16;
            if ((objc_msgSend(v13, "conformsToType:", v45) & 1) != 0 || objc_msgSend(v9, "isSticker"))
            {
              v46 += v17;
            }
            else if (objc_msgSend(v13, "conformsToType:", v41))
            {
              v44 += v17;
            }
            else if ((objc_msgSend(v13, "conformsToType:", v39) & 1) != 0
                   || objc_msgSend(v13, "conformsToType:", v36))
            {
              objc_msgSend(v49, "fileInfoMap");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "path");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "im_livePhotoImagePath");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectForKeyedSubscript:", v20);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "path");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "im_isLivePhoto");
              if (v43)
                v23 = v22;
              else
                v23 = 0;

              if (v23)
              {
                if ((objc_msgSend(v43, "isPurgableOnDisk") & 1) == 0)
                {
                  v35 += v17;
                  v44 += v17;
                }
              }
              else
              {
                v38 += v17;
              }

            }
            else
            {
              v37 += v17;
            }
          }
          else
          {
            IMLogHandleForCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              -[NSObject localizedDescription](v14, "localizedDescription");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v60 = v7;
              v61 = 2112;
              v62 = v24;
              _os_log_error_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_ERROR, "Failed to get utiType for file at path: %@, with error: %@", buf, 0x16u);

            }
          }

        }
        else
        {
          IMLogHandleForCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v60 = v7;
            _os_log_error_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_ERROR, "Failed to create URL for path: %@", buf, 0xCu);
          }
        }

      }
      else
      {
        IMLogHandleForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v7;
          _os_log_error_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_ERROR, "Failed to find file info for path: %@", buf, 0xCu);
        }
      }

LABEL_28:
      ++v6;
    }
    while (v4 != v6);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
    v4 = v25;
  }
  while (v25);
LABEL_47:

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v60 = v35;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Total size of live photo videos attributed to photos section: %llu", buf, 0xCu);
    }

  }
  v57[0] = *MEMORY[0x1E0D35AD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v44);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v27;
  v57[1] = *MEMORY[0x1E0D35AE0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v38);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v28;
  v57[2] = *MEMORY[0x1E0D35AC8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v29;
  v57[3] = *MEMORY[0x1E0D35AD0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v37);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStoragePlugin setSpaceTakenByAttachmentClass:](self, "setSpaceTakenByAttachmentClass:", v31);

  objc_msgSend(v34, "stopTimingForKey:", CFSTR("sizes"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v34, "totalTimeForKey:", CFSTR("sizes"));
      *(_DWORD *)buf = 134217984;
      v60 = v33;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Calculated attachment sizes in %f seconds", buf, 0xCu);
    }

  }
}

- (id)_spaceTakenForSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  __CFString *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint8_t v22[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "detailControllerClass");
  if (v5 != objc_opt_class())
  {
    v6 = objc_msgSend(v4, "detailControllerClass");
    if (v6 != objc_opt_class())
    {
      -[CKStoragePlugin _loadAttachmentSizes](self, "_loadAttachmentSizes");
      v7 = objc_msgSend(v4, "detailControllerClass");
      if (v7 == objc_opt_class())
        v8 = (id)*MEMORY[0x1E0D35AD8];
      else
        v8 = 0;
      v12 = objc_msgSend(v4, "detailControllerClass");
      if (v12 == objc_opt_class())
      {
        v13 = (id)*MEMORY[0x1E0D35AE0];

        v8 = v13;
      }
      v14 = objc_msgSend(v4, "detailControllerClass");
      if (v14 == objc_opt_class())
      {
        v15 = (id)*MEMORY[0x1E0D35AC8];

        v8 = v15;
      }
      v16 = objc_msgSend(v4, "detailControllerClass");
      if (v16 == objc_opt_class())
      {
        v20 = (id)*MEMORY[0x1E0D35AD0];

        v8 = v20;
        if (v20)
          goto LABEL_17;
      }
      else if (v8)
      {
LABEL_17:
        -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "longLongValue");

        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v19, 0);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_20:

        goto LABEL_21;
      }
      v11 = &stru_1E276D870;
      goto LABEL_20;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Querying for space saved by conversations", v22, 2u);
    }

  }
  v10 = -[CKStoragePlugin _spaceSavedByReviewingLargeConversations](self, "_spaceSavedByReviewingLargeConversations");
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v10, 0);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v11;
}

- (void)_loadTips
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKStoragePlugin _autoDeleteMessagesTip](self, "_autoDeleteMessagesTip");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v7, "addObject:", v3);

  -[CKStoragePlugin _reviewLargeAttachmentsTip](self, "_reviewLargeAttachmentsTip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "addObject:", v4);

  -[CKStoragePlugin _messagesOniCloudTip](self, "_messagesOniCloudTip");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v7, "addObject:", v5);

  v6 = (void *)objc_msgSend(v7, "copy");
  -[STStoragePlugin setTips:](self, "setTips:", v6);

}

- (BOOL)_attachmentsTakeUpMoreSpaceThanBytes:(unint64_t)a3
{
  id v5;
  unint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  id v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
  {
    -[CKStoragePlugin calculateDirectorySizesIfNeeded](self, "calculateDirectorySizesIfNeeded");
    -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "totalAttachmentSize");
    v7 = v6 > a3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttachmentsDirectoryURL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = *MEMORY[0x1E0CB2AF0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v11;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v25;
      v16 = *MEMORY[0x1E0C99998];
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v5);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v23 = 0;
          v19 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v23, v16, 0);
          v20 = v23;
          v21 = v20;
          if (v19)
          {
            v14 += objc_msgSend(v20, "unsignedLongLongValue");
            if (v14 > a3)
            {

              v7 = 1;
              goto LABEL_14;
            }
          }

        }
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_14:

  }
  return v7;
}

- (BOOL)_attachmentsTakeUpSignificantSpace
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  -[CKStoragePlugin cachedAttachmentsTakeUpSignificantSpaceDate](self, "cachedAttachmentsTakeUpSignificantSpaceDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[CKStoragePlugin cachedAttachmentsTakeUpSignificantSpaceDate](self, "cachedAttachmentsTakeUpSignificantSpaceDate"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "timeIntervalSinceNow"), v7 = v6, v5, v4, v7 < -10.0))
  {
    -[CKStoragePlugin setCachedAttachmentsTakeUpSignificantSpace:](self, "setCachedAttachmentsTakeUpSignificantSpace:", -[CKStoragePlugin _attachmentsTakeUpMoreSpaceThanBytes:](self, "_attachmentsTakeUpMoreSpaceThanBytes:", 104857600));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStoragePlugin setCachedAttachmentsTakeUpSignificantSpaceDate:](self, "setCachedAttachmentsTakeUpSignificantSpaceDate:", v8);

  }
  return -[CKStoragePlugin cachedAttachmentsTakeUpSignificantSpace](self, "cachedAttachmentsTakeUpSignificantSpace");
}

- (IMCloudKitHooks)cloudKitHooks
{
  IMCloudKitHooks *cloudKitHooks;
  IMCloudKitHooks *v4;
  IMCloudKitHooks *v5;

  cloudKitHooks = self->_cloudKitHooks;
  if (!cloudKitHooks)
  {
    objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
    v4 = (IMCloudKitHooks *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cloudKitHooks;
    self->_cloudKitHooks = v4;

    cloudKitHooks = self->_cloudKitHooks;
  }
  return cloudKitHooks;
}

- (unint64_t)_spaceSavedByAutoDeleteMessages
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CKStoragePlugin lastQuerySpaceSavedByAutoDeletingMessagesTime](self, "lastQuerySpaceSavedByAutoDeletingMessagesTime");
  if (v3 == 0.0
    || (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
        v5 = v4,
        -[CKStoragePlugin lastQuerySpaceSavedByAutoDeletingMessagesTime](self, "lastQuerySpaceSavedByAutoDeletingMessagesTime"), v5 - v6 > 10.0))
  {
    -[CKStoragePlugin setCachedSpaceSavedByAutoDeletingMessages:](self, "setCachedSpaceSavedByAutoDeletingMessages:", IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays());
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[CKStoragePlugin setLastQuerySpaceSavedByAutoDeletingMessagesTime:](self, "setLastQuerySpaceSavedByAutoDeletingMessagesTime:");
  }
  return -[CKStoragePlugin cachedSpaceSavedByAutoDeletingMessages](self, "cachedSpaceSavedByAutoDeletingMessages");
}

- (BOOL)_forceShowingAutoDeleteMessagesTip
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ForceShowAutoDeleteMessages"), CFSTR("com.apple.MobileSMS"), 0) != 0;
}

- (BOOL)_shouldDisplayAutoDeleteMessagesTip
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[16];

  -[CKStoragePlugin cloudKitHooks](self, "cloudKitHooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Not showing Auto Delete Messages tip, MoC is on.", buf, 2u);
      }

    }
    v5 = 0;
  }
  else
  {
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("KeepMessageForDays"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat || !AppIntegerValue || (v5 = 0, AppIntegerValue >= 366))
      v5 = -[CKStoragePlugin _forceShowingAutoDeleteMessagesTip](self, "_forceShowingAutoDeleteMessagesTip")
        || -[CKStoragePlugin _spaceSavedByAutoDeleteMessages](self, "_spaceSavedByAutoDeleteMessages") > 0x6400000;
  }

  return v5;
}

- (id)_autoDeleteMessagesTip
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];

  if (-[CKStoragePlugin _shouldDisplayAutoDeleteMessagesTip](self, "_shouldDisplayAutoDeleteMessagesTip"))
  {
    -[CKStoragePlugin cachedAutoDeleteMessagesTip](self, "cachedAutoDeleteMessagesTip");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DAF430]);
      objc_msgSend((id)objc_opt_class(), "_representedApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRepresentedApp:", v5);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTO_DELETE_MESSAGES_TITLE"), &stru_1E276D870, CFSTR("General"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v7);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AUTO_DELETE_MESSAGES_INFO"), &stru_1E276D870, CFSTR("General"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInfoText:", v9);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTO_DELETE_MESSAGES_CONFIRM_TEXT"), &stru_1E276D870, CFSTR("General"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setConfirmationText:", v11);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTO_DELETE_MESSAGES_CONFIRM_BUTTON"), &stru_1E276D870, CFSTR("General"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setConfirmationButtonTitle:", v13);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "setMayCauseDataLoss:", 1);
      objc_msgSend(v4, "setEventualGain:", -[CKStoragePlugin _spaceSavedByAutoDeleteMessages](self, "_spaceSavedByAutoDeleteMessages"));
      objc_msgSend(v4, "setDelegate:", self);
      -[CKStoragePlugin setCachedAutoDeleteMessagesTip:](self, "setCachedAutoDeleteMessagesTip:", v4);

    }
    -[CKStoragePlugin cachedAutoDeleteMessagesTip](self, "cachedAutoDeleteMessagesTip");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Should not display Auto Delete Messages tip.", v17, 2u);
      }

    }
    v14 = 0;
  }
  return v14;
}

- (void)_enableAutoDeleteMessages
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  double v5;
  NSObject *v6;
  uint8_t v7[16];

  CFPreferencesSetAppValue(CFSTR("KeepMessageForDays"), &unk_1E2870D98, CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.KeepMessages.changed"), 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.imautomatichistorydeletionagent.prefchange"), 0, 0, 1u);
  -[CKStoragePlugin cachedAutoDeleteMessagesTip](self, "cachedAutoDeleteMessagesTip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setActivationPercent:", v5);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Enable Auto Delete Messages complete.", v7, 2u);
    }

  }
}

- (unint64_t)_spaceSavedByReviewingLargeConversations
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[CKStoragePlugin lastQuerySpaceSavedByReviewingLargeConversationsTime](self, "lastQuerySpaceSavedByReviewingLargeConversationsTime");
  if (v3 == 0.0
    || (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
        v5 = v4,
        -[CKStoragePlugin lastQuerySpaceSavedByReviewingLargeConversationsTime](self, "lastQuerySpaceSavedByReviewingLargeConversationsTime"), v5 - v6 > 10.0))
  {
    -[CKStoragePlugin setCachedSpaceSavedByReviewingLargeConversations:](self, "setCachedSpaceSavedByReviewingLargeConversations:", -[CKStoragePlugin _totalSpaceOfLargeConversations](self, "_totalSpaceOfLargeConversations"));
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[CKStoragePlugin setLastQuerySpaceSavedByReviewingLargeConversationsTime:](self, "setLastQuerySpaceSavedByReviewingLargeConversationsTime:");
  }
  return -[CKStoragePlugin cachedSpaceSavedByReviewingLargeConversations](self, "cachedSpaceSavedByReviewingLargeConversations");
}

- (unint64_t)_totalSpaceOfLargeConversations
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v21[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Requesting size of large conversations", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectToDaemon");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "large conversations - BlockUntilConnected finished", buf, 2u);
    }

  }
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  if (-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
  {
    -[CKStoragePlugin cloudAppSpecifiers](self, "cloudAppSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Loading synced conversations", v21, 2u);
        }

      }
    }
  }
  IMDAttachmentFindLargestConversations();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v21 = 138412290;
      v22 = v9;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Found dbLargestConversations: %@", v21, 0xCu);
    }

  }
  v11 = (void *)MEMORY[0x193FF4740]();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__CKStoragePlugin__totalSpaceOfLargeConversations__block_invoke;
  v16[3] = &unk_1E2759348;
  v16[4] = buf;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
  objc_autoreleasePoolPop(v11);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)*((_QWORD *)v18 + 3);
      *(_DWORD *)v21 = 134217984;
      v22 = v13;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Done enumerating, total space: %llu", v21, 0xCu);
    }

  }
  v14 = *((_QWORD *)v18 + 3);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __50__CKStoragePlugin__totalSpaceOfLargeConversations__block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("size"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v8;
  if (a3 >= 0x14)
    *a4 = 1;
}

- (int64_t)_totalSpaceOfAttachments
{
  void *v3;
  int64_t v4;
  int64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  __int128 buf;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
  {
    -[CKStoragePlugin calculateDirectorySizesIfNeeded](self, "calculateDirectorySizesIfNeeded");
    -[CKStoragePlugin messageDirectorySizes](self, "messageDirectorySizes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "totalAttachmentSize");
    v5 = v4;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)MEMORY[0x1E0CB37F0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringFromHugeNumber:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Reporting attachment size as %@", (uint8_t *)&buf, 0xCu);

      }
    }
  }
  else
  {
    -[CKStoragePlugin _loadAttachmentSizes](self, "_loadAttachmentSizes");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x2020000000;
    v15 = 0;
    -[CKStoragePlugin spaceTakenByAttachmentClass](self, "spaceTakenByAttachmentClass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __43__CKStoragePlugin__totalSpaceOfAttachments__block_invoke;
    v12[3] = &unk_1E2759370;
    v12[4] = &buf;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

    v5 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  return v5;
}

uint64_t __43__CKStoragePlugin__totalSpaceOfAttachments__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "longLongValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)messageDatabaseSize
{
  void *v2;
  NSObject *v3;
  unint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  IMSharedHelperMessagesRootFolderPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Get file size on path: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v4 = IMLegacyCalculateFileSizeForPath();

  return v4;
}

- (BOOL)_forceShowingReviewLargeAttachmentsTip
{
  return CFPreferencesGetAppBooleanValue(CFSTR("ForceShowReviewLargeAttachments"), CFSTR("com.apple.MobileSMS"), 0) != 0;
}

- (BOOL)_shouldDisplayReviewLargeAttachmentsTip
{
  return -[CKStoragePlugin _forceShowingReviewLargeAttachmentsTip](self, "_forceShowingReviewLargeAttachmentsTip")
      || -[CKStoragePlugin _attachmentsTakeUpSignificantSpace](self, "_attachmentsTakeUpSignificantSpace");
}

- (id)_reviewLargeAttachmentsTip
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[CKStoragePlugin _shouldDisplayReviewLargeAttachmentsTip](self, "_shouldDisplayReviewLargeAttachmentsTip"))
  {
    -[CKStoragePlugin cachedReviewLargeAttachmentsTip](self, "cachedReviewLargeAttachmentsTip");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0DAF420]);
      objc_msgSend((id)objc_opt_class(), "_representedApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setRepresentedApp:", v5);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REVIEW_LARGE_ATTACHMENTS_TITLE"), &stru_1E276D870, CFSTR("General"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTitle:", v7);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REVIEW_LARGE_ATTACHMENTS_INFO"), &stru_1E276D870, CFSTR("General"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInfoText:", v9);

      objc_msgSend(v4, "setSize:", -[CKStoragePlugin _totalSpaceOfAttachments](self, "_totalSpaceOfAttachments"));
      objc_msgSend(v4, "setDetailControllerClass:", objc_opt_class());
      -[CKStoragePlugin setCachedReviewLargeAttachmentsTip:](self, "setCachedReviewLargeAttachmentsTip:", v4);

    }
    -[CKStoragePlugin cachedReviewLargeAttachmentsTip](self, "cachedReviewLargeAttachmentsTip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (unint64_t)_spaceSavedByDeletingNonSyncedAttachments
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t NonSyncedAttachmentDiskSpace;
  CKStoragePlugin *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CKStoragePlugin lastQuerySpaceSavedByNonSyncedDeletingAttachments](self, "lastQuerySpaceSavedByNonSyncedDeletingAttachments");
  if (v3 == 0.0
    || (objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
        v5 = v4,
        -[CKStoragePlugin lastQuerySpaceSavedByNonSyncedDeletingAttachments](self, "lastQuerySpaceSavedByNonSyncedDeletingAttachments"), v5 - v6 > 10.0))
  {
    if (-[CKStoragePlugin _cloudKitEnabled](self, "_cloudKitEnabled"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[CKStoragePlugin messageDirectoryContents](self, "messageDirectoryContents", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messagesDirectoryContents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileInfoMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v15, "isAttachment") && objc_msgSend(v15, "isPurgableOnDisk"))
            {
              objc_msgSend(v15, "fileSize");
              v12 += v16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      v18 = self;
      NonSyncedAttachmentDiskSpace = v12;
    }
    else
    {
      NonSyncedAttachmentDiskSpace = IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace();
      v18 = self;
    }
    -[CKStoragePlugin setCachedSpaceSavedByDeletingNonSyncedAttachments:](v18, "setCachedSpaceSavedByDeletingNonSyncedAttachments:", NonSyncedAttachmentDiskSpace);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[CKStoragePlugin setLastQuerySpaceSavedByNonSyncedDeletingAttachments:](self, "setLastQuerySpaceSavedByNonSyncedDeletingAttachments:");
  }
  return -[CKStoragePlugin cachedSpaceSavedByDeletingNonSyncedAttachments](self, "cachedSpaceSavedByDeletingNonSyncedAttachments");
}

- (id)_messagesOniCloudTip
{
  NSObject *v2;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Don't display _messagesOniCloudTip", v4, 2u);
    }

  }
  return 0;
}

- (void)_enableMessagesOniCloud
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  double v7;
  id v8;

  -[CKStoragePlugin cloudKitHooks](self, "cloudKitHooks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 1.0;
  else
    v5 = -1.0;
  -[CKStoragePlugin cachedMessagesOniCloudTip](self, "cachedMessagesOniCloudTip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setActivationPercent:", v7);

  -[CKStoragePlugin cloudKitHooks](self, "cloudKitHooks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

}

- (void)_displayICloudErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ON_ICLOUD_ERROR_TITLE"), &stru_1E276D870, CFSTR("General"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ON_ICLOUD_ERROR_MESSAGE"), &stru_1E276D870, CFSTR("General"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ON_ICLOUDR_CONFIRM"), &stru_1E276D870, CFSTR("General"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v8, 1, 0);

  if (self->_cachedMessagesOniCloudTip)
  {
    -[CKStoragePlugin cachedMessagesOniCloudTip](self, "cachedMessagesOniCloudTip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 0;
    objc_msgSend(v13, "setActivationPercent:", v14);

  }
}

- (void)_refreshMessageOniCloudTipIfNeeded
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_cachedMessagesOniCloudTip)
  {
    -[CKStoragePlugin cloudKitHooks](self, "cloudKitHooks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastSyncDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = 1.0;
    else
      v5 = -1.0;
    -[CKStoragePlugin cachedMessagesOniCloudTip](self, "cachedMessagesOniCloudTip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v7 = v5;
    objc_msgSend(v6, "setActivationPercent:", v7);

    -[CKStoragePlugin cloudKitHooks](self, "cloudKitHooks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabled");
    v10 = objc_msgSend(v8, "eligibleForTruthZone");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = CFSTR("NO");
        if (v9)
          v13 = CFSTR("YES");
        else
          v13 = CFSTR("NO");
        if (v10)
          v14 = CFSTR("YES");
        else
          v14 = CFSTR("NO");
        v18 = 138412802;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        if (v4)
          v12 = CFSTR("YES");
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "_refreshMessageOniCloudTipIfNeeded enabled: %@, eligible: %@, completedSync: %@", (uint8_t *)&v18, 0x20u);
      }

    }
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MESSAGES_ON_ICLOUD_TIP_INFO"), &stru_1E276D870, CFSTR("General"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKStoragePlugin cachedMessagesOniCloudTip](self, "cachedMessagesOniCloudTip");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setInfoText:", v16);

    }
  }
}

- (void)_iCloudHooksSetEnabledReturned:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_cachedMessagesOniCloudTip)
  {
    objc_msgSend(a3, "userInfo");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D35508]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) != 0)
      -[CKStoragePlugin _refreshMessageOniCloudTipIfNeeded](self, "_refreshMessageOniCloudTipIfNeeded");
    else
      -[CKStoragePlugin _displayICloudErrorMessage](self, "_displayICloudErrorMessage");

  }
}

- (void)_iCloudHooksValuesChanged:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMessagesIniCloudVersion2");

  if ((v5 & 1) == 0)
    -[CKStoragePlugin _refreshMessageOniCloudTipIfNeeded](self, "_refreshMessageOniCloudTipIfNeeded");
}

- (STStorageOptionTip)cachedAutoDeleteMessagesTip
{
  return self->_cachedAutoDeleteMessagesTip;
}

- (void)setCachedAutoDeleteMessagesTip:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAutoDeleteMessagesTip, a3);
}

- (unint64_t)cachedSpaceSavedByAutoDeletingMessages
{
  return self->_cachedSpaceSavedByAutoDeletingMessages;
}

- (void)setCachedSpaceSavedByAutoDeletingMessages:(unint64_t)a3
{
  self->_cachedSpaceSavedByAutoDeletingMessages = a3;
}

- (double)lastQuerySpaceSavedByAutoDeletingMessagesTime
{
  return self->_lastQuerySpaceSavedByAutoDeletingMessagesTime;
}

- (void)setLastQuerySpaceSavedByAutoDeletingMessagesTime:(double)a3
{
  self->_lastQuerySpaceSavedByAutoDeletingMessagesTime = a3;
}

- (STStorageActionTip)cachedReviewLargeConversationsTip
{
  return self->_cachedReviewLargeConversationsTip;
}

- (void)setCachedReviewLargeConversationsTip:(id)a3
{
  objc_storeStrong((id *)&self->_cachedReviewLargeConversationsTip, a3);
}

- (unint64_t)cachedSpaceSavedByReviewingLargeConversations
{
  return self->_cachedSpaceSavedByReviewingLargeConversations;
}

- (void)setCachedSpaceSavedByReviewingLargeConversations:(unint64_t)a3
{
  self->_cachedSpaceSavedByReviewingLargeConversations = a3;
}

- (double)lastQuerySpaceSavedByReviewingLargeConversationsTime
{
  return self->_lastQuerySpaceSavedByReviewingLargeConversationsTime;
}

- (void)setLastQuerySpaceSavedByReviewingLargeConversationsTime:(double)a3
{
  self->_lastQuerySpaceSavedByReviewingLargeConversationsTime = a3;
}

- (STStorageActionTip)cachedReviewLargeAttachmentsTip
{
  return self->_cachedReviewLargeAttachmentsTip;
}

- (void)setCachedReviewLargeAttachmentsTip:(id)a3
{
  objc_storeStrong((id *)&self->_cachedReviewLargeAttachmentsTip, a3);
}

- (BOOL)cachedAttachmentsTakeUpSignificantSpace
{
  return self->_cachedAttachmentsTakeUpSignificantSpace;
}

- (void)setCachedAttachmentsTakeUpSignificantSpace:(BOOL)a3
{
  self->_cachedAttachmentsTakeUpSignificantSpace = a3;
}

- (NSDate)cachedAttachmentsTakeUpSignificantSpaceDate
{
  return self->_cachedAttachmentsTakeUpSignificantSpaceDate;
}

- (void)setCachedAttachmentsTakeUpSignificantSpaceDate:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAttachmentsTakeUpSignificantSpaceDate, a3);
}

- (STStorageOptionTip)cachedMessagesOniCloudTip
{
  return self->_cachedMessagesOniCloudTip;
}

- (void)setCachedMessagesOniCloudTip:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMessagesOniCloudTip, a3);
}

- (unint64_t)cachedSpaceSavedByDeletingNonSyncedAttachments
{
  return self->_cachedSpaceSavedByDeletingNonSyncedAttachments;
}

- (void)setCachedSpaceSavedByDeletingNonSyncedAttachments:(unint64_t)a3
{
  self->_cachedSpaceSavedByDeletingNonSyncedAttachments = a3;
}

- (double)lastQuerySpaceSavedByNonSyncedDeletingAttachments
{
  return self->_lastQuerySpaceSavedByNonSyncedDeletingAttachments;
}

- (void)setLastQuerySpaceSavedByNonSyncedDeletingAttachments:(double)a3
{
  self->_lastQuerySpaceSavedByNonSyncedDeletingAttachments = a3;
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_appSpecifiers, a3);
}

- (NSArray)cloudAppSpecifiers
{
  return self->_cloudAppSpecifiers;
}

- (void)setCloudAppSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAppSpecifiers, a3);
}

- (NSDictionary)spaceTakenByAttachmentClass
{
  return self->_spaceTakenByAttachmentClass;
}

- (void)setSpaceTakenByAttachmentClass:(id)a3
{
  objc_storeStrong((id *)&self->_spaceTakenByAttachmentClass, a3);
}

- (void)setCloudKitHooks:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitHooks, a3);
}

- (IMMessageDirectoryContents)messageDirectoryContents
{
  return self->_messageDirectoryContents;
}

- (IMDirectoryContentsSizes)messageDirectorySizes
{
  return self->_messageDirectorySizes;
}

- (PSSpecifier)initialAppSpecifier
{
  return self->_initialAppSpecifier;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateWorkQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_initialAppSpecifier, 0);
  objc_storeStrong((id *)&self->_messageDirectorySizes, 0);
  objc_storeStrong((id *)&self->_messageDirectoryContents, 0);
  objc_storeStrong((id *)&self->_cloudKitHooks, 0);
  objc_storeStrong((id *)&self->_spaceTakenByAttachmentClass, 0);
  objc_storeStrong((id *)&self->_cloudAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_cachedMessagesOniCloudTip, 0);
  objc_storeStrong((id *)&self->_cachedAttachmentsTakeUpSignificantSpaceDate, 0);
  objc_storeStrong((id *)&self->_cachedReviewLargeAttachmentsTip, 0);
  objc_storeStrong((id *)&self->_cachedReviewLargeConversationsTip, 0);
  objc_storeStrong((id *)&self->_cachedAutoDeleteMessagesTip, 0);
}

@end
