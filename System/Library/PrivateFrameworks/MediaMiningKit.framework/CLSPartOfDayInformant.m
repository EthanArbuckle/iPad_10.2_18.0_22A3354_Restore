@implementation CLSPartOfDayInformant

+ (id)familyIdentifier
{
  __CFString *v2;

  v2 = CFSTR("com.apple.mediaminingkit.informant.core");
  return CFSTR("com.apple.mediaminingkit.informant.core");
}

+ (id)classIdentifier
{
  return CFSTR("partofday");
}

+ (id)informantDependenciesIdentifiers
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)gatherCluesForInvestigation:(id)a3 progressBlock:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "clueCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v22 = v6;
    objc_msgSend(v4, "feeder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSPartOfDayCalculation partsOfDayForFeeder:](CLSPartOfDayCalculation, "partsOfDayForFeeder:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          v19 = v18;

          +[CLSOutputClue clueWithValue:forKey:confidence:relevance:](CLSOutputClue, "clueWithValue:forKey:confidence:relevance:", v16, CFSTR("Time of Day"), v19, 0.0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    v6 = v22;
  }

  return v5;
}

@end
