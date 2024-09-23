@implementation PXPhotosUIViewController(MessagesSupport)

- (id)ck_transitionView
{
  return objc_getAssociatedObject(a1, sel_ck_transitionView);
}

- (void)setCk_transitionView:()MessagesSupport
{
  id v4;
  void *v5;
  id value;

  value = a3;
  objc_msgSend(a1, "ck_transitionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != value)
  {
    objc_msgSend(a1, "ck_transitionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_setAssociatedObject(a1, sel_ck_transitionView, value, (void *)1);
  }

}

- (id)ck_chatController
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, sel_ck_chatController);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setCk_chatController:()MessagesSupport
{
  id v4;
  _CKPhotosSupportWeakBox *value;

  if (a3)
  {
    v4 = a3;
    value = -[_CKPhotosSupportWeakBox initWithObject:]([_CKPhotosSupportWeakBox alloc], "initWithObject:", v4);

  }
  else
  {
    value = 0;
  }
  objc_setAssociatedObject(a1, sel_ck_chatController, value, (void *)1);

}

- (id)excludedActivityTypesForPreviewController:()MessagesSupport
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentPreviewItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v4, "mediaType") & 0xFFFFFFFE) == 2)
  {
    v9[0] = *MEMORY[0x1E0D96E08];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Will exclude system UIActivityTypeSaveToCameraRoll from ShareSheet.", v8, 2u);
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)additionalActivitiesTypesForPreviewController:()MessagesSupport
{
  id v3;
  void *v4;
  id v5;
  CKSaveToPhotosActivity *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "currentPreviewItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "mediaType") & 0xFFFFFFFE) == 2)
    {
      v6 = -[CKSaveToPhotosActivity initWithMediaObject:presenterViewController:]([CKSaveToPhotosActivity alloc], "initWithMediaObject:presenterViewController:", v5, v3);
      v14[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v7, "count");
      v10 = &stru_1E276D870;
      if (!v9)
        v10 = CFSTR(" NOT");
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Will%@ present additional activities on ShareSheet.", (uint8_t *)&v12, 0xCu);
    }

  }
  return v7;
}

- (uint64_t)shouldHideInteractionOptions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "ck_chatController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "shouldHideInteractionOptions");

  return v2;
}

- (id)_assetReferenceForPreviewItem:()MessagesSupport
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  objc_msgSend(a1, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "assetReferenceForMediaObject:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (void)previewControllerWillDismiss:()MessagesSupport
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];

  v4 = a3;
  objc_msgSend(a1, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfPreviewItemsInPreviewController:", v4);

  if (objc_msgSend(v6, "numberOfSections") < 1)
    v9 = 0;
  else
    v9 = objc_msgSend(v6, "numberOfItemsInSection:", 0);
  if (v8 == v9)
  {
    v10 = objc_msgSend(v4, "currentPreviewItemIndex");
    v12[0] = objc_msgSend(v6, "identifier");
    v12[1] = 0;
    v12[2] = v10;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v6, "assetReferenceAtItemIndexPath:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scrollToRevealAssetReference:completion:", v11, &__block_literal_global_374_3);

  }
}

- (uint64_t)previewControllerDidDismiss:()MessagesSupport
{
  void *v2;

  objc_msgSend(a1, "hiddenAssetReferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(a1, "setHiddenAssetReferences:animationType:", 0, 2);
  return objc_msgSend(a1, "setCk_transitionView:", 0);
}

- (id)previewController:()MessagesSupport transitionViewForPreviewItem:uncroppedSourceFrame:
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v32 = 138412290;
      v33 = v9;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "QuickLook did request preview view for transition to item {%@}.", (uint8_t *)&v32, 0xCu);
    }

  }
  objc_msgSend(a1, "gridView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rootLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createFenceWithType:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setTimeout:", 0.2);
  objc_msgSend(a1, "_assetReferenceForPreviewItem:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "regionOfInterestForAssetReference:image:shouldSnapshotPlaceholder:", v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v15, "placeholderViewFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "placeholderViewFactory");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v17)[2](v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(a1, "setCk_transitionView:", v18);
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0C99E60]);
    v38[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
    objc_msgSend(a1, "setHiddenAssetReferences:animationType:", v21, 2);

    objc_msgSend(a1, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rectInCoordinateSpace:", v22);
    objc_msgSend(v18, "setFrame:");

    objc_msgSend(a1, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v18);

    objc_msgSend(v18, "bounds");
    *a5 = v24;
    a5[1] = v25;
    a5[2] = v26;
    a5[3] = v27;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412802;
      v33 = v30;
      v34 = 2112;
      v35 = v15;
      v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "> For an item of type {%@} with a region of interest {%@}, we are returning preview view {%@}.", (uint8_t *)&v32, 0x20u);

    }
  }

  return v18;
}

- (uint64_t)previewController:()MessagesSupport editingModeForPreviewItem:
{
  return 0;
}

- (void)shouldShowReplyButtonForMediaObject:()MessagesSupport previewController:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "chatControllerPreviewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "chatControllerPreviewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v6, "chatControllerPreviewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "shouldShowReplyButtonForMediaObject:previewController:", v5, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)replyButtonTappedForMediaObject:()MessagesSupport previewController:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(a1, "chatItemForMediaObject:previewController:", v17, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend(v8, "mediaObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transferGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "transferGUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v12)
      {
        objc_msgSend(a1, "viewModel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assetActionManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "chatActionHelper");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "inlineReplyControllerForChatItem:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "presentViewController:animated:completion:", v16, 1, 0);
      }

    }
  }

}

- (id)chatItemForMediaObject:()MessagesSupport previewController:
{
  void *v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_assetReferenceForPreviewItem:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v1, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)previewControllerIsInGroupConversation:()MessagesSupport
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "chatControllerPreviewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "chatControllerPreviewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "chatControllerPreviewDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "previewControllerIsInGroupConversation:", v3);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (void)sendMessageAcknowledgment:()MessagesSupport chatItem:previewController:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  objc_msgSend(v7, "chatControllerPreviewDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "chatControllerPreviewDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v7, "chatControllerPreviewDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendMessageAcknowledgment:chatItem:previewController:", a3, v13, v7);

      objc_msgSend(v7, "updateBarButtonItems");
    }
  }

}

- (void)previewController:()MessagesSupport sendTapback:targetChatItem:isRemoval:
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v16, "chatControllerPreviewDelegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v16, "chatControllerPreviewDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v16, "chatControllerPreviewDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "previewController:sendTapback:targetChatItem:isRemoval:", v16, v9, v10, a6);

      objc_msgSend(v16, "updateBarButtonItems");
    }
  }

}

- (void)previewController:()MessagesSupport shouldShowTapbackAttributionForChatItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "chatControllerPreviewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "chatControllerPreviewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v5, "chatControllerPreviewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "previewController:shouldShowTapbackAttributionForChatItem:", v5, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)previewController:()MessagesSupport shouldShowTapbackPickerForChatItem:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "chatControllerPreviewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "chatControllerPreviewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(v5, "chatControllerPreviewDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "previewController:shouldShowTapbackPickerForChatItem:", v5, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)previewControllerShouldEnableStickerTapbacks:()MessagesSupport
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "chatControllerPreviewDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "chatControllerPreviewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "chatControllerPreviewDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v7, "previewControllerShouldEnableStickerTapbacks:", v3);

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)invisibleInkEffectControllerForPreviewController:()MessagesSupport
{
  return 0;
}

- (uint64_t)contextualCKChatItemsForPreviewController:()MessagesSupport
{
  return MEMORY[0x1E0C9AA60];
}

- (uint64_t)toolbarItemForIdentifier:()MessagesSupport
{
  return 0;
}

- (void)_handleBackButton
{
  void *v1;
  id v2;

  objc_msgSend(a1, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
