@implementation DDAddEventAction

- (void)invalidate
{
  void *v3;

  -[DDAddEventAction viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", 0);

  -[DDAddEventAction setViewController:](self, "setViewController:", 0);
}

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Add to Calendar"));
}

- (id)iconName
{
  return CFSTR("calendar.badge.plus");
}

- (id)variantIconName
{
  return CFSTR("calendar");
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable](DDRemoteActionViewController, "controllerIsAvailable");
}

- (int)interactionType
{
  return 1;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3;

  v3 = +[DDRemoteActionViewController prepareViewController:forAction:actionController:](DDRemoteActionViewController, "prepareViewController:forAction:actionController:", CFSTR("DDEventAddViewController"), self, a3);
}

+ (id)icsEventForICSString:(id)a3
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v13;
  void *v14;
  uint64_t v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AF30A0]();
  gotLoadHelper_x8__OBJC_CLASS___ICSDocument(v5);
  v7 = objc_alloc(*(Class *)(v6 + 2080));
  v16 = 0;
  v8 = (void *)objc_msgSend(v7, "initWithICSString:options:error:", v3, 0, &v16);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "method");
    if (v11 > 5 || ((1 << v11) & 0x27) == 0)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v10, "components");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

+ (id)cachedEventForICSString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_10;
  if (objc_msgSend(MEMORY[0x1E0CAA078], "authorizationStatusForEntityType:", 0) != 3)
  {
    objc_msgSend(a1, "icsEventForICSString:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v5 = (void *)v10;
      v12 = CFSTR("icsEvent");
      v13 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithOptions:path:", 48, 0);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importICSData:intoCalendar:options:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_9:

    goto LABEL_10;
  }
  v14[0] = CFSTR("event");
  v14[1] = CFSTR("store");
  v15[0] = v8;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
LABEL_11:

  return v9;
}

- (id)eventTitleFromCache
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _eventTitleFromCache(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)eventStartDateFromCache
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->super._context, "objectForKeyedSubscript:", 0x1E4259480);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _eventStartDateFromCache(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)compactTitle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[DDAddEventAction eventTitleFromCache](self, "eventTitleFromCache");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v9 = 0;
LABEL_5:
    -[DDAddEventAction eventStartDateFromCache](self, "eventStartDateFromCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v11, 1, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
LABEL_9:

        goto LABEL_10;
      }

    }
    v13.receiver = self;
    v13.super_class = (Class)DDAddEventAction;
    -[DDAction compactTitle](&v13, sel_compactTitle);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v4 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
    goto LABEL_5;
  v9 = v9;
  v10 = v9;
LABEL_10:

  return v10;
}

- (id)quickActionTitle
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFArray *v9;
  void *v10;
  objc_super v12;
  __int16 v13;

  v13 = 0;
  -[DDAddEventAction eventStartDateFromCache](self, "eventStartDateFromCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_2;
  v9 = -[DDAction associatedResults](self, "associatedResults");
  -[DDAction context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  beginDateOfEventResults(v9, v10, (_BYTE *)&v13 + 1, (BOOL *)&v13, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_8;
  if (!(_BYTE)v13)
  {
LABEL_2:
    v4 = (void *)MEMORY[0x1E0CB3578];
    v5 = HIBYTE(v13) != 1;
    v6 = v3;
    v7 = 3;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3578];
    v6 = v3;
    v7 = 0;
    v5 = 1;
  }
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {

LABEL_8:
    v12.receiver = self;
    v12.super_class = (Class)DDAddEventAction;
    -[DDAction quickActionTitle](&v12, sel_quickActionTitle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)notificationTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  -[DDAddEventAction eventTitleFromCache](self, "eventTitleFromCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDAddEventAction eventStartDateFromCache](self, "eventStartDateFromCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v4, 1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v3, "length");
  v7 = objc_msgSend(v5, "length");
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (!v6 || !v7)
  {
    if (v7)
    {
      DDLocalizedString(CFSTR("Add event on %@ to Calendar"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v5;
    }
    else
    {
      if (v6)
      {
        DDLocalizedString(CFSTR("Add “%@” to Calendar"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      DDLocalizedString(CFSTR("Add an ICS event to Calendar"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "stringWithFormat:", v9, v12, v13);
    goto LABEL_11;
  }
  DDLocalizedString(CFSTR("Add “%@” on %@ to Calendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
LABEL_7:
  objc_msgSend(v8, "stringWithFormat:", v9, v3, v13);
LABEL_11:
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)notificationIconBundleIdentifier
{
  return CFSTR("com.apple.mobilecal");
}

- (id)notificationURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-barcode-datadetectors-action:event"));
}

+ (BOOL)actionAvailableForEvent:(id)a3
{
  if (a3)
    return objc_msgSend(a1, "isAvailable");
  else
    return 0;
}

- (DDRemoteActionViewController)viewController
{
  return self->viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->viewController, 0);
}

@end
