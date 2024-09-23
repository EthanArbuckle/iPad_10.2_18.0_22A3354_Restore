@implementation MapsSuggestionsTransportModeForOriginAndDestinationMapItem

void __MapsSuggestionsTransportModeForOriginAndDestinationMapItem_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "Could not predict transport mode. Error: %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_5;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    GEOFindOrCreateLog();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = (id)objc_opt_class();
      v14 = v16;
      _os_log_impl(&dword_1A427D000, v12, OS_LOG_TYPE_ERROR, "Unexpected class type for predicted transport mode. Error: %@", (uint8_t *)&v15, 0xCu);

    }
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 4;
    goto LABEL_6;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "intValue");

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 4)
  {
    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A427D000, v11, OS_LOG_TYPE_ERROR, "Could not set predicted transport mode. We predicted GEOTransportType_UNKNOWN_TRANSPORT_TYPE.", (uint8_t *)&v15, 2u);
    }

  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

@end
