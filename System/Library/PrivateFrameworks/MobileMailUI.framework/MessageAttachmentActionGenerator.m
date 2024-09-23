@implementation MessageAttachmentActionGenerator

+ (id)_saveToCameraRollActionForFutureRepresentations:(id)a3 title:(id)a4 image:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke;
  v12[3] = &unk_1E9A02B90;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a4, a5, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "onScheduler:addSuccessBlock:", v6, &__block_literal_global);

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v2);
  }

}

void __96__MessageAttachmentActionGenerator__saveToCameraRollActionForFutureRepresentations_title_image___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "contentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MFCameraRollSaveAssetWithURL();
  v5 = 0;

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v2, "contentURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("failed to ingest %@ (%@)"), v6, v5);

  }
}

+ (id)saveImageActionForFutureRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SAVE_IMAGE"), &stru_1E9A04480, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6840]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_saveToCameraRollActionForFutureRepresentations:title:image:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)saveVideoActionForFutureRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SAVE_VIDEO"), &stru_1E9A04480, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6840]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_saveToCameraRollActionForFutureRepresentations:title:image:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)saveAllAttachmentsActionWithTitle:(id)a3 futureRepresentations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6848]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_saveToCameraRollActionForFutureRepresentations:title:image:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)quicklookActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 attachmentRect:(CGRect)a10 useFullScreenPresentation:(BOOL)a11 contentRepresentationHandlingDelegate:(id)a12 assetViewerManager:(id)a13
{
  double height;
  double width;
  double y;
  double x;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;

  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v23 = a3;
  v45 = a4;
  v44 = a5;
  v24 = a6;
  v43 = a7;
  v42 = a9;
  v46 = a12;
  v41 = v24;
  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
  {
    v25 = objc_alloc(MEMORY[0x1E0CC68C0]);
    BYTE1(v40) = objc_msgSend(v46, "isSourceManagedForURL:", v23);
    LOBYTE(v40) = a8;
    v26 = (void *)objc_msgSend(v25, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v23, 1, v45, v44, v24, v43, v40);
  }
  else
  {
    v26 = 0;
  }
  v27 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("QUICK_LOOK"), &stru_1E9A04480, CFSTR("Main"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6828]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __244__MessageAttachmentActionGenerator_quicklookActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_attachmentRect_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke;
  v47[3] = &unk_1E9A02BB8;
  v31 = v46;
  v48 = v31;
  v32 = v23;
  v49 = v32;
  objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v29, v30, 0, v47);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v34 = v42;
    objc_msgSend(a1, "quicklookActionForAttachmentContext:alternateAction:originView:attachmentRect:useFullScreenPresentation:", v26, v33, v42, a11, x, y, width, height);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("OPEN_IN_NEW_WINDOW"), &stru_1E9A04480, CFSTR("Main"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTitle:", v37);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6818]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setImage:", v38);

  }
  else
  {
    v35 = v33;
    v34 = v42;
  }

  return v35;
}

uint64_t __244__MessageAttachmentActionGenerator_quicklookActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_attachmentRect_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previewURL:", *(_QWORD *)(a1 + 40));
}

+ (id)markupDocumentActionForURL:(id)a3 messageObjectID:(id)a4 mailboxObjectID:(id)a5 subject:(id)a6 senderDisplayName:(id)a7 shouldShowReplyAll:(BOOL)a8 originView:(id)a9 useFullScreenPresentation:(BOOL)a10 contentRepresentationHandlingDelegate:(id)a11 assetViewerManager:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;

  HIDWORD(v39) = a10;
  v45 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v44 = a9;
  v42 = v18;
  v43 = a11;
  v40 = v20;
  v41 = v19;
  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
  {
    v22 = objc_alloc(MEMORY[0x1E0CC68C0]);
    BYTE1(v39) = objc_msgSend(v43, "isSourceManagedForURL:", v45);
    LOBYTE(v39) = a8;
    v23 = (void *)objc_msgSend(v22, "initWithAttachmentURL:editBehavior:messageObjectID:mailboxObjectID:subject:senderDisplayName:shouldShowReplyAll:contentManaged:", v45, 2, v18, v19, v20, v21, v39);
  }
  else
  {
    v23 = 0;
  }
  v24 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MARKUP_DOCUMENT"), &stru_1E9A04480, CFSTR("Main"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CC6800];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *MEMORY[0x1E0CC6800]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __234__MessageAttachmentActionGenerator_markupDocumentActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke;
  v46[3] = &unk_1E9A02BB8;
  v29 = v43;
  v47 = v29;
  v30 = v45;
  v48 = v30;
  objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v26, v28, 0, v46);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(a1, "quicklookActionForAttachmentContext:alternateAction:originView:attachmentRect:useFullScreenPresentation:", v23, v31, v44, HIDWORD(v39), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("MARKUP_DOCUMENT"), &stru_1E9A04480, CFSTR("Main"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTitle:", v34);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v21;
    v36 = v42;
    objc_msgSend(v32, "setImage:", v35);

  }
  else
  {
    v32 = v31;
    v37 = v21;
    v36 = v42;
  }

  return v32;
}

uint64_t __234__MessageAttachmentActionGenerator_markupDocumentActionForURL_messageObjectID_mailboxObjectID_subject_senderDisplayName_shouldShowReplyAll_originView_useFullScreenPresentation_contentRepresentationHandlingDelegate_assetViewerManager___block_invoke(uint64_t a1)
{
  if (LoadMarkupUI_loadPredicate != -1)
    dispatch_once(&LoadMarkupUI_loadPredicate, &__block_literal_global_199);
  return objc_msgSend(*(id *)(a1 + 32), "markupURL:", *(_QWORD *)(a1 + 40));
}

+ (id)quicklookActionForAttachmentContext:(id)a3 alternateAction:(id)a4 originView:(id)a5 attachmentRect:(CGRect)a6 useFullScreenPresentation:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  BOOL v28;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a3;
  v15 = a5;
  v16 = (void *)MEMORY[0x1E0DC3FA8];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __140__MessageAttachmentActionGenerator_quicklookActionForAttachmentContext_alternateAction_originView_attachmentRect_useFullScreenPresentation___block_invoke;
  v21[3] = &unk_1E9A02BE0;
  v28 = a7;
  v22 = v14;
  v23 = v15;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v17 = v15;
  v18 = v14;
  objc_msgSend(v16, "actionWithIdentifier:alternateAction:configurationProvider:", 0, a4, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __140__MessageAttachmentActionGenerator_quicklookActionForAttachmentContext_alternateAction_originView_attachmentRect_useFullScreenPresentation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v2 = objc_alloc(MEMORY[0x1E0DC3FB0]);
  objc_msgSend(*(id *)(a1 + 32), "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUserActivity:", v3);

  if (_os_feature_enabled_impl()
    && *(_BYTE *)(a1 + 80)
    && *(_QWORD *)(a1 + 40)
    && !CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    UIRectGetCenter();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B88]), "initWithContainer:center:", *(_QWORD *)(a1 + 40), v7, v8);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:target:", v5, v10, v9);
    objc_msgSend(v4, "setPreview:", v11);

    v12 = objc_alloc_init(MEMORY[0x1E0DC3FB8]);
    objc_msgSend(MEMORY[0x1E0DC3FC8], "_largeProminentPlacement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlacement:", v13);

    objc_msgSend(v4, "setOptions:", v12);
  }
  return v4;
}

@end
