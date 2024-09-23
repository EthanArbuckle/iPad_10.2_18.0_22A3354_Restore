@implementation AMSMediaResult(FCAdditions)

- (id)fc_appAdamID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  objc_msgSend(a1, "responseDataItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v2, "objectForKey:", CFSTR("relationships"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_opt_class();
  objc_msgSend(v5, "objectForKey:", CFSTR("app"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_opt_class();
  objc_msgSend(v8, "objectForKey:", CFSTR("data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "intValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fc_offerName
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "responseDataItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v2, "objectForKey:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_opt_class();
  objc_msgSend(v5, "objectForKey:", CFSTR("offerName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v7;
    else
      v6 = 0;
  }
  v8 = v6;

  return v8;
}

- (id)fc_externalVersionID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "responseDataItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ios"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("externalVersionId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (id)fc_bundleID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a1, "responseDataItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("platformAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_opt_class();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ios"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_opt_class();
  objc_msgSend(v11, "objectForKey:", CFSTR("bundleId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (id)fc_introductoryOffers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  FCIntroductoryOffer *v27;
  void *v29;
  void *v30;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "responseDataItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v30 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v29 = v7;
  objc_msgSend(v7, "objectForKey:", CFSTR("offers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v9, "objectForKey:", CFSTR("discounts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v13, "objectForKey:", CFSTR("priceFormatted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  objc_opt_class();
  objc_msgSend(v13, "objectForKey:", CFSTR("recurringSubscriptionPeriod"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  objc_opt_class();
  objc_msgSend(v13, "objectForKey:", CFSTR("numOfPeriods"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = v21;

  objc_opt_class();
  objc_msgSend(v13, "objectForKey:", CFSTR("modeType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("PayAsYouGo")) & 1) != 0)
  {
    v26 = 1;
LABEL_37:
    v27 = -[FCIntroductoryOffer initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:]([FCIntroductoryOffer alloc], "initWithOfferType:priceFormatted:recurringSubscriptionPeriod:numOfPeriods:", v26, v16, v19, objc_msgSend(v22, "unsignedIntegerValue"));
    objc_msgSend(v2, "addObject:", v27);

    goto LABEL_38;
  }
  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("PayUpFront")) & 1) != 0)
  {
    v26 = 2;
    goto LABEL_37;
  }
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("FreeTrial")))
  {
    v26 = 3;
    goto LABEL_37;
  }
LABEL_38:

  return v2;
}

- (id)fc_subscriptionPeriodInISO_8601
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(a1, "responseDataItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "objectForKey:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
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

  objc_msgSend(v6, "objectForKey:", CFSTR("offers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v8, "objectForKey:", CFSTR("recurringSubscriptionPeriod"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (!v11)
  {
    objc_opt_class();
    objc_msgSend(v6, "objectForKey:", CFSTR("recurringSubscriptionPeriod"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v11 = v13;

  }
  if (objc_msgSend(a1, "isPeriodValid:", v11))
    v14 = v11;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

- (uint64_t)isPeriodValid:()FCAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "hasPrefix:", CFSTR("P")))
  {
    objc_msgSend(v4, "substringWithRange:", 1, objc_msgSend(v4, "length") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = 0;
      while (1)
      {
        v7 = objc_msgSend(v5, "characterAtIndex:", v6) - 68;
        if (v7 < 0x16 && ((0x298211u >> v7) & 1) != 0)
          break;
        if (objc_msgSend(v5, "length") <= (unint64_t)++v6)
          goto LABEL_8;
      }
      v8 = (0x280201u >> v7) & 1;
    }
    else
    {
LABEL_8:
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
