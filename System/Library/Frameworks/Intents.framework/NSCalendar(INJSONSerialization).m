@implementation NSCalendar(INJSONSerialization)

- (const)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  void *v1;
  const __CFString *v2;

  objc_msgSend(a1, "calendarIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996C8]) & 1) != 0)
  {
    v2 = CFSTR("GREGORIAN");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99698]) & 1) != 0)
  {
    v2 = CFSTR("BUDDHIST");
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996A0]) & 1) == 0)
    {
      if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996A8]) & 1) == 0
        && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996B8]) & 1) == 0
        && (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996B0]) & 1) == 0)
      {
        if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996D0]) & 1) != 0)
        {
          v2 = CFSTR("HEBREW");
          goto LABEL_14;
        }
        if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996D8]) & 1) == 0)
        {
          if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996E0]) & 1) != 0)
          {
            v2 = CFSTR("HINDU");
            goto LABEL_14;
          }
          if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996E8]) & 1) != 0)
          {
            v2 = CFSTR("ISLAMIC");
            goto LABEL_14;
          }
          if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996F0]) & 1) == 0)
          {
            if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99708]) & 1) != 0)
            {
              v2 = CFSTR("JAPANESE");
              goto LABEL_14;
            }
            if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99710]) & 1) != 0)
            {
              v2 = CFSTR("PERSIAN");
              goto LABEL_14;
            }
            if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99718]) & 1) != 0)
            {
              v2 = CFSTR("REPUBLIC_OF_CHINA");
              goto LABEL_14;
            }
            if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C996F8]) & 1) == 0
              && objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99700]))
            {
              v2 = CFSTR("ISLAMIC_UMALQURA");
              goto LABEL_14;
            }
          }
        }
      }
      v2 = 0;
      goto LABEL_14;
    }
    v2 = CFSTR("CHINESE");
  }
LABEL_14:

  return v2;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id *v12;
  void *v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9)
    goto LABEL_28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_28;
  v10 = v9;
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("BUDDHIST"));
  v12 = (id *)MEMORY[0x1E0C99698];
  if ((v11 & 1) != 0)
    goto LABEL_25;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CHINESE")) & 1) != 0)
  {
    v12 = (id *)MEMORY[0x1E0C996A0];
    goto LABEL_25;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HEBREW")) & 1) != 0)
  {
    v12 = (id *)MEMORY[0x1E0C996D0];
    goto LABEL_25;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HIJRI")) & 1) == 0)
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HINDU")) & 1) != 0)
    {
      v12 = (id *)MEMORY[0x1E0C996E0];
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ISLAMIC_UMALQURA")) & 1) != 0)
    {
      v12 = (id *)MEMORY[0x1E0C99700];
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ISLAMIC")) & 1) != 0)
    {
      v12 = (id *)MEMORY[0x1E0C996E8];
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("GREGORIAN")) & 1) != 0)
    {
      v12 = (id *)MEMORY[0x1E0C996C8];
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("JAPANESE")) & 1) != 0)
    {
      v12 = (id *)MEMORY[0x1E0C99708];
    }
    else
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("JULIAN")) & 1) != 0)
        goto LABEL_9;
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PERSIAN")) & 1) != 0)
      {
        v12 = (id *)MEMORY[0x1E0C99710];
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("REPUBLIC_OF_CHINA")))
      {
        v12 = (id *)MEMORY[0x1E0C99718];
      }
    }
LABEL_25:

    v14 = *v12;
    if (v14)
    {
      v10 = v14;
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
LABEL_9:
  v13 = 0;
LABEL_27:

LABEL_29:
  return v13;
}

@end
