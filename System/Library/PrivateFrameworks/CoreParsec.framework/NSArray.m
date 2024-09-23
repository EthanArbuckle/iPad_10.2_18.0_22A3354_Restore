@implementation NSArray

id __39__NSArray_SFExtras__sf_asCardSections___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "parsec_stringForKey:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v4, "sf_cardSectionType"))
  {
    case 1u:
      objc_msgSend(v3, "sf_asTitleCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 2u:
      objc_msgSend(v3, "sf_asRichTitleCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 3u:
      objc_msgSend(v3, "sf_asRowCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 4u:
      objc_msgSend(v3, "sf_asDescriptionCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 5u:
      objc_msgSend(v3, "sf_asMediaInfoCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 6u:
      objc_msgSend(v3, "sf_asMediaPlayerCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 7u:
      objc_msgSend(v3, "sf_asSocialMediaPostCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 8u:
      objc_msgSend(v3, "sf_asMetaInfoCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 9u:
      objc_msgSend(v3, "sf_asScoreboardCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xAu:
      objc_msgSend(v3, "sf_asNowPlayingCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xBu:
      objc_msgSend(v3, "sf_asKeyValueDataCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xCu:
      objc_msgSend(v3, "sf_asTableRowCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xDu:
      objc_msgSend(v3, "sf_asDetailedRowCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xEu:
      objc_msgSend(v3, "sf_asTextColumnsCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0xFu:
      objc_msgSend(v3, "sf_asAppLinkCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x10u:
      objc_msgSend(v3, "sf_asTrackListCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x11u:
      objc_msgSend(v3, "sf_asStockChartCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x12u:
      objc_msgSend(v3, "sf_asWebCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x13u:
      objc_msgSend(v3, "sf_asFlightCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x14u:
      objc_msgSend(v3, "sf_asSuggestionCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 0x15u:
      objc_msgSend(v3, "sf_asWatchListCardSection:", *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_28:
      v7 = (void *)v5;
      break;
    default:
      if (PARLogHandleForCategory_onceToken_274 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
      v6 = PARLogHandleForCategory_logHandles_1_275;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_19A825000, v6, OS_LOG_TYPE_ERROR, "unknown card section type: %@", (uint8_t *)&v9, 0xCu);
      }
      v7 = 0;
      break;
  }

  return v7;
}

void __74__NSArray_ParsecExtras__parsec_mapAndFilterObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

uint64_t __56__NSArray_ParsecExtras__parsec_filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
