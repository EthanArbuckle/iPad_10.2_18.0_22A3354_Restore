@implementation MKURLHandler

void __39___MKURLHandler__treatPinPositionFrom___block_invoke(uint64_t a1, void *a2)
{
  MKPlacemark *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  MKMapItem *v10;

  objc_msgSend(a2, "firstObject");
  v10 = (MKMapItem *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v3 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v10 = -[MKMapItem initWithPlacemark:]([MKMapItem alloc], "initWithPlacemark:", v3);
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem setName:](v10, "setName:", v4);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = *(double *)(a1 + 48);
    v9 = *(double *)(a1 + 56);
  }
  else
  {
    -[MKMapItem _coordinate](v10, "_coordinate");
  }
  objc_msgSend(WeakRetained, "URLHandler:showMapItem:label:at:", v6, v10, v7, v8, v9);

}

void __39___MKURLHandler__treatPinPositionFrom___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  MKPlacemark *v6;
  MKPlacemark *v7;
  void *v8;
  void *WeakRetained;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  MKMapItem *v18;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mkPostalAddressDictionary");
    v6 = (MKPlacemark *)objc_claimAutoreleasedReturnValue();

    v7 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v18 = -[MKMapItem initWithPlacemark:]([MKMapItem alloc], "initWithPlacemark:", v7);

    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem setName:](v18, "setName:", v8);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      v12 = *(double *)(a1 + 48);
      v13 = *(double *)(a1 + 56);
    }
    else
    {
      -[MKMapItem _coordinate](v18, "_coordinate");
    }
    objc_msgSend(WeakRetained, "URLHandler:showMapItem:label:at:", v10, v18, v11, v12, v13);

  }
  else
  {
    v6 = -[MKPlacemark initWithCoordinate:addressDictionary:]([MKPlacemark alloc], "initWithCoordinate:addressDictionary:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v18 = -[MKMapItem initWithPlacemark:]([MKMapItem alloc], "initWithPlacemark:", v6);
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapItem setName:](v18, "setName:", v14);

    v7 = (MKPlacemark *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
    {
      v16 = *(double *)(a1 + 48);
      v17 = *(double *)(a1 + 56);
    }
    else
    {
      -[MKMapItem _coordinate](v18, "_coordinate");
    }
    -[MKPlacemark URLHandler:showMapItem:label:at:](v7, "URLHandler:showMapItem:label:at:", v15, v18, WeakRetained, v16, v17);
  }

}

void __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke_2;
  block[3] = &unk_1E20D9568;
  v17 = v9;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v18 = v10;
  v19 = v11;
  v20 = v7;
  v21 = v8;
  v22 = v12;
  v23 = *(id *)(a1 + 56);
  v13 = v8;
  v14 = v7;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __68___MKURLHandler__handleMapItemHandlesURL_sourceApplication_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v3 = *(_QWORD *)(a1 + 40);
      v8 = 138478083;
      v9 = v3;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_DEBUG, "_mapItemsFromHandleURL: '%{private}@' error %@", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleMapItems:withOptions:url:sourceApplication:context:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
    objc_msgSend(v7, "URLHandler:didFinishAsynchronousHandlingWithError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
}

uint64_t __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_51(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(v12, "_hasResolvablePartialInformation") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_geoAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "structuredAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      goto LABEL_6;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_geoAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "formattedAddressLinesCount");

    if (!v11)
      goto LABEL_6;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  *a4 = 1;
LABEL_6:

}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5 || !objc_msgSend(v10, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    WeakRetained = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "replaceObjectAtIndex:withObject:", v7, v8);

    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v9, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", *(_QWORD *)(a1 + 40), WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5 || !objc_msgSend(v10, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(WeakRetained, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    WeakRetained = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "replaceObjectAtIndex:withObject:", v7, v8);

    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(v9, "URLHandler:launchIntoDirectionsWithMapItems:options:context:", *(_QWORD *)(a1 + 40), WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  +[MKMapService sharedService](MKMapService, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_geoAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "singleLineAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ticketForForwardGeocodeString:traits:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_5;
  v7[3] = &unk_1E20D8E18;
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v5, "submitWithHandler:networkActivity:", v7, 0);

}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(WeakRetained, "URLHandler:launchIntoSearchWithMapItems:options:context:", a1[4], a1[7], a1[5], a1[6]);
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1[4] + 8));
    v9 = a1[4];
    v11[0] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLHandler:launchIntoShowMapItems:options:context:", v9, v10, a1[5], a1[6]);

  }
}

uint64_t __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___MKURLHandler__handleMapItems_withOptions_url_sourceApplication_context___block_invoke_7(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    objc_msgSend(WeakRetained, "URLHandler:launchIntoSearchWithMapItems:options:context:", a1[4], a1[7], a1[5], a1[6]);
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1[4] + 8));
    v9 = a1[4];
    v11[0] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLHandler:launchIntoShowMapItems:options:context:", v9, v10, a1[5], a1[6]);

  }
}

@end
