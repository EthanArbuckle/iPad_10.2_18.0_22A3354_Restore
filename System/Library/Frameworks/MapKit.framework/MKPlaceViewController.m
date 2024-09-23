@implementation MKPlaceViewController

uint64_t __37___MKPlaceViewController__commonInit__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 77);
}

uint64_t __40___MKPlaceViewController_viewDidAppear___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 77);
}

void __48___MKPlaceViewController__updateViewControllers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v15 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v15;
    if (v7)
    {
      objc_msgSend(v15, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v9 + 1328) & 1) != 0
        || (objc_msgSend(v8, "_displayMapRegion"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v9 = *(_QWORD *)(a1 + 32),
            !v10))
      {
        objc_msgSend((id)v9, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));

        if (v12)
          objc_msgSend(*(id *)(a1 + 32), "removeAdditionalViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));
      }
      else
      {
        objc_msgSend(*(id *)(v9 + 1176), "setMapItem:", v8);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setMapItem:", v8);
      v13 = *(void **)(a1 + 32);
      objc_msgSend(v13, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMapItem:contact:updateOriginalContact:", v8, v14, 0);

      v6 = v15;
    }
  }

}

void __48___MKPlaceViewController__updateViewControllers__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v14 = v5;
    v7 = objc_msgSend(v5, "count");
    v6 = v14;
    if (v7)
    {
      objc_msgSend(v14, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      if ((*(_BYTE *)(v9 + 1328) & 1) != 0
        || (objc_msgSend(v8, "_displayMapRegion"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v9 = *(_QWORD *)(a1 + 32),
            !v10))
      {
        objc_msgSend((id)v9, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));

        if (v12)
          objc_msgSend(*(id *)(a1 + 32), "removeAdditionalViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176));
      }
      else
      {
        objc_msgSend(*(id *)(v9 + 1176), "setMapItem:", v8);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "setMapItem:", v8);
      if (v8)
        objc_msgSend(v8, "_placeCardContact");
      else
        objc_msgSend(*(id *)(a1 + 32), "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setMapItem:contact:updateOriginalContact:", v8, v13, 0);

      v6 = v14;
    }
  }

}

void __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const char *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  MKGetPlaceCardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "mapItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      v8 = "Successfully launched Maps in SAR mode for mapItem: %@";
LABEL_6:
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);

    }
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    v8 = "Failed to launched Maps in SAR mode for mapItem: %@";
    goto LABEL_6;
  }

}

uint64_t __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_showShareSheet:", *(_QWORD *)(result + 40));
  return result;
}

void __190___MKPlaceViewController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  +[MKMapService sharedService](MKMapService, "sharedService");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned int *)(a1 + 88);
  v3 = *(void **)(a1 + 32);
  v4 = *(double *)(a1 + 64);
  v5 = *(unsigned int *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v3, "_vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)(a1 + 92);
  objc_msgSend(v9, "captureTransitPlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", v2, 201, 0, v3, v5, v6, v4, v7, -1, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __156___MKPlaceViewController_infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_moduleMetadata_feedbackDelegateSelector_actionRichProviderId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  id v14;

  +[MKMapService sharedService](MKMapService, "sharedService");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned int *)(a1 + 100);
  v13 = *(_DWORD *)(a1 + 96);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(double *)(a1 + 88);
  v6 = objc_msgSend(v4, "_muid");
  objc_msgSend(*(id *)(a1 + 40), "_vendorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_DWORD *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 40), "_firstLocalizedCategoryName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v10;
  objc_msgSend(v14, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v13, v2, v3, v4, 0xFFFFFFFFLL, v6, v5, v7, 0, v8, v9, v12, v11, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72),
    0,
    0,
    *(_QWORD *)(a1 + 80));

}

@end
