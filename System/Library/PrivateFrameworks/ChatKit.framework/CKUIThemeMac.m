@implementation CKUIThemeMac

- (id)quickActionButtonGlyphColor
{
  if (quickActionButtonGlyphColor_once_1449 != -1)
    dispatch_once(&quickActionButtonGlyphColor_once_1449, &__block_literal_global_1450);
  return (id)quickActionButtonGlyphColor_sBehavior_1448;
}

void __43__CKUIThemeMac_quickActionButtonGlyphColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)quickActionButtonGlyphColor_sBehavior_1448;
  quickActionButtonGlyphColor_sBehavior_1448 = v0;

}

- (id)entryFieldButtonColor
{
  if (entryFieldButtonColor_once_1452 != -1)
    dispatch_once(&entryFieldButtonColor_once_1452, &__block_literal_global_1453);
  return (id)entryFieldButtonColor_sBehavior_1451;
}

void __37__CKUIThemeMac_entryFieldButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryFieldButtonColor_sBehavior_1451;
  entryFieldButtonColor_sBehavior_1451 = v0;

}

- (id)conversationListSenderColor
{
  if (conversationListSenderColor_once_1455 != -1)
    dispatch_once(&conversationListSenderColor_once_1455, &__block_literal_global_1456);
  return (id)conversationListSenderColor_sBehavior_1454;
}

void __43__CKUIThemeMac_conversationListSenderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListSenderColor_sBehavior_1454;
  conversationListSenderColor_sBehavior_1454 = v0;

}

- (id)conversationListSummaryColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListSummaryColor_sBehavior_1458;
  if (conversationListSummaryColor_sBehavior_1458)
    v4 = conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor_1457 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)conversationListSummaryColor_sBehavior_1458;
    conversationListSummaryColor_sBehavior_1458 = v5;

    conversationListSummaryColor_sIsIncreaseContrastEnabled_conversationListSummaryColor_1457 = v2;
    v3 = (void *)conversationListSummaryColor_sBehavior_1458;
  }
  return v3;
}

- (id)conversationListEditingPinsSummaryColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1460;
  if (conversationListEditingPinsSummaryColor_sBehavior_1460)
    v4 = conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor_1459 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1460;
    conversationListEditingPinsSummaryColor_sBehavior_1460 = v5;

    conversationListEditingPinsSummaryColor_sIsIncreaseContrastEnabled_conversationListEditingPinsSummaryColor_1459 = v2;
    v3 = (void *)conversationListEditingPinsSummaryColor_sBehavior_1460;
  }
  return v3;
}

- (id)conversationListCellSelectedTextColor
{
  if (conversationListCellSelectedTextColor_once_1462 != -1)
    dispatch_once(&conversationListCellSelectedTextColor_once_1462, &__block_literal_global_1463);
  return (id)conversationListCellSelectedTextColor_sBehavior_1461;
}

void __53__CKUIThemeMac_conversationListCellSelectedTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListCellSelectedTextColor_sBehavior_1461;
  conversationListCellSelectedTextColor_sBehavior_1461 = v0;

}

- (id)conversationListCellPreviewBackgroundColor
{
  if (conversationListCellPreviewBackgroundColor_once != -1)
    dispatch_once(&conversationListCellPreviewBackgroundColor_once, &__block_literal_global_1464);
  return 0;
}

- (id)conversationListCellSelectedSummaryColor
{
  if (conversationListCellSelectedSummaryColor_once_1466 != -1)
    dispatch_once(&conversationListCellSelectedSummaryColor_once_1466, &__block_literal_global_1467);
  return (id)conversationListCellSelectedSummaryColor_sBehavior_1465;
}

void __56__CKUIThemeMac_conversationListCellSelectedSummaryColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListCellSelectedSummaryColor_sBehavior_1465;
  conversationListCellSelectedSummaryColor_sBehavior_1465 = v0;

}

- (id)readSelectedIndicatorColor
{
  if (readSelectedIndicatorColor_once_1469 != -1)
    dispatch_once(&readSelectedIndicatorColor_once_1469, &__block_literal_global_1470);
  return (id)readSelectedIndicatorColor_sBehavior_1468;
}

void __42__CKUIThemeMac_readSelectedIndicatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)readSelectedIndicatorColor_sBehavior_1468;
  readSelectedIndicatorColor_sBehavior_1468 = v0;

}

- (id)conversationListDateColor
{
  int v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;

  v2 = UIAccessibilityDarkerSystemColorsEnabled();
  v3 = (void *)conversationListDateColor_sBehavior_1472;
  if (conversationListDateColor_sBehavior_1472)
    v4 = conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor_1471 == v2;
  else
    v4 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)conversationListDateColor_sBehavior_1472;
    conversationListDateColor_sBehavior_1472 = v5;

    conversationListDateColor_sIsIncreaseContrastEnabled_conversationListDateColor_1471 = v2;
    v3 = (void *)conversationListDateColor_sBehavior_1472;
  }
  return v3;
}

- (id)conversationListCellSelectedDateColor
{
  if (conversationListCellSelectedDateColor_once_1474 != -1)
    dispatch_once(&conversationListCellSelectedDateColor_once_1474, &__block_literal_global_1475);
  return (id)conversationListCellSelectedDateColor_sBehavior_1473;
}

void __53__CKUIThemeMac_conversationListCellSelectedDateColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListCellSelectedDateColor_sBehavior_1473;
  conversationListCellSelectedDateColor_sBehavior_1473 = v0;

}

- (id)conversationListCellColor
{
  if (conversationListCellColor_once_1477 != -1)
    dispatch_once(&conversationListCellColor_once_1477, &__block_literal_global_1478);
  return (id)conversationListCellColor_sBehavior_1476;
}

void __41__CKUIThemeMac_conversationListCellColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)conversationListCellColor_sBehavior_1476;
  conversationListCellColor_sBehavior_1476 = v0;

}

- (id)conversationListBackgroundColor
{
  if (conversationListBackgroundColor_once_1480 != -1)
    dispatch_once(&conversationListBackgroundColor_once_1480, &__block_literal_global_1481);
  return (id)conversationListBackgroundColor_sBehavior_1479;
}

void __47__CKUIThemeMac_conversationListBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)conversationListBackgroundColor_sBehavior_1479;
  conversationListBackgroundColor_sBehavior_1479 = v0;

}

- (id)conversationListCollectionViewBackgroundColor
{
  if (conversationListCollectionViewBackgroundColor_once_1483 != -1)
    dispatch_once(&conversationListCollectionViewBackgroundColor_once_1483, &__block_literal_global_1484);
  return (id)conversationListCollectionViewBackgroundColor_sBehavior_1482;
}

void __61__CKUIThemeMac_conversationListCollectionViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)conversationListCollectionViewBackgroundColor_sBehavior_1482;
  conversationListCollectionViewBackgroundColor_sBehavior_1482 = v0;

}

- (id)conversationListPinnedCellSelectorViewColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CKUIThemeMac_conversationListPinnedCellSelectorViewColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListPinnedCellSelectorViewColor_once_1486 != -1)
    dispatch_once(&conversationListPinnedCellSelectorViewColor_once_1486, block);
  return (id)conversationListPinnedCellSelectorViewColor_sBehavior_1485;
}

void __59__CKUIThemeMac_conversationListPinnedCellSelectorViewColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSelectedCellColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListPinnedCellSelectorViewColor_sBehavior_1485;
  conversationListPinnedCellSelectorViewColor_sBehavior_1485 = v1;

}

- (id)conversationListPinnedConversationNameSelectedColor
{
  if (conversationListPinnedConversationNameSelectedColor_once_1488 != -1)
    dispatch_once(&conversationListPinnedConversationNameSelectedColor_once_1488, &__block_literal_global_1489);
  return (id)conversationListPinnedConversationNameSelectedColor_sBehavior_1487;
}

void __67__CKUIThemeMac_conversationListPinnedConversationNameSelectedColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListPinnedConversationNameSelectedColor_sBehavior_1487;
  conversationListPinnedConversationNameSelectedColor_sBehavior_1487 = v0;

}

- (id)conversationListFocusFilterBannerTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKUIThemeMac_conversationListFocusFilterBannerTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (conversationListFocusFilterBannerTextColor_once_1491 != -1)
    dispatch_once(&conversationListFocusFilterBannerTextColor_once_1491, block);
  return (id)conversationListFocusFilterBannerTextColor_sBehavior_1490;
}

void __58__CKUIThemeMac_conversationListFocusFilterBannerTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "conversationListSummaryColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)conversationListFocusFilterBannerTextColor_sBehavior_1490;
  conversationListFocusFilterBannerTextColor_sBehavior_1490 = v1;

}

- (id)selectedConversationListTypingIndicatorBubbleColor
{
  if (selectedConversationListTypingIndicatorBubbleColor_once_1493 != -1)
    dispatch_once(&selectedConversationListTypingIndicatorBubbleColor_once_1493, &__block_literal_global_1494);
  return (id)selectedConversationListTypingIndicatorBubbleColor_sBehavior_1492;
}

void __66__CKUIThemeMac_selectedConversationListTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)selectedConversationListTypingIndicatorBubbleColor_sBehavior_1492;
  selectedConversationListTypingIndicatorBubbleColor_sBehavior_1492 = v0;

}

- (id)spotlightSearchBackgroundColor
{
  if (spotlightSearchBackgroundColor_once_1496 != -1)
    dispatch_once(&spotlightSearchBackgroundColor_once_1496, &__block_literal_global_1497);
  return (id)spotlightSearchBackgroundColor_sBehavior_1495;
}

void __46__CKUIThemeMac_spotlightSearchBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)spotlightSearchBackgroundColor_sBehavior_1495;
  spotlightSearchBackgroundColor_sBehavior_1495 = v0;

}

- (id)detailsCollectionViewBackgroundColor
{
  if (detailsCollectionViewBackgroundColor_once_1499 != -1)
    dispatch_once(&detailsCollectionViewBackgroundColor_once_1499, &__block_literal_global_1500);
  return (id)detailsCollectionViewBackgroundColor_sBehavior_1498;
}

void __52__CKUIThemeMac_detailsCollectionViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)detailsCollectionViewBackgroundColor_sBehavior_1498;
  detailsCollectionViewBackgroundColor_sBehavior_1498 = v0;

}

- (id)spotlightSearchBarBackgroundColor
{
  if (spotlightSearchBarBackgroundColor_once != -1)
    dispatch_once(&spotlightSearchBarBackgroundColor_once, &__block_literal_global_1501);
  return (id)spotlightSearchBarBackgroundColor_sBehavior;
}

void __49__CKUIThemeMac_spotlightSearchBarBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayTintColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)spotlightSearchBarBackgroundColor_sBehavior;
  spotlightSearchBarBackgroundColor_sBehavior = v0;

}

- (id)spotlightSearchSegmentedControlBackgroundColor
{
  if (spotlightSearchSegmentedControlBackgroundColor_once_1503 != -1)
    dispatch_once(&spotlightSearchSegmentedControlBackgroundColor_once_1503, &__block_literal_global_1504);
  return (id)spotlightSearchSegmentedControlBackgroundColor_sBehavior_1502;
}

void __62__CKUIThemeMac_spotlightSearchSegmentedControlBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)spotlightSearchSegmentedControlBackgroundColor_sBehavior_1502;
  spotlightSearchSegmentedControlBackgroundColor_sBehavior_1502 = v0;

}

- (id)contactsActionButtonBackgroundColor
{
  if (contactsActionButtonBackgroundColor_once_1506 != -1)
    dispatch_once(&contactsActionButtonBackgroundColor_once_1506, &__block_literal_global_1507);
  return (id)contactsActionButtonBackgroundColor_sBehavior_1505;
}

void __51__CKUIThemeMac_contactsActionButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactsActionButtonBackgroundColor_sBehavior_1505;
  contactsActionButtonBackgroundColor_sBehavior_1505 = v0;

}

- (id)detailsGroupPhotoBackgroundColor
{
  if (detailsGroupPhotoBackgroundColor_once_1509 != -1)
    dispatch_once(&detailsGroupPhotoBackgroundColor_once_1509, &__block_literal_global_1510);
  return 0;
}

- (id)detailsHeaderFooterContentViewBackgroundColor
{
  if (detailsHeaderFooterContentViewBackgroundColor_once_1512 != -1)
    dispatch_once(&detailsHeaderFooterContentViewBackgroundColor_once_1512, &__block_literal_global_1513);
  return (id)detailsHeaderFooterContentViewBackgroundColor_sBehavior_1511;
}

void __61__CKUIThemeMac_detailsHeaderFooterContentViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)detailsHeaderFooterContentViewBackgroundColor_sBehavior_1511;
  detailsHeaderFooterContentViewBackgroundColor_sBehavior_1511 = v0;

}

- (id)iosMacDetailsCellColor
{
  if (iosMacDetailsCellColor_once_1515 != -1)
    dispatch_once(&iosMacDetailsCellColor_once_1515, &__block_literal_global_1516);
  return (id)iosMacDetailsCellColor_sBehavior_1514;
}

void __38__CKUIThemeMac_iosMacDetailsCellColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)iosMacDetailsCellColor_sBehavior_1514;
  iosMacDetailsCellColor_sBehavior_1514 = v0;

}

- (id)detailsBackgroundColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CKUIThemeMac_detailsBackgroundColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (detailsBackgroundColor_once_1518 != -1)
    dispatch_once(&detailsBackgroundColor_once_1518, block);
  return (id)detailsBackgroundColor_sBehavior_1517;
}

void __38__CKUIThemeMac_detailsBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "iosMacDetailsCellColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)detailsBackgroundColor_sBehavior_1517;
  detailsBackgroundColor_sBehavior_1517 = v1;

}

- (id)detailsAddButtonBackgroundColor
{
  if (detailsAddButtonBackgroundColor_once_1520 != -1)
    dispatch_once(&detailsAddButtonBackgroundColor_once_1520, &__block_literal_global_1521);
  return (id)detailsAddButtonBackgroundColor_sBehavior_1519;
}

void __47__CKUIThemeMac_detailsAddButtonBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)detailsAddButtonBackgroundColor_sBehavior_1519;
  detailsAddButtonBackgroundColor_sBehavior_1519 = v0;

}

- (id)detailsAttachmentsDecorationViewBackgroundColor
{
  if (detailsAttachmentsDecorationViewBackgroundColor_once_1523 != -1)
    dispatch_once(&detailsAttachmentsDecorationViewBackgroundColor_once_1523, &__block_literal_global_1524);
  return (id)detailsAttachmentsDecorationViewBackgroundColor_sBehavior_1522;
}

void __63__CKUIThemeMac_detailsAttachmentsDecorationViewBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "macApplicationMetricsGatheringEnabled") & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)detailsAttachmentsDecorationViewBackgroundColor_sBehavior_1522;
  detailsAttachmentsDecorationViewBackgroundColor_sBehavior_1522 = v0;

}

- (id)paddleSeparatorColor
{
  if (paddleSeparatorColor_once_1526 != -1)
    dispatch_once(&paddleSeparatorColor_once_1526, &__block_literal_global_1527);
  return (id)paddleSeparatorColor_sBehavior_1525;
}

void __36__CKUIThemeMac_paddleSeparatorColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)paddleSeparatorColor_sBehavior_1525;
  paddleSeparatorColor_sBehavior_1525 = v0;

}

@end
