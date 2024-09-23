@implementation _MSMessageAppBundleContext

- (_MSMessageAppBundleContext)initWithViewController:(id)a3 wantsLiveView:(BOOL)a4
{
  id v6;
  _MSMessageAppBundleContext *v7;
  _MSMessageAppBundleContext *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MSMessageAppBundleContext;
  v7 = -[_MSMessageAppBundleContext init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewController, v6);
    v8->_wantsLiveView = a4;
    if (!a4)
    {
      +[_MSExtensionGlobalState sharedInstance](_MSExtensionGlobalState, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setActiveExtensionContext:", v8);

    }
  }

  return v8;
}

- (UIViewController)stickerViewController
{
  UIViewController **p_viewController;
  id WeakRetained;
  id v4;

  p_viewController = &self->_viewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_loadWeakRetained((id *)p_viewController);
  else
    v4 = 0;

  return (UIViewController *)v4;
}

- (void)_sendWillBecomeActiveMessage
{
  void *v3;
  char v4;
  id v5;

  -[_MSMessageAppBundleContext viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_MSMessageAppBundleContext viewController](self, "viewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_MSMessageAppBundleContext initialFrameOfHostView](self, "initialFrameOfHostView");
    objc_msgSend(v5, "setInitialFrameBeforeAppearance:");

  }
}

- (CGRect)initialFrameOfHostView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_remoteViewProvidesExplicitSizeSnapshot
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteViewProvidesExplicitSizeSnapshot");

}

- (void)_remoteViewNeedsSizeMatchBeforeSnapshotSwap
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteViewNeedsSizeMatchBeforeSnapshotSwap");

}

- (void)_remoteViewDidBecomeReadyForDisplay
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_remoteViewDidBecomeReadyForDisplay");

}

- (void)_requestStickerExtensionMetadataDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_MSMessageAppBundleContext containingContext](self, "containingContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestStickerExtensionMetadataDictionary:", v4);

}

- (void)_requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_MSMessageAppBundleContext containingContext](self, "containingContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_requestPresentationWithStickerType:identifier:", v7, v6);

}

- (void)_hostDidBeginDeferredTeardown
{
  void *v3;
  char v4;
  _QWORD block[5];

  -[_MSMessageAppBundleContext viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59___MSMessageAppBundleContext__hostDidBeginDeferredTeardown__block_invoke;
    block[3] = &unk_1EA25C5A0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)beginDisablingUserInteraction
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___MSMessageAppBundleContext_beginDisablingUserInteraction__block_invoke;
  block[3] = &unk_1EA25C5A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)endDisablingUserInteraction
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___MSMessageAppBundleContext_endDisablingUserInteraction__block_invoke;
  block[3] = &unk_1EA25C5A0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_becomeActiveWithConversationState:(id)a3 presentationState:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _becomeActiveWithConversationState:presentationState:](self->_containingContext, "_becomeActiveWithConversationState:presentationState:", a3, a4);
}

- (void)_resignActive
{
  -[_MSMessageComposeExtensionImplProtocol _resignActive](self->_containingContext, "_resignActive");
}

- (void)_canSendMessage:(id)a3 conversationState:(id)a4 associatedText:(id)a5 completion:(id)a6
{
  -[_MSMessageComposeExtensionImplProtocol _canSendMessage:conversationState:associatedText:completion:](self->_containingContext, "_canSendMessage:conversationState:associatedText:completion:", a3, a4, a5, a6);
}

- (void)_requestContentSizeThatFits:(id)a3 presentationStyle:(id)a4 completionHandler:(id)a5
{
  -[_MSMessageComposeExtensionImplProtocol _requestContentSizeThatFits:presentationStyle:completionHandler:](self->_containingContext, "_requestContentSizeThatFits:presentationStyle:completionHandler:", a3, a4, a5);
}

- (void)_didUpdateMessage:(id)a3 conversationState:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _didUpdateMessage:conversationState:](self->_containingContext, "_didUpdateMessage:conversationState:", a3, a4);
}

- (void)_didReceiveMessage:(id)a3 conversationState:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _didReceiveMessage:conversationState:](self->_containingContext, "_didReceiveMessage:conversationState:", a3, a4);
}

- (void)_didStartSendingMessage:(id)a3 conversationState:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _didStartSendingMessage:conversationState:](self->_containingContext, "_didStartSendingMessage:conversationState:", a3, a4);
}

- (void)_didCancelSendingMessage:(id)a3 conversationState:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _didCancelSendingMessage:conversationState:](self->_containingContext, "_didCancelSendingMessage:conversationState:", a3, a4);
}

- (void)_didSelectGPAsset:(id)a3 sandboxExtension:(id)a4 recipeData:(id)a5 completion:(id)a6
{
  -[_MSMessageComposeExtensionImplProtocol _didSelectGPAsset:sandboxExtension:recipeData:completion:](self->_containingContext, "_didSelectGPAsset:sandboxExtension:recipeData:completion:", a3, a4, a5, a6);
}

- (void)_conversationDidChangeWithConversationState:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _conversationDidChangeWithConversationState:](self->_containingContext, "_conversationDidChangeWithConversationState:", a3);
}

- (void)_presentationWillChangeToPresentationState:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _presentationWillChangeToPresentationState:](self->_containingContext, "_presentationWillChangeToPresentationState:", a3);
}

- (void)_presentationDidChangeToPresentationState:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _presentationDidChangeToPresentationState:](self->_containingContext, "_presentationDidChangeToPresentationState:", a3);
}

- (void)_requestSnapshotThatFits:(id)a3 completion:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _requestSnapshotThatFits:completion:](self->_containingContext, "_requestSnapshotThatFits:completion:", a3, a4);
}

- (void)_requestSnapshotWithCompletion:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _requestSnapshotWithCompletion:](self->_containingContext, "_requestSnapshotWithCompletion:", a3);
}

- (void)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4 completion:(id)a5
{
  -[_MSMessageComposeExtensionImplProtocol _handleTextInputPayload:withPayloadID:completion:](self->_containingContext, "_handleTextInputPayload:withPayloadID:completion:", a3, a4, a5);
}

- (void)_didRemoveAssetArchiveWithIdentifier:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _didRemoveAssetArchiveWithIdentifier:](self->_containingContext, "_didRemoveAssetArchiveWithIdentifier:", a3);
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _prepareForPresentationWithCompletionHandler:](self->_containingContext, "_prepareForPresentationWithCompletionHandler:", a3);
}

- (void)_volumeButtonPressed:(BOOL)a3
{
  -[_MSMessageComposeExtensionImplProtocol _volumeButtonPressed:](self->_containingContext, "_volumeButtonPressed:", a3);
}

- (void)_setPluginIdentifierToShow:(id)a3 completion:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _setPluginIdentifierToShow:completion:](self->_containingContext, "_setPluginIdentifierToShow:completion:", a3, a4);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerToStoreWithRepresentations:completionHandler:](self->_containingContext, "_addStickerToStoreWithRepresentations:completionHandler:", a3, a4);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerToStoreWithRepresentations:completionWithStickerIDs:](self->_containingContext, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:", a3, a4);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerToStoreWithRepresentations:sourceRect:completion:](self->_containingContext, "_addStickerToStoreWithRepresentations:sourceRect:completion:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerToStoreWithRepresentations:sourceRect:effect:completion:](self->_containingContext, "_addStickerToStoreWithRepresentations:sourceRect:effect:completion:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerToStoreWithUISticker:sourceRect:completion:](self->_containingContext, "_addStickerToStoreWithUISticker:sourceRect:completion:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_prepareForAddStickerFromSubjectLift
{
  -[_MSMessageComposeExtensionImplProtocol _prepareForAddStickerFromSubjectLift](self->_containingContext, "_prepareForAddStickerFromSubjectLift");
}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  -[_MSMessageComposeExtensionImplProtocol _addStickerAnimationDidFinishWithCompletion:](self->_containingContext, "_addStickerAnimationDidFinishWithCompletion:", a3);
}

- (void)_didRemoveStickerPreview
{
  -[_MSMessageComposeExtensionImplProtocol _didRemoveStickerPreview](self->_containingContext, "_didRemoveStickerPreview");
}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  -[_MSMessageComposeExtensionImplProtocol _animatedStickerCreationProgressChanged:progress:](self->_containingContext, "_animatedStickerCreationProgressChanged:progress:", a3, a4);
}

- (void)stageAppItem:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stageAppItem:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)stageMediaItem:(id)a3 skipShelf:(BOOL)a4 forceStage:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_stageMediaItem:skipShelf:forceStage:completionHandler:", v11, v7, v6, v10);

}

- (void)stageRichLink:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stageRichLink:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_stageAssetArchive:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_removeAssetArchiveWithIdentifier:completionHandler:", v7, v6);

}

- (void)startDragMediaItem:(id)a3 frameInRemoteView:(CGRect)a4 fence:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_startDragMediaItem:frameInRemoteView:fence:completionHandler:", v15, v14, v13, x, y, width, height);

}

- (void)dragMediaItemMoved:(id)a3 frameInRemoteView:(CGRect)a4 rotation:(double)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a7;
  v16 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_dragMediaItemMoved:frameInRemoteView:rotation:scale:completionHandler:", v16, v15, x, y, width, height, a5, a6);

}

- (void)dragMediaItemCanceled
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dragMediaItemCanceled");

}

- (void)stickerDruidDragStarted
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stickerDruidDragStarted");

}

- (void)stickerDruidDragEndedWithPayload:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stickerDruidDragEndedWithPayload:", v4);

}

- (void)stickerDruidDragEndedWithPayload:(id)a3 pluginIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stickerDruidDragEndedWithPayload:pluginIdentifier:", v7, v6);

}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  -[_MSMessageAppBundleContext requestPresentationStyle:](self, "requestPresentationStyle:", a3);
}

- (void)requestPresentationStyle:(unint64_t)a3
{
  id v4;

  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot request transition to transcript presentation style"), 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise");
      goto LABEL_6;
    }
    if (a3 != 3)
      return;
  }
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_requestPresentationStyle:", a3);
LABEL_6:

}

- (void)requestFullScreenModalPresentationWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestFullScreenModalPresentationWithSize:", width, height);

}

- (void)dismiss
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismiss");

}

- (void)dismissAndPresentPhotosApp
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissAndPresentPhotosApp");

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_presentAlertWithTitle:message:buttonTitle:completion:", v13, v12, v11, v10);

}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 destructiveButtonTitle:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_presentAlertWithTitle:message:buttonTitle:destructiveButtonTitle:completion:", v16, v15, v14, v13, v12);

}

- (void)presentAlertSheetWith:(id)a3 styles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_presentAlertSheetWith:styles:completion:", v10, v9, v8);

}

- (void)presentContextMenuWithButtonTitles:(id)a3 imageNames:(id)a4 buttonFrame:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  id v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_presentContextMenuWithButtonTitles:imageNames:buttonFrame:completion:", v15, v14, v13, x, y, width, height);

}

- (void)presentAlertSheetWithTitle:(id)a3 message:(id)a4 buttonTitles:(id)a5 styles:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_presentAlertSheetWithTitle:message:buttonTitles:styles:completion:", v16, v15, v14, v13, v12);

}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_canShowBrowserForPluginIdentifier:completion:", v7, v6);

}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_showBrowserForPluginIdentifier:style:completion:", v9, a4, v8);

}

- (void)requestResize
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_requestResize");

}

- (void)contentDidLoad
{
  id v2;

  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentDidLoad");

}

- (void)requestHostSceneIdentifierWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_requestHostSceneIdentifierWithCompletion:", v4);

}

- ($115C4C562B26FF47E01F9F4EA65B5887)balloonHostAuditToken
{
  __int128 v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  *(_OWORD *)retstr->var0 = v5;
  *(_OWORD *)&retstr->var0[4] = v5;
  -[_MSMessageAppBundleContext hostContext](self, "hostContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[_MSMessageAppBundleContext hostContext](self, "hostContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "_extensionHostAuditToken");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    v12 = v14;
    *(_OWORD *)retstr->var0 = v13;
    *(_OWORD *)&retstr->var0[4] = v12;

  }
  else
  {
    LODWORD(v13) = 8;
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)retstr, (mach_msg_type_number_t *)&v13);
    if ((_DWORD)result)
    {
      ms_traceLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_MSMessageAppBundleContext balloonHostAuditToken].cold.1(v11);

    }
  }
  return result;
}

- (_MSMessageComposeExtensionImplProtocol)containingContext
{
  return self->_containingContext;
}

- (void)setContainingContext:(id)a3
{
  objc_storeStrong((id *)&self->_containingContext, a3);
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (MSConversation)activeConversation
{
  return self->_activeConversation;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (unint64_t)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(unint64_t)a3
{
  self->_presentationContext = a3;
}

- (_MSMessageComposeHostImplProtocol)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_hostContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_activeConversation, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_containingContext, 0);
}

- (void)balloonHostAuditToken
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[_MSMessageAppBundleContext balloonHostAuditToken]";
  _os_log_debug_impl(&dword_1DB1A9000, log, OS_LOG_TYPE_DEBUG, "failed to get audit token for self: %s", (uint8_t *)&v1, 0xCu);
}

@end
