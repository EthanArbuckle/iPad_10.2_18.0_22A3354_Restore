@implementation DDShowCalendarAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Show in Calendar"));
}

- (id)iconName
{
  return CFSTR("calendar");
}

- (void)performFromView:(id)a3
{
  NSDictionary *context;
  id v5;
  void *v6;
  void *v7;
  __CFArray *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  context = self->super._context;
  v5 = a3;
  -[NSDictionary objectForKeyedSubscript:](context, "objectForKeyedSubscript:", 0x1E4259480);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _eventStartDateFromCache(v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v14;
  if (!v14)
  {
    if (self->super._ics)
    {
      v7 = 0;
    }
    else
    {
      v8 = -[DDAction associatedResults](self, "associatedResults");
      -[DDAction context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      beginDateOfEventResults(v8, v9, 0, 0, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v15;
    }
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v16 = v7;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("calshow:%f"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  DDUIRecordOtherActionInSheetForResultIfNeeded((uint64_t)self->super._result);
  -[DDAction _performFromView:byOpeningURL:](self, "_performFromView:byOpeningURL:", v5, v13);

}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

@end
