@implementation CKMediaObjectDeleteAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "selectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectionSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAnyItemSelected");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)canPerformOnImplicitSelection
{
  return 0;
}

- (void)performUserInteractionTask
{
  CKMediaObjectDeleteAssetActionPerformer *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 CanBeCancelled;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v50;
  uint64_t v51;
  id v52;
  CKMediaObjectDeleteAssetActionPerformer *v53;
  id obj;
  _QWORD v55[5];
  void *v56;
  uint64_t v57;
  _QWORD v58[5];
  _QWORD v59[5];
  id v60;
  uint64_t v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v2 = self;
  v68 = *MEMORY[0x1E0C80C00];
  -[CKMediaObjectAssetActionPerformer chatItem](self, "chatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "message");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "fileTransferGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
  {
    -[PXAssetActionPerformer selectionSnapshot](v2, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isAnyItemSelected") & 1) != 0)
    {
      -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CanBeCancelled = _ChatItemCanBeCancelled(v9);

      if (CanBeCancelled)
      {
        if (_IMWillLog())
          _IMAlwaysLog();
        v11 = v8;
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v11, "allItemsEnumerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v64;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v64 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "chatItem");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v12, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
          }
          while (v15);
        }

        -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke;
        v62[3] = &unk_1E274A208;
        v62[4] = v2;
        -[CKMediaObjectDeleteAssetActionPerformer _performRetractScheduledChatItems:fromAggregateChatItem:completion:](v2, "_performRetractScheduledChatItems:fromAggregateChatItem:completion:", v12, v19, v62);

        goto LABEL_66;
      }
      v11 = v8;
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend(v11, "allItemsEnumerator");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v26)
      {
        v27 = v26;
        v53 = v2;
        obj = v25;
        v28 = v24;
        v51 = v6;
        v52 = v11;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v64 != v32)
              objc_enumerationMutation(obj);
            v34 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            objc_msgSend(v34, "mediaObject", v51);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (v35)
            {
              objc_msgSend(v35, "transferGUID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v37);

            }
            v38 = objc_msgSend(v34, "mediaType");
            if (v38 == 1)
              v39 = v29;
            else
              v39 = v29 + 1;
            if (v38 == 1)
              v40 = v31 + 1;
            else
              v40 = v31;
            if (v38 == 2)
              ++v30;
            else
              v29 = v39;
            if (v38 != 2)
              v31 = v40;

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        }
        while (v27);

        v6 = v51;
        if (v31)
        {
          v11 = v52;
          v2 = v53;
          v24 = v28;
          if (!(v30 | v29))
          {
            v41 = 1;
LABEL_63:

            if (objc_msgSend(v24, "count"))
            {
              v59[0] = MEMORY[0x1E0C809B0];
              v59[1] = 3221225472;
              v50 = v30 + v31 + v29;
              v59[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_2;
              v59[3] = &unk_1E274DD80;
              v59[4] = v2;
              v60 = v24;
              v61 = v6;
              v12 = v24;
              -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v2, "_presentDeleteConfirmationDialogForTypedCount:completionHandler:", v50, v41, v59);
              v46 = v60;
LABEL_65:

LABEL_66:
              goto LABEL_70;
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObjectDeleteAssetActionPerformer: Selected items are not media objects"));
            v47 = objc_claimAutoreleasedReturnValue();

LABEL_68:
            v11 = (id)v47;
            goto LABEL_69;
          }
        }
        else
        {
          v11 = v52;
          v2 = v53;
          v24 = v28;
        }
      }
      else
      {

        v31 = 0;
        v30 = 0;
        v29 = 0;
      }
      if (v29)
        v48 = 0;
      else
        v48 = v31 == 0;
      if (!v48 || v30 == 0)
        v41 = 0;
      else
        v41 = 2;
      goto LABEL_63;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObjectDeleteAssetActionPerformer: No items selected for delete action"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_69:
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](v2, "completeUserInteractionTaskWithSuccess:error:", 0, v11);
    goto LABEL_70;
  }
  -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v11 = 0;
    goto LABEL_69;
  }
  -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetActionPerformer chatItem](v2, "chatItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = _ChatItemCanBeCancelled(v22);

  if (!v23)
  {
    objc_msgSend(v11, "mediaObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v11, "mediaObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "mediaType");
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_4;
      v55[3] = &unk_1E274DD80;
      if (v44 == 3)
        v45 = 1;
      else
        v45 = 2 * (v44 == 2);
      v55[4] = v2;
      v56 = v43;
      v57 = v6;
      v12 = v43;
      -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:](v2, "_presentDeleteConfirmationDialogForTypedCount:completionHandler:", 1, v45, v55);
      v46 = v56;
      goto LABEL_65;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("CKMediaObjectDeleteAssetActionPerformer: attachment part item doesn't have a media object"));
    v47 = objc_claimAutoreleasedReturnValue();
    goto LABEL_68;
  }
  if (_IMWillLog())
    _IMAlwaysLog();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_3;
  v58[3] = &unk_1E274A208;
  v58[4] = v2;
  -[CKMediaObjectDeleteAssetActionPerformer _performRetractScheduledChatItem:completion:](v2, "_performRetractScheduledChatItem:completion:", v11, v58);
LABEL_70:

}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "chatActionHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteMediaObjectAttachmentGUIDs:originalStackCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __69__CKMediaObjectDeleteAssetActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "chatActionHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "transferGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteMediaObjectAttachmentGUIDs:originalStackCount:", v5, *(_QWORD *)(a1 + 48));

  }
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(id)a3 completionHandler:(id)a4
{
  unint64_t var0;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;

  var0 = a3.var0;
  v6 = a4;
  if (v6)
  {
    if (var0)
    {
      PXLocalizationKeyForMediaType();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)v7;
      objc_msgSend(v9, "localizedStringForKey:value:table:", v7, &stru_1E276D870, CFSTR("ChatKit"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v10, var0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceLayoutDirection");

      if (v13 == 1)
        v14 = CFSTR("\u200F");
      else
        v14 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (CKIsRunningInMacCatalyst())
      {
        PXLocalizationKeyForMediaType();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("ChatKit"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        CKFrameworkBundle();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("DELETE_WARNING"), &stru_1E276D870, CFSTR("ChatKit"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v36, v38, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v40 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke;
      v49[3] = &unk_1E274B330;
      v41 = v6;
      v50 = v41;
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v15, 2, v49);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAction:", v42);

      v47[0] = v40;
      v47[1] = 3221225472;
      v47[2] = __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke_2;
      v47[3] = &unk_1E274B330;
      v43 = v41;
      v48 = v43;
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v17, 1, v47);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addAction:", v44);

      if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v39))
      {
        IMLogHandleForCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:].cold.3((uint64_t)v39, v45);

        (*((void (**)(id, _QWORD))v43 + 2))(v43, 0);
      }

    }
    else
    {
      IMLogHandleForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);

      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CKMediaObjectDeleteAssetActionPerformer _presentDeleteConfirmationDialogForTypedCount:completionHandler:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

  }
}

uint64_t __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke(uint64_t a1)
{
  if (_IMWillLog())
    _IMAlwaysLog();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __107__CKMediaObjectDeleteAssetActionPerformer__presentDeleteConfirmationDialogForTypedCount_completionHandler___block_invoke_2(uint64_t a1)
{
  if (_IMWillLog())
    _IMAlwaysLog();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performRetractScheduledChatItem:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a4;
  v6 = a3;
  -[CKMediaObjectAssetActionPerformer chatActionHelper](self, "chatActionHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "retractScheduledChatItem:", v6);

  v8[2]();
}

- (void)_performRetractScheduledChatItems:(id)a3 fromAggregateChatItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a5;
  v8 = a4;
  v9 = a3;
  -[CKMediaObjectAssetActionPerformer chatActionHelper](self, "chatActionHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "retractScheduledChatItems:fromAggregateChatItem:", v9, v8);

  v11[2]();
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 CanBeCancelled;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScheduledMessagesEnabled");

  if (v6
    && (objc_msgSend(v4, "chatItem"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        CanBeCancelled = _ChatItemCanBeCancelled(v7),
        v7,
        CanBeCancelled))
  {
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("CANCEL");
  }
  else
  {
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("DELETE");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("trash");
}

+ (id)createPreviewActionWithActionManager:(id)a3 handler:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CKMediaObjectDeleteAssetActionPerformer;
  objc_msgSendSuper2(&v6, sel_createPreviewActionWithActionManager_handler_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setAttributes:", 2);
  return v4;
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "No completion handler for delete confirmation", a5, a6, a7, a8, 0);
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "No items for delete confirmation", a5, a6, a7, a8, 0);
}

- (void)_presentDeleteConfirmationDialogForTypedCount:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Failed to present alert (%@) for delete. Cancelling deletion", (uint8_t *)&v2, 0xCu);
}

@end
