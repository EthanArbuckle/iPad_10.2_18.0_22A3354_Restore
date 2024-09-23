@implementation DDTimeLineAction

- (id)startDate
{
  NSDate *startDate;
  NSDate *v4;
  NSDate *v5;

  startDate = self->_startDate;
  if (!startDate)
  {
    beginDateOfEventResults(-[DDAction associatedResults](self, "associatedResults"), self->super.super.super._context, 0, 0, 0);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_startDate;
    self->_startDate = v4;

    startDate = self->_startDate;
  }
  return startDate;
}

- (id)platterTitle
{
  void *v2;
  __CFString *v3;

  -[DDTimeLineAction startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v2, 3, 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E4259460;
  }

  return v3;
}

+ (id)viewControllerProviderClass
{
  return CFSTR("DDRemoteTimeLineViewControllerProvider");
}

- (id)previewActions
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  _BOOL4 v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->super.super.super._ics)
  {
    objc_msgSend(v3, "addObject:", objc_opt_class());
    -[NSDictionary objectForKeyedSubscript:](self->super.super.super._context, "objectForKeyedSubscript:", CFSTR("CachedEvent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[DDOpenMapsAction actionAvailableForCachedEvent:](DDOpenMapsAction, "actionAvailableForCachedEvent:", v4);

    if (v5)
      objc_msgSend(v3, "addObject:", objc_opt_class());
    -[NSDictionary objectForKeyedSubscript:](self->super.super.super._context, "objectForKeyedSubscript:", CFSTR("CachedEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[DDOpenMapsAction actionAvailableForCachedEvent:](DDDirectionsAction, "actionAvailableForCachedEvent:", v6);

    if (v7)
LABEL_5:
      objc_msgSend(v3, "addObject:", objc_opt_class());
  }
  else
  {
    if (self->super.super.super._result
      && +[DDTimeZoneConversionAction actionAvailableForResult:](DDTimeZoneConversionAction, "actionAvailableForResult:"))
    {
      objc_msgSend(v3, "addObject:", objc_opt_class());
    }
    if (+[DDAddEventAction isAvailable](DDCreateEventAction, "isAvailable"))
      objc_msgSend(v3, "addObject:", objc_opt_class());
    if (+[DDCreateReminderAction isAvailable](DDCreateReminderAction, "isAvailable"))
      goto LABEL_5;
  }
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  objc_msgSend(v3, "addObject:", objc_opt_class());
  return v3;
}

- (id)menuActionClasses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDTimeLineAction previewActions](self, "previewActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v15 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)commitURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[DDTimeLineAction startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("calshow:%f"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)suggestedContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 375.0;
  v3 = 375.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
