@implementation EKEventAttachmentCellController

+ (BOOL)_attachmentIsViewable:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "URLForPendingFileCopy");
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_7;
  }
  objc_msgSend(v3, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 || (objc_msgSend(v3, "URL"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_msgSend(v3, "URLForPendingFileCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9 != 0;

  }
LABEL_7:

  return v5;
}

+ (id)_keyForAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "URLForPendingFileCopy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "URLForPendingFileCopy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (id)cellControllersForAttachments:(id)a3 givenExistingControllers:(id)a4 sourceIsManaged:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  EKEventAttachmentCellController *v32;
  id v34;
  void *v35;
  id obj;
  unsigned int v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v35 = v8;
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v34 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    v37 = v5;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          if (+[EKEventAttachmentCellController _attachmentIsViewable:](EKEventAttachmentCellController, "_attachmentIsViewable:", v15))
          {
            objc_msgSend((id)objc_opt_class(), "_keyForAttachment:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKey:", v15, v16);

            v5 = v37;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v12);
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v38, "count"));
    v9 = v35;
    if (v35)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v35;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v44;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
            objc_msgSend(v22, "attachment");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "refresh")
              && (objc_msgSend((id)objc_opt_class(), "_keyForAttachment:", v23),
                  v24 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v38, "objectForKey:", v24),
                  v25 = (void *)objc_claimAutoreleasedReturnValue(),
                  v25,
                  v24,
                  v25))
            {
              objc_msgSend(v17, "addObject:", v22);
              objc_msgSend((id)objc_opt_class(), "_keyForAttachment:", v23);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "removeObjectForKey:", v26);

              objc_msgSend(v22, "setAttachment:", v23);
            }
            else
            {
              objc_msgSend(v22, "tearDown");
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        }
        while (v19);
      }

      v9 = v35;
      v5 = v37;
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v38, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v27);
          v32 = -[EKEventAttachmentCellController initWithAttachment:sourceIsManaged:]([EKEventAttachmentCellController alloc], "initWithAttachment:sourceIsManaged:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k), v5);
          objc_msgSend(v17, "addObject:", v32);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v29);
    }

    v7 = v34;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (EKEventAttachmentCellController)initWithAttachment:(id)a3 sourceIsManaged:(BOOL)a4
{
  id v6;
  EKEventAttachmentCellController *v7;
  EKEventAttachmentCellController *v8;
  EKEventAttachmentCell *v9;
  EKEventAttachmentCell *cell;
  EKEventAttachmentCell *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKEventAttachmentCellController;
  v7 = -[EKEventAttachmentCellController init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    -[EKEventAttachmentCellController setAttachment:](v7, "setAttachment:", v6);
    v8->_sourceIsManaged = a4;
    v9 = -[EKEventAttachmentCell initWithStyle:reuseIdentifier:]([EKEventAttachmentCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("AttachmentCell"));
    cell = v8->_cell;
    v8->_cell = v9;

    v11 = v8->_cell;
    -[EKEventAttachmentCellController attachment](v8, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttachmentCell setAttachment:](v11, "setAttachment:", v12);

  }
  return v8;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  obj = v4;
  if (!v4)
  {
    -[EKEventAttachmentCellController tearDown](self, "tearDown");
    v4 = 0;
  }
  objc_storeWeak((id *)&self->_delegate, v4);

}

- (void)_clearDownloadID
{
  id downloadID;

  downloadID = self->_downloadID;
  self->_downloadID = 0;

}

- (void)tearDown
{
  id downloadID;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  downloadID = self->_downloadID;
  if (downloadID)
  {
    v4 = downloadID;
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EKEventAttachmentCellController_tearDown__block_invoke;
    block[3] = &unk_1E6018688;
    v8 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    -[EKEventAttachmentCellController _clearDownloadID](self, "_clearDownloadID");
  }
}

void __43__EKEventAttachmentCellController_tearDown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKAttachmentDomain"), 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelDownloadingAttachmentWithDownloadID:error:", v2, v3);

}

+ (id)_okLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_cannotOpenAttachmentLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cannot Open Attachment"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_attachmentDownloadErrorLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("An error occurred while downloading the attachment."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_downloadProgressStringWithDownloadedBytes:(id)a3 outOfTotalBytes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB34E8];
  v7 = a3;
  objc_msgSend(v6, "stringFromByteCount:countStyle:", objc_msgSend(v7, "longLongValue"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToNumber:", v9);

  v11 = 0;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "isEqualToNumber:", v12);

    if (v13)
    {
      v11 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", objc_msgSend(v5, "longLongValue"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v14))
      {
        v11 = v8;
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1E601DFA8, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v17, v8, v14);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v11;
}

- (void)_presentPreviewAttachmentInPreviewWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("attachmentLocalURL"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("attachmentFileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventAttachmentCellController _presentPreviewWithURL:filename:](self, "_presentPreviewWithURL:filename:", v7, v5);
  -[EKEventAttachmentCellController cell](self, "cell");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showSpinner:", 0);

}

- (unint64_t)supportedInterfaceOrientationMaskForInterfaceOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 2)
    return 2;
  else
    return qword_1AFA138E0[a3 - 2];
}

- (void)_presentPreviewWithURL:(id)a3 filename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  EKAttachmentQLItem *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[EKEventAttachmentCellController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewControllerForAttachmentCellController:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[EKAttachmentQLItem initWithURL:filename:]([EKAttachmentQLItem alloc], "initWithURL:filename:", v7, v6);
  if (objc_msgSend(getQLPreviewControllerClass(), "canPreviewItem:", v10))
  {
    v11 = objc_alloc((Class)getQLPreviewControllerClass());
    v27[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithPreviewItems:", v12);

    objc_msgSend(v13, "setIsContentManaged:", self->_sourceIsManaged);
    -[EKEventAttachmentCellController cell](self, "cell");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "interfaceOrientation");

    objc_msgSend(v13, "setForcedSupportedInterfaceOrientations:", -[EKEventAttachmentCellController supportedInterfaceOrientationMaskForInterfaceOrientation:](self, "supportedInterfaceOrientationMaskForInterfaceOrientation:", v17));
    objc_msgSend(v9, "presentViewController:animated:completion:", v13, 1, 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend((id)objc_opt_class(), "_cannotOpenAttachmentLocalizedString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("This type of file is not supported."), &stru_1E601DFA8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend((id)objc_opt_class(), "_okLocalizedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v24);

    -[EKEventAttachmentCellController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "parentViewControllerForAttachmentCellController:", self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "presentViewController:animated:completion:", v13, 1, 0);
  }

}

- (void)_openExternalAttachmentURLInBrowser:(id)a3
{
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Open attachment in web browser?"), &stru_1E601DFA8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("This attachment is a download link to an external website, would you like to continue opening the attachment in web browser?"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  EventKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_1E601DFA8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__EKEventAttachmentCellController__openExternalAttachmentURLInBrowser___block_invoke;
  v20[3] = &unk_1E60185C0;
  v21 = v4;
  v15 = v4;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v11, 0, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v16);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v17);

  -[EKEventAttachmentCellController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parentViewControllerForAttachmentCellController:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "presentViewController:animated:completion:", v9, 1, 0);
}

void __71__EKEventAttachmentCellController__openExternalAttachmentURLInBrowser___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:withOptions:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70]);

}

- (id)attachmentFilename
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[EKAttachment fileName](self->_attachment, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Untitled Attachment"), &stru_1E601DFA8, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)event
{
  EKEventAttachmentCellControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "owningEventForAttachmentCellController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)cellSelected
{
  void *v3;
  EKAttachment *attachment;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id downloadID;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _QWORD block[5];

  -[EKAttachment localURL](self->_attachment, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  attachment = self->_attachment;
  if (v3)
    -[EKAttachment localURL](attachment, "localURL");
  else
    -[EKAttachment URLForPendingFileCopy](attachment, "URLForPendingFileCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "scheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v5, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURLWithPath:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }
  -[EKEventAttachmentCellController attachmentFilename](self, "attachmentFilename");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment UUID](self->_attachment, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttachmentCellController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "requiresOpeningAttachmentAsLink");

  if (v17)
  {
    -[EKAttachment URL](self->_attachment, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttachmentCellController _openExternalAttachmentURLInBrowser:](self, "_openExternalAttachmentURLInBrowser:", v18);
LABEL_9:

    goto LABEL_18;
  }
  objc_msgSend(v5, "pathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("zip")))
  {
    v20 = objc_msgSend(v11, "isEqualToString:", CFSTR("zip"));

    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CA9FC8], "createTempDestinationURLWithExtension:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = UnzipArchive();

      if (v23)
        -[EKEventAttachmentCellController _presentPreviewWithURL:filename:](self, "_presentPreviewWithURL:filename:", v18, v10);

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v5)
  {
    -[EKEventAttachmentCellController _presentPreviewWithURL:filename:](self, "_presentPreviewWithURL:filename:", v5, v10);
    goto LABEL_18;
  }
  if (v12)
  {
    -[EKAttachment URL](self->_attachment, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      downloadID = self->_downloadID;

      if (!downloadID)
      {
        objc_msgSend(v13, "calendar");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "source");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "externalID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "calendar");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v29, "isSubscribed");

        if ((_DWORD)v27)
          v30 = objc_msgSend(v28, "compare:", CFSTR("Subscribed Calendars")) == 0;
        else
          v30 = 0;
        if (!v28 || v30)
        {
          objc_msgSend(v13, "calendar");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "eventStore");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "defaultCalendarForNewEvents");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "source");
          v32 = v28;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "externalID");
          v34 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v34;
          if (!v34)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __47__EKEventAttachmentCellController_cellSelected__block_invoke;
            block[3] = &unk_1E6018688;
            block[4] = self;
            dispatch_async(MEMORY[0x1E0C80D38], block);
            goto LABEL_18;
          }
        }
        v47 = v28;
        objc_msgSend(v13, "calendar");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "source");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v36, "sourceType") == 1)
        {
          v37 = 0;
          v38 = 0;
        }
        else
        {
          -[EKAttachment URL](self->_attachment, "URL");
          v45 = objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v36, "serverUsesSSL");
          objc_msgSend(v36, "serverHost");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          v42 = v41;
          if (v39)
            v43 = CFSTR("https");
          else
            v43 = CFSTR("http");
          objc_msgSend(v41, "setScheme:", v43);
          objc_msgSend(v42, "setHost:", v40);
          objc_msgSend(v42, "URL");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = (void *)v45;
          if (!objc_msgSend(MEMORY[0x1E0D0C258], "attachmentURL:matchesServerURL:", v45, v38))
          {
            -[EKEventAttachmentCellController promptToDownloadAttachment](self, "promptToDownloadAttachment");
            goto LABEL_37;
          }
        }
        -[EKEventAttachmentCellController startAttachmentDownload](self, "startAttachmentDownload");
LABEL_37:

      }
    }
  }
LABEL_18:

}

void __47__EKEventAttachmentCellController_cellSelected__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_cannotOpenAttachmentLocalizedString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_attachmentDownloadErrorLocalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend((id)objc_opt_class(), "_okLocalizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAction:", v6);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewControllerForAttachmentCellController:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "presentViewController:animated:completion:", v3, 1, 0);
}

- (void)promptToDownloadAttachment
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("The attachment is on a different server than the event."), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Would you like to download it from “%@”?"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment URL](self->_attachment, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Download"), &stru_1E601DFA8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1E601DFA8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v10, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__EKEventAttachmentCellController_promptToDownloadAttachment__block_invoke;
  v20[3] = &unk_1E60185C0;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v12, 0, v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v16);
  objc_msgSend(v15, "addAction:", v17);
  -[EKEventAttachmentCellController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parentViewControllerForAttachmentCellController:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "presentViewController:animated:completion:", v15, 1, 0);
}

uint64_t __61__EKEventAttachmentCellController_promptToDownloadAttachment__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAttachmentDownload");
}

- (void)startAttachmentDownload
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id downloadID;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];

  -[EKEventAttachmentCellController cell](self, "cell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showSpinner:", 1);

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke;
  aBlock[3] = &unk_1E601C218;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  -[EKEventAttachmentCellController event](self, "event");
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_3;
  v16[3] = &unk_1E601C240;
  v16[4] = self;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  v7 = _Block_copy(v16);
  objc_msgSend(v6, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "externalID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAttachment UUID](self->_attachment, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginDownloadingAttachmentWithUUID:accountID:queue:progressBlock:completionBlock:", v12, v10, v13, v5, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  downloadID = self->_downloadID;
  self->_downloadID = v14;

}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_downloadProgressStringWithDownloadedBytes:outOfTotalBytes:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_2;
    v11[3] = &unk_1E6018EC0;
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "cell");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v1);

}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[5];

  v5 = a4;
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_4;
    block[3] = &unk_1E6018688;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(v5, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("EKAttachmentDomain"));

    if ((v8 & 1) == 0)
    {
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_5;
      v17[3] = &unk_1E6018EC0;
      v9 = *(void **)(a1 + 40);
      v17[4] = *(_QWORD *)(a1 + 32);
      v18 = v9;
      v10 = (void *)MEMORY[0x1E0C80D38];
      dispatch_async(MEMORY[0x1E0C80D38], v17);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "refresh");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "localURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("attachmentLocalURL"));
      objc_msgSend(*(id *)(a1 + 32), "attachmentFilename");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("attachmentFileName"));

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_6;
      v15[3] = &unk_1E6018EC0;
      v15[4] = *(_QWORD *)(a1 + 32);
      v16 = v12;
      v14 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_clearDownloadID");

}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cell");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showSpinner:", 0);

}

void __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_5(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend((id)objc_opt_class(), "_cannotOpenAttachmentLocalizedString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSubscribed");

  if ((v3 & 1) != 0)
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Attachments on subscribed calendar events cannot be downloaded."), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_attachmentDownloadErrorLocalizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend((id)objc_opt_class(), "_okLocalizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentViewControllerForAttachmentCellController:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __58__EKEventAttachmentCellController_startAttachmentDownload__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentPreviewAttachmentInPreviewWithInfo:", *(_QWORD *)(a1 + 40));
}

- (void)previewControllerWillDismiss:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("EKDocumentQuickLookWillEndNotification"), v4);

}

- (EKEventAttachmentCell)cell
{
  return (EKEventAttachmentCell *)objc_getProperty(self, a2, 16, 1);
}

- (EKAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (EKEventAttachmentCellControllerDelegate)delegate
{
  return (EKEventAttachmentCellControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong(&self->_downloadID, 0);
}

@end
