@implementation NSDictionary

void __146__NSDictionary_MNExtras___navigation_serverStringDictionaryForDistance_validDistance_waypoints_currentDestination_legIndex_spoken_useDisplayName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a2;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(double *)(a1 + 40) >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("{distance}"));

  }
  if (*(double *)(a1 + 48) >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("{valid_distance}"));

  }
  v16 = 0;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v5, "navAnnouncementNameAndSubstituteType:", &v16);
  else
    objc_msgSend(v5, "navDisplayNameWithSpecialContacts:substituteType:", 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("{Name}"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("{Name}_source"));

  }
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v5, "navAnnouncementAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (*(_BYTE *)(a1 + 57))
      objc_msgSend(v5, "navDisplayName");
    else
      objc_msgSend(v5, "navDisplayAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("{Address}"));
    objc_msgSend(v8, "setObject:forKey:", &unk_1E620F7B8, CFSTR("{Address}_source"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "waypointCategory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("{WaypointCategory}"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);
}

@end
