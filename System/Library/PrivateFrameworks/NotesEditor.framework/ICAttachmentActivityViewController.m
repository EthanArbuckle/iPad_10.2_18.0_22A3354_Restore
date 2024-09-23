@implementation ICAttachmentActivityViewController

+ (id)makeWithAttachment:(id)a3 quickLookItemDelegate:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICAttachmentActivityViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NotesQuickLookActivityItem *v28;
  void *v29;
  uint64_t v30;
  NotesQuickLookActivity *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[3];
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "activityItems");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v7, "media");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12
      && objc_msgSend(v12, "hasFile")
      && (objc_msgSend(v13, "isPasswordProtected") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision") & 1) == 0)
    {
      v28 = objc_alloc_init(NotesQuickLookActivityItem);
      -[NotesQuickLookActivityItem setDelegate:](v28, "setDelegate:", v8);
      v35[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NotesQuickLookActivityItem setPreviewItems:](v28, "setPreviewItems:", v29);

      objc_msgSend(v11, "arrayByAddingObject:", v28);
      v30 = objc_claimAutoreleasedReturnValue();

      v31 = objc_alloc_init(NotesQuickLookActivity);
      objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)v30;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (ICDebugModeEnabled())
    {
      v15 = objc_alloc(MEMORY[0x1E0D64D20]);
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithIdentifier:", v16);

      objc_msgSend(v14, "arrayByAddingObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D64BB0]), "initWithObject:activityType:", v7, 1);
      objc_msgSend(v18, "arrayByAddingObject:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v20 = -[ICAttachmentActivityViewController initWithActivityItems:applicationActivities:]([ICAttachmentActivityViewController alloc], "initWithActivityItems:applicationActivities:", v11, v14);
    objc_msgSend(MEMORY[0x1E0C99D20], "ic_arrayFromNonNilObject:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setAttachments:](v20, "setAttachments:", v21);

    objc_msgSend(v7, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "account");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setIsContentManaged:](v20, "setIsContentManaged:", objc_msgSend(v23, "isManaged"));

    v24 = *MEMORY[0x1E0D63EF0];
    v34[0] = *MEMORY[0x1E0D96DC8];
    v34[1] = v24;
    v34[2] = *MEMORY[0x1E0D96E28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController setExcludedActivityTypes:](v20, "setExcludedActivityTypes:", v25);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      v26 = -2;
    else
      v26 = 7;
    -[ICAttachmentActivityViewController setModalPresentationStyle:](v20, "setModalPresentationStyle:", v26);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __90__ICAttachmentActivityViewController_makeWithAttachment_quickLookItemDelegate_completion___block_invoke;
    v32[3] = &unk_1EA7E1008;
    v33 = v9;
    -[ICAttachmentActivityViewController setCompletionWithItemsHandler:](v20, "setCompletionWithItemsHandler:", v32);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t __90__ICAttachmentActivityViewController_makeWithAttachment_quickLookItemDelegate_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performActivity:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICAttachmentActivityViewController inhibitPDFGenerationForActivityType:](self, "inhibitPDFGenerationForActivityType:", v5);

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)ICAttachmentActivityViewController;
    -[ICAttachmentActivityViewController _performActivity:](&v11, sel__performActivity_, v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D64BE0];
    -[ICAttachmentActivityViewController attachments](self, "attachments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentActivityViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__ICAttachmentActivityViewController__performActivity___block_invoke;
    v12[3] = &unk_1EA7DE8D0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v7, "generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:", v8, v10, self, v12);

  }
}

void __55__ICAttachmentActivityViewController__performActivity___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  objc_super v8;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v2, "writeGalleryPDFDataToPasteboardIfNecessaryForActivity:attachments:", v4, v5);

    if ((v6 & 1) == 0)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8.receiver = *(id *)(a1 + 32);
      v8.super_class = (Class)ICAttachmentActivityViewController;
      objc_msgSendSuper2(&v8, sel__performActivity_, v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancel");
  }
}

- (BOOL)inhibitPDFGenerationForActivityType:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[ICAttachmentActivityViewController ignoreAttachmentsForCopyToPasteboard](self, "ignoreAttachmentsForCopyToPasteboard")&& (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D96DA0]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[ICAttachmentActivityViewController activityTypesThatInhibitPDFGeneration](self, "activityTypesThatInhibitPDFGeneration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (BOOL)writeGalleryPDFDataToPasteboardIfNecessaryForActivity:(id)a3 attachments:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  uint64_t v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D96DA0]);

  if (v7)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v25 = v5;
      v9 = 0;
      v10 = *(_QWORD *)v31;
      v26 = (void *)*MEMORY[0x1E0CEC570];
      v27 = *MEMORY[0x1E0D637F0];
      v11 = 0x1E0DC3000uLL;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v13, "attachmentType") == 11)
          {
            objc_msgSend(MEMORY[0x1E0D64BE0], "pdfURLForAttachment:", v13);
            v14 = v8;
            v15 = v10;
            v16 = v11;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "pasteboardData");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "persistenceData");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v21, "ic_setNonNilObject:forKey:", v20, v27);
            objc_msgSend(v26, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "ic_setNonNilObject:forKey:", v18, v22);

            objc_msgSend(v29, "addObject:", v21);
            v11 = v16;
            v10 = v15;
            v8 = v14;
          }
          objc_msgSend(*(id *)(v11 + 2752), "generalPasteboard");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setItems:", v29);

          if (objc_msgSend(v29, "count"))
            v9 = 1;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v8);
      LOBYTE(v8) = v9 & 1;
      v5 = v25;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)activityTypesThatInhibitPDFGeneration
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.mobilenotes.markup");
  v3[1] = CFSTR("com.apple.mobilenotes.findInNote");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (BOOL)ignoreAttachmentsForCopyToPasteboard
{
  return self->_ignoreAttachmentsForCopyToPasteboard;
}

- (void)setIgnoreAttachmentsForCopyToPasteboard:(BOOL)a3
{
  self->_ignoreAttachmentsForCopyToPasteboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
