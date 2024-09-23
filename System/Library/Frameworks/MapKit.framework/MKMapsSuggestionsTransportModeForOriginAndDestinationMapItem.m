@implementation MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem

void __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("MapsSuggestionsTransportModePredictionQueue", v2);
  v1 = (void *)MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue;
  MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue = (uint64_t)v0;

}

void __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_s_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_3;
  v13[3] = &unk_1E20D9280;
  v14 = v6;
  v15 = v5;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v16 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  dispatch_async(v12, v13);

}

uint64_t __MKMapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t (*v4)(void);
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(void **)(a1 + 32);
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_ERROR, "Could not predict transport mode. Error: %@", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_impl(&dword_18B0B0000, v2, OS_LOG_TYPE_ERROR, "Unexpected class type for predicted transport mode. Error: %@", (uint8_t *)&v12, 0xCu);

    }
LABEL_4:

    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v4();
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "intValue");

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 4)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_18B0B0000, v9, OS_LOG_TYPE_ERROR, "Could not set predicted transport mode.", (uint8_t *)&v12, 2u);
    }

  }
  v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  return v4();
}

@end
