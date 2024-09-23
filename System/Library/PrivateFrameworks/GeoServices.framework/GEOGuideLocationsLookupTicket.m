@implementation GEOGuideLocationsLookupTicket

void __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__18;
    v27 = __Block_byref_object_dispose__18;
    v28 = 0;
    objc_msgSend(v5, "mapsResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke_994;
      v22[3] = &unk_1E1C06CF0;
      v22[4] = &v23;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
      objc_msgSend(v5, "mapsResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Batch Request for a City Selector view returned invalid data. guideLocationEntries count: %lu. MapResults count: %lu"), v10, objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      GEOGetGEOCitySelectorViewLookupLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v24[5];
      v24[5] = v14;

    }
    +[GEOGuideLocation guideLocationsForEntries:mapsResults:](GEOGuideLocation, "guideLocationsForEntries:mapsResults:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (v17 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Batch Request for a City Selector view could not initialize some guide locations. Expected Count: %lu. Actual Count: %lu"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"), objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      GEOGetGEOCitySelectorViewLookupLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Error : %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v24[5];
      v24[5] = v20;

      v16 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    _Block_object_dispose(&v23, 8);
  }

}

void __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke_994(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(v6, "resultType") != 1 || (objc_msgSend(v6, "hasPlace") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Batch Request for a City Selector view returned a maps result without a place or invalid type. MapResults: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetGEOCitySelectorViewLookupLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Error : %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

@end
