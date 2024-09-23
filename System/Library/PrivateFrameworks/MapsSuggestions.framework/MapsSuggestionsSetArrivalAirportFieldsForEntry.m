@implementation MapsSuggestionsSetArrivalAirportFieldsForEntry

void __MapsSuggestionsSetArrivalAirportFieldsForEntry_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || objc_msgSend(v5, "count") != 1)
  {
    GEOFindOrCreateLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138412546;
      v20 = v18;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1A427D000, v17, OS_LOG_TYPE_ERROR, "Couldn't get arrival airport '%@', error: %@", (uint8_t *)&v19, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v7, "addressDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("City"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 40), "setString:forKey:", v8, CFSTR("MapsSuggestionsFlightArrivalAirportLocalityKey"));
    v10 = *(void **)(a1 + 40);
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "coordinate");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumber:forKey:", v12, CFSTR("MapsSuggestionsFlightArrivalAirportLatitudeKey"));

    v13 = *(void **)(a1 + 40);
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "coordinate");
    objc_msgSend(v14, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumber:forKey:", v16, CFSTR("MapsSuggestionsFlightArrivalAirportLongitudeKey"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
