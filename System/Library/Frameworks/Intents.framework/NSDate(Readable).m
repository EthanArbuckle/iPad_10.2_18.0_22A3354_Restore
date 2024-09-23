@implementation NSDate(Readable)

- (uint64_t)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  return objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:timeZone:", a3, a4, 0);
}

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:timeZone:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v12, "setLocale:", v11);
  if (v10)
    objc_msgSend(v12, "setTimeZone:", v10);
  v13 = v9;
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v14 = 0;
    goto LABEL_18;
  }
  if (!objc_msgSend(v13, "format"))
  {
    objc_msgSend(v12, "setDoesRelativeDateFormatting:", 1);
    v16 = objc_msgSend(v13, "type");
    if (v16 == 2)
    {
      v18 = v12;
      v17 = 0;
    }
    else
    {
      if (v16 == 1)
      {
        objc_msgSend(v12, "setDateStyle:", objc_msgSend(v13, "dateStyle"));
        v20 = v12;
        v19 = 0;
        goto LABEL_16;
      }
      v14 = v13;
      if (v16)
        goto LABEL_18;
      v17 = objc_msgSend(v13, "dateStyle");
      v18 = v12;
    }
    objc_msgSend(v18, "setDateStyle:", v17);
    v19 = objc_msgSend(v13, "timeStyle");
    v20 = v12;
LABEL_16:
    objc_msgSend(v20, "setTimeStyle:", v19);
    goto LABEL_17;
  }
  v14 = v13;
  if (objc_msgSend(v13, "format") == 2)
  {
    objc_msgSend(v13, "localizedFormatStringWithLocalizer:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDateFormat:", v15);

LABEL_17:
    v14 = v13;
  }
LABEL_18:
  objc_msgSend(v12, "stringFromDate:", a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
