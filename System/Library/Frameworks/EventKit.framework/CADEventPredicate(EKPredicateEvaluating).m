@implementation CADEventPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v5, "startDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "CalIsAfterOrSameAsDate:", v6);

        if ((v12 & 1) != 0)
          goto LABEL_23;
        objc_msgSend(v5, "endDateUnadjustedForLegacyClients");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "CalIsBeforeOrSameAsDate:", v7);

        if ((v14 & 1) != 0)
          goto LABEL_23;
      }
    }
    objc_msgSend(a1, "calendars");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(a1, "calendars");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "calendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "CADObjectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v17, "containsObject:", v19);

      if (!v20)
        goto LABEL_23;
    }
    objc_msgSend(a1, "eventUUID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(a1, "eventUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if (!v25)
        goto LABEL_23;
    }
    if (objc_msgSend(a1, "excludeTimedEvents") && !objc_msgSend(v5, "isAllDay")
      || objc_msgSend(a1, "excludeAllDayEvents") && (objc_msgSend(v5, "isAllDay") & 1) != 0
      || objc_msgSend(a1, "excludeDeclined") && objc_msgSend(v5, "participationStatus") == 3
      || objc_msgSend(a1, "excludeProposed") && (objc_msgSend(v5, "isProposedTimeEvent") & 1) != 0
      || objc_msgSend(a1, "excludeDeclinedUnlessProposed")
      && objc_msgSend(v5, "participationStatus") == 3
      && !objc_msgSend(v5, "isProposedTimeEvent"))
    {
LABEL_23:
      v26 = 0;
    }
    else
    {
      v26 = 1;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

@end
