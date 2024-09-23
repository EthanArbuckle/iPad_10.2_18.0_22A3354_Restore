@implementation HKWorkoutEvent(HDCodingSupport)

- (HDCodableWorkoutEvent)codableRepresentationForSync
{
  HDCodableWorkoutEvent *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(HDCodableWorkoutEvent);
  -[HDCodableWorkoutEvent setType:](v2, "setType:", objc_msgSend(a1, "type"));
  objc_msgSend(a1, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HDCodableWorkoutEvent setDate:](v2, "setDate:");

  objc_msgSend(a1, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  -[HDCodableWorkoutEvent setDuration:](v2, "setDuration:");

  objc_msgSend(a1, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_codableMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutEvent setMetadataDictionary:](v2, "setMetadataDictionary:", v7);

  objc_msgSend(a1, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB55C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[HDCodableWorkoutEvent setSwimmingStrokeStyle:](v2, "setSwimmingStrokeStyle:", objc_msgSend(v9, "longLongValue"));

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "hasType"))
    {
      v6 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v5, "metadataDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hk_dictionaryWithCodableMetadata:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0.0;
      if (objc_msgSend(v5, "hasDuration"))
      {
        objc_msgSend(v5, "duration");
        v9 = v10;
      }
      if (objc_msgSend(v5, "hasSwimmingStrokeStyle"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "swimmingStrokeStyle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CB55C8]);

      }
      v12 = objc_msgSend(v5, "type");
      v13 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "decodedDateIntervalStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithStartDate:duration:", v14, v9);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_unvalidatedWorkoutEventWithType:dateInterval:metadata:", v12, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
