@implementation IQFMapsCoreAnalyticsLogger

+ (id)logCoreAnalyticsEventsWithResults:(id)a3 locations:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[3];
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v27 = a4;
  v6 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v11, "muid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        if (v14)
        {
          objc_msgSend(v14, "addObject:", v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "setObject:forKey:", v14, v12);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_opt_new();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v16 = MEMORY[0x24BDAC760];
  v38 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke;
  v32[3] = &unk_250F8D350;
  v36 = a1;
  v17 = v6;
  v33 = v17;
  v18 = v15;
  v34 = v18;
  v35 = v37;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v32);
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "environment");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("XCTestConfigurationFilePath"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 != 0;

  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke_2;
  v28[3] = &unk_250F8D378;
  v30 = v37;
  v31 = v23;
  v24 = v19;
  v29 = v24;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v28);

  _Block_object_dispose(v37, 8);
  return v24;
}

void __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 56), "_createCoreAnalyticsEventForLocation:index:muidsToResults:", a2, a3, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(v5, "objectForKey:", IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __74__IQFMapsCoreAnalyticsLogger_logCoreAnalyticsEventsWithResults_locations___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, IQFMapsCoreAnalyticsFieldName_queryResultsHavePersonalizationSignals);

  if (!*(_BYTE *)(a1 + 48))
    AnalyticsSendEvent();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (id)_createCoreAnalyticsEventForLocation:(id)a3 index:(unint64_t)a4 muidsToResults:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  void *v39;
  __CFString **v40;
  __CFString **v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, IQFMapsCoreAnalyticsFieldName_startingRank);

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, IQFMapsCoreAnalyticsFieldName_client);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend((id)objc_opt_class(), "BOOLeanCoreAnalyticsKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v54;
    v17 = MEMORY[0x24BDBD1C0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v9, "setObject:forKey:", v17, *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v15);
  }

  v48 = v7;
  objc_msgSend(v7, "muid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v8;
  objc_msgSend(v8, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v50 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v27, "startEventDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isDateInTodayOrFuture");

        objc_msgSend(v27, "startEventDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "timeIntervalSinceNow");
        v32 = v31;

        objc_msgSend(v27, "dateOfLastVisit");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "timeIntervalSinceNow");
        v35 = v34;

        v36 = v32 / 3600.0;
        v37 = v35 / -3600.0;
        switch(objc_msgSend(v27, "resultType"))
        {
          case 1:
            objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], IQFMapsCoreAnalyticsFieldName_hasLifeEvent);
            objc_msgSend(v27, "numberOfVisits");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_rawLifeEventVisitCount;
            v41 = &IQFMapsCoreAnalyticsFieldName_lifeEventTimeSinceLastVisit;
            goto LABEL_26;
          case 2:
          case 3:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingFlightReservation;
            break;
          case 4:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingRestaurantReservation;
            break;
          case 5:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingHotelReservation;
            break;
          case 6:
          case 7:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingCarReservation;
            break;
          case 8:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingTicketReservation;
            break;
          case 9:
            if (!v29)
              continue;
            v38 = 0x24BDD1000uLL;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_hasUpcomingGenericCalendarEvent;
            break;
          case 10:
            objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], IQFMapsCoreAnalyticsFieldName_hasEntityRelevance);
            objc_msgSend(v27, "numberOfVisits");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v42, IQFMapsCoreAnalyticsFieldName_decayedVisitCount);

            objc_msgSend(v27, "numberOfVisitsGivenLocation");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v43, IQFMapsCoreAnalyticsFieldName_decayedVisitCountGivenCurrentLocation);

            objc_msgSend(v27, "entityRelevanceScore");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = &IQFMapsCoreAnalyticsFieldName_entityRelevanceScore;
            v41 = &IQFMapsCoreAnalyticsFieldName_timeSinceLastVisit;
LABEL_26:
            v38 = 0x24BDD1000;
            goto LABEL_30;
          default:
            continue;
        }
        v37 = v36;
        v41 = &IQFMapsCoreAnalyticsFieldName_timeToUpcomingEvent;
LABEL_30:
        objc_msgSend(v9, "setObject:forKey:", v39, *v40);

        objc_msgSend(*(id *)(v38 + 1760), "numberWithDouble:", v37);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v44, *v41);

        v24 = 1;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24 & 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v45, IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals);

  return v9;
}

+ (id)BOOLeanCoreAnalyticsKeys
{
  if (BOOLeanCoreAnalyticsKeys_onceToken != -1)
    dispatch_once(&BOOLeanCoreAnalyticsKeys_onceToken, &__block_literal_global);
  return (id)BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys;
}

void __54__IQFMapsCoreAnalyticsLogger_BOOLeanCoreAnalyticsKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x24BDAC8D0];
  v2[0] = IQFMapsCoreAnalyticsFieldName_hasPersonalizationSignals;
  v2[1] = IQFMapsCoreAnalyticsFieldName_queryResultsHavePersonalizationSignals;
  v2[2] = IQFMapsCoreAnalyticsFieldName_hasLifeEvent;
  v2[3] = IQFMapsCoreAnalyticsFieldName_hasEntityRelevance;
  v2[4] = IQFMapsCoreAnalyticsFieldName_hasUpcomingCarReservation;
  v2[5] = IQFMapsCoreAnalyticsFieldName_hasUpcomingFlightReservation;
  v2[6] = IQFMapsCoreAnalyticsFieldName_hasUpcomingGenericCalendarEvent;
  v2[7] = IQFMapsCoreAnalyticsFieldName_hasUpcomingHotelReservation;
  v2[8] = IQFMapsCoreAnalyticsFieldName_hasUpcomingRestaurantReservation;
  v2[9] = IQFMapsCoreAnalyticsFieldName_hasUpcomingTicketReservation;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys;
  BOOLeanCoreAnalyticsKeys_BOOLeanCoreAnalyticsKeys = v0;

}

@end
