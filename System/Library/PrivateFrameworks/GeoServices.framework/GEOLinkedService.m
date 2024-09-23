@implementation GEOLinkedService

- (GEOLinkedService)initWithGEOPDLinkedService:(id)a3 timeZone:(id)a4
{
  id v7;
  id v8;
  GEOLinkedService *v9;
  GEOLinkedService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOLinkedService;
  v9 = -[GEOLinkedService init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_linkedService, a3);
    objc_storeStrong((id *)&v10->_timeZone, a4);
  }

  return v10;
}

- (NSArray)businessHours
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  GEOBusinessHours *v10;
  GEOBusinessHours *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_checkedForBusinessHoursAlready)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[GEOPDLinkedService hours]((id *)&self->_linkedService->super.super.isa);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = [GEOBusinessHours alloc];
          v11 = -[GEOBusinessHours initWithGEOPDBusinessHours:timeZone:](v10, "initWithGEOPDBusinessHours:timeZone:", v9, self->_timeZone, (_QWORD)v16);
          if (-[GEOBusinessHours hoursType](v11, "hoursType"))
          {
            if (!v6)
              v6 = (void *)objc_opt_new();
            objc_msgSend(v6, "addObject:", v11);
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOBusinessHours prioritizeBusinessHours:compareDate:](GEOBusinessHours, "prioritizeBusinessHours:compareDate:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
      objc_storeStrong((id *)&self->_cachedBusinessHours, v14);
    self->_checkedForBusinessHoursAlready = 1;

  }
  return self->_cachedBusinessHours;
}

- (NSString)localizedCategoryName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[GEOPDLinkedService entity]((id *)&self->_linkedService->super.super.isa);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedCategorys");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v26;
    v6 = -1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "level");
        if (v6 < v9)
        {
          v10 = v9;
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v8, "localizedNames");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
LABEL_9:
            v15 = 0;
            v16 = v4;
            while (1)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v15), "stringValue");
              v4 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v4, "length"))
                break;
              ++v15;
              v16 = v4;
              if (v13 == v15)
              {
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
                if (v13)
                  goto LABEL_9;
                break;
              }
            }
          }

          v6 = v10;
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  v17 = v4;

  return (NSString *)v17;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  GEOFeatureStyleAttributes *v3;
  void *v4;
  void *v5;
  GEOFeatureStyleAttributes *v6;

  v3 = [GEOFeatureStyleAttributes alloc];
  -[GEOPDLinkedService entity]((id *)&self->_linkedService->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GEOFeatureStyleAttributes initWithPlaceDataStyleAttributes:](v3, "initWithPlaceDataStyleAttributes:", v5);

  return v6;
}

- (void)setBusinessHours:(id)a3
{
  objc_storeStrong((id *)&self->_businessHours, a3);
}

- (void)setLocalizedCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCategoryName, a3);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void)setStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);
  objc_storeStrong((id *)&self->_businessHours, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_cachedBusinessHours, 0);
  objc_storeStrong((id *)&self->_linkedService, 0);
}

@end
