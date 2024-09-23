@implementation IMChat(CKAdditions)

- (id)__ck_watermarkDate
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "waterMarkTimeCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4
     || (objc_msgSend(a1, "valueForChatProperty:", CFSTR("CKChatWatermarkTime")),
         (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    && (objc_msgSend(v4, "doubleValue"), v5 > 0.0))
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)waterMarkTimeCache
{
  if (waterMarkTimeCache_onceToken != -1)
    dispatch_once(&waterMarkTimeCache_onceToken, &__block_literal_global_44);
  return (id)waterMarkTimeCache__waterMarkTimeCache;
}

+ (id)waterMarkMessageIDCache
{
  if (waterMarkMessageIDCache_onceToken != -1)
    dispatch_once(&waterMarkMessageIDCache_onceToken, &__block_literal_global_159);
  return (id)waterMarkMessageIDCache__waterMarkMessageIDCache;
}

- (uint64_t)__ck_watermarkMessageID
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;
  uint64_t v6;

  objc_msgSend((id)objc_opt_class(), "waterMarkMessageIDCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (objc_msgSend(a1, "valueForChatProperty:", CFSTR("CKChatWatermarkMessageID")),
        result = objc_claimAutoreleasedReturnValue(),
        (v4 = (void *)result) != 0))
  {
    v6 = objc_msgSend(v4, "longLongValue");

    return v6;
  }
  return result;
}

- (void)__ck_updateWatermarkToMessageID:()CKAdditions date:
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(a1, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(a1, "__ck_watermarkMessageID");
    if (v7 > a3)
      a3 = v7;
    objc_msgSend((id)objc_opt_class(), "waterMarkMessageIDCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    objc_msgSend(a1, "__ck_watermarkDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v11, "laterDate:", v18);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
LABEL_6:
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v13, "timeIntervalSince1970");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        objc_msgSend((id)objc_opt_class(), "waterMarkTimeCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "guid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setValue:forKey:", v15, v17);

        goto LABEL_10;
      }
    }
    else
    {
      v13 = v18;
      if (v13)
        goto LABEL_6;
    }
    v15 = &unk_1E2871460;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)__ck_saveWatermark
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend((id)objc_opt_class(), "waterMarkMessageIDCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "waterMarkTimeCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "setValue:forChatProperty:", v11, CFSTR("CKChatWatermarkMessageID"));
    objc_msgSend((id)objc_opt_class(), "waterMarkMessageIDCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  if (v6)
  {
    objc_msgSend(a1, "setValue:forChatProperty:", v6, CFSTR("CKChatWatermarkTime"));
    objc_msgSend((id)objc_opt_class(), "waterMarkTimeCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "guid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (uint64_t)__ck_sendReadReceipts
{
  uint64_t v2;
  void *v3;
  void *v4;

  if ((IMGetDomainBoolForKey() & 1) != 0)
    v2 = 1;
  else
    v2 = IMGetDomainBoolForKey();
  objc_msgSend(a1, "valueForChatProperty:", *MEMORY[0x1E0D37770]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "BOOLValue");

  return v2;
}

@end
