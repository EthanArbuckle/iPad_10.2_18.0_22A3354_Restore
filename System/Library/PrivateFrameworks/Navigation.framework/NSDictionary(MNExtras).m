@implementation NSDictionary(MNExtras)

+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:destination:spoken:useDisplayName:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a1 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("{distance}"));

  }
  if (a2 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("{valid_distance}"));

  }
  if ((a6 & 1) != 0)
    objc_msgSend(v11, "navAnnouncementName");
  else
    objc_msgSend(v11, "navDisplayNameWithSpecialContacts:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
    objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("{Name}"));
  if ((a6 & 1) != 0)
  {
    objc_msgSend(v11, "navAnnouncementAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a7 & 1) != 0)
      objc_msgSend(v11, "navDisplayName");
    else
      objc_msgSend(v11, "navDisplayAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("{Address}"));

  return v12;
}

+ (id)_navigation_serverStringDictionaryForDistance:()MNExtras validDistance:waypoints:currentDestination:legIndex:spoken:useDisplayName:
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;
  char v26;
  char v27;

  v14 = a5;
  v15 = a6;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("{fromOrigin}"));

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("{Destination}"));
    objc_msgSend(v14, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("{toDestination}"));

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("{currentDestination}"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __146__NSDictionary_MNExtras___navigation_serverStringDictionaryForDistance_validDistance_waypoints_currentDestination_legIndex_spoken_useDisplayName___block_invoke;
    v22[3] = &unk_1E61D81D0;
    v24 = a1;
    v25 = a2;
    v26 = a8;
    v27 = a9;
    v20 = v19;
    v23 = v20;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

+ (id)_navigation_stringTokensForDirectionsError:()MNExtras waypoints:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v6, "content", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formatTokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "type") == 18)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(a1, "_navigation_stringTokensForGenericCombinationsToken:waypoints:isSpokenString:", v11, v7, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("{toDestination}"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("{currentDestination}"));
  +[MNVirtualGarageManager sharedManager](MNVirtualGarageManager, "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastVehicleName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("{VehicleName}"));
  if (objc_msgSend(v8, "count"))
    v19 = v8;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

+ (id)_navigation_stringTokensForGenericCombinationsToken:()MNExtras waypoints:isSpokenString:
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "type") != 18)
    goto LABEL_7;
  objc_msgSend(v7, "genericCombinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_8;
  if ((objc_msgSend(v7, "waypointIndex") & 0x80000000) != 0
    || (v10 = objc_msgSend(v7, "waypointIndex"), v10 >= (int)objc_msgSend(v8, "count")))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v7, "waypointIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (a5)
    objc_msgSend(v11, "navAnnouncementNameAndSubstituteType:", &v17);
  else
    objc_msgSend(v11, "navDisplayNameWithSpecialContacts:substituteType:", 0, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("{Name}"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("{Name}_source"));

  }
  if ((a5 & 1) != 0)
    objc_msgSend(v11, "navAnnouncementAddress");
  else
    objc_msgSend(v11, "navDisplayAddress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("{Address}"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1E620F7B8, CFSTR("{Address}_source"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "waypointCategory"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("{WaypointCategory}"));

LABEL_8:
  return v9;
}

+ (id)_navigation_serverStringDictionaryForMapItem:()MNExtras
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "geoAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStructuredAddress");

  v6 = &stru_1E61D9090;
  v7 = &stru_1E61D9090;
  v8 = &stru_1E61D9090;
  if (v5)
  {
    objc_msgSend(v3, "geoAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "structuredAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "hasFullThoroughfare"))
    {
      objc_msgSend(v10, "fullThoroughfare");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = &stru_1E61D9090;
    }
    if (objc_msgSend(v10, "hasThoroughfare"))
    {
      objc_msgSend(v10, "thoroughfare");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E61D9090;
    }

  }
  navDisplayNameForMapItem(v3, 1, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
    v6 = (__CFString *)v11;
  v14[0] = CFSTR("{Address}");
  v14[1] = CFSTR("{StreetName}");
  v15[0] = v8;
  v15[1] = v7;
  v14[2] = CFSTR("{Name}");
  v15[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
