@implementation MUPlaceHoursSectionViewConfiguration

+ (id)configurationForMapItem:(id)a3
{
  id v3;
  id v4;
  MUBusinessHoursConfiguration *v5;
  void *v6;
  void *v7;
  MUBusinessHoursConfiguration *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  MUBusinessHoursConfiguration *v18;
  void *v19;
  void *v20;
  MUBusinessHoursConfiguration *v21;
  void *v22;
  void *v23;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v3, "_hasBusinessHours"))
  {
    v5 = [MUBusinessHoursConfiguration alloc];
    objc_msgSend(v3, "_businessHours");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MUBusinessHoursConfiguration initWithBusinessHours:timeZone:](v5, "initWithBusinessHours:timeZone:", v6, v7);

    _MULocalizedStringFromThisBundle(CFSTR("Hours [Placecard]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBusinessHoursConfiguration setHoursName:](v8, "setHoursName:", v9);

    objc_msgSend(v4, "addObject:", v8);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = v3;
  objc_msgSend(v3, "_linkedServices", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "businessHours");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          v18 = [MUBusinessHoursConfiguration alloc];
          objc_msgSend(v15, "businessHours");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeZone");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[MUBusinessHoursConfiguration initWithBusinessHours:timeZone:](v18, "initWithBusinessHours:timeZone:", v19, v20);

          objc_msgSend(v15, "localizedCategoryName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUBusinessHoursConfiguration setHoursName:](v21, "setHoursName:", v22);

          -[MUBusinessHoursConfiguration setIsServiceHours:](v21, "setIsServiceHours:", 1);
          objc_msgSend(v4, "addObject:", v21);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

  objc_msgSend(v26, "configurationForBusinessHours:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)configurationForMessagesMapItem:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MUBusinessHoursConfiguration *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MUBusinessHoursConfiguration *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "_messageBusinessHours");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "_geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_messageLink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [MUBusinessHoursConfiguration alloc];
      objc_msgSend(v4, "_messageBusinessHours");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_geoMapItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_messageLink");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MUBusinessHoursConfiguration initWithBusinessHours:timeZone:](v11, "initWithBusinessHours:timeZone:", v13, v16);

      _MULocalizedStringFromThisBundle(CFSTR("Messages Hours [Placecard]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUBusinessHoursConfiguration setHoursName:](v17, "setHoursName:", v18);

      objc_msgSend(v5, "addObject:", v17);
    }
  }
  objc_msgSend(a1, "configurationForBusinessHours:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)configurationForBusinessHours:(id)a3
{
  id v3;
  MUPlaceHoursSectionViewConfiguration *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MUPlaceHoursSectionViewConfiguration);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isServiceHours");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v3, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlaceHoursSectionViewConfiguration setPlaceHours:](v4, "setPlaceHours:", v8);

      objc_msgSend(v5, "removeObjectAtIndex:", 0);
    }
  }
  v9 = (void *)objc_msgSend(v5, "copy");
  -[MUPlaceHoursSectionViewConfiguration setServiceHoursList:](v4, "setServiceHoursList:", v9);

  -[MUPlaceHoursSectionViewConfiguration setNumberOfInlineServiceHours:](v4, "setNumberOfInlineServiceHours:", GEOConfigGetUInteger());
  return v4;
}

- (MUBusinessHoursConfiguration)placeHours
{
  return self->_placeHours;
}

- (void)setPlaceHours:(id)a3
{
  objc_storeStrong((id *)&self->_placeHours, a3);
}

- (NSArray)serviceHoursList
{
  return self->_serviceHoursList;
}

- (void)setServiceHoursList:(id)a3
{
  objc_storeStrong((id *)&self->_serviceHoursList, a3);
}

- (unint64_t)numberOfInlineServiceHours
{
  return self->_numberOfInlineServiceHours;
}

- (void)setNumberOfInlineServiceHours:(unint64_t)a3
{
  self->_numberOfInlineServiceHours = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceHoursList, 0);
  objc_storeStrong((id *)&self->_placeHours, 0);
}

@end
