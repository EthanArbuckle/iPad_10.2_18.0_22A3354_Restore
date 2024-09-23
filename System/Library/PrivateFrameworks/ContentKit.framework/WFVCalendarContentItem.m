@implementation WFVCalendarContentItem

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("EKEvent"), "isEqualToString:", v7))
  {

  }
  else
  {
    NSStringFromClass(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(CFSTR("REMReminder"), "isEqualToString:", v8);

    if (!v9)
    {
      v16 = 0;
      return v16;
    }
  }
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.ical.ics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v11, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v13, 4);

  +[WFVCalendarFormatter calendarItemsFromICS:](WFVCalendarFormatter, "calendarItemsFromICS:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", v22, (_QWORD)v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v19);
  }

  return v16;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  objc_super v21;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("EKEvent")))
  {

  }
  else
  {
    v8 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("REMReminder"));
    if (!(_DWORD)v10)
    {
      v21.receiver = self;
      v21.super_class = (Class)WFVCalendarContentItem;
      v19 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v21, sel_canGenerateRepresentationForType_, v8);
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.ical.ics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItem fileRepresentationForType:](self, "fileRepresentationForType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v13, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithData:encoding:", v15, 4);

  +[WFVCalendarFormatter calendarItemsFromICS:](WFVCalendarFormatter, "calendarItemsFromICS:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectsMatchingClass:", objc_msgSend(v4, "objectClass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "count") != 0;
LABEL_16:

  return v19;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  objc_super v14;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("EKEvent")))
  {

  }
  else
  {
    v8 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("REMReminder"));
    if ((v10 & 1) == 0)
    {
      v14.receiver = a1;
      v14.super_class = (Class)&OBJC_METACLASS___WFVCalendarContentItem;
      v12 = objc_msgSendSuper2(&v14, sel_supportedTypeMustBeDeterminedByInstance_, v8);
      goto LABEL_16;
    }
  }
  v12 = 1;
LABEL_16:

  return v12;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContentItemStringConversionBehavior accessingProperty:](WFContentItemStringConversionBehavior, "accessingProperty:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", CFSTR("com.apple.ical.ics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("EKEvent"), CFSTR("EventKit"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFObjectType typeWithClassName:frameworkName:location:](WFObjectType, "typeWithClassName:frameworkName:location:", CFSTR("REMReminder"), CFSTR("ReminderKit"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("iCalendar item"), CFSTR("iCalendar item"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("iCalendar items"), CFSTR("iCalendar items"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d iCalendar items"));
}

@end
