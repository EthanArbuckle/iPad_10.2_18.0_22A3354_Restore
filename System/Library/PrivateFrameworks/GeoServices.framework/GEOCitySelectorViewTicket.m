@implementation GEOCitySelectorViewTicket

void __64___GEOCitySelectorViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  GEOAllGuidesLocationsViewResult *v13;
  id *v14;
  void *v15;
  void *v16;
  GEOAllGuidesLocationsViewResult *v17;
  void *v18;
  NSObject *v19;
  id *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(v5, "globalResult");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (_QWORD *)v7;
      -[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult](v7);
      v9 = v8[7];

      if (v9)
      {
        objc_msgSend(v5, "globalResult");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (_QWORD *)v10;
        if (v10 && (-[GEOPDPlaceGlobalResult _readAllGuidesLocationsViewresult](v10), v11[7]))
        {
          objc_msgSend(v5, "mapsResults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v13 = [GEOAllGuidesLocationsViewResult alloc];
            objc_msgSend(v5, "globalResult");
            v14 = (id *)objc_claimAutoreleasedReturnValue();
            -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "mapsResults");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[GEOAllGuidesLocationsViewResult initWithAllGuidesLocationsViewResult:mapsResults:](v13, "initWithAllGuidesLocationsViewResult:mapsResults:", v15, v16);

            if (v17)
            {
              v18 = 0;
LABEL_15:
              (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

              goto LABEL_16;
            }
            GEOGetGEOCitySelectorViewLookupLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v24) = 0;
              _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Request for a City Selector view returned invalid data.", (uint8_t *)&v24, 2u);
            }
            v23 = CFSTR("Couldn't initialize view result.");
LABEL_14:

            objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, v23);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = 0;
            goto LABEL_15;
          }
        }
        else
        {

        }
        GEOGetGEOCitySelectorViewLookupLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "globalResult");
          v20 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "mapsResults");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138412546;
          v25 = v21;
          v26 = 2048;
          v27 = objc_msgSend(v22, "count");
          _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Request for a City Selector view returned invalid data. hasAllGuidesLocationsViewresult: %@. MapResults count: %lu", (uint8_t *)&v24, 0x16u);

        }
        v23 = CFSTR("No publisher result in response.");
        goto LABEL_14;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

@end
