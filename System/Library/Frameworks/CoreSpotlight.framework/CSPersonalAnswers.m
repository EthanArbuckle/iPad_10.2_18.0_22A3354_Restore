@implementation CSPersonalAnswers

+ (id)fetchAttributes
{
  if (fetchAttributes_onceAttributesToken != -1)
    dispatch_once(&fetchAttributes_onceAttributesToken, &__block_literal_global_33);
  return (id)fetchAttributes_cachedAttributes;
}

void __36__CSPersonalAnswers_fetchAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[12];
  _QWORD v11[15];
  _QWORD v12[16];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("kMDItemEventMessageIdentifier");
  v13[1] = CFSTR("kMDItemEventType");
  v13[2] = CFSTR("kMDItemEventIsAllDay");
  v13[3] = CFSTR("kMDItemStartDate");
  v13[4] = CFSTR("kMDItemEndDate");
  v13[5] = CFSTR("com_apple_mail_messageID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 6);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_block_invoke_commonEventAttributes;
  _block_invoke_commonEventAttributes = v1;

  v12[0] = CFSTR("kMDItemEventFlightNumber");
  v12[1] = CFSTR("kMDItemEventFlightCarrier");
  v12[2] = CFSTR("kMDItemEventFlightCarrierCode");
  v12[3] = CFSTR("kMDItemEventFlightArrivalDateTime");
  v12[4] = CFSTR("kMDItemEventFlightArrivalTimeZone");
  v12[5] = CFSTR("kMDItemEventFlightDepartureDateTime");
  v12[6] = CFSTR("kMDItemEventFlightDepartureTimeZone");
  v12[7] = CFSTR("kMDItemEventFlightArrivalAirportCode");
  v12[8] = CFSTR("kMDItemEventFlightDepartureAirportCode");
  v12[9] = CFSTR("kMDItemEventFlightConfirmationNumber");
  v12[10] = CFSTR("kMDItemEventFlightArrivalAirportName");
  v12[11] = CFSTR("kMDItemEventFlightDepartureAirportName");
  v12[12] = CFSTR("kMDItemEventFlightPassengerNames");
  v12[13] = CFSTR("kMDItemEventFlightPassengerSeatNumbers");
  v12[14] = CFSTR("kMDItemEventFlightArrivalTerminal");
  v12[15] = CFSTR("kMDItemEventFlightDepartureTerminal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 16);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_block_invoke_flightEventAttributes;
  _block_invoke_flightEventAttributes = v3;

  v11[0] = CFSTR("kMDItemEventHotelReservationId");
  v11[1] = CFSTR("kMDItemEventHotelUnderName");
  v11[2] = CFSTR("kMDItemEventHotelProvider");
  v11[3] = CFSTR("kMDItemEventHotelCheckinDate");
  v11[4] = CFSTR("kMDItemEventHotelCheckinTime");
  v11[5] = CFSTR("kMDItemEventHotelCheckoutDate");
  v11[6] = CFSTR("kMDItemEventHotelCheckoutTime");
  v11[7] = CFSTR("kMDItemEventHotelTimeZone");
  v11[8] = CFSTR("kMDItemEventHotelReservationForName");
  v11[9] = CFSTR("kMDItemEventHotelReservationForAddress");
  v11[10] = CFSTR("kMDItemEventHotelReservationForStreetAddress");
  v11[11] = CFSTR("kMDItemEventHotelReservationForAddressLocality");
  v11[12] = CFSTR("kMDItemEventHotelReservationForAddressRegion");
  v11[13] = CFSTR("kMDItemEventHotelReservationForAddressPostalCode");
  v11[14] = CFSTR("kMDItemEventHotelReservationForAddressCountry");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 15);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_block_invoke_hotelEventAttributes;
  _block_invoke_hotelEventAttributes = v5;

  v10[0] = CFSTR("kMDItemEventRestaurantReservationId");
  v10[1] = CFSTR("kMDItemEventRestaurantUnderName");
  v10[2] = CFSTR("kMDItemEventRestaurantStartDate");
  v10[3] = CFSTR("kMDItemEventRestaurantStartTime");
  v10[4] = CFSTR("kMDItemEventRestaurantTimeZone");
  v10[5] = CFSTR("kMDItemEventRestaurantReservationForName");
  v10[6] = CFSTR("kMDItemEventRestaurantReservationForAddress");
  v10[7] = CFSTR("kMDItemEventRestaurantReservationForStreetAddress");
  v10[8] = CFSTR("kMDItemEventRestaurantReservationForAddressLocality");
  v10[9] = CFSTR("kMDItemEventRestaurantReservationForAddressRegion");
  v10[10] = CFSTR("kMDItemEventRestaurantReservationForAddressPostalCode");
  v10[11] = CFSTR("kMDItemEventRestaurantReservationForAddressCountry");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_block_invoke_restaurantEventAttributes;
  _block_invoke_restaurantEventAttributes = v7;

  objc_msgSend(v0, "addObjectsFromArray:", _block_invoke_commonEventAttributes);
  objc_msgSend(v0, "addObjectsFromArray:", _block_invoke_flightEventAttributes);
  objc_msgSend(v0, "addObjectsFromArray:", _block_invoke_hotelEventAttributes);
  objc_msgSend(v0, "addObjectsFromArray:", _block_invoke_restaurantEventAttributes);
  v9 = (void *)fetchAttributes_cachedAttributes;
  fetchAttributes_cachedAttributes = (uint64_t)v0;

}

+ (id)personalAnswersEventIntentForQUOutput:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = _os_feature_enabled_impl();
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v3;
      _os_log_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEFAULT, "[debug][personal answers][query] queryUnderstandingOutput = %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    +[CSPersonalAnswers personalAnswersEventIntentForQUOutput:].cold.1((uint64_t)v3, v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v3;
    v7 = v3;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("kQPQUIntentLabels")))
          {
            -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "count"))
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = v14;
                if ((objc_msgSend(v15, "hasPrefix:", CFSTR("INTENT_FLIGHT")) & 1) != 0
                  || (objc_msgSend(v15, "hasPrefix:", CFSTR("INTENT_HOTEL")) & 1) != 0
                  || (objc_msgSend(v15, "hasPrefix:", CFSTR("INTENT_RESTAURANT")) & 1) != 0)
                {
                  logForCSLogCategoryDefault();
                  v16 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v25 = v15;
                    _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, "[personal answers][query] queryUnderstandingOutput has event intent, kQPQUIntentLabels = %@", buf, 0xCu);
                  }

                  goto LABEL_33;
                }

              }
            }

          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }

    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "[personal answers][query] No event Intent detected in queryUnderstandingOutput", buf, 2u);
    }
    v15 = 0;
LABEL_33:
    v3 = v18;
  }
  else
  {
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "[personal answers][query] queryUnderstandingOutput dictionary is empty", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)attributeIntentsFromQU:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (attributeIntentsFromQU__onceToken[0] != -1)
    dispatch_once(attributeIntentsFromQU__onceToken, &__block_literal_global_12);
  objc_msgSend((id)attributeIntentsFromQU__mapQUIntentToAttributes, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v13 = 138412290;
    v14 = v3;
    v9 = "[personal answers][query] Unrecognized personalAnswersQUIntent found from QU: %@";
LABEL_11:
    v10 = v7;
    v11 = 12;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v4, "count");
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (!v8)
      goto LABEL_13;
    v13 = 138412290;
    v14 = v3;
    v9 = "[personal answers][query] For personalAnswersQUIntent: %@, assigning no answer attributes";
    goto LABEL_11;
  }
  if (v8)
  {
    v13 = 138412546;
    v14 = v3;
    v15 = 2112;
    v16 = v5;
    v9 = "[personal answers][query] For personalAnswersQUIntent: %@, assigning answer attributes: %@";
    v10 = v7;
    v11 = 22;
LABEL_12:
    _os_log_impl(&dword_18C42F000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
  }
LABEL_13:

  return v5;
}

void __44__CSPersonalAnswers_attributeIntentsFromQU___block_invoke()
{
  void *v0;

  v0 = (void *)attributeIntentsFromQU__mapQUIntentToAttributes;
  attributeIntentsFromQU__mapQUIntentToAttributes = (uint64_t)&unk_1E2430300;

}

+ (id)personalAnswersFallbackQueries:(id)a3 queryComponents:(id)a4 searchString:(id)a5 answerAttributeIntents:(id)a6 isShortQuery:(BOOL)a7 locale:(id)a8
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a7;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a8;
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {
    logForCSLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[personal answers][fallback qp]: No fallback query triggered for query with < 2 tokens";
LABEL_7:
      _os_log_impl(&dword_18C42F000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    logForCSLogCategoryDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "[personal answers][fallback qp]: No fallback query triggered for short query";
      goto LABEL_7;
    }
LABEL_8:
    v18 = 0;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSPersonalAnswersUtils intentsForStringTokens:filteredTokens:categoryIntents:attributeIntents:locale:](CSPersonalAnswersUtils, "intentsForStringTokens:filteredTokens:categoryIntents:attributeIntents:locale:", v12, v19, v16, v14, v15);
  if (-[NSObject count](v16, "count"))
  {
    +[CSPersonalAnswers structuredIntentQueryForCategoryIntents:](CSPersonalAnswers, "structuredIntentQueryForCategoryIntents:", v16);
    v20 = objc_claimAutoreleasedReturnValue();
    +[CSPersonalAnswers structuredFreeTextQueryForTokens:searchString:searchStringTokens:categoryIntents:](CSPersonalAnswers, "structuredFreeTextQueryForTokens:searchString:searchStringTokens:categoryIntents:", v19, v13, v12, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && -[NSObject length](v20, "length"))
    {
      if (v21 && objc_msgSend(v21, "length"))
      {
        objc_msgSend(v22, "appendFormat:", CFSTR("(%@)"), v20);
        objc_msgSend(v22, "appendString:", CFSTR(" && "));
        objc_msgSend(v22, "appendString:", v21);
      }
      else
      {
        objc_msgSend(v22, "appendFormat:", CFSTR("%@"), v20);
      }
    }
    if (objc_msgSend(v22, "length"))
    {
      v24 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    logForCSLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v26 = -[NSObject count](v16, "count");
      v27 = 2048;
      v28 = objc_msgSend(v14, "count");
      _os_log_impl(&dword_18C42F000, v20, OS_LOG_TYPE_DEFAULT, "[personal answers][fallback qp]: No fallback query triggered for query with categoryIntents.count =  %ld and attributeIntents.count=%ld", buf, 0x16u);
    }
    v18 = 0;
  }

LABEL_24:
  return v18;
}

+ (id)attributesFromIntent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a3;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSPersonalAnswers fetchAttributes](CSPersonalAnswers, "fetchAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v7);
  return v5;
}

+ (id)structuredFreeTextQueryForTokens:(id)a3 searchString:(id)a4 searchStringTokens:(id)a5 categoryIntents:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "rangeOfString:", CFSTR(" to "));
  v14 = objc_msgSend(v10, "rangeOfString:", CFSTR(" from "));
  v45 = v12;
  v15 = objc_msgSend(v12, "containsObject:", &unk_1E2430210);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = v14 == 0x7FFFFFFFFFFFFFFFLL && v13 == 0x7FFFFFFFFFFFFFFFLL;
  v46 = v11;
  v47 = (void *)v16;
  if (!v18 && v15)
  {
    v43 = v9;
    v44 = v10;
    v49 = (void *)objc_msgSend(v9, "mutableCopy");
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v19 = v11;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (!v20)
      goto LABEL_25;
    v21 = v20;
    v22 = 0;
    v23 = 0;
    v24 = *(_QWORD *)v55;
    while (1)
    {
      v25 = 0;
      do
      {
        v26 = v22;
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v19);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v25);
        v22 = objc_msgSend(v27, "isEqualToString:", CFSTR("to"));
        if ((v22 & 1) != 0)
        {
LABEL_12:
          v23 = 0;
          goto LABEL_19;
        }
        if ((objc_msgSend(v27, "isEqualToString:", CFSTR("from")) & 1) != 0)
        {
          v23 = 1;
          goto LABEL_19;
        }
        if ((v26 & 1) == 0)
        {
          if ((v23 & 1) == 0)
            goto LABEL_12;
          v28 = v47;
          v23 = 0;
          if (!objc_msgSend(v47, "length"))
            goto LABEL_18;
LABEL_17:
          objc_msgSend(v28, "appendString:", CFSTR(" "));
          goto LABEL_18;
        }
        v28 = v48;
        if (objc_msgSend(v48, "length"))
          goto LABEL_17;
LABEL_18:
        objc_msgSend(v28, "appendString:", v27);
        objc_msgSend(v49, "removeObject:", v27);
LABEL_19:
        ++v25;
      }
      while (v21 != v25);
      v29 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      v21 = v29;
      if (!v29)
      {
LABEL_25:

        v10 = v44;
        v11 = v46;
        v17 = v47;
        v9 = v49;
        break;
      }
    }
  }
  if (objc_msgSend(v9, "count") || objc_msgSend(v48, "length") || objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v31 = v9;
    v32 = v9;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v51 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(** = '%@*'cdwt)"), *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addObject:", v37);

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v34);
    }

    v38 = v48;
    if (objc_msgSend(v48, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemEventFlightArrivalAirportCode=\"%@*\"cwd || kMDItemEventFlightArrivalAirportName=\"%@*\"cwd || kMDItemEventFlightArrivalTerminal=\"%@*\"cwd || kMDItemEventFlightArrivalAirportAddress=\"%@*\"cwd || kMDItemEventFlightArrivalAirportStreetAddress=\"%@*\"cwd || kMDItemEventFlightArrivalAirportLocality=\"%@*\"cwd || kMDItemEventFlightArrivalAirportRegion=\"%@*\"cwd || kMDItemEventFlightArrivalAirportCountry=\"%@*\"cwd)"), v48, v48, v48, v48, v48, v48, v48, v48);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v39);

    }
    v17 = v47;
    v9 = v31;
    if (objc_msgSend(v47, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemEventFlightDepartureAirportCode=\"%@*\"cwd || kMDItemEventFlightDepartureAirportName=\"%@*\"cwd || kMDItemEventFlightDepartureTerminal=\"%@*\"cwd || kMDItemEventFlightDepartureAirportAddress=\"%@*\"cwd || kMDItemEventFlightDepartureAirportStreetAddress=\"%@*\"cwd || kMDItemEventFlightDepartureAirportLocality=\"%@*\"cwd || kMDItemEventFlightDepartureAirportRegion=\"%@*\"cwd || kMDItemEventFlightDepartureAirportCountry=\"%@*\"cwd)"), v47, v47, v47, v47, v47, v47, v47, v47);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v40);

    }
    objc_msgSend(v30, "componentsJoinedByString:", CFSTR(" && "));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v46;
  }
  else
  {
    v41 = 0;
    v38 = v48;
  }

  return v41;
}

+ (id)structuredIntentQueryForCategoryIntents:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
    v4 = objc_msgSend(v3, "containsObject:", &unk_1E2430228);
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "appendString:", CFSTR("kMDItemEventType=\"flight\" || kMDItemEventType=\"hotel\" || kMDItemEventType=\"restaurant\"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2430240, &unk_1E2430258, &unk_1E2430270, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "intersectsSet:", v7);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
LABEL_8:
      v13 = 0;
      while (2)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "integerValue"))
        {
          case 0:
            v14 = CFSTR("kMDItemEventType=\"flight\");
            if (objc_msgSend(v6, "length"))
              goto LABEL_18;
            goto LABEL_19;
          case 1:
            v14 = CFSTR("kMDItemEventType=\"hotel\");
            if (!objc_msgSend(v6, "length"))
              goto LABEL_19;
            goto LABEL_18;
          case 2:
            if ((v8 & 1) != 0)
              goto LABEL_20;
            v14 = CFSTR("kMDItemEventType=\"restaurant\");
            if (objc_msgSend(v6, "length"))
LABEL_18:
              objc_msgSend(v6, "appendString:", CFSTR(" || "));
LABEL_19:
            objc_msgSend(v6, "appendString:", v14);
LABEL_20:
            if (v11 != ++v13)
              continue;
            v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            v11 = v15;
            if (!v15)
              goto LABEL_29;
            goto LABEL_8;
          case 3:
            v14 = CFSTR("kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"breakfast\");
            if (!objc_msgSend(v6, "length"))
              goto LABEL_19;
            goto LABEL_18;
          case 4:
            v14 = CFSTR("kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"lunch\");
            if (objc_msgSend(v6, "length"))
              goto LABEL_18;
            goto LABEL_19;
          case 5:
            v14 = CFSTR("kMDItemEventType=\"restaurant\" && kMDItemEventRestaurantMealType=\"dinner\");
            if (!objc_msgSend(v6, "length"))
              goto LABEL_19;
            goto LABEL_18;
          default:
            goto LABEL_20;
        }
      }
    }
LABEL_29:

    v3 = v17;
  }

  return v6;
}

+ (void)personalAnswersEventIntentForQUOutput:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18C42F000, a2, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] queryUnderstandingOutput = %@", (uint8_t *)&v2, 0xCu);
}

@end
