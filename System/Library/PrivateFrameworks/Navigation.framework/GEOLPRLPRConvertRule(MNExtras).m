@implementation GEOLPRLPRConvertRule(MNExtras)

- (uint64_t)hasValidDateInterval
{
  unsigned int v2;

  if (objc_msgSend(a1, "hasValidStartTime") && objc_msgSend(a1, "hasValidEndTime"))
  {
    v2 = objc_msgSend(a1, "validStartTime");
    return v2 < objc_msgSend(a1, "validEndTime");
  }
  else if ((objc_msgSend(a1, "hasValidStartTime") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "hasValidEndTime");
  }
}

- (id)validDateInterval
{
  void *v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(a1, "hasValidStartTime") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a1, "validStartTime"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "hasValidEndTime") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a1, "validEndTime"));
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v2, v3);

  return v4;
}

- (id)rules:()MNExtras forPlateTypes:atIndexes:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(a1, "pickupRulesCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__GEOLPRLPRConvertRule_MNExtras__rules_forPlateTypes_atIndexes___block_invoke;
  v19[3] = &unk_1E61D2DC0;
  v13 = v12;
  v20 = v13;
  v21 = v9;
  v22 = v8;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v19);

  v16 = v22;
  v17 = v13;

  return v17;
}

- (id)pickupRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "pickupRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rules:forPlateTypes:atIndexes:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)mapRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "mapRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rules:forPlateTypes:atIndexes:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fillRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "fillRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rules:forPlateTypes:atIndexes:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
