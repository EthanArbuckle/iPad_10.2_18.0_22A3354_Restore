@implementation CKUIBehaviorPad

- (BOOL)usesUncollapsedSplitview
{
  if (usesUncollapsedSplitview_once_4370 != -1)
    dispatch_once(&usesUncollapsedSplitview_once_4370, &__block_literal_global_4371);
  return usesUncollapsedSplitview_sBehavior_4369;
}

void __43__CKUIBehaviorPad_usesUncollapsedSplitview__block_invoke()
{
  usesUncollapsedSplitview_sBehavior_4369 = 1;
}

- (BOOL)shouldSuppressRotationInNewCompose
{
  if (shouldSuppressRotationInNewCompose_once_4373 != -1)
    dispatch_once(&shouldSuppressRotationInNewCompose_once_4373, &__block_literal_global_4374);
  return 0;
}

- (BOOL)lowClearanceInLandscape
{
  if (lowClearanceInLandscape_once_4376 != -1)
    dispatch_once(&lowClearanceInLandscape_once_4376, &__block_literal_global_4377);
  return 0;
}

- (BOOL)usesPopovers
{
  if (usesPopovers_once_4379 != -1)
    dispatch_once(&usesPopovers_once_4379, &__block_literal_global_4380);
  return usesPopovers_sBehavior_4378;
}

void __31__CKUIBehaviorPad_usesPopovers__block_invoke()
{
  usesPopovers_sBehavior_4378 = 1;
}

- (BOOL)canPresentOverKeyboard
{
  if (canPresentOverKeyboard_once_4382 != -1)
    dispatch_once(&canPresentOverKeyboard_once_4382, &__block_literal_global_4383);
  return 0;
}

- (BOOL)keyboardSizeDeterminesAppCardDetentHeight
{
  if (keyboardSizeDeterminesAppCardDetentHeight_once_4385 != -1)
    dispatch_once(&keyboardSizeDeterminesAppCardDetentHeight_once_4385, &__block_literal_global_4386);
  return 0;
}

- (BOOL)presentsQuickLookController
{
  if (presentsQuickLookController_once_4388 != -1)
    dispatch_once(&presentsQuickLookController_once_4388, &__block_literal_global_4389);
  return presentsQuickLookController_sBehavior_4387;
}

void __46__CKUIBehaviorPad_presentsQuickLookController__block_invoke()
{
  presentsQuickLookController_sBehavior_4387 = 1;
}

- (BOOL)presentForwardingUIModally
{
  if (presentForwardingUIModally_once_4391 != -1)
    dispatch_once(&presentForwardingUIModally_once_4391, &__block_literal_global_4392);
  return 0;
}

- (double)transcriptHeaderViewMaxRows
{
  if (transcriptHeaderViewMaxRows_once_4394 != -1)
    dispatch_once(&transcriptHeaderViewMaxRows_once_4394, &__block_literal_global_4395);
  return *(double *)&transcriptHeaderViewMaxRows_sBehavior_4393;
}

void __46__CKUIBehaviorPad_transcriptHeaderViewMaxRows__block_invoke()
{
  transcriptHeaderViewMaxRows_sBehavior_4393 = 0x4012000000000000;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (supportedInterfaceOrientations_once_4397 != -1)
    dispatch_once(&supportedInterfaceOrientations_once_4397, &__block_literal_global_4398);
  if (supportedInterfaceOrientations_sBehavior_4396)
    return 30;
  else
    return 0;
}

void __49__CKUIBehaviorPad_supportedInterfaceOrientations__block_invoke()
{
  supportedInterfaceOrientations_sBehavior_4396 = 1;
}

- (BOOL)showMMSSetup
{
  if (showMMSSetup_once_4400 != -1)
    dispatch_once(&showMMSSetup_once_4400, &__block_literal_global_4401);
  return 0;
}

- (unint64_t)defaultConversationViewingMessageCount
{
  if (defaultConversationViewingMessageCount_once_4403 != -1)
    dispatch_once(&defaultConversationViewingMessageCount_once_4403, &__block_literal_global_4404);
  if (defaultConversationViewingMessageCount_sBehavior_4402)
    return 50;
  else
    return 0;
}

void __57__CKUIBehaviorPad_defaultConversationViewingMessageCount__block_invoke()
{
  defaultConversationViewingMessageCount_sBehavior_4402 = 1;
}

- (double)defaultNavigationBarNoContactPhotoCollapsedHeightValue
{
  return 50.0;
}

- (unint64_t)browserViewControllerSheetDetentStyle
{
  return 2;
}

- (double)conversationListWidthForInterfaceOrientation:(int64_t)a3
{
  double result;

  result = 320.0;
  if ((unint64_t)(a3 - 1) >= 2)
    result = 0.0;
  if ((unint64_t)(a3 - 3) < 2)
    return 375.0;
  return result;
}

- (BOOL)showPendingInConversationList
{
  if (showPendingInConversationList_once_4406 != -1)
    dispatch_once(&showPendingInConversationList_once_4406, &__block_literal_global_4407);
  return showPendingInConversationList_sBehavior_4405;
}

void __48__CKUIBehaviorPad_showPendingInConversationList__block_invoke()
{
  showPendingInConversationList_sBehavior_4405 = 1;
}

- (BOOL)canShowContactPhotosInConversationList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CKUIBehaviorPad_canShowContactPhotosInConversationList__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (canShowContactPhotosInConversationList_once_4409 != -1)
    dispatch_once(&canShowContactPhotosInConversationList_once_4409, block);
  return canShowContactPhotosInConversationList_sBehavior_4408;
}

uint64_t __57__CKUIBehaviorPad_canShowContactPhotosInConversationList__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "conversationListCellUsesLargeTextLayout");
  canShowContactPhotosInConversationList_sBehavior_4408 = result ^ 1;
  return result;
}

- (BOOL)showsConversationListCellChevronImage
{
  if (showsConversationListCellChevronImage_once_4411 != -1)
    dispatch_once(&showsConversationListCellChevronImage_once_4411, &__block_literal_global_4412);
  return showsConversationListCellChevronImage_sBehavior_4410;
}

void __56__CKUIBehaviorPad_showsConversationListCellChevronImage__block_invoke()
{
  showsConversationListCellChevronImage_sBehavior_4410 = 1;
}

- (double)conversationListMinimumWidthForHiddenContactImage
{
  if (conversationListMinimumWidthForHiddenContactImage_once_4414 != -1)
    dispatch_once(&conversationListMinimumWidthForHiddenContactImage_once_4414, &__block_literal_global_4415);
  return *(double *)&conversationListMinimumWidthForHiddenContactImage_sBehavior_4413;
}

void __68__CKUIBehaviorPad_conversationListMinimumWidthForHiddenContactImage__block_invoke()
{
  conversationListMinimumWidthForHiddenContactImage_sBehavior_4413 = 0x4073F00000000000;
}

- (double)previewMaxWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CKUIBehaviorPad_previewMaxWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (previewMaxWidth_once_4417 != -1)
    dispatch_once(&previewMaxWidth_once_4417, block);
  return *(double *)&previewMaxWidth_sBehavior_4416;
}

double __34__CKUIBehaviorPad_previewMaxWidth__block_invoke(uint64_t a1)
{
  double v1;
  double result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CKUIBehaviorPad;
  objc_msgSendSuper2(&v3, sel_previewMaxWidth);
  result = fmin(v1, 300.0);
  previewMaxWidth_sBehavior_4416 = *(_QWORD *)&result;
  return result;
}

- (double)transcriptContactImageDiameter
{
  if (transcriptContactImageDiameter_once_4421 != -1)
    dispatch_once(&transcriptContactImageDiameter_once_4421, &__block_literal_global_4422);
  return *(double *)&transcriptContactImageDiameter_sBehavior_4420;
}

void __49__CKUIBehaviorPad_transcriptContactImageDiameter__block_invoke()
{
  transcriptContactImageDiameter_sBehavior_4420 = 0x4041000000000000;
}

- (UIEdgeInsets)contactPhotoTranscriptInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (contactPhotoTranscriptInsets_once != -1)
    dispatch_once(&contactPhotoTranscriptInsets_once, &__block_literal_global_4424);
  v3 = *((double *)&contactPhotoTranscriptInsets_sBehavior_4423 + 1);
  v2 = *(double *)&contactPhotoTranscriptInsets_sBehavior_4423;
  v4 = *(double *)&qword_1EE11D468;
  v5 = unk_1EE11D470;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

__n128 __47__CKUIBehaviorPad_contactPhotoTranscriptInsets__block_invoke()
{
  __n128 result;
  __int128 v1;

  result = *(__n128 *)MEMORY[0x1E0CEB4B0];
  v1 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  contactPhotoTranscriptInsets_sBehavior_4423 = *MEMORY[0x1E0CEB4B0];
  *(_OWORD *)&qword_1EE11D468 = v1;
  return result;
}

- (UIEdgeInsets)minTranscriptMarginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (minTranscriptMarginInsets_once_4426 != -1)
    dispatch_once(&minTranscriptMarginInsets_once_4426, &__block_literal_global_4427);
  v2 = *(double *)&minTranscriptMarginInsets_sBehavior_4425_1;
  v3 = *(double *)&minTranscriptMarginInsets_sBehavior_4425_3;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

void __44__CKUIBehaviorPad_minTranscriptMarginInsets__block_invoke()
{
  minTranscriptMarginInsets_sBehavior_4425_1 = 0x4034000000000000;
  minTranscriptMarginInsets_sBehavior_4425_3 = 0x4034000000000000;
}

- (UIEdgeInsets)defaultAVPlayerViewContorllerControlsInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (defaultAVPlayerViewContorllerControlsInsets_once_4429 != -1)
    dispatch_once(&defaultAVPlayerViewContorllerControlsInsets_once_4429, &__block_literal_global_4430);
  v2 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_0;
  v3 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_1;
  v4 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_2;
  v5 = *(double *)&defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_3;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

void __62__CKUIBehaviorPad_defaultAVPlayerViewContorllerControlsInsets__block_invoke()
{
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_0 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_1 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_2 = 0x4020000000000000;
  defaultAVPlayerViewContorllerControlsInsets_sBehavior_4428_3 = 0x4020000000000000;
}

- (CGSize)documentIconSize
{
  double v2;
  double v3;
  CGSize result;

  if (documentIconSize_once_4432 != -1)
    dispatch_once(&documentIconSize_once_4432, &__block_literal_global_4433);
  v2 = *(double *)&documentIconSize_sBehavior_4431_0;
  v3 = *(double *)&documentIconSize_sBehavior_4431_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __35__CKUIBehaviorPad_documentIconSize__block_invoke()
{
  documentIconSize_sBehavior_4431_0 = 0x4050000000000000;
  documentIconSize_sBehavior_4431_1 = 0x4050000000000000;
}

- (BOOL)shouldShowDisclosureChevronInRecipientAtoms
{
  if (shouldShowDisclosureChevronInRecipientAtoms_once_4435 != -1)
    dispatch_once(&shouldShowDisclosureChevronInRecipientAtoms_once_4435, &__block_literal_global_4436);
  return 0;
}

- (BOOL)shouldRefreshAlternateAddressesSheet
{
  if (shouldRefreshAlternateAddressesSheet_once_4438 != -1)
    dispatch_once(&shouldRefreshAlternateAddressesSheet_once_4438, &__block_literal_global_4439);
  return shouldRefreshAlternateAddressesSheet_sBehavior_4437;
}

void __55__CKUIBehaviorPad_shouldRefreshAlternateAddressesSheet__block_invoke()
{
  shouldRefreshAlternateAddressesSheet_sBehavior_4437 = 1;
}

- (BOOL)presentsAutocompleteInAPopover
{
  if (presentsAutocompleteInAPopover_once_4441 != -1)
    dispatch_once(&presentsAutocompleteInAPopover_once_4441, &__block_literal_global_4442);
  return 0;
}

- (BOOL)isAppStripInKeyboard
{
  if (isAppStripInKeyboard_once_4444 != -1)
    dispatch_once(&isAppStripInKeyboard_once_4444, &__block_literal_global_4445);
  return 0;
}

- (BOOL)supportsEntryViewPlusButtonLongPress
{
  if (supportsEntryViewPlusButtonLongPress_once_4447 != -1)
    dispatch_once(&supportsEntryViewPlusButtonLongPress_once_4447, &__block_literal_global_4448);
  return supportsEntryViewPlusButtonLongPress_sBehavior_4446;
}

void __55__CKUIBehaviorPad_supportsEntryViewPlusButtonLongPress__block_invoke()
{
  supportsEntryViewPlusButtonLongPress_sBehavior_4446 = 1;
}

- (double)entryViewMaxHandWritingPluginShelfHeight
{
  if (entryViewMaxHandWritingPluginShelfHeight_once_4450 != -1)
    dispatch_once(&entryViewMaxHandWritingPluginShelfHeight_once_4450, &__block_literal_global_4451);
  return *(double *)&entryViewMaxHandWritingPluginShelfHeight_sBehavior_4449;
}

void __59__CKUIBehaviorPad_entryViewMaxHandWritingPluginShelfHeight__block_invoke()
{
  double v0;

  if (CKIsBigIdiom_onceToken != -1)
    dispatch_once(&CKIsBigIdiom_onceToken, &__block_literal_global_4567);
  v0 = 135.0;
  if (!CKIsBigIdiom_sBig)
    v0 = 128.0;
  entryViewMaxHandWritingPluginShelfHeight_sBehavior_4449 = *(_QWORD *)&v0;
}

- (CGSize)attachmentBrowserDefaultSizeForSquare
{
  double v2;
  double v3;
  CGSize result;

  if (attachmentBrowserDefaultSizeForSquare_once_4453 != -1)
    dispatch_once(&attachmentBrowserDefaultSizeForSquare_once_4453, &__block_literal_global_4454);
  v2 = *(double *)&attachmentBrowserDefaultSizeForSquare_sBehavior_4452_0;
  v3 = *(double *)&attachmentBrowserDefaultSizeForSquare_sBehavior_4452_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __56__CKUIBehaviorPad_attachmentBrowserDefaultSizeForSquare__block_invoke()
{
  attachmentBrowserDefaultSizeForSquare_sBehavior_4452_0 = 0x405A000000000000;
  attachmentBrowserDefaultSizeForSquare_sBehavior_4452_1 = 0x405A000000000000;
}

- (double)attachmentBrowserGridInterItemSpacing
{
  if (attachmentBrowserGridInterItemSpacing_once_4456 != -1)
    dispatch_once(&attachmentBrowserGridInterItemSpacing_once_4456, &__block_literal_global_4457);
  return *(double *)&attachmentBrowserGridInterItemSpacing_sBehavior_4455;
}

void __56__CKUIBehaviorPad_attachmentBrowserGridInterItemSpacing__block_invoke()
{
  attachmentBrowserGridInterItemSpacing_sBehavior_4455 = 0x4010000000000000;
}

- (double)photoPickerPopoverWidth
{
  if (photoPickerPopoverWidth_once_4459 != -1)
    dispatch_once(&photoPickerPopoverWidth_once_4459, &__block_literal_global_4460);
  return *(double *)&photoPickerPopoverWidth_sBehavior_4458;
}

void __42__CKUIBehaviorPad_photoPickerPopoverWidth__block_invoke()
{
  photoPickerPopoverWidth_sBehavior_4458 = 0x4079000000000000;
}

- (unint64_t)numberOfButtonsInPhotoPicker
{
  if (numberOfButtonsInPhotoPicker_once_4462 != -1)
    dispatch_once(&numberOfButtonsInPhotoPicker_once_4462, &__block_literal_global_4463);
  if (numberOfButtonsInPhotoPicker_sBehavior_4461)
    return 2;
  else
    return 0;
}

void __47__CKUIBehaviorPad_numberOfButtonsInPhotoPicker__block_invoke()
{
  numberOfButtonsInPhotoPicker_sBehavior_4461 = 1;
}

- (BOOL)photoPickerShouldZoomOnSelection
{
  if (photoPickerShouldZoomOnSelection_once != -1)
    dispatch_once(&photoPickerShouldZoomOnSelection_once, &__block_literal_global_4464);
  return photoPickerShouldZoomOnSelection_sBehavior;
}

void __51__CKUIBehaviorPad_photoPickerShouldZoomOnSelection__block_invoke()
{
  photoPickerShouldZoomOnSelection_sBehavior = 1;
}

- (double)photoPickerMaxPopoverPhotoHeight
{
  if (photoPickerMaxPopoverPhotoHeight_once_4466 != -1)
    dispatch_once(&photoPickerMaxPopoverPhotoHeight_once_4466, &__block_literal_global_4467);
  return *(double *)&photoPickerMaxPopoverPhotoHeight_sBehavior_4465;
}

void __51__CKUIBehaviorPad_photoPickerMaxPopoverPhotoHeight__block_invoke()
{
  photoPickerMaxPopoverPhotoHeight_sBehavior_4465 = 0x4074A00000000000;
}

- (BOOL)shouldAlignRecipientGlyphsWithMargins
{
  if (shouldAlignRecipientGlyphsWithMargins_once_4469 != -1)
    dispatch_once(&shouldAlignRecipientGlyphsWithMargins_once_4469, &__block_literal_global_4470);
  return shouldAlignRecipientGlyphsWithMargins_sBehavior_4468;
}

void __56__CKUIBehaviorPad_shouldAlignRecipientGlyphsWithMargins__block_invoke()
{
  shouldAlignRecipientGlyphsWithMargins_sBehavior_4468 = 1;
}

- (int64_t)groupRecipientSelectionPresentationStyle
{
  if (groupRecipientSelectionPresentationStyle_once_4472 != -1)
    dispatch_once(&groupRecipientSelectionPresentationStyle_once_4472, &__block_literal_global_4473);
  if (groupRecipientSelectionPresentationStyle_sBehavior_4471)
    return 2;
  else
    return 0;
}

void __59__CKUIBehaviorPad_groupRecipientSelectionPresentationStyle__block_invoke()
{
  groupRecipientSelectionPresentationStyle_sBehavior_4471 = 1;
}

- (id)fullscreenPickerActionLayoutAxisPrioritiesForWidth:(double)a3
{
  void *v3;
  objc_super v5;

  if (a3 >= 550.0)
  {
    v3 = &unk_1E286F5E0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKUIBehaviorPad;
    -[CKUIBehavior fullscreenPickerActionLayoutAxisPrioritiesForWidth:](&v5, sel_fullscreenPickerActionLayoutAxisPrioritiesForWidth_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (double)searchPhotosThumbnailWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKUIBehaviorPad_searchPhotosThumbnailWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (searchPhotosThumbnailWidth_once_4479 != -1)
    dispatch_once(&searchPhotosThumbnailWidth_once_4479, block);
  return *(double *)&searchPhotosThumbnailWidth_sBehavior_4478;
}

double __45__CKUIBehaviorPad_searchPhotosThumbnailWidth__block_invoke(uint64_t a1)
{
  double v1;
  double result;

  objc_msgSend(*(id *)(a1 + 32), "maxConversationListWidth");
  result = v1 * 0.5;
  searchPhotosThumbnailWidth_sBehavior_4478 = *(_QWORD *)&result;
  return result;
}

- (double)searchLinksThumbnailWidth
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKUIBehaviorPad_searchLinksThumbnailWidth__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (searchLinksThumbnailWidth_once_4481 != -1)
    dispatch_once(&searchLinksThumbnailWidth_once_4481, block);
  return *(double *)&searchLinksThumbnailWidth_sBehavior_4480;
}

uint64_t __44__CKUIBehaviorPad_searchLinksThumbnailWidth__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "maxConversationListWidth");
  searchLinksThumbnailWidth_sBehavior_4480 = v2;
  return result;
}

- (unint64_t)suggestedAppStripLimit
{
  if (suggestedAppStripLimit_once_4483 != -1)
    dispatch_once(&suggestedAppStripLimit_once_4483, &__block_literal_global_4484);
  if (suggestedAppStripLimit_sBehavior_4482)
    return 30;
  else
    return 0;
}

void __41__CKUIBehaviorPad_suggestedAppStripLimit__block_invoke()
{
  suggestedAppStripLimit_sBehavior_4482 = 1;
}

- (double)appDrawerTitleIconHeight
{
  if (appDrawerTitleIconHeight_once != -1)
    dispatch_once(&appDrawerTitleIconHeight_once, &__block_literal_global_4485);
  return *(double *)&appDrawerTitleIconHeight_sBehavior;
}

void __43__CKUIBehaviorPad_appDrawerTitleIconHeight__block_invoke()
{
  appDrawerTitleIconHeight_sBehavior = 0x4040000000000000;
}

- (double)appDrawerTitleIconWidth
{
  if (appDrawerTitleIconWidth_once != -1)
    dispatch_once(&appDrawerTitleIconWidth_once, &__block_literal_global_4486);
  return *(double *)&appDrawerTitleIconWidth_sBehavior;
}

void __42__CKUIBehaviorPad_appDrawerTitleIconWidth__block_invoke()
{
  appDrawerTitleIconWidth_sBehavior = 0x4045000000000000;
}

- (BOOL)shouldPopoverSuggestionsBanner
{
  return 0;
}

- (double)welcomeViewContentViewTopAnchorLayoutConstraintConstant
{
  return 45.0;
}

- (CGSize)detonatedItemBalloonViewSize
{
  double v2;
  double v3;
  CGSize result;

  if (detonatedItemBalloonViewSize_once_4488 != -1)
    dispatch_once(&detonatedItemBalloonViewSize_once_4488, &__block_literal_global_4489);
  v2 = *(double *)&detonatedItemBalloonViewSize_sBehavior_4487_0;
  v3 = *(double *)&detonatedItemBalloonViewSize_sBehavior_4487_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __47__CKUIBehaviorPad_detonatedItemBalloonViewSize__block_invoke()
{
  detonatedItemBalloonViewSize_sBehavior_4487_0 = 0x4064000000000000;
  detonatedItemBalloonViewSize_sBehavior_4487_1 = 0x405E000000000000;
}

- (CGSize)detonatedItemDocumentIconSize
{
  double v2;
  double v3;
  CGSize result;

  if (detonatedItemDocumentIconSize_once_4491 != -1)
    dispatch_once(&detonatedItemDocumentIconSize_once_4491, &__block_literal_global_4492);
  v2 = *(double *)&detonatedItemDocumentIconSize_sBehavior_4490_0;
  v3 = *(double *)&detonatedItemDocumentIconSize_sBehavior_4490_1;
  result.height = v3;
  result.width = v2;
  return result;
}

void __48__CKUIBehaviorPad_detonatedItemDocumentIconSize__block_invoke()
{
  detonatedItemDocumentIconSize_sBehavior_4490_0 = 0x404B000000000000;
  detonatedItemDocumentIconSize_sBehavior_4490_1 = 0x404E000000000000;
}

@end
