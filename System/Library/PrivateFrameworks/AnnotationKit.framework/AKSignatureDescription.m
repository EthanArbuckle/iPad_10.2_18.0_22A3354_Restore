@implementation AKSignatureDescription

+ (id)stringValueForSignatureDescriptionTag:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Full Name");
      goto LABEL_8;
    case 2:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Given Name");
      goto LABEL_8;
    case 3:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Family Name");
      goto LABEL_8;
    case 4:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Nickname");
      goto LABEL_8;
    case 5:
      +[AKController akBundle](AKController, "akBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Initials");
LABEL_8:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (int64_t)signatureDescriptionTagFromStringValue:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int64_t v10;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "length"))
  {
    +[AKController akBundle](AKController, "akBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Full Name"), &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v9 & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      +[AKController akBundle](AKController, "akBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Given Name"), &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "isEqualToString:", v13);

      if ((v14 & 1) != 0)
      {
        v10 = 2;
      }
      else
      {
        +[AKController akBundle](AKController, "akBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Family Name"), &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
        {
          v10 = 3;
        }
        else
        {
          +[AKController akBundle](AKController, "akBundle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Nickname"), &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v6, "isEqualToString:", v19);

          if ((v20 & 1) != 0)
          {
            v10 = 4;
          }
          else
          {
            +[AKController akBundle](AKController, "akBundle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Initials"), &stru_24F1A83D0, CFSTR("AKSignatureDescription"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v6, "isEqualToString:", v22);

            if (v23)
              v10 = 5;
            else
              v10 = -1;
          }
        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
