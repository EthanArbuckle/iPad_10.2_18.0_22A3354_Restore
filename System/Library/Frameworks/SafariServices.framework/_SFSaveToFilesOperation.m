@implementation _SFSaveToFilesOperation

- (_SFSaveToFilesOperation)initWithActivityItemProviderCollection:(id)a3
{
  id v5;
  _SFSaveToFilesOperation *v6;
  _SFSaveToFilesOperation *v7;
  _SFSaveToFilesOperation *v8;

  v5 = a3;
  v6 = -[_SFSaveToFilesOperation init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to delete temporary directory: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32___SFSaveToFilesOperation_start__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_showDocumentPickerForFileURL:(id)a3 sourceURL:(id)a4 willStartDownload:(BOOL)a5
{
  _BOOL8 v5;
  UIDocumentPickerViewController *v7;
  UIDocumentPickerViewController *documentPickerViewController;
  id v9;
  id WeakRetained;
  id v11;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0DC3730], "sf_documentPickerViewControllerWithURL:inMode:sourceURL:", a3, 2, a4);
  v7 = (UIDocumentPickerViewController *)objc_claimAutoreleasedReturnValue();
  documentPickerViewController = self->_documentPickerViewController;
  self->_documentPickerViewController = v7;

  -[UIDocumentPickerViewController setDelegate:](self->_documentPickerViewController, "setDelegate:", self);
  -[UIDocumentPickerViewController _setForPickingDownloadsFolder:](self->_documentPickerViewController, "_setForPickingDownloadsFolder:", v5);
  v9 = (id)directoryURLOfLastSuccessfulSave;
  if (!v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA530], "placeholderURLForDownloadsFolder");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  v11 = v9;
  -[UIDocumentPickerViewController setDirectoryURL:](self->_documentPickerViewController, "setDirectoryURL:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIDocumentPickerViewController _setAutomaticallyDismissesAfterCompletion:](self->_documentPickerViewController, "_setAutomaticallyDismissesAfterCompletion:", objc_msgSend(WeakRetained, "saveToFilesOperationShouldDismissViewControllerAfterCompletion:", self));
  objc_msgSend(WeakRetained, "saveToFilesOperation:presentViewController:", self, self->_documentPickerViewController);

}

- (void)_finishWithURL:(id)a3
{
  id v4;
  void (**downloadPlaceholderCompletionHandler)(id, id);
  id v6;
  _SFDownload *v7;
  _SFDownload *download;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _SFDownload *v14;
  id WeakRetained;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  downloadPlaceholderCompletionHandler = (void (**)(id, id))self->_downloadPlaceholderCompletionHandler;
  if (!downloadPlaceholderCompletionHandler)
  {
    download = self->_download;
    self->_download = 0;

    if (v4)
      goto LABEL_5;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  downloadPlaceholderCompletionHandler[2](downloadPlaceholderCompletionHandler, v4);
  v6 = self->_downloadPlaceholderCompletionHandler;
  self->_downloadPlaceholderCompletionHandler = 0;

  if (!v4)
  {
    +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = self->_download;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeDownloads:", v13);

    v14 = self->_download;
    self->_download = 0;

    goto LABEL_7;
  }
  v7 = self->_download;
  self->_download = 0;

LABEL_5:
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)directoryURLOfLastSuccessfulSave;
  directoryURLOfLastSuccessfulSave = v9;

  v11 = 1;
LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "saveToFilesOperation:didFinishWithSuccess:", self, v11);

}

- (id)_temporaryFileWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *containerDirectoryPath;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", CFSTR("File"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  containerDirectoryPath = self->_containerDirectoryPath;
  self->_containerDirectoryPath = v7;

  -[NSString stringByAppendingPathComponent:](self->_containerDirectoryPath, "stringByAppendingPathComponent:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "_web_pathWithUniqueFilenameForPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_copyFileData:(id)a3
{
  void (**v4)(id, void *, void *, _QWORD);
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _SFSaveToFilesOperation *v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id prepareDownloadPlaceholderHandler;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  _SFSaveToFilesOperation *v45;
  void (**v46)(id, void *, void *, _QWORD);
  _QWORD v47[5];
  void (**v48)(id, void *, void *, _QWORD);
  id v49;

  v4 = (void (**)(id, void *, void *, _QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "customizationControllerForSaveToFilesOperation:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "canShareAsStandaloneImage"))
  {
LABEL_12:
    v21 = objc_msgSend(v7, "canShareAsDownload");
    v20 = 0;
    goto LABEL_13;
  }
  v8 = 0;
LABEL_7:
  -[_SFActivityItemProviderCollection standaloneImageProvider](self->_collection, "standaloneImageProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_SFActivityItemProviderCollection standaloneImageProvider](self->_collection, "standaloneImageProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFActivityItemProviderCollection webView](self->_collection, "webView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_sf_suggestedFilename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_committedURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D4ED18];
    objc_msgSend(v12, "_MIMEType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "properFilenameForOriginalFilename:typeIdentifier:mimeType:sourceURL:", v13, 0, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSaveToFilesOperation _temporaryFileWithName:](self, "_temporaryFileWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0;
    LODWORD(v16) = objc_msgSend(v11, "writeToURL:options:error:", v18, 0, &v49);
    v19 = v49;
    if ((_DWORD)v16)
    {
      v4[2](v4, v18, v14, 0);
    }
    else
    {
      v26 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_SFSaveToFilesOperation _copyFileData:].cold.2(v26);
      v4[2](v4, 0, 0, 0);
    }

    goto LABEL_21;
  }
  if ((v8 & 1) == 0)
    goto LABEL_12;
  v20 = 1;
  v21 = 1;
LABEL_13:
  -[_SFActivityItemProviderCollection downloadProvider](self->_collection, "downloadProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v21 && v22)
  {
    objc_msgSend(v22, "item");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "quickLookDocument");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sourceURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v23, v25, 0);

    }
    else
    {
      v4[2](v4, 0, 0, 0);
    }
    goto LABEL_29;
  }
  if ((v20 & 1) != 0 || objc_msgSend(v7, "canShareAsWebArchive"))
  {
    -[_SFActivityItemProviderCollection webArchiveProvider](self->_collection, "webArchiveProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[_SFActivityItemProviderCollection webArchiveProvider](self->_collection, "webArchiveProvider");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v29 = *MEMORY[0x1E0CA5CC8];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke;
        v47[3] = &unk_1E4AC7128;
        v47[4] = self;
        v48 = v4;
        objc_msgSend(v12, "loadItemForTypeIdentifier:options:completionHandler:", v29, 0, v47);

      }
      else
      {
        v4[2](v4, 0, 0, 0);
      }
      goto LABEL_22;
    }
    if ((v20 & 1) != 0)
      goto LABEL_48;
  }
  if (objc_msgSend(v7, "canShareAsPDF"))
  {
LABEL_48:
    -[_SFActivityItemProviderCollection printProvider](self->_collection, "printProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[_SFActivityItemProviderCollection printProvider](self->_collection, "printProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pdfItemProvider");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v31;
      if (v31)
      {
        v32 = *MEMORY[0x1E0CA5C00];
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __41___SFSaveToFilesOperation__copyFileData___block_invoke_3;
        v43[3] = &unk_1E4AC7150;
        v44 = v31;
        v45 = self;
        v46 = v4;
        v33 = (id)objc_msgSend(v44, "loadDataRepresentationForTypeIdentifier:completionHandler:", v32, v43);

      }
      else
      {
        v4[2](v4, 0, 0, 0);
      }
LABEL_21:

LABEL_22:
      goto LABEL_45;
    }
  }
  if (-[_SFActivityItemProviderCollection displayingStandaloneMedia](self->_collection, "displayingStandaloneMedia"))
  {
    v34 = self;
    v35 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v36 = objc_msgSend(v35, "saveToFilesOperationSupportsDownloads:", v34);

      if (v36)
      {
        -[_SFActivityItemProviderCollection webView](self->_collection, "webView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_SFDownloadDispatcher sharedDownloadDispatcher](_SFDownloadDispatcher, "sharedDownloadDispatcher");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "startDownloadForCurrentURLFromWebView:", v23);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "setExplicitlySaved:", 1);
        +[_SFDownloadManager sharedManager](_SFDownloadManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDelegate:", v39);

        objc_msgSend(v38, "setPlaceholderImporter:", v34);
        v40 = MEMORY[0x1A8598C40](v4);
        prepareDownloadPlaceholderHandler = v34->_prepareDownloadPlaceholderHandler;
        v34->_prepareDownloadPlaceholderHandler = (id)v40;

LABEL_29:
        goto LABEL_45;
      }
    }
    else
    {

    }
  }
  v42 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    -[_SFSaveToFilesOperation _copyFileData:].cold.1(v42);
  v4[2](v4, 0, 0, 0);
LABEL_45:

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5;

  objc_msgSend(a4, "firstObject", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFSaveToFilesOperation _finishWithURL:](self, "_finishWithURL:", v5);

}

- (void)documentPickerWasCancelled:(id)a3
{
  -[_SFSaveToFilesOperation _finishWithURL:](self, "_finishWithURL:", 0);
}

- (void)importPlaceholderForDownload:(id)a3 fromURL:(id)a4 completionHandler:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id downloadPlaceholderCompletionHandler;
  id *p_prepareDownloadPlaceholderHandler;
  void (**prepareDownloadPlaceholderHandler)(id, id, void *, uint64_t);
  void *v15;
  id v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)MEMORY[0x1A8598C40]();
  downloadPlaceholderCompletionHandler = self->_downloadPlaceholderCompletionHandler;
  self->_downloadPlaceholderCompletionHandler = v11;

  objc_msgSend(v17, "setPlaceholderImporter:", 0);
  p_prepareDownloadPlaceholderHandler = &self->_prepareDownloadPlaceholderHandler;
  if (self->_prepareDownloadPlaceholderHandler)
  {
    objc_storeStrong((id *)&self->_download, a3);
    prepareDownloadPlaceholderHandler = (void (**)(id, id, void *, uint64_t))self->_prepareDownloadPlaceholderHandler;
    objc_msgSend(v17, "sourceURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    prepareDownloadPlaceholderHandler[2](prepareDownloadPlaceholderHandler, v9, v15, 1);

  }
  else
  {
    v10[2](v10, 0);
    p_prepareDownloadPlaceholderHandler = &self->_downloadPlaceholderCompletionHandler;
  }
  v16 = *p_prepareDownloadPlaceholderHandler;
  *p_prepareDownloadPlaceholderHandler = 0;

}

- (_SFSaveToFilesOperationDelegate)delegate
{
  return (_SFSaveToFilesOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong(&self->_prepareDownloadPlaceholderHandler, 0);
  objc_storeStrong(&self->_downloadPlaceholderCompletionHandler, 0);
  objc_storeStrong((id *)&self->_documentPickerViewController, 0);
  objc_storeStrong((id *)&self->_containerDirectoryPath, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_copyFileData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Unable to prepare data to save to Files", v1, 2u);
}

- (void)_copyFileData:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v3, v4, "Failed to save standalone image data: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

@end
