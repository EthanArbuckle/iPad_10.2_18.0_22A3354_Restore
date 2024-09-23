@implementation NSDictionary

id __54__NSDictionary_SFExtras__sf_asTextColumnsCardSection___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x1E0D8C7B0];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "parsec_mapAndFilterObjectsUsingBlock:", &__block_literal_global_629);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSections:", v5);
  return v4;
}

id __54__NSDictionary_SFExtras__sf_asTextColumnsCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = (objc_class *)MEMORY[0x1E0D8C7B8];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "parsec_arrayForKey:", CFSTR("text_lines"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextLines:", v5);

  objc_msgSend(v4, "setTextNoWrap:", objc_msgSend(v3, "parsec_BOOLForKey:", CFSTR("text_nowrap")));
  objc_msgSend(v3, "parsec_numberForKey:", CFSTR("text_weight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = -1;
  objc_msgSend(v4, "setTextWeight:", v7);

  return v4;
}

uint64_t __54__NSDictionary_SFExtras__sf_asDetailedRowCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asRichText:", *(_QWORD *)(a1 + 32));
}

uint64_t __51__NSDictionary_SFExtras__sf_asTableRowCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(_QWORD *)(a1 + 32));
}

id __51__NSDictionary_SFExtras__sf_asTableAlignmentSchema__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D8C790];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", CFSTR("right")))
  {
    v9 = v7;
    v10 = 2;
LABEL_7:
    objc_msgSend(v9, "setColumnAlignment:", v10);
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("left")))
  {
    v9 = v7;
    v10 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("center")))
  {
    v9 = v7;
    v10 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v7, "setColumnAlignment:", 0);
  if (PARLogHandleForCategory_onceToken_274 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
  v15 = PARLogHandleForCategory_logHandles_1_275;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
  {
    v21 = 138412290;
    v22 = (unint64_t)v8;
    _os_log_error_impl(&dword_19A825000, v15, OS_LOG_TYPE_ERROR, "unknown table alignment schema column_align: %@", (uint8_t *)&v21, 0xCu);
  }
LABEL_8:
  if (objc_msgSend(*(id *)(a1 + 32), "count") > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("center")))
    {
      v12 = v7;
      v13 = 1;
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("right")))
    {
      v12 = v7;
      v13 = 2;
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("left")))
      {
        objc_msgSend(v7, "setColumnAlignment:", 0);
        if (PARLogHandleForCategory_onceToken_274 != -1)
          dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
        v20 = PARLogHandleForCategory_logHandles_1_275;
        if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
        {
          v21 = 138412290;
          v22 = (unint64_t)v11;
          _os_log_error_impl(&dword_19A825000, v20, OS_LOG_TYPE_ERROR, "unknown table alignment schema within_column_align: %@", (uint8_t *)&v21, 0xCu);
        }
        goto LABEL_24;
      }
      v12 = v7;
      v13 = 0;
    }
    objc_msgSend(v12, "setDataAlignment:", v13);
LABEL_24:

    goto LABEL_25;
  }
  objc_msgSend(v7, "setColumnAlignment:", 0);
  if (PARLogHandleForCategory_onceToken_274 != -1)
    dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
  v14 = PARLogHandleForCategory_logHandles_1_275;
  if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
  {
    v21 = 134217984;
    v22 = a3;
    _os_log_error_impl(&dword_19A825000, v14, OS_LOG_TYPE_ERROR, "missing table alignment schema within_column_align[%lu]", (uint8_t *)&v21, 0xCu);
  }
LABEL_25:
  objc_msgSend(v7, "setIsEqualWidth:", 0);
  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    if (objc_msgSend(v16, "count") <= a3)
    {
      if (PARLogHandleForCategory_onceToken_274 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
      v18 = PARLogHandleForCategory_logHandles_1_275;
      if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
      {
        v21 = 134217984;
        v22 = a3;
        _os_log_error_impl(&dword_19A825000, v18, OS_LOG_TYPE_ERROR, "missing table alignment schema equal_width[%lu]", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsEqualWidth:", objc_msgSend(v17, "BOOLValue"));

    }
  }

  return v7;
}

id __55__NSDictionary_SFExtras__sf_asKeyValueDataCardSection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0D8C468];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setKey:", v6);

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:", v8);

  return v7;
}

uint64_t __53__NSDictionary_SFExtras__sf_asNowPlayingCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaItem:", *(_QWORD *)(a1 + 32));
}

id __53__NSDictionary_SFExtras__sf_asScoreboardCardSection___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D8C728];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "sf_imageForKey:reply:", CFSTR("image"), *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLogo:", v6);

  objc_msgSend(v4, "parsec_stringForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecord:", v7);

  objc_msgSend(v4, "parsec_stringForKey:", CFSTR("readable_string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityDescription:", v8);

  objc_msgSend(v4, "parsec_stringForKey:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setName:", v9);
  return v5;
}

uint64_t __58__NSDictionary_SFExtras__sf_asSocialMediaPostCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__NSDictionary_SFExtras__sf_asMediaPlayerCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaItem:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaDetail:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parsec_URLForKey:", a2);
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asTrackListCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asTrack:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__NSDictionary_SFExtras__sf_asAppLinkCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asAppLink:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asMediaOffer:", *(_QWORD *)(a1 + 32));
}

id __51__NSDictionary_SFExtras__sf_baseCardSection_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __CFString *v4;
  const __CFString *v5;

  objc_msgSend(a2, "sf_asPunchout:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "parsec_stringForKey:", CFSTR("action_target_id"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v4, "length"))
    v5 = v4;
  else
    v5 = CFSTR("open");
  objc_msgSend(v3, "setActionTarget:", v5);

  return v3;
}

id __37__NSDictionary_SFExtras__sf_asFlight__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0D8C3C0]);
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatus:", objc_msgSend(v4, "integerValue"));

  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("departure_published_time"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v6, "intValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeparturePublishedTime:", v7);

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("departure_actual_time"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v9, "intValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureActualTime:", v10);

  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("departure_terminal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureTerminal:", v11);

  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("departure_gate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureGate:", v12);

  v13 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("departure_gate_closed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v14, "intValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureGateClosedTime:", v15);

  v16 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("departure_runway"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v17, "intValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureRunwayTime:", v18);

  objc_msgSend(v2, "parsec_dictionaryForKey:", CFSTR("departure_airport"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sf_asAirport");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDepartureAirport:", v20);

  v21 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("arrival_published_time"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v22, "intValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalPublishedTime:", v23);

  v24 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("arrival_actual_time"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v25, "intValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalActualTime:", v26);

  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("arrival_terminal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalTerminal:", v27);

  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("arrival_gate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalGate:", v28);

  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("baggage_claim"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaggageClaim:", v29);

  v30 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("arrival_runway"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v31, "intValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalRunwayTime:", v32);

  v33 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "parsec_numberForKey:", CFSTR("gate_arrival"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v34, "intValue"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalGateTime:", v35);

  objc_msgSend(v2, "parsec_dictionaryForKey:", CFSTR("arrival_airport"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sf_asAirport");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrivalAirport:", v37);

  objc_msgSend(v2, "parsec_dictionaryForKey:", CFSTR("diverted_airport"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    objc_msgSend(v38, "sf_asAirport");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDivertedAirport:", v40);

  }
  objc_msgSend(v2, "parsec_stringForKey:", CFSTR("title"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v41);

  return v3;
}

uint64_t __40__NSDictionary_SFExtras__sf_asRichText___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asImage:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__NSDictionary_SFExtras__sf_asRichText___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asFormattedText:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sf_asRichText:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
}

@end
