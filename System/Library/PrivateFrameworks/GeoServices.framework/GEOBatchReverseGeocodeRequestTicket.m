@implementation GEOBatchReverseGeocodeRequestTicket

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *global_queue;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  -[GEOPDBatchReverseGeocodingParameters assetLocations](*(id **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  objc_msgSend(v5, "latLng");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalAccuracy");
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2;
  v18[3] = &unk_1E1C06940;
  v22 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 56);
  v18[4] = *(_QWORD *)(a1 + 64);
  v19 = v5;
  v20 = *(id *)(a1 + 32);
  v23 = a2;
  v21 = *(id *)(a1 + 40);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4;
  v15[3] = &unk_1E1C06968;
  v12 = *(_QWORD *)(a1 + 72);
  v15[4] = *(_QWORD *)(a1 + 64);
  v17 = v12;
  v16 = *(id *)(a1 + 40);
  v13 = v5;
  global_queue = (void *)geo_get_global_queue();
  objc_msgSend(v6, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v7, v11, v18, 0, v15, global_queue, v9);

}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_3(uint64_t a1)
{
  GEOLatLng *v2;
  void *v3;
  id v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
    v2 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_msgSend(v4, "setLatLng:", v2);

    objc_msgSend(v4, "setReferenceFrame:", 2);
    -[GEOPDBatchReverseGeocodingParameters assetLocations](*(id **)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 72), v4);

  }
}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = v4;
  geo_isolate_sync_data();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(_QWORD *)(v1 + 40);
  v2 = (id *)(v1 + 40);
  if (!v3)
    objc_storeStrong(v2, *(id *)(a1 + 32));
}

uint64_t __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_6(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_submitRequest:auditToken:timeout:withHandler:networkActivity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0.0);
}

uint64_t __102___GEOBatchReverseGeocodeRequestTicket__submitRequest_auditToken_timeout_withHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_handleResponse:completion:", a2, *(_QWORD *)(a1 + 40));
}

_GEOPlaceDataItem *__67___GEOBatchReverseGeocodeRequestTicket__handleResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id *v3;
  void *v4;
  void *v5;
  _GEOPlaceDataItem *v6;
  void *v7;
  _GEOPlaceDataItem *v8;

  v2 = a2;
  v3 = v2;
  if (v2 && (-[GEOPDBatchReverseGeocodeResult _readPlace]((uint64_t)v2), v3[4]))
  {
    -[GEOPDBatchReverseGeocodeResult additionalPlaces](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_geo_compactMap:", &__block_literal_global_628);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [_GEOPlaceDataItem alloc];
    -[GEOPDBatchReverseGeocodeResult place](v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_GEOPlaceDataItem initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:](v6, "initWithPlaceData:attributionMap:disambiguationLabel:detourInfo:externalTransitStationCode:additionalPlaces:", v7, 0, 0, 0, 0, v5);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

GEOMapItemAdditionalPlaceInfo *__67___GEOBatchReverseGeocodeRequestTicket__handleResponse_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _GEOPlaceDataItem *v3;
  GEOMapItemAdditionalPlaceInfo *v4;

  v2 = a2;
  v3 = -[_GEOPlaceDataItem initWithPlaceData:]([_GEOPlaceDataItem alloc], "initWithPlaceData:", v2);

  v4 = -[GEOMapItemAdditionalPlaceInfo initWithMapItem:]([GEOMapItemAdditionalPlaceInfo alloc], "initWithMapItem:", v3);
  return v4;
}

@end
