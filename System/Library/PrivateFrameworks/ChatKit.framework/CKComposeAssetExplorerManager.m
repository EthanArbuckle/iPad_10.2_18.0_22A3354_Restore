@implementation CKComposeAssetExplorerManager

- (CKComposeAssetExplorerManager)initWithInputController:(id)a3
{
  id v4;
  CKComposeAssetExplorerManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKComposeAssetExplorerManager;
  v5 = -[CKComposeAssetExplorerManager init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeAssetExplorerManager setPackagesToStage:](v5, "setPackagesToStage:", v6);

    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidatePhotosViewController");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeAssetExplorerManager setSavedData:](v5, "setSavedData:", v8);

    -[CKComposeAssetExplorerManager setAllItemsShouldNotAppearInShelf:](v5, "setAllItemsShouldNotAppearInShelf:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, sel__balloonPluginExtensionsLoaded_, *MEMORY[0x1E0D352B8], 0);

    -[CKComposeAssetExplorerManager setInputController:](v5, "setInputController:", v4);
  }

  return v5;
}

- (void)setInputController:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[CKComposeAssetExplorerManager allItemsShouldNotAppearInShelf](self, "allItemsShouldNotAppearInShelf"))
  {
    objc_storeStrong((id *)&self->_inputController, a3);
    -[CKComposeAssetExplorerManager tryToStagePendingPackages](self, "tryToStagePendingPackages");
  }

}

- (id)browser
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  IMBalloonExtensionIDWithSuffix();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForPluginIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photosBrowserViewControllerWithPluginPayloads:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Warning: Browser is nil!", v8, 2u);
        }

      }
      v4 = 0;
    }
  }

  return v4;
}

- (void)tryToStagePendingPackages
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  int v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[CKComposeAssetExplorerManager allItemsShouldNotAppearInShelf](self, "allItemsShouldNotAppearInShelf"))
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Staging: Items should not appear in shelf, not staging package", (uint8_t *)&v31, 2u);
    }
LABEL_35:

    return;
  }
  -[CKComposeAssetExplorerManager packagesToStage](self, "packagesToStage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Staging: No packages to try to stage, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_35;
  }
  -[CKComposeAssetExplorerManager inputController](self, "inputController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Staging: No packages to try to stage, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_35;
  }
  -[CKComposeAssetExplorerManager browser](self, "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sendDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeAssetExplorerManager inputController](self, "inputController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[CKComposeAssetExplorerManager inputController](self, "inputController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138412290;
          v32 = (uint64_t)v12;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Setting browser send delegate to %@", (uint8_t *)&v31, 0xCu);

        }
      }
      -[CKComposeAssetExplorerManager inputController](self, "inputController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSendDelegate:", v13);

    }
    objc_msgSend(v8, "sendDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    v16 = IMOSLoggingEnabled();
    if (!v15)
    {
      if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          -[CKComposeAssetExplorerManager packagesToStage](self, "packagesToStage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");
          v31 = 134217984;
          v32 = v19;
          _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Staging %lu packages to browser", (uint8_t *)&v31, 0xCu);

        }
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[CKComposeAssetExplorerManager packagesToStage](self, "packagesToStage", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v27 != v22)
              objc_enumerationMutation(v20);
            -[CKComposeAssetExplorerManager _stageAssetPackage:toBrowser:](self, "_stageAssetPackage:toBrowser:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), v8);
          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v21);
      }

      -[CKComposeAssetExplorerManager packagesToStage](self, "packagesToStage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeAllObjects");

      goto LABEL_44;
    }
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Browser send delegate is nil", (uint8_t *)&v31, 2u);
      }
LABEL_43:

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Staging: browser is nil, no staging", (uint8_t *)&v31, 2u);
    }
    goto LABEL_43;
  }
LABEL_44:

}

- (void)_stageAssetPackage:(id)a3 toBrowser:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "stageAssetToTransportAndNotifySendDelegate:", v5);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive to the photos browser", v8, 2u);
    }

  }
}

- (void)stageAssetPackage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (v4)
  {
    -[CKComposeAssetExplorerManager packagesToStage](self, "packagesToStage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[CKComposeAssetExplorerManager tryToStagePendingPackages](self, "tryToStagePendingPackages");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Received nil package, returning", v7, 2u);
    }

  }
}

- (id)generatePackageFromAssetURL:(id)a3 appendedVideoURL:(id)a4 previewImage:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t v16[16];
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[CKComposeAssetExplorerManager allItemsShouldNotAppearInShelf](self, "allItemsShouldNotAppearInShelf"))
  {
    if (generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator)
    {
      if (v9)
      {
LABEL_9:
        v17[0] = v8;
        v17[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v14 = (void *)v13;
        objc_msgSend((id)generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator, "generateAssetFromFileURLs:previewImage:error:", v13, v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
    }
    else
    {
      generatePackageFromAssetURL_appendedVideoURL_previewImage__IMAEFileAssetPackageGenerator = MEMORY[0x193FF3C18](CFSTR("AEFileAssetPackageGenerator"), CFSTR("AssetExplorer"));
      if (v9)
        goto LABEL_9;
    }
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "generatePackageFromAssetURL: Items should not appear in shelf, not generating a package", v16, 2u);
    }

  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)clearAndDisableShelfAndReturnPreviouslyShelvedData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "clearAndDisableShelfAndReturnPreviouslyShelvedData called.", v9, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposeAssetExplorerManager setPackagesToStage:](self, "setPackagesToStage:", v4);

  -[CKComposeAssetExplorerManager browser](self, "browser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearAllStagedPluginPackages");
  -[CKComposeAssetExplorerManager setAllItemsShouldNotAppearInShelf:](self, "setAllItemsShouldNotAppearInShelf:", 1);
  -[CKComposeAssetExplorerManager savedData](self, "savedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[CKComposeAssetExplorerManager setSavedData:](self, "setSavedData:", 0);
  return v7;
}

- (void)saveFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 fullyRealizedPreview:(id)a6 rawPreview:(id)a7 appendedVideoURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  CKComposeAssetExplorerManagerSavedData *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v21 = -[CKComposeAssetExplorerManagerSavedData initWithFileURL:filename:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:]([CKComposeAssetExplorerManagerSavedData alloc], "initWithFileURL:filename:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:", v19, v18, v17, v16, v15, v14);

  -[CKComposeAssetExplorerManager savedData](self, "savedData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v21);

}

- (CKChatInputController)inputController
{
  return self->_inputController;
}

- (NSMutableArray)packagesToStage
{
  return self->_packagesToStage;
}

- (void)setPackagesToStage:(id)a3
{
  objc_storeStrong((id *)&self->_packagesToStage, a3);
}

- (NSMutableArray)savedData
{
  return self->_savedData;
}

- (void)setSavedData:(id)a3
{
  objc_storeStrong((id *)&self->_savedData, a3);
}

- (BOOL)allItemsShouldNotAppearInShelf
{
  return self->_allItemsShouldNotAppearInShelf;
}

- (void)setAllItemsShouldNotAppearInShelf:(BOOL)a3
{
  self->_allItemsShouldNotAppearInShelf = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedData, 0);
  objc_storeStrong((id *)&self->_packagesToStage, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
}

@end
